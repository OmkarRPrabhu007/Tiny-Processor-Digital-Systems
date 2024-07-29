`timescale 1ns / 1ps

module Dual_Port_Register_tb();
reg [3:0]Source1 , Source2 , Destination ;
reg clk , En; 
reg [3:0] Operation ; 
Dual_Port_Register uut(Operation , Source1 , Source2 , Destination ,En , clk) ; 

initial 
begin 
clk = 1 ; 
forever #5 clk = ~clk ; 
end

initial
begin  
Operation = 4'b0001 ; Source1 = 4'b0110 ; Source2 = 4'b1010 ; Destination = 4'b1001 ; En =1 ; 
#10 
Operation = 4'b0001 ; Source1 = 4'b0101 ; Source2 = 4'b1011 ; Destination = 4'b0010 ; En = 1 ; 
#10 
Operation = 4'b0010 ; Source1 = 4'b0111 ; Source2 = 4'b1101 ; Destination = 4'b0011 ; En = 0 ; 
#10
Operation = 4'b0000 ; Source1 = 4'b1111 ; Source2 = 4'b1110 ; Destination = 4'b0110 ; En = 1; 
#10
Operation = 4'b0001; Source1 = 4'b1010 ; Source2 = 4'b0101 ; Destination = 4'b1011 ; En =1 ; 
#10 
Operation = 4'b0010 ; Source1 = 4'b0011 ; Source2 = 4'b1011 ; Destination = 4'b1100 ; En = 0 ; 
#10 
Operation = 4'b0001 ; Source1 = 4'b1101 ; Source2 = 4'b1101 ; Destination = 4'b0101 ; En = 1 ; 
#10
Operation = 4'b0010 ; Source1 = 4'b1111 ; Source2 = 4'b1111 ; Destination = 4'b1111 ; En = 1 ; 
#10

$finish() ;
end

endmodule

