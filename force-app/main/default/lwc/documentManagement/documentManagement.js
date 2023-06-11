import { LightningElement,wire, track, api } from 'lwc';
import fetchAccounts from '@salesforce/apex/DocumentManagementCtrl.fetchDocuments';
import updateAccounts from '@salesforce/apex/DocumentManagementCtrl.updateDocument';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const columns = [
    { label: 'Name', fieldName: 'Name', editable: true,sortable: 'true' },
    { label: 'Document Version', fieldName: 'Document_Version__c', editable: true },
    { label: 'Document Category', fieldName: 'Document_Category__c', editable: true }
];

export default class DocumentManagement extends LightningElement {


    @track records;
    wiredRecords;
    error;
    columns = columns;
    draftValues = [];
    @track initialRecords;
    @track columns = columns;
    @track sortBy='Name';
    @track sortDirection='asc';



    // retrieving the data using wire service
    @wire(fetchAccounts,{field : '$sortBy',sortOrder : '$sortDirection'})
    Documents(result) {
        if (result.data) {
            this.initialRecords = result.data; 
            this.records = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.records = undefined;
        }
    }

    handleSearch(event) {
        const searchKey = event.target.value.toLowerCase();
 
        if (searchKey) {
            this.records = this.initialRecords;
 
            if (this.records) {
                let searchRecords = [];
 
                for (let record of this.records) {
                    let valuesArray = Object.values(record);
 
                    for (let val of valuesArray) {
                        console.log('val is ' + val);
                        let strVal = String(val);
 
                        if (strVal) {
 
                            if (strVal.toLowerCase().includes(searchKey)) {
                                searchRecords.push(record);
                                break;
                            }
                        }
                    }
                }
 
                console.log('Matched Accounts are ' + JSON.stringify(searchRecords));
                this.records = searchRecords;
            }
        } else {
            this.records = this.initialRecords;
        }
    }
    doSorting(event) {
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;

    }

    async handleSave( event ) {

        const updatedFields = event.detail.draftValues;

        await updateAccounts( { data: updatedFields } )
        .then( result => {

            console.log( JSON.stringify( "Apex update result: " + result ) );
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account(s) updated',
                    variant: 'success'
                })
            );
            
            refreshApex( this.wiredRecords ).then( () => {
                this.draftValues = [];
            });        

        }).catch( error => {

            console.log( 'Error is ' + JSON.stringify( error ) );
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or refreshing records',
                    message: error.body.message,
                    variant: 'error'
                })
            );

        });

    }


}