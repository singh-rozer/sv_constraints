# sv_constraints
* d1:constraints to generate the pattern 0102030405.
* d2:constraint for an integer array with 10 elements such that exactly 3 of them are the same and the rest are unique.
* d3:constraint to randomize a 32-bit variable, but only randomize the 12th bit.
* d4:constraint to show 'b' depending on 'a' in following way -> case(a) 0: b=8;1: b=7;2: b=6;3: b=5;4: b=4;5: b=3;6: b=2;7: b=1;8: b=0;endcase
* d5:constraint to populate unique elements in array(1D,2D,3D)
* d6:constriant to generate pattern 9,99,999,9999...
* d7:constraint to generate number divisible by both 4 & 10
* d8:constraint for counting the number of ones in a variable.
* d9:constraint for PLL: ref_clk division ratio. (a) reference clk in range 10MHZ to 100MHZ. (b) division ratio is an 8-bit number. (c) output clk = reference clk * division ratio. (d) clk out in range 100MHZ to 5GHZ.
* d10:twoDarray:constraint for generating array with pattern [100,010,001].
* d11:twoDarray:constraint for generating array, which restricts 5 ones in a row and not more than a single one in a column.
* d12:twoDarray:(i) constraint for 3x3 array such that sum of rows and columns are same and elements are unique. (ii) sudoku version of (i)
* d13:twoDarray:constraint to generate same diagonal value in multidimensional array.
* d14:constraint to generate an address where 9 bits are always set to 1, and sequences of 111 or 000 should not occur in a 16-bit address.
* d15:twoDarray:constraints for the eight queens problem? two shouldn't lie in same row or column. (two shouldn't threaten each other)
* d16:constraint to pick a ball out of 10 different colored balls and that color should not be repeated for in next 3 draws
* d17:constraint to generate a random number with only 5 bits set and consecutively set for 80% of the time
