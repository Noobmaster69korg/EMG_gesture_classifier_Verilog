`timescale 1ns / 1ps

module max_pooling_tb;

    reg clk;
    reg reset;

    // 32 input signals
    reg signed [17:0] data_in [1:32];
    // 32 output signals
    wire signed [17:0] data_out [1:32];
    wire reset_next_stage;

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns period

    // Map individual inputs and outputs
    max_pooling uut (
        .clk(clk),
        .reset(reset),
        .data_in_1(data_in[1]), .data_in_2(data_in[2]), .data_in_3(data_in[3]), .data_in_4(data_in[4]),
        .data_in_5(data_in[5]), .data_in_6(data_in[6]), .data_in_7(data_in[7]), .data_in_8(data_in[8]),
        .data_in_9(data_in[9]), .data_in_10(data_in[10]), .data_in_11(data_in[11]), .data_in_12(data_in[12]),
        .data_in_13(data_in[13]), .data_in_14(data_in[14]), .data_in_15(data_in[15]), .data_in_16(data_in[16]),
        .data_in_17(data_in[17]), .data_in_18(data_in[18]), .data_in_19(data_in[19]), .data_in_20(data_in[20]),
        .data_in_21(data_in[21]), .data_in_22(data_in[22]), .data_in_23(data_in[23]), .data_in_24(data_in[24]),
        .data_in_25(data_in[25]), .data_in_26(data_in[26]), .data_in_27(data_in[27]), .data_in_28(data_in[28]),
        .data_in_29(data_in[29]), .data_in_30(data_in[30]), .data_in_31(data_in[31]), .data_in_32(data_in[32]),
        .data_out_1(data_out[1]), .data_out_2(data_out[2]), .data_out_3(data_out[3]), .data_out_4(data_out[4]),
        .data_out_5(data_out[5]), .data_out_6(data_out[6]), .data_out_7(data_out[7]), .data_out_8(data_out[8]),
        .data_out_9(data_out[9]), .data_out_10(data_out[10]), .data_out_11(data_out[11]), .data_out_12(data_out[12]),
        .data_out_13(data_out[13]), .data_out_14(data_out[14]), .data_out_15(data_out[15]), .data_out_16(data_out[16]),
        .data_out_17(data_out[17]), .data_out_18(data_out[18]), .data_out_19(data_out[19]), .data_out_20(data_out[20]),
        .data_out_21(data_out[21]), .data_out_22(data_out[22]), .data_out_23(data_out[23]), .data_out_24(data_out[24]),
        .data_out_25(data_out[25]), .data_out_26(data_out[26]), .data_out_27(data_out[27]), .data_out_28(data_out[28]),
        .data_out_29(data_out[29]), .data_out_30(data_out[30]), .data_out_31(data_out[31]), .data_out_32(data_out[32]),
        .reset_next_stage(reset_next_stage)
    );

    // Test sequence
    integer i;
    initial begin
        // Initialize signals
        reset = 0;
        for ( i = 1; i <= 32; i = i + 1)
            data_in[i] = 0;

        #10;

        // Apply reset
        $display("\n--- Applying reset ---");
        reset = 1;
        #10;
        reset = 0;

        // Feed values to inputs
        $display("\n--- Applying input values ---");
        for ( i = 1; i <= 32; i = i + 1) begin
            data_in[i] = i * 3; // Arbitrary increasing values
            #10;
        end
        // Run simulation for a few clock cycles
        #100;
        // Show some outputs        
        $display("\n--- Output after a few clock cycles ---");
        for (i = 1; i <= 32; i = i + 1)
            $display("data_out[%0d] = %0d", i, data_out[i]);

        $finish;
    end

    // Monitor reset behavior
    initial begin
        $display("Time\tclk\treset\treset_next_stage");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk, reset, reset_next_stage);
    end

endmodule
