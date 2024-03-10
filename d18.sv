class check;
  rand bit [99:0] val;
  rand bit [6:0] id;
  
  constraint flag_id {id inside {[0:95]};}

  constraint val_v {$countones(val) == 5;}
  constraint val_cont {val == 'b11111 << id;}
    
endclass

module tb;
  check ch = new();
  
  initial begin
    repeat(20) begin
    assert(ch.randomize());
      $display("id = %0d",ch.id);
      $displayb(ch.val);
    end
    #1 $finish();
  end
  
endmodule
