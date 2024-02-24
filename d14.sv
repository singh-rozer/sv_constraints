class check;
  rand bit [15:0] addr;
  
  constraint arr_val {foreach(addr[i]) (14>i) -> !({addr[i],addr[i+1],addr[i+2]} inside {'b000,'b111});
                           $countones(addr) == 9;
                          }
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    $display("VALUE:: %0b ",ch.addr);
    #1 $finish();
  end
  
endmodule
