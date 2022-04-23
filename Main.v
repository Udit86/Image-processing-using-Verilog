`timescale 1ps / 0.1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2022 22:01:26
// Design Name: 
// Module Name: Main
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


module Main(
    input clk,
    input[1:0] select,
    input[7:0] value,threshold,in_byte,
    output[0:7] out_byte
);
reg[0:7] parser;
    always @(posedge clk)
        case(select)
            2'b00: parser = (in_byte > (8'b11111111 - value))? (8'b11111111) : (in_byte + value);
            //2'b00: parser <= in_byte + value;
            2'b01: parser = (in_byte < value)? (8'b00000000) : (in_byte - value);
            2'b10: parser = (in_byte > threshold)? (8'b11111111) : (8'b00000000);
            2'b11: parser = 8'b11111111 - in_byte;
        endcase    
        assign out_byte = parser;
endmodule
