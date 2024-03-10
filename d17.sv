//Assumption: val is of 9 bits
class check;
  rand bit [8:0] val;
  rand bit flag;
  rand bit [3:0] id;
  
  constraint flag_id {flag dist {1:= 80, 0:= 20};
                      id inside {[0:4]};}

  constraint val_v {$countones(val) == 5;}
  constraint val_cont {flag -> val == 'b11111 << id;}
    
endclass

module tb;
  check ch = new();
  
  initial begin
    repeat(10) begin
    assert(ch.randomize());
      $display("VAL = %0b && flag = %0d",ch.val,ch.flag);
    end
    #1 $finish();
  end
  
endmodule
