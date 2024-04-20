class check;
  rand bit [7:0] a;
  bit [7:0] prev_a;
  
  constraint a_val {if (prev_a[0] == 1) (a[0] == 0) dist {1:=75,0:=25};
                    else (a[0] == 0) dist {1:=25,0:=75};}
  function void post_randomize();
    prev_a = a;
  endfunction
endclass

module tb;
  initial begin
    check ch = new();
    
    repeat(10) begin
      assert(ch.randomize());
      $display("CHECK = %0d",ch.a);
    end
    #1 $finish();
  end
endmodule
