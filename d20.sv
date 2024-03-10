class check;
  rand bit [4:0] a[11];

//   constraint arr_val { 
//     foreach(a[i])
//   {
//     i%2 == 0 -> a[i][0] == 0;
//     i%2 != 0 -> a[i][0] != 0;}}
  constraint arr_val {foreach(a[i]) i%2 == a[i]%2;}
endclass

module tb;
  check ch = new();
  
  initial begin
    repeat(1) begin
    assert(ch.randomize());
      $display("arr = %0p",ch.a);
    end
    #1 $finish();
  end

endmodule
