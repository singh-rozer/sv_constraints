class randc_type;
  
  rand bit [1:0] num;
  int set[$];//to track all possible values of num for a set till count reaches.
  int count;
  int size = 2**$bits(num);
   
  constraint num_val {count<size -> !(num inside {set});}
  
  function void post_randomize();
    count+=1;
    if(count!=size)
      set.push_back(num);
    else begin
      count = 0;
      set = {};
    end
  endfunction
  
endclass

module tb;
  randc_type h = new();

  initial begin
    repeat(10) begin
    assert(h.randomize());
      $display("randc value(%0d): %d",h.count, h.num);
    end
  end
endmodule
