`timescale 1ps / 0.1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2022 22:50:31
// Design Name: 
// Module Name: Image_parser
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


module Image_parser;
reg[7:0] threshold,value;
reg[1:0] select;
reg clk;
reg[7:0] inp[98303:0];
reg[7:0] out[98303:0];
reg[7:0] in_byte;
wire[7:0] out_byte; ;

Main M1(clk,select,value,threshold,in_byte,out_byte);

initial 
begin
    clk = 1'b1;
    forever
        #5 clk = ~clk;
end

initial
begin
    value   <= 8'b00111100;
    threshold <= 8'b10100000;
    select <= 2'b00; 
    $readmemb("/home/shinzo/Desktop/Udyam/ICHIP/2022/project_1/img.txt",inp);
end

integer i;

initial
begin
#5 in_byte <= inp[0];
#7out[0] = out_byte; 
$display("input : %b  output : %b ",inp[0],out[0]);
for (i=1;i<98304;i=i+1)
    begin
    #5 in_byte <= inp[i];
    #5 out[i] = out_byte; 
    $display("input : %b  output : %b ",inp[i],out[i]);
    end
    #8 select = select + 2'b01;
    $writememb("/home/shinzo/Desktop/Udyam/ICHIP/2022/project_1/output.txt",out);
    
#10 $finish;
    
end
endmodule
