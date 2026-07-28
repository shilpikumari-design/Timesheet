public class Employee {
Public String fname,lname;
   public Date dob;
    public integer age, eID;
   public void showData(){
       calage();
        system.debug('Employee name:'+fname+''+lname);
        system.debug('Employee id:'+eID);
        system.debug('Employee date of birth:'+dob+'and age:'+age);
    }
    void calage(){
        age=dob.daysbetween(date.today())/365;
    }
    public void saveRec(){
        if(fname=='test'){
            system.debug('test is not allowed in name');
        }
        else{
            client__c c=new client__c();
        c.First_Name__c=fname;
        c.Date_of_Birth__c=dob;
        c.Last_Name__c=lname;
        insert c;
        if(c.ID!=null){
            system.debug('record created succesfully');
            showData(); 
        }
     
        else{
            
           system.debug('record is not created');
        }
        }
}
}