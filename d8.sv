class check;
  
  rand byte unsigned a;
  rand byte unsigned length;
  
  /*constraint a_val {
    $countones(a) == length;
    length <= 4;
  }*/
  
  constraint a_val{countones(a) == length;
                  length <=4;}
  
  function byte countones(byte a);
    foreach(a[i]) if(a[i]) countones += 1;
  endfunction
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    
    assert(ch.randomize());
    $display("a : %0b",ch.a);
    #1 $finish();
  end
endmodule
