class check;
  rand bit [15:0] addr;
  rand bit [2:0] val;
  //-------working in vcs
  constraint arr_diagonal {foreach(addr[i]){ i < 9 -> addr[i] == 1;}
    foreach(addr[i]) (14>i>8) -> !({addr[i],addr[i+1],addr[i+2]} inside {'b000,'b111});
                          }
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    //foreach(ch.arr[i])
    $display("VALUE:: %0b ",ch.addr);
    #1 $finish();
  end
  
endmodule
