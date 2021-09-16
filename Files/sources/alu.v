`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2021 09:14:10
// Design Name: 
// Module Name: alu
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


module alu#(parameter N = 8, 
parameter N_op = 6)
(
    input wire signed [N-1:0] date_a,
    input wire signed [N-1:0] date_b,
    input wire [N_op-1:0] op,
    output reg [N-1:0] result
);

always@(*)begin
    if(op == 32)begin
        result = date_a + date_b;   //ADD
    end
    else if( op == 34 )begin
        result = date_a - date_b;   //SUB
    end
    else if( op == 36 )begin
        result = date_a & date_b;   //AND
    end
    else if( op == 37 )begin
        result = date_a | date_b;   //OR
    end
    else if( op == 38 )begin
        result = date_a ^ date_b;   //XOR
    end
    else if( op == 3 )begin
        result = date_a >>> date_b; //SRA muevo a lugares a la derecha de b, completando con el signo de b
    end
    else if( op == 2 )begin
        result = date_a >> date_b;  //SRL muevo a lugares a la derecha de b, completando con 0
    end
    else if( op == 39 )begin
        result = ~(date_a | date_b);   //NOR
    end

end
endmodule