class check;  
  rand bit [5:0] a;
  
  constraint a_4_10 {a%20 == 0;}
  
endclass
 
module tb;
  initial begin 
   check ch = new();

    repeat(10)
      begin 
      ch.randomize();
         $display("Value of num = %0p",ch.a);
      end
  end 
endmodule
