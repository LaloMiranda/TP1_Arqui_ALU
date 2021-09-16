`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2021 22:57:20
// Design Name: 
// Module Name: top
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


module top#(parameter N = 8,
parameter N_op = 6,
parameter N_buttons = 6, 
parameter N_switches = 3
    )(
    input wire signed [N - 1:0] i_switches,
    input wire [N_switches - 1:0] i_buttons,
    input wire i_clock,
    input wire i_reset,
    output wire signed [N - 1:0] o_leds
    );

    wire signed [N - 1:0] conn_a;
    wire signed [N - 1:0] conn_b;
    wire signed [N_op - 1:0] conn_op;

    interfaces interfaces_instance(
        .input_switches(i_switches),
        .input_buttons(i_buttons),
        .input_clock(i_clock),
        .input_reset(i_reset),
        .output_a(conn_a),
        .output_b(conn_b),
        .output_op(conn_op)
    );

    alu alu_instance(
        .date_a(conn_a),
        .date_b(conn_b),
        .op(conn_op),
        .result(o_leds)
    );
endmodule
