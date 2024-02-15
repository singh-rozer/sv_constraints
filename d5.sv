class check;

  //Using unique
  /*//1D
  rand byte unsigned arr1[];
  
  constraint arr_size {arr1.size() <= 10;}
  
  constraint arr_val_1 {unique {arr1};}
  
  //2D
  rand byte unsigned arr2[2][2];
  
  constraint arr_val_2 {unique{arr2};}
  
  //3D
  rand byte unsigned arr3[2][2][2];
  constraint arr_val_3 {unique{arr3};}
  */
  /////////////////////
  
  //Using loop
  //1D
  rand byte unsigned arr1[];
  
  constraint arr_size {arr1.size() <= 10;}
  
  constraint arr_val_1 {foreach(arr1[i])
    foreach(arr1[j])if(i!=j) arr1[i] != arr1[j];}
  
  //2D
  rand byte unsigned arr2[2][2];
  
  constraint arr_val_2 {foreach(arr2[i,j])
    foreach(arr2[a,b])
    {(i!=a && j!=b) -> (arr2[i][j] != arr2[a][b]);}}
  
  //3D
  rand byte unsigned arr3[2][2][2];
  
                      constraint arr_val_3 {foreach(arr3[i,j,k])
                        foreach(arr3[a,b,c])
                          (!(i==a && j==b && k==c)) -> arr3[i][j][k] != arr3[a][b][c];}
  
endclass

module tb;
  
  check ch;
  
  initial begin
    ch = new();
    repeat(2) begin
      assert(ch.randomize());
      $display("%0p \n%0p \n%0p",ch.arr1,ch.arr2,ch.arr3);
    end
    #1 $finish();
  end
endmodule
