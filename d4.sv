class check;
  rand bit [3:0] a;
  rand bit [7:0] b;
  
  constraint a_op_b {//a inside {[8:15]};
                     b == 8-a;}//unsigned
endclass

module tb;
  
  check ch;
  
  initial begin
    ch = new();
    
    repeat(20) begin
      assert(ch.randomize())
        $display("a = %0d - b = %0d",ch.a,ch.b);
      end
    end
endmodule
