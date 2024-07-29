`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////

module ClockDivide_1(input main_clk,output slow_clk);

reg [31:0] counter; //Initialisation
always@(posedge main_clk)
begin
counter <= counter + 1 ;
end

assign slow_clk = counter[27] ; 

endmodule

//////////////////////////////////////////////////////////////////////////////

module Moore_10010(clk, w, Resetn, z , CLK);
input clk, Resetn, w;
output z;
output CLK ;  


ClockDivide_1 inst1(clk , CLK) ; 

reg [2:0] y, Y; 
parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

// Initialize y to state A
initial begin
  y <= A;
end

always @(posedge CLK or negedge Resetn)
begin
  if (Resetn == 0)
    y <= A;
  else
    y <= Y;
end

always @(w or y)
case (y)
  A: if (w) Y = B;
    else Y = A;
  
  B: if (w) Y = B;
    else Y = C;
  
  C: if (w) Y = B;
    else Y = D;
  
  D: if (w) Y = E;
    else Y = A;
  
  E: if (w) Y = B;
    else Y = F;
  
  F: if (w) Y = B;
    else Y = D;
  
  default: Y = 3'bxxx;
endcase


assign z = (y == F);


endmodule
