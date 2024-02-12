class check;
  rand bit [31:0] num;
  
  constraint only_12th {foreach(num[i]){
    if (i == 12) num[i] dist {0:=20,1:=80};
    else num[i] == 0;}}
endclass
                            
module tb;
  check ch;
  
  initial
    begin
      ch = new();
      
      repeat(10) begin
        ch.randomize();
        $display("ch = %0d", ch.num);
      end
       #1 $finish();
    end
endmodule
