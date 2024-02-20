class check;
  
  rand bit[1:0] a [3][3];
  
  constraint a_val {foreach(a[i,j]) a[i][j] inside {0,1};}
  constraint c1_column {foreach(a[,j]) a.sum() with (int'(a[item.index][j] == 1)) < 2;} //to restrict column to contain zero/single '1'
  constraint c1_diagonal {a.sum() with (int'(a[item.index][item.index])) == 3;}
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
