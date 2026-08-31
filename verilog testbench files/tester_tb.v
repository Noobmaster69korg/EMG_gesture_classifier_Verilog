`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 10:29:13 AM
// Design Name: 
// Module Name: tester
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


module tester();
    reg clk, ena;
    reg [6:0] addra;      // 7 bits needed: depth is 64 (0-63)
    wire [7:0] douta;
    blk_mem_gen_0 dut (.clka(clk),.ena(ena),.addra(addra),.douta(douta));
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin ena = 1; addra = 0; end
    always @(posedge clk) addra <= addra + 1;
    always @(posedge clk) $display("addr=%0d douta=%0d", addra, $signed(douta));
endmodule
