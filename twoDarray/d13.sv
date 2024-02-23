class check;
  rand bit [2:0] arr [4][4];
  rand bit [2:0] val;
  
  constraint arr_diagonal {foreach(arr[i,j]) i == j -> arr[i][j] == val;}
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    foreach(ch.arr[i])
      $display("VALUE:: %0p",ch.arr[i]);
    #1 $finish();
  end
  
endmodule
