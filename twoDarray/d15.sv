class check;

  rand bit queens[8][8];//chess board size

  constraint queens_number {queens.sum() with (item.sum() with (int'(item))) == 8;}
  
  constraint queens_dir_row {foreach(queens[i,]) queens[i].sum() with (int'(item)) == 1;}
  constraint queens_dir_column {foreach(queens[,j]) queens.sum() with (int'(queens[item.index][j])) == 1;}
  
  constraint queens_diag_L_to_R {foreach(queens[i]){queens.sum() with (i+item.index<8?int'(queens[item.index][i+item.index]):0) <= 1;
                                                    queens.sum() with (i+item.index<8?int'(queens[i+item.index][item.index]):0) <= 1;}
                           }
    
    constraint queens_diag_R_to_L {foreach(queens[i]){queens.sum() with (i+item.index<8?int'(queens[item.index][7-i-item.index]):0) <= 1;
                                                      queens.sum() with (i+item.index<8?int'(queens[7-i-item.index][item.index]):0) <= 1;}
                           }
    
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    foreach(ch.queens[i]) $display("%0p",ch.queens[i]);
    #1 $finish();
  end
  
endmodule
