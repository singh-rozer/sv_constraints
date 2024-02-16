class check;  
  rand int unsigned a;
  int vars;
  //int q[$];
  
  constraint a_val {a == vars/10;}
  
  function void post_randomize();
    vars = (vars+9)*10;
    //if(a != 0) q.push_back(a);
  endfunction
endclass
 
module tb;
  initial begin 
   check ch = new();

    repeat(5)
      begin 
      ch.randomize();
        if(ch.a != 0)
          $display("Value of num = %0p",ch.a);
      end
  end 
endmodule
