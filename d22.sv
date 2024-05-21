class check;
  parameter SIZE=10;
  rand bit [SIZE-1:0] num;
 //Approach 1: 
  /*
//   rand bit [3:0] temp_1 [SIZE/2], temp_0 [SIZE/2];
  
//   constraint num_ref {foreach(temp_1[i]) temp_1[i] inside {[0:SIZE-1]};
//                       foreach(temp_0[i]) temp_0[i] inside {[0:SIZE-1]};
//                       unique{temp_1,temp_0};}
//   constraint num_val {foreach(temp_1[i]) num[temp_1[i]] == 1;
//                       foreach(temp_0[i]) num[temp_0[i]] == 0;}
  */
  //Approach 2:
  constraint num_val {$countones(num) == SIZE/2;}
  
endclass

module tb;
  check ch;
  initial begin
    ch = new();
    repeat(5) begin
    assert(ch.randomize());
//      $display("%0p",ch.temp_0);
    
    $display("%b",ch.num);
    end
    #1 $finish();
  end
endmodule
