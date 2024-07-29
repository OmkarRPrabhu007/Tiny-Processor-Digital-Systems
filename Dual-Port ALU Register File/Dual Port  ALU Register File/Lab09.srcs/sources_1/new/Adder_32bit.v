`timescale 1ns / 1ps

module Adder_32bit(A , B , S , CarryOUT);
parameter n = 32;
input [n-1:0] A, B;
output reg [n-1:0] S;
output reg CarryOUT;
reg [n:0] C;
integer k;

always @(A,B)
begin
C[0] = 0;
for (k=0; k<n; k=k+1)
begin
S[k] = A[k] ^ B[k] ^ C[k];
C[k+1] = (A[k] & B[k] ) | (A[k] & C[k] ) | (C[k] & B[k] ) ; 
end
CarryOUT = C[n];
end
endmodule
