class check;
  rand int ref_clk;
  rand bit [7:0] div_ratio;
  rand int clk_out;
  
  constraint clk_range {
    ref_clk inside {[10:100]};
    div_ratio > 0;
    clk_out == ref_clk * div_ratio;
    solve ref_clk before clk_out;
    clk_out inside {[100:5000]};}
  
endclass

module tb;
  check ch;
  
  initial begin
    ch = new();
    assert(ch.randomize());
    $display("%0d MHZ(ref_clk ) * %0d (div_ratio) = %0d MHZ (clk_out)",ch.ref_clk,ch.div_ratio,ch.clk_out);
    #1 $finish();
  end
endmodule
