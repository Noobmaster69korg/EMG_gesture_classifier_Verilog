`timescale 1ns / 1ps


module mux_sel (
    input wire clk,
    input wire rst,         // Active-high synchronous reset
    output reg [1:0] out    // 2-bit output to hold values 0 to 3
);

    // Counter to count up to 509
    reg [8:0] cycle_counter;  // 9-bit is enough to count up to 509

    always @(posedge clk) begin
        if (rst) begin
            cycle_counter <= 9'd0;
            out <= 2'd0;
        end 
        else begin
            if (cycle_counter == 9'd509) begin  // 509th cycle (0 to 508)
                cycle_counter <= 9'd0;
                out <= out + 1;
            end 
            else begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end

endmodule
