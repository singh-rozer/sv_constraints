class check;
  rand int unsigned a;

  constraint val_4 { a inside {[1584:3000]}; //range can be increased.
    (a%400 == 0) || (a%4 == 0 && a%100 != 0);}
    
endclass

module tb;
  check ch = new();
  
  initial begin
    repeat(5) begin
    assert(ch.randomize());
      $display("Leap year = %0d",ch.a);
    end
    #1 $finish();
  end

endmodule
