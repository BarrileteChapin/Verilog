`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 05:32:53 PM
// Design Name: 
// Module Name: excess3
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


module excess3(
    input a,
    input b,
    input c,
    input d,
    output w,
    output x,
    output y,
    output z    
);

assign w = (a|(b&(d|c)));
assign x = b^(d|c);
assign y = ~(c^d);
assign z = ~d; 

endmodule
