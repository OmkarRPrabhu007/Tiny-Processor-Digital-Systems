`timescale 1ns / 1ps

module Processor_Sim(En , Clk ,  Out );
input En ; 
input Clk ; 
output reg [15:0]Out ;
reg [7:0]Inst ;  
reg [7:0]Acc ; 
reg [7:0]Inst_Mem[19:0] ; 
reg [7:0]PC ; 
reg C_B ; 
reg [7:0]Ext ; 
reg [7:0]Register[15:0] ;
reg [3:0]Oper ; 
reg [3:0]Address ; 
reg [7:0] Dividend , Divisor, Quotient , Remainder ; 
reg [15:0] Conc ; 

integer k;    
    
initial
begin
PC = 8'b00000000;
Ext = 8'b00000000;
Acc = 8'b01000100 ; 
Out = {8'b00000000 , Acc} ; 
C_B = 0 ; 

Register[0] = 8'b00001010; // Decimal 10
Register[1] = 8'b00010100; // Decimal 20
Register[2] = 8'b00011110; // Decimal 30
Register[3] = 8'b00101000; // Decimal 40
Register[4] = 8'b00110010; // Decimal 50
Register[5] = 8'b00111100; // Decimal 60
Register[6] = 8'b01000110; // Decimal 70
Register[7] = 8'b01010000; // Decimal 80
Register[8] = 8'b01011010; // Decimal 90
Register[9] = 8'b01100100; // Decimal 100
Register[10] = 8'b01101110; // Decimal 110
Register[11] = 8'b01111000; // Decimal 120
Register[12] = 8'b10000010; // Decimal 130
Register[13] = 8'b10001100; // Decimal 140
Register[14] = 8'b10010110; // Decimal 150
Register[15] = 8'b10100000; // Decimal 160

Inst_Mem[0] =  8'b00000000;
Inst_Mem[1] =  8'b00000001;
Inst_Mem[2] =  8'b00000010;
Inst_Mem[3] =  8'b00000011;
Inst_Mem[4] =  8'b00000100;
Inst_Mem[5] =  8'b00000101;
Inst_Mem[6] =  8'b00000110;
Inst_Mem[7] =  8'b00000111;
Inst_Mem[8] =  8'b00010010;
Inst_Mem[9] =  8'b00100011;
Inst_Mem[10] = 8'b00110101;
Inst_Mem[11] = 8'b01000011;
Inst_Mem[12] = 8'b01010100;
Inst_Mem[13] = 8'b01101111;
Inst_Mem[14] = 8'b01110100;
Inst_Mem[15] = 8'b10000001;
Inst_Mem[16] = 8'b10010001;
Inst_Mem[17] = 8'b10100001;
Inst_Mem[18] = 8'b10110001;
Inst_Mem[19] = 8'b11110001;
end

always@(posedge Clk)
begin
    Inst = Inst_Mem[PC] ;  
    Oper = Inst[7:4] ;
    Address = Inst[3:0] ;
    case(Oper) 
        4'b1111 : $stop() ; // HALT  
        4'b0000 : 
            case(Address)   
                4'b0001 : begin Acc <= Acc << 1 ; Out <= Acc ; end // Left Shift Left Logical 
                4'b0010 : begin Acc <= Acc >> 1  ; Out <= Acc ; end // Left Shift Right Logical 
                4'b0011 : begin Acc <= {Acc[0] , Acc[7:1]} ; Out <= Acc ; end // Circular Right Shift 
                4'b0100 : begin Acc <= {Acc[6:0] , Acc[7]} ; Out <= Acc ; end  // Circular Left Shift
                4'b0101 : begin Acc <= {Acc[7] , Acc[7:1]} ; Out <= Acc ; end  // Arithematic Right shift  
                4'b0110 : begin {C_B , Acc} <= Acc + 1 ; Out <= {C_B ,Acc} ; end  // Increments Acc ; 
                4'b0111 : begin {C_B , Acc} <= Acc - 1 ; Out <= {C_B , Acc} ; end  // Decrements Acc ;     
            endcase 
        4'b0001 : begin {C_B , Acc} <= Acc + Register[Address] ; Out <= {C_B , Acc} ; end  // Add Register[Address]
        4'b0010 : begin {C_B , Acc} <= Acc - Register[Address] ; Out <= {C_B , Acc} ; end  // Subtract Register[Address]  
        4'b0011 : begin {Ext , Acc} <= Acc * Register[Address]; Out <= {Ext , Acc} ; end  // Multiply Register[Address]
        4'b0100 : begin // Divide Register[Address]
                    Dividend = Acc;
                    Divisor = Register[Address];
                    Quotient = 8'b0;
                    Remainder = 8'b0;
                
                    for (k = 0; k < 8; k = k + 1)
                    begin
                        Remainder = Remainder << 1;
                        Remainder[0] = Dividend[7];
                        Dividend = {Dividend[6:0], 1'b0};
                
                        if (Remainder >= Divisor)
                        begin
                            Remainder = Remainder - Divisor;
                            Quotient[7-k] = 1'b1;
                        end
                        else
                        begin
                            Quotient[7-k] = 1'b0;
                        end
                    end
                    Acc <= Quotient ; 
                    Ext <= Remainder ; 
                    Out <= {Remainder, Quotient};
                end  
        4'b0101 : begin Acc <= (Acc & Register[Address]); Out <= Acc ; end  // AND 
        4'b0110 : begin Acc <= (Acc ^ Register[Address]); Out <= Acc ; end  // XRA   
        4'b0111 : if (Acc < Register[Address])  // CMP
                    begin 
                    C_B <= 1;
                    Out <= {C_B , Acc} ;
                    end
                  else
                    begin 
                    C_B <= 0;
                    Out <= {C_B , Acc} ;
                    end
                     
        4'b1000 : if (C_B == 1) // Branch
                    begin
                    PC <= Address - 1;
                    Out <= PC ; 
                    end
        4'b1001 : begin Acc <= Register[Address] ; Out <= Acc ; end // MOV ACC , Ri
        4'b1010 : begin Register[Address] <= Acc ; Out <= Register[Address] ; end // MOV Ri , ACC   
        4'b1011 : begin PC <= Address - 1; Out <= PC ; end // Return  
        default : begin Acc <= Acc; Out <= Acc ; end       
    endcase
    
    PC = PC + 1 ; 
    
end
endmodule
