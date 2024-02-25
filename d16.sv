class check;
  
  randc bit [3:0] a; //it should work based on the cyclic behavior of it
  bit [3:0] q[$];
  
  constraint arr_val {a inside {[1:10]};}
  //unique{a,q};} //if randc not works then uncomment unique and replace randc with rand.

  function void post_randomize();
    if (q.size()<3) q.push_back(a);
    else begin q.pop_front(); q.push_back(a); end
  endfunction
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    repeat(10) begin
    assert(ch.randomize());
    $display("%0p",ch.q);
    end
    #1 $finish();
  end
endmodule
