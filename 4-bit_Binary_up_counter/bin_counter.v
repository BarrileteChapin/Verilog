`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 11:18:27 PM
// Design Name: 
// Module Name: bin_counter
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


module bin_counter(
 //   output f_out,
    output [3:0] q,
    input f_crystal,
    input rst_n
);

wire f_out; //auxiliar output 

//lab 3_2
freqdiiv_1hz e2(.f_crystal(f_crystal), .f_out(f_out), .rst_n(rst_n));
//prelab1 
binary_counter e1(.q(q), .clk(f_out), .rst_n(rst_n));

endmodule
