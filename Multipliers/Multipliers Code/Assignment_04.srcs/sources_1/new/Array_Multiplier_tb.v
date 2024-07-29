`timescale 1ns / 1ps

module Array_Multiplier_tb();
reg [7:0] A , B ; 
wire [15:0] OUT ; 

Array_Multiplier uut(A , B , OUT) ; 

initial 
begin 
A = 8'b00000011 ; B = 8'b11110000 ; 
#10 
A = 8'b11111111 ; B = 8'b11111111 ; 
#10 
A = 88 ; B = 88 ;
#10 
A = 1 ; B = 126 ;
#10
A = 77 ; B = 211 ; 
#10 
A = 1 ; B = 1 ; 
#10 


$finish() ;
end 
endmodule
