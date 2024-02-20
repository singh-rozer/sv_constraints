class check;
  
  rand bit[1:0] a [2][16];
  
  constraint a_val {foreach(a[i,j]) a[i][j] inside {0,1};}
  constraint a_row {foreach(a[i,]) a[i].sum() with (int'(item)) == 5;} //to restrict 5 ones in single row
  constraint a_column {foreach(a[,j]) a.sum() with (int'(a[item.index][j])) < 2;} //to restrict zero/single one in a column
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    
    foreach(ch.a[i,j])
      if((i == 1 || i == 2) && j == 0) $write("\n%0d ", ch.a[i][j]);
      else $write("%0d ", ch.a[i][j]);
    $display("");
    #10 $finish();
  end
  
endmodule
