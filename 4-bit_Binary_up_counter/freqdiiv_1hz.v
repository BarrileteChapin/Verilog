`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 06:41:36 PM
// Design Name: 
// Module Name: freqdiiv_1hz
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
module freqdiiv_1hz(
    input f_crystal,   
    input rst_n,
    output reg f_out  // 1 hz output
 );
 //maximum value
 parameter MAX = 50000000; //cycles 
 //parameter MAX = 50000000/2;
 
reg [25:0] counter; //since we will need 25 bits to generate a output that is half positive and half negative -> just divide steps/2



always@(posedge f_crystal or negedge rst_n)
    if(~rst_n)
        begin
            f_out <=0;
            counter <=0;
        end
    else
        begin
             counter <= counter +1'b1;
            if(counter == (MAX-1))
            begin
                f_out<=!f_out;
                counter <=0;
            end
        end


endmodule







/* ***1st version  ***
module freqdiiv_1hz(
    input f_crystal,   
    input rst_n,
    output reg f_out  // 1 hz output
 );
 //maximum value
 parameter MAX = 50000000; //cycles 
 
 
 reg [25:0] counter; //since we will need 25 bits to generate a output that is half positive and half negative -> just divide steps/2
 reg [26:0] counter_aux; //input of DFF;
 
 
 
 always@*
    counter_aux = {f_out,counter} +1'b1; //increment
 
 always@ (posedge f_crystal or negedge rst_n)
    if(~rst_n)
        begin
            {f_out,counter} <=25'd0;
        end
    else
        begin
            if(counter==(26'd50000000-26'd1)) //when reach max value -> change value
                begin
                    counter <= 0;
                    f_out <= ~f_out; //change it
                end
            else
                begin
                  //  counter_aux <= {f_out,counter} +1'b1; //increment
                    {f_out,counter} <= counter_aux;
                end
        end
 
 
endmodule
*/