module d1;
	//0102030405
	class test;
	rand int val[10];

	constraint c1{foreach(val[i]){
			if(i%2 == 0){
				val[i] == 0;
            		}else if(i%2 != 0){
              			val[i] == (i+1)/2;
			}}}
	endclass

initial
begin
test t = new();
t.randomize();

#1 $display("Value after randomization = %0p",t.val);
#5 $finish();
end
endmodule
