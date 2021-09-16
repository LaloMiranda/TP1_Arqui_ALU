`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2021 17:01:44
// Design Name: 
// Module Name: interfaces
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


module interfaces#(
    parameter N = 8,
    parameter N_op = 6,
    parameter N_switches = 3
    )(
    input wire signed [N - 1:0] input_switches,
    input wire [N_switches - 1:0] input_buttons,
    input wire input_clock,
    input wire input_reset,
    output reg signed [N-1:0]output_a,
    output reg signed [N-1:0]output_b,
    output reg signed [N-1:0]output_op
    );
    
    always@(posedge input_clock)begin
        if(input_buttons == 1) begin
            output_a <= input_switches;
        end
        if(input_buttons == 2) begin
            output_b <= input_switches;
        end
        if(input_buttons == 4) begin
            output_op <= input_switches;
        end
        
    end
    
    
endmodule
