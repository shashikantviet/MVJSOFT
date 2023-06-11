import { LightningElement, wire } from 'lwc';
import ChartJS from '@salesforce/resourceUrl/ChartJs';
import { loadScript } from 'lightning/platformResourceLoader';
import getRelatedContacts from '@salesforce/apex/ChartForRelatedContacts.getRelatedContacts';
//import { ShowToastEvent } from "lightning/platformResourceLoader" 

export default class ParentBarchart extends LightningElement {
   
    mychart;
    renderedCallback() {
        var check;
        this.createChart(this.check);
        Promise.all([loadScript(this,ChartJS)])
        .then(()=>{
            this.createChart(1);
            this.check=1;
        })
     }
     
     createChart(condition){
        if(condition==1){
          getRelatedContacts({})
          .then((result=>{
            console.log('Resut ---',result);
            const ctx = this.template.querySelectorAll("canvas");
            var reportResultData = JSON.parse(result.reportDetail);
            var chartData = [];
            var chartLabels = [];
           // this.totalActiveChart = reportResultData.groupingsDown.groupings.length;
            for(var i=0; i < (reportResultData.groupingsDown.groupings.length); i++){
                //Collect all labels for Chart.js data
                var labelTemp = reportResultData.groupingsDown.groupings[i].label;
                chartLabels.push(labelTemp);
                
                var keyTemp = reportResultData.groupingsDown.groupings[i].key;
                //Collect all values for Chart.js data
                var valueTemp = reportResultData.factMap[keyTemp + '!T'].aggregates[0].value ;
                
                chartData.push(valueTemp);
            }
            console.log('chartData-----',chartData);
            console.log('chartLabels-----',chartLabels);
        this.mychart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels : chartLabels,
                datasets: [{
                    label: 'Account Related Contacts',
                    data:chartData ,
                    backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
              scales: {
                yAxes: [{
                  ticks: {
                    beginAtZero: true,
                    callback: function(value) {if (value % 1   === 0) {return value;}}
                }
                }]
              }
            },
        });
        this.mychart.update();
          }))
        
     } 
    }
   
}