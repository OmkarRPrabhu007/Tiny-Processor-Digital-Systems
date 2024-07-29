`timescale 1ns / 1ps

module Half_Adder(input a , input b , output sum ,  output cout);
  assign sum = a ^ b;
  assign cout = a & b;
endmodule
 
//////////////////////////////////////////////////////////////////////////////////

module Full_Adder(input a , input b , input cin , output sum ,  output cout);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

//////////////////////////////////////////////////////////////////////////////////

module Array_Multiplier(input [3:0]A , input [3:0]B , output [7:0]OUT) ; 

wire [1:4]Cout1 , Cout2 , Cout3 ;
wire [1:3] SUM1 , SUM2 , SUM3 ; 

assign OUT[0] = A[0]&B[0];

Half_Adder inst11(.a(A[0]&B[1]) , .b(A[1]&B[0]) , .sum(OUT[1]) , .cout(Cout1[1]));
Full_Adder inst12(.a(A[1]&B[1]) , .b(A[2]&B[0]) , .cin(Cout1[1]) , .sum(SUM1[1]) , .cout(Cout1[2]));
Full_Adder inst13(.a(A[2]&B[1]) , .b(A[3]&B[0]) , .cin(Cout1[2]) , .sum(SUM1[2]) , .cout(Cout1[3]));
Half_Adder inst14(.a(A[3]&B[1]) , .b(Cout1[3]) , .sum(SUM1[3]) , .cout(Cout1[4]));

Half_Adder inst21(.a(SUM1[1]) , .b(A[0]&B[2]) , .sum(OUT[2]) , .cout(Cout2[1])) ; 
Full_Adder inst22(.a(SUM1[2]) , .b(A[1]&B[2]) , .cin(Cout2[1]) , .sum(SUM2[1]) , .cout(Cout2[2]));
Full_Adder inst23(.a(SUM1[3]) , .b(A[2]&B[2]) , .cin(Cout2[2]) , .sum(SUM2[2]) , .cout(Cout2[3]));
Full_Adder inst24(.a(Cout1[4]) , .b(A[3]&B[2]) , .cin(Cout2[3]) , .sum(SUM2[3]) , .cout(Cout2[4]));

Half_Adder inst31(.a(SUM2[1]) , .b(A[0]&B[3]) , .sum(OUT[3]) , .cout(Cout3[1])) ; 
Full_Adder inst32(.a(SUM2[2]) , .b(A[1]&B[3]) , .cin(Cout3[1]) , .sum(SUM3[1]) , .cout(Cout3[2]));
Full_Adder inst33(.a(SUM2[3]) , .b(A[2]&B[3]) , .cin(Cout3[2]) , .sum(SUM3[2]) , .cout(Cout3[3]));
Full_Adder inst34(.a(Cout2[4]) , .b(A[3]&B[3]) , .cin(Cout3[3]) , .sum(SUM3[3]) , .cout(Cout3[4]));


assign OUT[4] = SUM3[1] ; 
assign OUT[5] = SUM3[2] ; 
assign OUT[6] = SUM3[3] ; 
assign OUT[7] = Cout3[4] ; 

endmodule 
