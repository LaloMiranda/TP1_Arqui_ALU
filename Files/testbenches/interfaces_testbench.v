`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2021 22:29:18
// Design Name: 
// Module Name: interfaces_testbench
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


module interfaces_testbench;

parameter N = 8;
parameter N_op = 6;
parameter N_switches = 3;

//Inputs
reg [N - 1:0] i_switches;
reg [N_op - 1:0] i_buttons;
reg i_clock;
reg i_reset;
//Outputs
wire [N - 1:0] o_a;
wire [N - 1:0] o_b;
wire [N - 1:0] o_op;


initial begin
    i_clock = 0; 
    i_reset = 0;

    i_switches = 8'b11111111;
    i_buttons = 3'b001;
    
    #10
    i_switches = 8'b1000000;
    i_buttons = 3'b010;
    
    #10
    i_switches = 8'b00100000;
    i_buttons = 3'b100;
    
    #10
    $finish;
end

always #5 i_clock = ~i_clock;

//Connection between tb and module
interfaces interfaces_instance(
    .input_switches(i_switches),
    .input_buttons(i_buttons),
    .input_clock(i_clock),
    .input_reset(i_reset),
    .output_a(o_a),
    .output_b(o_b),
    .output_op(o_op)
);
endmodule
