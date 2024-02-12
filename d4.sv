class check;
  rand bit [2:0] a;
  rand bit [7:0] b;
  
  constraint a_op_b {//a inside {[0:8]};
                    b == 8-a;}
endclass

module tb;
  
  check ch;
  
  initial begin
    ch = new();
    
    repeat(2) begin
      assert(ch.randomize())
        $display("a = %0d - b = %0d",ch.a,ch.b);
      end
    end
endmodule
