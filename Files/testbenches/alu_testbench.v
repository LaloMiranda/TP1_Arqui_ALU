`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2021 09:48:37
// Design Name: 
// Module Name: alu_testbench
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


module alu_testbench;

parameter N = 8;
parameter N_op = 6;

reg [N-1:0]date_a;
reg [N-1:0]date_b;
reg [N_op-1:0]op;
wire [N-1:0]result;

initial begin
    date_a = 1;
    date_b = 1;
    op = 6'b100000; //ADD
    
    #10
    op = 6'b100010; //SUB
    
    #10
    op = 6'b100100; //AND
    
    #10
    op = 6'b100101; //OR
    
    #10
    op = 6'b100110; //XOR
       
    #10
    op = 6'b100111; //NOR
    
    #10
    date_a = 8'b11111111;
    date_b = 8'b00000001;
    
    #10
    op = 6'b000010; //SRL
    
    #10
    op = 6'b000011; //SRA
    
    #10
    $finish;
    
end
alu alu1(.date_a(date_a), .date_b(date_b), .op(op), .result(result));
endmodule
