`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////

module ClockDivide(input main_clk,output slow_clk);
reg [31:0] counter;
always@(posedge main_clk)
begin
counter <= counter + 1;
end
assign slow_clk = counter[27];
endmodule
//////////////////////////////////////////////////////////////////////////////

module Mealy_10010(clk, w, Resetn, z , CLK );
input clk, w, Resetn ; 
output reg z ; 
output CLK ;  
reg [2:0]y , Y ;
  
parameter [2:0] A = 3'b000, B = 3'b001 , C = 3'b010 , D = 3'b011 , E = 3'b100;

ClockDivide inst(.main_clk(clk) , .slow_clk(CLK)) ; 

always @(w or y)
begin
case (y)
    A: if (w == 0)
        begin
        Y = A; z = 0;
        end
       else
        begin
        Y = B; z = 0;
        end   
    B: if (w == 0)
        begin
        Y = C; z = 0;
        end
        else
        begin
        Y = B; z = 0;
        end
    C: if (w == 0)
        begin
        Y = D; z = 0;
        end
        else
        begin
        Y = B; z = 0;
        end
    D: if (w == 0)
        begin
        Y = A; z = 0;
        end
        else
        begin
        Y = E; z = 0;
        end    
    E: if (w == 0)
        begin
        Y = C; z = 1;
        end
        else
        begin
        Y = B; z = 0;
        end      
    default : Y = A ;    
endcase
end

always @(negedge CLK or negedge Resetn)
begin
if (Resetn == 0)
y <= A;
else
y <= Y;
end
endmodule
