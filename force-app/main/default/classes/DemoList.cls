public class DemoList {
    public void DemoListMethod()
    {
    list< Account> acc=new list< Account>([select Name,phone, Id from Account  limit 2]);
      insert acc;
        
        system.debug('acc =>'+acc);
        
    }
}