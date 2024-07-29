`timescale 1ns / 1ps

module Processor_Sim_tb();
reg Clk;
reg En;
wire [15:0] Out ; 

Processor_Sim uut (En , Clk, Out );

initial
begin
    Clk = 1;
    forever #5 Clk = ~Clk;
end

initial
begin

En = 1 ; 
#250;

$finish() ; 
end
endmodule



