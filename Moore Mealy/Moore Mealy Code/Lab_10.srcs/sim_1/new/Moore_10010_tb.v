`timescale 1ns / 1ps

module Moore_10010_tb();
reg clk, Resetn, w;
wire z , CLK; 

Moore_10010 uut(clk, w , Resetn, z , CLK);

initial 
begin 
clk = 0 ; 
    forever #2.5 clk = ~clk ; 
end 

initial 
begin 
w = 0 ; Resetn = 0 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 0 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 0 ; Resetn = 1 ; 
#5
w = 1 ; Resetn = 1 ; 
#5

$finish ; 
end 

endmodule
