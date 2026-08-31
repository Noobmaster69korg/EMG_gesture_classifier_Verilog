`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2026 18:10:14
// Design Name: 
// Module Name: single_real_sample_tb
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


module single_real_sample_tb;

    // =========================================================
    // DUT inputs
    // =========================================================

    reg clk;
    reg clk_2;

    reg reset;
    reg reset_data;

    reg signed [7:0] ch0;
    reg signed [7:0] ch1;
    reg signed [7:0] ch2;
    reg signed [7:0] ch3;
    reg signed [7:0] ch4;
    reg signed [7:0] ch5;


    // =========================================================
    // DUT outputs
    // =========================================================

    wire signed [31:0] max_out;
    wire [2:0] max_index;


    // =========================================================
    // Instantiate DUT
    // =========================================================

    top_mp5 dut (
        .clk       (clk),
        .clk_2     (clk_2),
        .reset     (reset),
        .reset_data(reset_data),

        .ch0(ch0),
        .ch1(ch1),
        .ch2(ch2),
        .ch3(ch3),
        .ch4(ch4),
        .ch5(ch5),

        .max_out  (max_out),
        .max_index(max_index)
    );


    // =========================================================
    // EMG DATA MEMORY
    //
    // Complete emg_data.hex:
    // 150 windows × 1019 samples
    //
    // Each word:
    // [47:40] = ch5
    // [39:32] = ch4
    // [31:24] = ch3
    // [23:16] = ch2
    // [15:8]  = ch1
    // [7:0]   = ch0
    // =========================================================

    localparam NUM_WINDOWS = 150;
    localparam SAMPLES_PER_WINDOW = 1019;

    localparam TOTAL_SAMPLES =
        NUM_WINDOWS * SAMPLES_PER_WINDOW;

    reg [47:0] emg_mem [0:TOTAL_SAMPLES-1];


    // =========================================================
    // Test parameters
    // =========================================================

    // 37th window = index 36
    localparam TEST_WINDOW = 14;

    // According to your label mapping:
    // windows 25-49 -> class 3
    localparam EXPECTED_CLASS = 3;

    localparam START_INDEX =
        TEST_WINDOW * SAMPLES_PER_WINDOW;


    // =========================================================
    // Variables
    // =========================================================

    integer sample;
    integer mem_index;

    integer result;


    // =========================================================
    // Clock generation
    // =========================================================

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end


    initial begin
        clk_2 = 0;
        #10;
        forever #20 clk_2 = ~clk_2;
    end


    // =========================================================
    // Load EMG data
    // =========================================================

    initial begin

        $display("");
        $display("==============================================");
        $display("       REAL EMG CLASSIFIER TEST");
        $display("==============================================");

        $display("Loading emg_data.hex...");

        $readmemh("emg_data.hex", emg_mem);

        $display("Loaded %0d total EMG samples",
                 TOTAL_SAMPLES);

        $display("");
        $display("Testing window      : %0d",
                 TEST_WINDOW + 1);

        $display("Window index        : %0d",
                 TEST_WINDOW);

        $display("Start memory index  : %0d",
                 START_INDEX);

        $display("Expected class      : %0d",
                 EXPECTED_CLASS);

        $display("==============================================");
        $display("");

    end


    // =========================================================
    // Reset
    // =========================================================

    initial begin

        reset      = 1;
        reset_data = 1;

        ch0 = 0;
        ch1 = 0;
        ch2 = 0;
        ch3 = 0;
        ch4 = 0;
        ch5 = 0;

        // Same reset timing as current TB
        #180;

        reset = 0;

        #8020;

        reset_data = 0;

    end


    // =========================================================
    // Main stimulus
    // =========================================================

    initial begin

        // Wait for reset sequence
        #8200;


        // =====================================================
        // Feed ONLY the 37th EMG window
        // =====================================================

        $display("");
        $display("----------------------------------------------");
        $display("FEEDING EMG WINDOW 37");
        $display("----------------------------------------------");


        for (sample = 0;
             sample < SAMPLES_PER_WINDOW;
             sample = sample + 1) begin


            // Memory location for this sample
            mem_index = START_INDEX + sample;


            // -------------------------------------------------
            // Extract six signed 8-bit channels
            // -------------------------------------------------

            ch0 <= $signed(
                emg_mem[mem_index][7:0]
            );

            ch1 <= $signed(
                emg_mem[mem_index][15:8]
            );

            ch2 <= $signed(
                emg_mem[mem_index][23:16]
            );

            ch3 <= $signed(
                emg_mem[mem_index][31:24]
            );

            ch4 <= $signed(
                emg_mem[mem_index][39:32]
            );

            ch5 <= $signed(
                emg_mem[mem_index][47:40]
            );


            // One EMG sample every 20 ns
            #20;

        end


        // =====================================================
        // All 1019 samples have now been fed
        // =====================================================

        $display("");
        $display("----------------------------------------------");
        $display("FINISHED FEEDING WINDOW 37");
        $display("----------------------------------------------");

        $display("Waiting for DUT to finish...");


        // Give DUT enough time to finish processing
        #100000;


        // =====================================================
        // Display result
        // =====================================================

        $display("");
        $display("==============================================");
        $display("              CLASSIFICATION RESULT");
        $display("==============================================");

        $display("Window tested : %0d",
                 TEST_WINDOW + 1);

        $display("Expected class: %0d",
                 EXPECTED_CLASS);

        $display("Predicted class: %0d",
                 max_index);

        $display("max_out: %0d",
                 max_out);


        if (max_index == EXPECTED_CLASS) begin

            $display("");
            $display("RESULT: PASS");
            $display("==============================================");

        end
        else begin

            $display("");
            $display("RESULT: FAIL");
            $display("==============================================");

        end


        #100;

        $finish;

    end

endmodule
