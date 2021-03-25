`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 10:56:53 PM
// Design Name: 
// Module Name: binary_counter
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


module binary_counter(
    output reg [3:0] q,
    input clk,
    input rst_n
    );
    
    reg [3:0] q_aux;
    
    //1st version requires two blocks: combinatorial and sequencial
    always @*
        q_aux = q + 1'b1;
        
    always @(posedge clk or negedge rst_n) //when the clock changes from 0 to 1
        if(~rst_n) q<=4'b0;
        else q<=q_aux;
    
    
    /* 2nd version
    always @(posedge clk or negedge rst_n)
        if(!rst_n) q <=0;
        else q<=q+1;
    */
endmodule
