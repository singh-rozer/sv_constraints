module tb;
  class check;
    rand byte unsigned arr[10],val;
    
    constraint array_value{foreach (arr[i]){
      arr[i] < 10;
      //to make each value of array unique
      arr[i] != val -> arr.sum() with (int'(item == arr[i])) == 1;
    }
      //to make sure 3 items are equal
      arr.sum() with (int'(item == val)) == 3;
      
    }
    
  endclass
  
  check ch;
  
  initial
    begin
      ch = new();
      
      assert(ch.randomize());
      
      $display("%0p :: %0d",ch.arr,ch.val);
      
      #1 $finish();
    end
endmodule
