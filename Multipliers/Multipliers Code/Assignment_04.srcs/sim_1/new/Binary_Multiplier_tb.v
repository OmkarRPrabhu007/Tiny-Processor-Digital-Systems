`timescale 1ns / 1ps

module Binary_Multiplier_tb();
reg [3:0] A , B ; 
wire [7:0] OUT ; 

Binary_Multiplier uut(A , B , OUT) ; 

initial 
begin 
 
A = 8 ; B = 8 ;
#10 
A = 1 ; B = 12 ;
#10
A = 7 ; B = 1 ; 
#10 
A = 12 ; B = 15 ; 
#10 
A = 0 ; B = 0 ; 
#10 
A = 12 ; B = 0 ; 
#10 

$finish() ;
end 
endmodule
