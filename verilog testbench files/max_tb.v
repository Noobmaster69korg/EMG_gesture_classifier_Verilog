`timescale 1ns / 1ps

module max_tb;

    // Inputs
    reg clk;
    reg signed [17:0] data_in;
    reg reset;

    // Output
    wire signed [17:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    max uut (
        .clk(clk),
        .data_in(data_in),
        .reset(reset),
        .data_out(data_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Test input data
    reg signed [17:0] test_data [0:6];
    integer i;

    initial begin
        // Initialize test data: index 0 will be dummy (to align clock edges)
        test_data[0] = 0;
        test_data[1] = 5;
        test_data[2] = 9;
        test_data[3] = 3;
        test_data[4] = 12;
        test_data[5] = 7;
        test_data[6] = -4;

        // Initialize inputs
        reset = 1;
        data_in = 0;

        // Apply reset
        #12;
        reset = 0;

        // Apply test data on each rising edge of clk
        for (i = 1; i <= 6; i = i + 1) begin
            @(posedge clk);
            data_in <= test_data[i];
        end

        // Finish after a few more cycles
        repeat(3) @(posedge clk);
        $finish;
    end

    // Monitor output
    initial begin
        $display("Time\tclk\treset\tdata_in\t\tdata_out");
        $monitor("%0dns\t%b\t%b\t%d\t\t%d", $time, clk, reset, data_in, data_out);
    end

endmodule

