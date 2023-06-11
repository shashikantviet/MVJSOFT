/* * 
* \arg CreatedOn        : 22/Oct/2018
* \arg LastModifiedOn   : 
* \arg CreatededBy      : Shashi
* \arg ModifiedBy       : Shashi
* \arg Description      : Trigger for Contact object.
*/
trigger triggerOnContact on Contact (before insert) {
    ContactTriggerHan cth =  new ContactTriggerHan();
    if(Trigger.isBefore && Trigger.isInsert){
        cth.updateAdrsOfSelAccount(Trigger.new);
    }
}