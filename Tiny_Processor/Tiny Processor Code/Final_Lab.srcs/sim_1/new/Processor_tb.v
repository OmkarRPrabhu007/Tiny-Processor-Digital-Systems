`timescale 1ns / 1ps

module Processor_tb();
reg Clk;
reg En;
wire [15:0] Out ; 

Processor_Sim uut (En , Clk, Acc );

initial
begin
    Clk = 1;
    forever #5 Clk = ~Clk;
end

initial
begin

En = 1 ; 
#150;

$finish() ; 
end
endmodule



