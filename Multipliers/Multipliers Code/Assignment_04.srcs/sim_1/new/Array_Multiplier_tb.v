`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 15:49:16
// Design Name: 
// Module Name: Array_Multiplier_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Array_Multiplier_tb();

reg [3:0] A , B ; 
wire [7:0] OUT ; 

Array_Multiplier uut(A , B , OUT) ; 

initial 
begin 
 
A = 8 ; B = 8 ;
#10 
A = 2 ; B = 15 ;
#10
A = 15 ; B = 15 ; 
#10 
A = 12 ; B = 10 ; 
#10 
A = 0 ; B = 0 ; 
#10 
A = 12 ; B = 0 ; 
#10 

$finish() ;
end 
endmodule

