public class Constructor {
    static integer ticket=10;
    static{
        system.debug('hello i am static ticket');
    }
    Public Constructor(){
        system.debug('hello i am here');
    }
    Public Constructor(integer i){
        system.debug('hello i am back');
    }
    Public Constructor(String s){
        system.debug('hello i am good');
    }
}