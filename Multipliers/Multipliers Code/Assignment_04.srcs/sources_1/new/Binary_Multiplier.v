`timescale 1ns / 1ps
module Binary_Multiplier(A , B ,OUT) ;
parameter n = 4;
input [n-1:0] A;
input [n-1:0] B;
output [2*n-1 : 0] OUT;
 
reg [n :0] TempA;
reg [n-1:0] TempB;
reg [2*n: 0] TempOUT ; 

integer i;
always @(*) 
begin
TempB = B;
TempA =0;
for (i = 0; i<= n-1; i = i+1)
begin
    if (B[i] == 1)
        TempA =TempA+A; //Also includes Carry
    else
        TempA =TempA;
        
    TempOUT={TempA, TempB};
    TempOUT=TempOUT>>1;
    TempA =TempOUT[2*n : n];
    TempB = TempOUT[n- 1 : 0];
    end
end
assign OUT = TempOUT[2*n-1:0] ; 
endmodule