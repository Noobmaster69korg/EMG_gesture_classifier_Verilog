`timescale 1ns/1ps

module filter_tb;

    // Inputs
    reg clk;
    reg reset;
    reg signed [7:0] ch0, ch1, ch2, ch3, ch4, ch5;
    reg signed [7:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11;
    reg signed [7:0] bias;

    // Output
    wire signed [17:0] result;

    // Instantiate the DUT
    filter dut (
        .clk(clk),
        .reset(reset),
        .bias(bias),
        .ch0(ch0), .ch1(ch1), .ch2(ch2), .ch3(ch3), .ch4(ch4), .ch5(ch5),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5),
        .w6(w6), .w7(w7), .w8(w8), .w9(w9), .w10(w10), .w11(w11),
        .result(result)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 100MHz clock

    initial begin
        // Initialize
        reset = 1;
        ch0 = 0;
        ch1 = 0;
        ch2 = 0;
        ch3 = 0;
        ch4 = 0;
        ch5 = 0;
        w0 = 0;
        w1 = 0;
        w2 = 0;
        w3 = 0;
        w4 = 0;
        w5 = 0;
        w6 = 0;
        w7 = 0;
        w8 = 0;
        w9 = 0;
        w10 = 0;
        w11 = 0;
        bias = 0;

        // Wait a couple of cycles
        #12;
        reset = 0;

        // Stimulus 1
        ch0 = 8'd2; ch1 = 8'd3; ch2 = 8'd4;
        ch3 = 8'd5; ch4 = 8'd6; ch5 = 8'd7;

        w0 = 8'd1; w1 = 8'd2; w2 = 8'd3;
        w3 = 8'd4; w4 = 8'd5; w5 = 8'd6;

        w6 = 8'd1; w7 = 8'd1; w8 = 8'd1;
        w9 = 8'd1; w10 = 8'd1; w11 = 8'd1;

        bias = 8'd10;

        repeat(4) @(posedge clk);

        // Stimulus 2
        ch0 = -8'd2; ch1 = 8'd1; ch2 = -8'd1;
        ch3 = 8'd1; ch4 = 8'd0; ch5 = 8'd3;

        w0 = -8'd1; w1 = -8'd2; w2 = -8'd3;
        w3 = 8'd4; w4 = 8'd2; w5 = 8'd1;

        w6 = 8'd0; w7 = 8'd0; w8 = 8'd0;
        w9 = 8'd0; w10 = 8'd0; w11 = 8'd0;

        bias = -8'd5;

        #50;

        // Finish
        $display("Simulation done.");
        $finish;
    end

    always @(posedge clk) begin
        $display("Time: %0t | Result: %d", $time, result);
    end

endmodule
