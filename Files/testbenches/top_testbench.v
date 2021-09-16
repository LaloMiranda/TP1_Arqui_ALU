`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2021 23:08:11
// Design Name: 
// Module Name: top_testbench
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


module top_testbench;

parameter N = 8;
parameter N_op = 6;
parameter N_buttons = 3;
parameter N_switches = 8;

parameter test_amount = 10;

//Inputs
reg signed [N_switches - 1:0] i_switches;
reg [N_buttons - 1:0] i_buttons;
reg  i_clock;
reg i_reset;


//Output
wire [N - 1:0] o_leds;
//wire [N - 1:0] o_result;


//Connectors
wire [N - 1:0] conn_a;
wire [N - 1:0] conn_b;
wire [N_op - 1:0] conn_op;

//Variables
reg signed [N_switches - 1:0] i_varA;
reg signed [N_switches - 1:0] i_varB;
reg unsigned [N_op - 1: 0] r_op [7:0];
integer ii_op;
integer ii;



initial begin
    //Inicializo clk y res
    i_clock = 0;
    i_reset = 0;
    
    //inicializo indices
    ii_op = 0;
    ii = 0;
    
    //Inicializo r_op
    r_op[0] = 32;   //ADD
    r_op[1] = 34;   //SUB
    r_op[2] = 36;   //AND
    r_op[3] = 37;   //OR
    r_op[4] = 38;   //XOR
    r_op[5] = 3;    //SRA
    r_op[6] = 2;    //SRL
    r_op[7] = 39;   //NOR
    
    $display("Starting test");
    
    
    
    for(ii_op = 0; ii_op <= 7; ii_op = ii_op + 1) begin
        
        for(ii = 0; ii < test_amount; ii = ii + 1) begin
            #2
            //Assign A value
            i_varA = $urandom;
            i_switches = i_varA;
            i_buttons = 3'b001;
            
            #2
            //Assign B value
            if(ii_op == 5) begin
                i_varB = 2;
            end
            else begin
                i_varB = $urandom;
            end
            i_switches = i_varB;
            i_buttons = 3'b010;
            
            #2
            //Assign op value
            i_switches = r_op[ii_op];
            i_buttons = 3'b100;
            
            
            #2
            case(r_op[ii_op])
                32: if((i_varA + i_varB) !== o_leds) begin
                        $display("%b + %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la suma");
                        //$finish;
                    end
                34: if((i_varA - i_varB) !== o_leds) begin
                        $display("%b - %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la resta");
                        //$finish;
                    end
                36: if((i_varA & i_varB) !== o_leds) begin
                        $display("%b & %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operación AND");
                        //$finish;
                    end
                37: if((i_varA | i_varB) !== o_leds) begin
                        $display("%b | %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operación OR");
                        //$finish;
                    end
                38: if((i_varA ^ i_varB) !== o_leds) begin
                        $display("%b ^ %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operacion XOR");
                        //$finish;
                    end
                3: if((i_varA >>> i_varB) !== o_leds) begin
                        $display("%b >>> %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operacion SRA");
                        //$finish;
                    end
                2: if((i_varA >> i_varB) !== o_leds) begin
                        $display("%b >> %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operacion SRL");
                        //$finish;
                    end
                39: if(~(i_varA | i_varB) !== o_leds) begin
                        $display("%b NOR %b = %b", i_varA, i_varB, o_leds);
                        $display("Error en la Operacion NOR");
                        //$finish;
                    end
            endcase
            
        end
        $display("Test %d pasado", ii_op);
    end
    
    #10
    $finish;
end

always #1 i_clock = ~i_clock;

top top_instance(
    .i_switches(i_switches),
    .i_buttons(i_buttons),
    .i_clock(i_clock),
    .i_reset(i_reset),
    .o_leds(o_leds)
);

endmodule
