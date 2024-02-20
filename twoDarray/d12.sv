class check;
  
  rand bit[3:0] a [3][3];
  
  constraint a_val {foreach(a[i,j]) a[i][j] inside {[1:9]};}
  constraint a_row {foreach(a[i,]) a[i].sum() with (int'(item)) == 15;}
  constraint a_column {foreach(a[,j]) a.sum() with (int'(a[item.index][j])) == 15;}
  //constraint a_diagonal {a.sum() with (int'(a[item.index][item.index])) == 15;}
  constraint a_unique {unique{a};}
   
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
