`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2026 16:46:26
// Design Name: 
// Module Name: tb_weight_loader_L2
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



module tb_weight_loader_L2();

    reg clk, reset;
    reg [6:0] counter;        // exact replica of L2_bram.v's ROM address counter
    wire [7:0] rom_data_out;

    wire signed [7:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15,
                       w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31,
                       w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43, w44, w45, w46, w47,
                       w48, w49, w50, w51, w52, w53, w54, w55, w56, w57, w58, w59, w60, w61, w62, w63;

    // Real ROM, real loaded weights - blk_mem_gen_0 (filter 0)
    blk_mem_gen_0 rom (.clka(clk), .ena(!reset), .addra(counter), .douta(rom_data_out));

    // Real weight_loader, fed by the real ROM's output
    weight_loader #(.N(32)) dut (
        .clk(clk), .reset(reset), .data_in(rom_data_out),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7),
        .w8(w8), .w9(w9), .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15),
        .w16(w16), .w17(w17), .w18(w18), .w19(w19), .w20(w20), .w21(w21), .w22(w22), .w23(w23),
        .w24(w24), .w25(w25), .w26(w26), .w27(w27), .w28(w28), .w29(w29), .w30(w30), .w31(w31),
        .w32(w32), .w33(w33), .w34(w34), .w35(w35), .w36(w36), .w37(w37), .w38(w38), .w39(w39),
        .w40(w40), .w41(w41), .w42(w42), .w43(w43), .w44(w44), .w45(w45), .w46(w46), .w47(w47),
        .w48(w48), .w49(w49), .w50(w50), .w51(w51), .w52(w52), .w53(w53), .w54(w54), .w55(w55),
        .w56(w56), .w57(w57), .w58(w58), .w59(w59), .w60(w60), .w61(w61), .w62(w62), .w63(w63)
    );

    // exact replica of L2_bram.v's counter logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 0;
        else begin
            if (counter > 63)
                counter <= 64;
            else
                counter <= counter + 1;
        end
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        #12;
        reset = 0;

        // give it comfortably more than enough cycles to finish loading
        #2000;

        $display("---- FINAL VALUES (expect w0=-4, w1=-15 if correct) ----");
        $display("w0  = %0d", w0);
        $display("w1  = %0d", w1);
        $display("w2  = %0d", w2);
        $display("w62 = %0d", w62);
        $display("w63 = %0d", w63);
        $stop;
    end

    // watch w0/w63 settle in real time too, in case they change more than once
    always @(w0 or w63)
        $display("t=%0t  w0=%0d  w63=%0d", $time, w0, w63);

endmodule


