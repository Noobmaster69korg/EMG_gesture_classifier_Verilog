`timescale 1ns / 1ps


module L2_negDFF(
    input  D,
    input clk,
    output reg Q

    );
    
    always@(negedge  clk)begin
        Q <= D;
    end
endmodule

module L2_posDFF(
    input D,
    input clk,
    output reg Q
    );
    always@(posedge clk)begin
        Q <= D;
    end
    endmodule
