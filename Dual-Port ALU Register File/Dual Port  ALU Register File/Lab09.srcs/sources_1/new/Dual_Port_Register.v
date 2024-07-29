`timescale 1ns / 1ps
module Dual_Port_Register(Operation , Source1 , Source2 , Destination ,En , clk);
    input [3:0] Source1 , Source2 ;
    input [3:0] Destination;
    input [3:0] Operation ; 
    input clk , En;
    reg [31:0] R[0:15];
    reg CarryOUT ; 
    reg [32:0] Result ; 

    // Randomly Initialising R0 -> R15
    initial
    begin
        R[0] = $random;
        R[1] = $random;
        R[2] = $random;
        R[3] = $random;
        R[4] = $random;
        R[5] = $random;
        R[6] = $random;
        R[7] = $random;
        R[8] = $random;
        R[9] = $random;
        R[10] = $random;
        R[11] = $random;
        R[12] = $random;
        R[13] = $random;
        R[14] = $random;
        R[15] = $random; 
    end
    
    always @(posedge clk)
    begin
        if(En) 
        begin   
        case(Operation) 
            4'b0001 : Result = R[Source1] + R[Source2]  ;
            4'b0010 : R[Destination] = R[Source1] & R[Source2] ;
            default : R[Destination] = R[Destination]  ;
        endcase
        
        R[Destination] = Result[31:0] ; 
        CarryOUT = Result[32] ; 
        end 
     end
endmodule
