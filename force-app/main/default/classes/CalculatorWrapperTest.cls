@istest
public class CalculatorWrapperTest {
    @isTest
    public static void CalculatorWrapperMethod(){
        integer num1=4; integer num2=5;
                 
  integer sum =num1+num2;
            if( sum>=0){
                system.Debug('The sum of two number is positive'+ sum);
            }
  Decimal  sub =num1-num2;
            if( sub>=0){
                system.Debug('The sub of two number is positive'+ sub);
            }
          Decimal mul=num1*num2;
            if (mul>=0){
                system.Debug('The Multiplication of two number is positive'+ mul);
            }
        
    Decimal  Div=num1/num2;
            if( Div>=0){
                system.Debug('The Division of two number is positive'+ Div);
            }
        }
}