`timescale 1ns / 1ps
  
module Layer_1 (
    input clk,
    input data_reset,
    input reset,
    input signed [7:0] ch0,
    input signed [7:0] ch1,
    input signed [7:0] ch2,
    input signed [7:0] ch3,
    input signed [7:0] ch4,
    input signed [7:0] ch5,
    input clk_2,   
 /*   output signed [17:0] data_out_0,
    output signed [17:0] data_out_1,
    output signed [17:0] data_out_2,
    output signed [17:0] data_out_3,
    output signed [17:0] data_out_4,
    output signed [17:0] data_out_5,
    output signed [17:0] data_out_6,
    output signed [17:0] data_out_7,
    output signed [17:0] data_out_8,
    output signed [17:0] data_out_9,
    output signed [17:0] data_out_10,
    output signed [17:0] data_out_11,
    output signed [17:0] data_out_12,
    output signed [17:0] data_out_13,
    output signed [17:0] data_out_14,
    output signed [17:0] data_out_15,
    output signed [17:0] data_out_16,
    output signed [17:0] data_out_17,
    output signed [17:0] data_out_18,
    output signed [17:0] data_out_19,
    output signed [17:0] data_out_20,
    output signed [17:0] data_out_21,
    output signed [17:0] data_out_22,
    output signed [17:0] data_out_23,
    output signed [17:0] data_out_24,
    output signed [17:0] data_out_25,
    output signed [17:0] data_out_26,
    output signed [17:0] data_out_27,
    output signed [17:0] data_out_28,
    output signed [17:0] data_out_29,
    output signed [17:0] data_out_30,
    output signed [17:0] data_out_31, */
    
    output signed [17:0] d_out_1,
    output signed [17:0] d_out_2,
    output signed [17:0] d_out_3,
    output signed [17:0] d_out_4,
    output signed [17:0] d_out_5,
    output signed [17:0] d_out_6,
    output signed [17:0] d_out_7,
    output signed [17:0] d_out_8,
    output signed [17:0] d_out_9,
    output signed [17:0] d_out_10,
    output signed [17:0] d_out_11,
    output signed [17:0] d_out_12,
    output signed [17:0] d_out_13,
    output signed [17:0] d_out_14,
    output signed [17:0] d_out_15,
    output signed [17:0] d_out_16,
    output signed [17:0] d_out_17,
    output signed [17:0] d_out_18,
    output signed [17:0] d_out_19,
    output signed [17:0] d_out_20,
    output signed [17:0] d_out_21,
    output signed [17:0] d_out_22,
    output signed [17:0] d_out_23,
    output signed [17:0] d_out_24,
    output signed [17:0] d_out_25,
    output signed [17:0] d_out_26,
    output signed [17:0] d_out_27,
    output signed [17:0] d_out_28,
    output signed [17:0] d_out_29,
    output signed [17:0] d_out_30,
    output signed [17:0] d_out_31,
    output signed [17:0] d_out_32,
    output reset_next_stage  


);
    (*dont_touch = "true"*)wire signed [17:0] result_out [31:0]; //input to RELU block
    (*dont_touch = "true"*)wire signed [17:0] wxb [31:0]; // output of RELU block and subsequent input to Max_pooling
    (*dont_touch = "true"*)wire signed [17:0] wxc [31:0]; // output of Max_pooling block
    wire signed [7:0] w0 [31:0]; //12 weights for 32 filters
    wire signed [7:0] w1 [31:0];
    wire signed [7:0] w2 [31:0];
    wire signed [7:0] w3 [31:0];
    wire signed [7:0] w4 [31:0];
    wire signed [7:0] w5 [31:0];
    wire signed [7:0] w6 [31:0];
    wire signed [7:0] w7 [31:0];
    wire signed [7:0] w8 [31:0];
    wire signed [7:0] w9 [31:0];
    wire signed [7:0] w10 [31:0];
    wire signed [7:0] w11 [31:0];
    wire signed [7:0] bias [31:0]; // 1 bias for 32 filters
    reg q1,q2; //q2 is reset of max_pooling.  q1 is used to delay it by one cycle  
   // reg clk_2;
    wire reset_next_stage_1; // intermidiate variable for handling reset_next_stage
    wire [1:0] cycle_count; // used in counter_508 module
    (*dont_touch = "true"*) reg bram_reset; // used in write_enable for brams. 1:write into bram. 0:read from bram
    (*dont_touch = "true"*) wire [8:0] addr; // address to traverse the BRAMs
    
    initial begin
        bram_reset <= 0;
    end


    
    genvar i ;
    generate // generates 32 filter 
    for (i = 0 ; i < 32 ; i = i+1)begin
        filter f0 (.clk(clk),.reset(reset),.bias(bias[i]),.ch0(ch0),.ch1(ch1),.ch2(ch2),.ch3(ch3),.ch4(ch4),.ch5(ch5),
                   .w0(w0[i]),.w1(w1[i]),.w2(w2[i]),.w3(w3[i]),.w4(w4[i]),.w5(w5[i]),.w6(w6[i]),.w7(w7[i]),.w8(w8[i]),.w9(w9[i]),.w10(w10[i]),.w11(w11[i]),.result(result_out[i]));
    end  
    endgenerate
    
    //loads the 12 weights and 1 bias to 32 filters. wX_Y: X is filter mumber. Y is weight number
    weight_loader_L1 A1 (.clk(clk),.reset(reset),.w0_0(w0[0]), .w0_1(w1[0]), .w0_2(w2[0]), .w0_3(w3[0]), .w0_4(w4[0]), .w0_5(w5[0]), .w0_6(w6[0]), .w0_7(w7[0]), .w0_8(w8[0]), .w0_9(w9[0]), .w0_10(w10[0]), .w0_11(w11[0]), 
                        .w1_0(w0[1]), .w1_1(w1[1]), .w1_2(w2[1]), .w1_3(w3[1]), .w1_4(w4[1]), .w1_5(w5[1]), .w1_6(w6[1]), .w1_7(w7[1]), .w1_8(w8[1]), .w1_9(w9[1]), .w1_10(w10[1]), .w1_11(w11[1]), 
                        .w2_0(w0[2]), .w2_1(w1[2]), .w2_2(w2[2]), .w2_3(w3[2]), .w2_4(w4[2]), .w2_5(w5[2]), .w2_6(w6[2]), .w2_7(w7[2]), .w2_8(w8[2]), .w2_9(w9[2]), .w2_10(w10[2]), .w2_11(w11[2]), 
                        .w3_0(w0[3]), .w3_1(w1[3]), .w3_2(w2[3]), .w3_3(w3[3]), .w3_4(w4[3]), .w3_5(w5[3]), .w3_6(w6[3]), .w3_7(w7[3]), .w3_8(w8[3]), .w3_9(w9[3]), .w3_10(w10[3]), .w3_11(w11[3]), 
                        .w4_0(w0[4]), .w4_1(w1[4]), .w4_2(w2[4]), .w4_3(w3[4]), .w4_4(w4[4]), .w4_5(w5[4]), .w4_6(w6[4]), .w4_7(w7[4]), .w4_8(w8[4]), .w4_9(w9[4]), .w4_10(w10[4]), .w4_11(w11[4]), 
                        .w5_0(w0[5]), .w5_1(w1[5]), .w5_2(w2[5]), .w5_3(w3[5]), .w5_4(w4[5]), .w5_5(w5[5]), .w5_6(w6[5]), .w5_7(w7[5]), .w5_8(w8[5]), .w5_9(w9[5]), .w5_10(w10[5]), .w5_11(w11[5]), 
                        .w6_0(w0[6]), .w6_1(w1[6]), .w6_2(w2[6]), .w6_3(w3[6]), .w6_4(w4[6]), .w6_5(w5[6]), .w6_6(w6[6]), .w6_7(w7[6]), .w6_8(w8[6]), .w6_9(w9[6]), .w6_10(w10[6]), .w6_11(w11[6]), 
                        .w7_0(w0[7]), .w7_1(w1[7]), .w7_2(w2[7]), .w7_3(w3[7]), .w7_4(w4[7]), .w7_5(w5[7]), .w7_6(w6[7]), .w7_7(w7[7]), .w7_8(w8[7]), .w7_9(w9[7]), .w7_10(w10[7]), .w7_11(w11[7]), 
                        .w8_0(w0[8]), .w8_1(w1[8]), .w8_2(w2[8]), .w8_3(w3[8]), .w8_4(w4[8]), .w8_5(w5[8]), .w8_6(w6[8]), .w8_7(w7[8]), .w8_8(w8[8]), .w8_9(w9[8]), .w8_10(w10[8]), .w8_11(w11[8]), 
                        .w9_0(w0[9]), .w9_1(w1[9]), .w9_2(w2[9]), .w9_3(w3[9]), .w9_4(w4[9]), .w9_5(w5[9]), .w9_6(w6[9]), .w9_7(w7[9]), .w9_8(w8[9]), .w9_9(w9[9]), .w9_10(w10[9]), .w9_11(w11[9]), 
                        .w10_0(w0[10]), .w10_1(w1[10]), .w10_2(w2[10]), .w10_3(w3[10]), .w10_4(w4[10]), .w10_5(w5[10]), .w10_6(w6[10]), .w10_7(w7[10]), .w10_8(w8[10]), .w10_9(w9[10]), .w10_10(w10[10]), .w10_11(w11[10]), 
                        .w11_0(w0[11]), .w11_1(w1[11]), .w11_2(w2[11]), .w11_3(w3[11]), .w11_4(w4[11]), .w11_5(w5[11]), .w11_6(w6[11]), .w11_7(w7[11]), .w11_8(w8[11]), .w11_9(w9[11]), .w11_10(w10[11]), .w11_11(w11[11]), 
                        .w12_0(w0[12]), .w12_1(w1[12]), .w12_2(w2[12]), .w12_3(w3[12]), .w12_4(w4[12]), .w12_5(w5[12]), .w12_6(w6[12]), .w12_7(w7[12]), .w12_8(w8[12]), .w12_9(w9[12]), .w12_10(w10[12]), .w12_11(w11[12]), 
                        .w13_0(w0[13]), .w13_1(w1[13]), .w13_2(w2[13]), .w13_3(w3[13]), .w13_4(w4[13]), .w13_5(w5[13]), .w13_6(w6[13]), .w13_7(w7[13]), .w13_8(w8[13]), .w13_9(w9[13]), .w13_10(w10[13]), .w13_11(w11[13]), 
                        .w14_0(w0[14]), .w14_1(w1[14]), .w14_2(w2[14]), .w14_3(w3[14]), .w14_4(w4[14]), .w14_5(w5[14]), .w14_6(w6[14]), .w14_7(w7[14]), .w14_8(w8[14]), .w14_9(w9[14]), .w14_10(w10[14]), .w14_11(w11[14]), 
                        .w15_0(w0[15]), .w15_1(w1[15]), .w15_2(w2[15]), .w15_3(w3[15]), .w15_4(w4[15]), .w15_5(w5[15]), .w15_6(w6[15]), .w15_7(w7[15]), .w15_8(w8[15]), .w15_9(w9[15]), .w15_10(w10[15]), .w15_11(w11[15]), 
                        .w16_0(w0[16]), .w16_1(w1[16]), .w16_2(w2[16]), .w16_3(w3[16]), .w16_4(w4[16]), .w16_5(w5[16]), .w16_6(w6[16]), .w16_7(w7[16]), .w16_8(w8[16]), .w16_9(w9[16]), .w16_10(w10[16]), .w16_11(w11[16]), 
                        .w17_0(w0[17]), .w17_1(w1[17]), .w17_2(w2[17]), .w17_3(w3[17]), .w17_4(w4[17]), .w17_5(w5[17]), .w17_6(w6[17]), .w17_7(w7[17]), .w17_8(w8[17]), .w17_9(w9[17]), .w17_10(w10[17]), .w17_11(w11[17]), 
                        .w18_0(w0[18]), .w18_1(w1[18]), .w18_2(w2[18]), .w18_3(w3[18]), .w18_4(w4[18]), .w18_5(w5[18]), .w18_6(w6[18]), .w18_7(w7[18]), .w18_8(w8[18]), .w18_9(w9[18]), .w18_10(w10[18]), .w18_11(w11[18]), 
                        .w19_0(w0[19]), .w19_1(w1[19]), .w19_2(w2[19]), .w19_3(w3[19]), .w19_4(w4[19]), .w19_5(w5[19]), .w19_6(w6[19]), .w19_7(w7[19]), .w19_8(w8[19]), .w19_9(w9[19]), .w19_10(w10[19]), .w19_11(w11[19]), 
                        .w20_0(w0[20]), .w20_1(w1[20]), .w20_2(w2[20]), .w20_3(w3[20]), .w20_4(w4[20]), .w20_5(w5[20]), .w20_6(w6[20]), .w20_7(w7[20]), .w20_8(w8[20]), .w20_9(w9[20]), .w20_10(w10[20]), .w20_11(w11[20]), 
                        .w21_0(w0[21]), .w21_1(w1[21]), .w21_2(w2[21]), .w21_3(w3[21]), .w21_4(w4[21]), .w21_5(w5[21]), .w21_6(w6[21]), .w21_7(w7[21]), .w21_8(w8[21]), .w21_9(w9[21]), .w21_10(w10[21]), .w21_11(w11[21]), 
                        .w22_0(w0[22]), .w22_1(w1[22]), .w22_2(w2[22]), .w22_3(w3[22]), .w22_4(w4[22]), .w22_5(w5[22]), .w22_6(w6[22]), .w22_7(w7[22]), .w22_8(w8[22]), .w22_9(w9[22]), .w22_10(w10[22]), .w22_11(w11[22]), 
                        .w23_0(w0[23]), .w23_1(w1[23]), .w23_2(w2[23]), .w23_3(w3[23]), .w23_4(w4[23]), .w23_5(w5[23]), .w23_6(w6[23]), .w23_7(w7[23]), .w23_8(w8[23]), .w23_9(w9[23]), .w23_10(w10[23]), .w23_11(w11[23]), 
                        .w24_0(w0[24]), .w24_1(w1[24]), .w24_2(w2[24]), .w24_3(w3[24]), .w24_4(w4[24]), .w24_5(w5[24]), .w24_6(w6[24]), .w24_7(w7[24]), .w24_8(w8[24]), .w24_9(w9[24]), .w24_10(w10[24]), .w24_11(w11[24]), 
                        .w25_0(w0[25]), .w25_1(w1[25]), .w25_2(w2[25]), .w25_3(w3[25]), .w25_4(w4[25]), .w25_5(w5[25]), .w25_6(w6[25]), .w25_7(w7[25]), .w25_8(w8[25]), .w25_9(w9[25]), .w25_10(w10[25]), .w25_11(w11[25]), 
                        .w26_0(w0[26]), .w26_1(w1[26]), .w26_2(w2[26]), .w26_3(w3[26]), .w26_4(w4[26]), .w26_5(w5[26]), .w26_6(w6[26]), .w26_7(w7[26]), .w26_8(w8[26]), .w26_9(w9[26]), .w26_10(w10[26]), .w26_11(w11[26]), 
                        .w27_0(w0[27]), .w27_1(w1[27]), .w27_2(w2[27]), .w27_3(w3[27]), .w27_4(w4[27]), .w27_5(w5[27]), .w27_6(w6[27]), .w27_7(w7[27]), .w27_8(w8[27]), .w27_9(w9[27]), .w27_10(w10[27]), .w27_11(w11[27]), 
                        .w28_0(w0[28]), .w28_1(w1[28]), .w28_2(w2[28]), .w28_3(w3[28]), .w28_4(w4[28]), .w28_5(w5[28]), .w28_6(w6[28]), .w28_7(w7[28]), .w28_8(w8[28]), .w28_9(w9[28]), .w28_10(w10[28]), .w28_11(w11[28]), 
                        .w29_0(w0[29]), .w29_1(w1[29]), .w29_2(w2[29]), .w29_3(w3[29]), .w29_4(w4[29]), .w29_5(w5[29]), .w29_6(w6[29]), .w29_7(w7[29]), .w29_8(w8[29]), .w29_9(w9[29]), .w29_10(w10[29]), .w29_11(w11[29]), 
                        .w30_0(w0[30]), .w30_1(w1[30]), .w30_2(w2[30]), .w30_3(w3[30]), .w30_4(w4[30]), .w30_5(w5[30]), .w30_6(w6[30]), .w30_7(w7[30]), .w30_8(w8[30]), .w30_9(w9[30]), .w30_10(w10[30]), .w30_11(w11[30]), 
                        .w31_0(w0[31]), .w31_1(w1[31]), .w31_2(w2[31]), .w31_3(w3[31]), .w31_4(w4[31]), .w31_5(w5[31]), .w31_6(w6[31]), .w31_7(w7[31]), .w31_8(w8[31]), .w31_9(w9[31]), .w31_10(w10[31]), .w31_11(w11[31]),
                        .bias_0(bias[0]), .bias_1(bias[1]), .bias_2(bias[2]), .bias_3(bias[3]), .bias_4(bias[4]), .bias_5(bias[5]), .bias_6(bias[6]), .bias_7(bias[7]), .bias_8(bias[8]), .bias_9(bias[9]), .bias_10(bias[10]),
                        .bias_11(bias[11]), .bias_12(bias[12]), .bias_13(bias[13]), .bias_14(bias[14]), .bias_15(bias[15]), .bias_16(bias[16]), .bias_17(bias[17]), .bias_18(bias[18]), .bias_19(bias[19]), .bias_20(bias[20]),
                        .bias_21(bias[21]), .bias_22(bias[22]), .bias_23(bias[23]), .bias_24(bias[24]), .bias_25(bias[25]), .bias_26(bias[26]), .bias_27(bias[27]), .bias_28(bias[28]), .bias_29(bias[29]), .bias_30(bias[30]),
                        .bias_31(bias[31]) 
);

    relu A2 (.reset(reset),.data_in_1(result_out[0]), .data_in_2(result_out[1]), .data_in_3(result_out[2]), .data_in_4(result_out[3]), .data_in_5(result_out[4]), .data_in_6(result_out[5]), .data_in_7(result_out[6]),
             .data_in_8(result_out[7]), .data_in_9(result_out[8]), .data_in_10(result_out[9]), .data_in_11(result_out[10]), .data_in_12(result_out[11]), .data_in_13(result_out[12]), .data_in_14(result_out[13]), .data_in_15(result_out[14]),
             .data_in_16(result_out[15]), .data_in_17(result_out[16]), .data_in_18(result_out[17]), .data_in_19(result_out[18]), .data_in_20(result_out[19]), .data_in_21(result_out[20]), .data_in_22(result_out[21]), .data_in_23(result_out[22]),
             .data_in_24(result_out[23]), .data_in_25(result_out[24]), .data_in_26(result_out[25]), .data_in_27(result_out[26]), .data_in_28(result_out[27]), .data_in_29(result_out[28]), .data_in_30(result_out[29]), .data_in_31(result_out[30]),
             .data_in_32(result_out[31]),.data_out_1(wxb[0]), .data_out_2(wxb[1]), .data_out_3(wxb[2]), .data_out_4(wxb[3]), .data_out_5(wxb[4]), .data_out_6(wxb[5]), .data_out_7(wxb[6]), .data_out_8(wxb[7]), .data_out_9(wxb[8]), .data_out_10(wxb[9]),
             .data_out_11(wxb[10]), .data_out_12(wxb[11]), .data_out_13(wxb[12]), .data_out_14(wxb[13]), .data_out_15(wxb[14]), .data_out_16(wxb[15]), .data_out_17(wxb[16]), .data_out_18(wxb[17]), .data_out_19(wxb[18]), .data_out_20(wxb[19]), .data_out_21(wxb[20]),
             .data_out_22(wxb[21]), .data_out_23(wxb[22]), .data_out_24(wxb[23]), .data_out_25(wxb[24]), .data_out_26(wxb[25]), .data_out_27(wxb[26]), .data_out_28(wxb[27]), .data_out_29(wxb[28]), .data_out_30(wxb[29]), .data_out_31(wxb[30]), .data_out_32(wxb[31]));

    max_pooling A3(.clk(clk),.reset(q2),.data_in_1(wxb[0]), .data_in_2(wxb[1]), .data_in_3(wxb[2]), .data_in_4(wxb[3]), .data_in_5(wxb[4]), .data_in_6(wxb[5]), .data_in_7(wxb[6]), .data_in_8(wxb[7]), .data_in_9(wxb[8]), .data_in_10(wxb[9]), .data_in_11(wxb[10]),
                   .data_in_12(wxb[11]), .data_in_13(wxb[12]), .data_in_14(wxb[13]), .data_in_15(wxb[14]), .data_in_16(wxb[15]), .data_in_17(wxb[16]), .data_in_18(wxb[17]), .data_in_19(wxb[18]), .data_in_20(wxb[19]), .data_in_21(wxb[20]), .data_in_22(wxb[21]),
                   .data_in_23(wxb[22]), .data_in_24(wxb[23]), .data_in_25(wxb[24]), .data_in_26(wxb[25]), .data_in_27(wxb[26]), .data_in_28(wxb[27]), .data_in_29(wxb[28]), .data_in_30(wxb[29]), .data_in_31(wxb[30]), .data_in_32(wxb[31]),.data_out_1(wxc[0]), .data_out_2(wxc[1]),
                   .data_out_3(wxc[2]), .data_out_4(wxc[3]), .data_out_5(wxc[4]), .data_out_6(wxc[5]), .data_out_7(wxc[6]), .data_out_8(wxc[7]), .data_out_9(wxc[8]), .data_out_10(wxc[9]), .data_out_11(wxc[10]), .data_out_12(wxc[11]), .data_out_13(wxc[12]), .data_out_14(wxc[13]),
                   .data_out_15(wxc[14]), .data_out_16(wxc[15]), .data_out_17(wxc[16]), .data_out_18(wxc[17]), .data_out_19(wxc[18]), .data_out_20(wxc[19]), .data_out_21(wxc[20]), .data_out_22(wxc[21]), .data_out_23(wxc[22]), .data_out_24(wxc[23]), .data_out_25(wxc[24]), .data_out_26(wxc[25]),
                   .data_out_27(wxc[26]), .data_out_28(wxc[27]), .data_out_29(wxc[28]), .data_out_30(wxc[29]), .data_out_31(wxc[30]), .data_out_32(wxc[31]),.reset_next_stage(reset_next_stage_1));
  
  // bram_0 to bram_32 hold the output maps of layer1                 
 (*dont_touch = "true"*)    bram_0 b0 (.clka(clk_2),.addra(addr),.dina(wxc[0]),.douta(d_out_1),.wea(bram_reset),.ena(1'b1)); 
 (*dont_touch = "true"*)    bram_1 b1 (.clka(clk_2),.addra(addr),.dina(wxc[1]),.douta(d_out_2),.wea(bram_reset),.ena(1'b1)); 
     bram_2 b2 (.clka(clk_2),.addra(addr),.dina(wxc[2]),.douta(d_out_3),.wea(bram_reset),.ena(1'b1)); 
     bram_3 b3 (.clka(clk_2),.addra(addr),.dina(wxc[3]),.douta(d_out_4),.wea(bram_reset),.ena(1'b1)); 
     bram_4 b4 (.clka(clk_2),.addra(addr),.dina(wxc[4]),.douta(d_out_5),.wea(bram_reset),.ena(1'b1)); 
     bram_5 b5 (.clka(clk_2),.addra(addr),.dina(wxc[5]),.douta(d_out_6),.wea(bram_reset),.ena(1'b1)); 
     bram_6 b6 (.clka(clk_2),.addra(addr),.dina(wxc[6]),.douta(d_out_7),.wea(bram_reset),.ena(1'b1)); 
     bram_7 b7 (.clka(clk_2),.addra(addr),.dina(wxc[7]),.douta(d_out_8),.wea(bram_reset),.ena(1'b1)); 
     bram_8 b8 (.clka(clk_2),.addra(addr),.dina(wxc[8]),.douta(d_out_9),.wea(bram_reset),.ena(1'b1)); 
     bram_9 b9 (.clka(clk_2),.addra(addr),.dina(wxc[9]),.douta(d_out_10),.wea(bram_reset),.ena(1'b1)); 
     bram_10 b10 (.clka(clk_2),.addra(addr),.dina(wxc[10]),.douta(d_out_11),.wea(bram_reset),.ena(1'b1)); 
     bram_11 b11 (.clka(clk_2),.addra(addr),.dina(wxc[11]),.douta(d_out_12),.wea(bram_reset),.ena(1'b1)); 
     bram_12 b12 (.clka(clk_2),.addra(addr),.dina(wxc[12]),.douta(d_out_13),.wea(bram_reset),.ena(1'b1)); 
     bram_13 b13 (.clka(clk_2),.addra(addr),.dina(wxc[13]),.douta(d_out_14),.wea(bram_reset),.ena(1'b1)); 
     bram_14 b14 (.clka(clk_2),.addra(addr),.dina(wxc[14]),.douta(d_out_15),.wea(bram_reset),.ena(1'b1)); 
     bram_15 b15 (.clka(clk_2),.addra(addr),.dina(wxc[15]),.douta(d_out_16),.wea(bram_reset),.ena(1'b1)); 
     bram_16 b16 (.clka(clk_2),.addra(addr),.dina(wxc[16]),.douta(d_out_17),.wea(bram_reset),.ena(1'b1)); 
     bram_17 b17 (.clka(clk_2),.addra(addr),.dina(wxc[17]),.douta(d_out_18),.wea(bram_reset),.ena(1'b1)); 
     bram_18 b18 (.clka(clk_2),.addra(addr),.dina(wxc[18]),.douta(d_out_19),.wea(bram_reset),.ena(1'b1)); 
     bram_19 b19 (.clka(clk_2),.addra(addr),.dina(wxc[19]),.douta(d_out_20),.wea(bram_reset),.ena(1'b1)); 
     bram_20 b20 (.clka(clk_2),.addra(addr),.dina(wxc[20]),.douta(d_out_21),.wea(bram_reset),.ena(1'b1)); 
     bram_21 b21 (.clka(clk_2),.addra(addr),.dina(wxc[21]),.douta(d_out_22),.wea(bram_reset),.ena(1'b1)); 
     bram_22 b22 (.clka(clk_2),.addra(addr),.dina(wxc[22]),.douta(d_out_23),.wea(bram_reset),.ena(1'b1)); 
     bram_23 b23 (.clka(clk_2),.addra(addr),.dina(wxc[23]),.douta(d_out_24),.wea(bram_reset),.ena(1'b1)); 
     bram_24 b24 (.clka(clk_2),.addra(addr),.dina(wxc[24]),.douta(d_out_25),.wea(bram_reset),.ena(1'b1)); 
     bram_25 b25 (.clka(clk_2),.addra(addr),.dina(wxc[25]),.douta(d_out_26),.wea(bram_reset),.ena(1'b1)); 
     bram_26 b26 (.clka(clk_2),.addra(addr),.dina(wxc[26]),.douta(d_out_27),.wea(bram_reset),.ena(1'b1)); 
     bram_27 b27 (.clka(clk_2),.addra(addr),.dina(wxc[27]),.douta(d_out_28),.wea(bram_reset),.ena(1'b1)); 
     bram_28 b28 (.clka(clk_2),.addra(addr),.dina(wxc[28]),.douta(d_out_29),.wea(bram_reset),.ena(1'b1)); 
     bram_29 b29 (.clka(clk_2),.addra(addr),.dina(wxc[29]),.douta(d_out_30),.wea(bram_reset),.ena(1'b1)); 
     bram_30 b30 (.clka(clk_2),.addra(addr),.dina(wxc[30]),.douta(d_out_31),.wea(bram_reset),.ena(1'b1)); 
     bram_31 b31 (.clka(clk_2),.addra(addr),.dina(wxc[31]),.douta(d_out_32),.wea(bram_reset),.ena(1'b1)); 
     
    
 /*   always@(posedge clk)begin           // Generation of clock/2 block 
        if(reset)
            clk_2 <= 0;
        else
            clk_2 <= ~clk_2 ;
    */
    
    
    always@(posedge clk)begin       // always block for reset logic for maxpooling : q2 is the input to the maxpooling 
        q1<= data_reset;
        q2<= q1;
    end // from what I understand, Max_pooling gets reset TWO clock cycle after data_reset is activated
    
    
    reg x1,x2,x3;
    always@(posedge clk_2)begin //NOTE: 2x slower clock is used
        x1 <= reset_next_stage_1;  // reset_next_stage_1 is controlled by Max_Pooling module
        x2 <= x1; 
        x3 <= x2;       // similiarly x3 is delayed by 3 clock cycles. x3 is used to control r1
    end
    
    reg y1,y2;
    wire r1;
    always @(posedge clk_2)begin //NOTE: 2x slower clock is used
        y1 <= r1; // r1 is handelled by counter 508 module
        y2 <= y1; //y2 is delayed by 2 clock cycles
    end 
    
 (*dont_touch = "true"*)   assign reset_next_stage = y2 & r1 ; // effectively makes reset_next_stage high IF r1 is high for 2 clock cycles.
     
    wire reset_temp; 
(*dont_touch = "true"*)    counter_508_4times A4 (.clk(clk_2),.reset(reset_next_stage_1),.count(addr),.cycle_count(cycle_count),.done_n(reset_temp));
(*dont_touch = "true"*)   assign r1 = ( reset_temp || x3 );
    
    
    
    
    
    
    always@(*)begin
        if(reset_next_stage_1)begin
            bram_reset = 0; //reading from bram
        end 
        else begin
            if(cycle_count > 2'b0)
                bram_reset  = 0;
            else
                bram_reset = 1; //writing into bram
       end
       end
        
        // data_out is getting assigned the outputs of max_pooling
        assign data_out_0 = wxc[0]; 
        assign data_out_1 = wxc[1]; 
        assign data_out_2 = wxc[2]; 
        assign data_out_3 = wxc[3]; 
        assign data_out_4 = wxc[4]; 
        assign data_out_5 = wxc[5]; 
        assign data_out_6 = wxc[6]; 
        assign data_out_7 = wxc[7]; 
        assign data_out_8 = wxc[8];   
        assign data_out_9 = wxc[9]; 
        assign data_out_10 = wxc[10]; 
        assign data_out_11 = wxc[11]; 
        assign data_out_12 = wxc[12]; 
        assign data_out_13 = wxc[13]; 
        assign data_out_14 = wxc[14]; 
        assign data_out_15 = wxc[15]; 
        assign data_out_16 = wxc[16]; 
        assign data_out_17 = wxc[17]; 
        assign data_out_18 = wxc[18]; 
        assign data_out_19 = wxc[19]; 
        assign data_out_20 = wxc[20]; 
        assign data_out_21 = wxc[21]; 
        assign data_out_22 = wxc[22]; 
        assign data_out_23 = wxc[23]; 
        assign data_out_24 = wxc[24]; 
        assign data_out_25 = wxc[25]; 
        assign data_out_26 = wxc[26]; 
        assign data_out_27 = wxc[27]; 
        assign data_out_28 = wxc[28]; 
        assign data_out_29 = wxc[29]; 
        assign data_out_30 = wxc[30]; 
        assign data_out_31 = wxc[31];   


endmodule 
     
module counter_508_4times (
    input clk,
    input reset,
    output reg [8:0] count,   // 9 bits to count up to 508
    output reg [1:0]cycle_count, // To count 0 to 3 (4 cycles)
    output reg done_n          // Active low during counting, high when done
);

  //  reg [1:0] cycle_count;     

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count       <= 9'd0;
            cycle_count <= 2'd0;
            done_n      <= 1'b0;
        end 
        else begin
            if (done_n == 1'b0) begin
                if (count < 9'd508) begin
                    count <= count + 1; 
                end 
                else begin // count is 508
                    if (cycle_count < 2'd3) begin
                        cycle_count <= cycle_count + 1;
                        count <= 9'd1;
                    end 
                    else begin
                        done_n <= 1'b1;      // Done after 4 cycles
                        count  <= 9'd508;    // Hold at 508 so no mroe counting for now
                    end
                end
            end
        end
    end

endmodule
 
   
module filter (
    input   clk,
    input   reset,  
    input  signed [7:0] bias,
    input  signed  [7:0]  ch0,
    input  signed  [7:0]  ch1,
    input  signed  [7:0]  ch2,
    input  signed  [7:0]  ch3,
    input  signed  [7:0]  ch4,
    input  signed  [7:0]  ch5,
    input  signed  [7:0]  w0,
    input  signed  [7:0]  w1,
    input  signed  [7:0]  w2,
    input  signed  [7:0]  w3,
    input  signed  [7:0]  w4,
    input  signed  [7:0]  w5,
    input  signed  [7:0]  w6,
    input  signed  [7:0]  w7,
    input  signed  [7:0]  w8,
    input  signed  [7:0]  w9,
    input  signed  [7:0]  w10,
    input  signed  [7:0]  w11, 
    output signed [17:0] result
);
    reg signed [15:0] products_phase1 [0:5];
    reg signed [15:0] products_phase2 [0:5];
    wire signed [15:0] temp [0:5];
    
    genvar i;
    always @(posedge clk) begin
        if (reset) begin
                products_phase1[0] <= 0;
                products_phase1[1] <= 0;
                products_phase1[2] <= 0;
                products_phase1[3] <= 0;
                products_phase1[4] <= 0;
                products_phase1[5] <= 0;
               
                products_phase2[0] <= 0;
                products_phase2[1] <= 0;
                products_phase2[2] <= 0;
                products_phase2[3] <= 0;
                products_phase2[4] <= 0;
                products_phase2[5] <= 0;
        end 
        else begin // here the rest of the emg ensures that at each clk cycle, u get a new row for ch0 to ch1
                products_phase1[0] <= ch0 * w0;
                products_phase1[1] <= ch1 * w1;
                products_phase1[2] <= ch2 * w2;
                products_phase1[3] <= ch3 * w3;
                products_phase1[4] <= ch4 * w4;
                products_phase1[5] <= ch5 * w5;
               
                products_phase2[0] <= ch0 * w6;
                products_phase2[1] <= ch1 * w7;
                products_phase2[2] <= ch2 * w8;
                products_phase2[3] <= ch3 * w9;
                products_phase2[4] <= ch4 * w10;
                products_phase2[5] <= ch5 * w11;
        end
    end
    generate 
    for(i = 0 ; i<6 ; i=i+1)begin  //6 D-flipFlop are instantiated
        DFF_15bits_L1 D(.Q(temp[i]),.D(products_phase1[i]),.clk(clk),.reset(reset)); // refer to diagram in Pradyuman Bhaiya's. makes sense
    end
    endgenerate 
    
           assign result = temp[0] + products_phase2[0] + // result is the one the convolution output. like these 1018 outputs are achieved for each of the 32 filters.
                    temp[1] + products_phase2[1] +
                    temp[2] + products_phase2[2] +
                    temp[3] + products_phase2[3] +
                    temp[4] + products_phase2[4] +
                    temp[5] + products_phase2[5] + bias;
                    
                
    endmodule
    

module DFF_15bits_L1(
    input clk,
    input reset,
    input  signed [15:0] D,
    output reg signed [15:0] Q
    );
    always @(posedge clk)begin
        if(reset)
            Q <= 0;
        else
            Q <= D;
    end
    endmodule
   
  

module weight_loader_L1 #(parameter N = 32)(
    input clk,
    input reset,
    
    output reg signed [7:0] bias_0,
    output reg signed [7:0] bias_1,
    output reg signed [7:0] bias_2,
    output reg signed [7:0] bias_3,
    output reg signed [7:0] bias_4,
    output reg signed [7:0] bias_5,
    output reg signed [7:0] bias_6,
    output reg signed [7:0] bias_7,
    output reg signed [7:0] bias_8,
    output reg signed [7:0] bias_9,
    output reg signed [7:0] bias_10,
    output reg signed [7:0] bias_11,
    output reg signed [7:0] bias_12,
    output reg signed [7:0] bias_13,
    output reg signed [7:0] bias_14,
    output reg signed [7:0] bias_15,
    output reg signed [7:0] bias_16,
    output reg signed [7:0] bias_17,
    output reg signed [7:0] bias_18,
    output reg signed [7:0] bias_19,
    output reg signed [7:0] bias_20,
    output reg signed [7:0] bias_21,
    output reg signed [7:0] bias_22,
    output reg signed [7:0] bias_23,
    output reg signed [7:0] bias_24,
    output reg signed [7:0] bias_25,
    output reg signed [7:0] bias_26,
    output reg signed [7:0] bias_27,
    output reg signed [7:0] bias_28,
    output reg signed [7:0] bias_29,
    output reg signed [7:0] bias_30,
    output reg signed [7:0] bias_31,
         
    output reg signed [7:0] w0_0,
    output reg signed [7:0] w0_1,
    output reg signed [7:0] w0_2,
    output reg signed [7:0] w0_3,
    output reg signed [7:0] w0_4,
    output reg signed [7:0] w0_5,
    output reg signed [7:0] w0_6,
    output reg signed [7:0] w0_7,
    output reg signed [7:0] w0_8,
    output reg signed [7:0] w0_9,
    output reg signed [7:0] w0_10,
    output reg signed [7:0] w0_11,
    output reg signed [7:0] w1_0,
    output reg signed [7:0] w1_1,
    output reg signed [7:0] w1_2,
    output reg signed [7:0] w1_3,
    output reg signed [7:0] w1_4,
    output reg signed [7:0] w1_5,
    output reg signed [7:0] w1_6,
    output reg signed [7:0] w1_7,
    output reg signed [7:0] w1_8,
    output reg signed [7:0] w1_9,
    output reg signed [7:0] w1_10,
    output reg signed [7:0] w1_11,
    output reg signed [7:0] w2_0,
    output reg signed [7:0] w2_1,
    output reg signed [7:0] w2_2,
    output reg signed [7:0] w2_3,
    output reg signed [7:0] w2_4,
    output reg signed [7:0] w2_5,
    output reg signed [7:0] w2_6,
    output reg signed [7:0] w2_7,
    output reg signed [7:0] w2_8,
    output reg signed [7:0] w2_9,
    output reg signed [7:0] w2_10,
    output reg signed [7:0] w2_11,
    output reg signed [7:0] w3_0,
    output reg signed [7:0] w3_1,
    output reg signed [7:0] w3_2,
    output reg signed [7:0] w3_3,
    output reg signed [7:0] w3_4,
    output reg signed [7:0] w3_5,
    output reg signed [7:0] w3_6,
    output reg signed [7:0] w3_7,
    output reg signed [7:0] w3_8,
    output reg signed [7:0] w3_9,
    output reg signed [7:0] w3_10,
    output reg signed [7:0] w3_11,
    output reg signed [7:0] w4_0,
    output reg signed [7:0] w4_1,
    output reg signed [7:0] w4_2,
    output reg signed [7:0] w4_3,
    output reg signed [7:0] w4_4,
    output reg signed [7:0] w4_5,
    output reg signed [7:0] w4_6,
    output reg signed [7:0] w4_7,
    output reg signed [7:0] w4_8,
    output reg signed [7:0] w4_9,
    output reg signed [7:0] w4_10,
    output reg signed [7:0] w4_11,
    output reg signed [7:0] w5_0,
    output reg signed [7:0] w5_1,
    output reg signed [7:0] w5_2,
    output reg signed [7:0] w5_3,
    output reg signed [7:0] w5_4,
    output reg signed [7:0] w5_5,
    output reg signed [7:0] w5_6,
    output reg signed [7:0] w5_7,
    output reg signed [7:0] w5_8,
    output reg signed [7:0] w5_9,
    output reg signed [7:0] w5_10,
    output reg signed [7:0] w5_11,
    output reg signed [7:0] w6_0,
    output reg signed [7:0] w6_1,
    output reg signed [7:0] w6_2,
    output reg signed [7:0] w6_3,
    output reg signed [7:0] w6_4,
    output reg signed [7:0] w6_5,
    output reg signed [7:0] w6_6,
    output reg signed [7:0] w6_7,
    output reg signed [7:0] w6_8,
    output reg signed [7:0] w6_9,
    output reg signed [7:0] w6_10,
    output reg signed [7:0] w6_11,
    output reg signed [7:0] w7_0,
    output reg signed [7:0] w7_1,
    output reg signed [7:0] w7_2,
    output reg signed [7:0] w7_3,
    output reg signed [7:0] w7_4,
    output reg signed [7:0] w7_5,
    output reg signed [7:0] w7_6,
    output reg signed [7:0] w7_7,
    output reg signed [7:0] w7_8,
    output reg signed [7:0] w7_9,
    output reg signed [7:0] w7_10,
    output reg signed [7:0] w7_11,
    output reg signed [7:0] w8_0,
    output reg signed [7:0] w8_1,
    output reg signed [7:0] w8_2,
    output reg signed [7:0] w8_3,
    output reg signed [7:0] w8_4,
    output reg signed [7:0] w8_5,
    output reg signed [7:0] w8_6,
    output reg signed [7:0] w8_7,
    output reg signed [7:0] w8_8,
    output reg signed [7:0] w8_9,
    output reg signed [7:0] w8_10,
    output reg signed [7:0] w8_11,
    output reg signed [7:0] w9_0,
    output reg signed [7:0] w9_1,
    output reg signed [7:0] w9_2,
    output reg signed [7:0] w9_3,
    output reg signed [7:0] w9_4,
    output reg signed [7:0] w9_5,
    output reg signed [7:0] w9_6,
    output reg signed [7:0] w9_7,
    output reg signed [7:0] w9_8,
    output reg signed [7:0] w9_9,
    output reg signed [7:0] w9_10,
    output reg signed [7:0] w9_11,
    output reg signed [7:0] w10_0,
    output reg signed [7:0] w10_1,
    output reg signed [7:0] w10_2,
    output reg signed [7:0] w10_3,
    output reg signed [7:0] w10_4,
    output reg signed [7:0] w10_5,
    output reg signed [7:0] w10_6,
    output reg signed [7:0] w10_7,
    output reg signed [7:0] w10_8,
    output reg signed [7:0] w10_9,
    output reg signed [7:0] w10_10,
    output reg signed [7:0] w10_11,
    output reg signed [7:0] w11_0,
    output reg signed [7:0] w11_1,
    output reg signed [7:0] w11_2,
    output reg signed [7:0] w11_3,
    output reg signed [7:0] w11_4,
    output reg signed [7:0] w11_5,
    output reg signed [7:0] w11_6,
    output reg signed [7:0] w11_7,
    output reg signed [7:0] w11_8,
    output reg signed [7:0] w11_9,
    output reg signed [7:0] w11_10,
    output reg signed [7:0] w11_11,
    output reg signed [7:0] w12_0,
    output reg signed [7:0] w12_1,
    output reg signed [7:0] w12_2,
    output reg signed [7:0] w12_3,
    output reg signed [7:0] w12_4,
    output reg signed [7:0] w12_5,
    output reg signed [7:0] w12_6,
    output reg signed [7:0] w12_7,
    output reg signed [7:0] w12_8,
    output reg signed [7:0] w12_9,
    output reg signed [7:0] w12_10,
    output reg signed [7:0] w12_11,
    output reg signed [7:0] w13_0,
    output reg signed [7:0] w13_1,
    output reg signed [7:0] w13_2,
    output reg signed [7:0] w13_3,
    output reg signed [7:0] w13_4,
    output reg signed [7:0] w13_5,
    output reg signed [7:0] w13_6,
    output reg signed [7:0] w13_7,
    output reg signed [7:0] w13_8,
    output reg signed [7:0] w13_9,
    output reg signed [7:0] w13_10,
    output reg signed [7:0] w13_11,
    output reg signed [7:0] w14_0,
    output reg signed [7:0] w14_1,
    output reg signed [7:0] w14_2,
    output reg signed [7:0] w14_3,
    output reg signed [7:0] w14_4,
    output reg signed [7:0] w14_5,
    output reg signed [7:0] w14_6,
    output reg signed [7:0] w14_7,
    output reg signed [7:0] w14_8,
    output reg signed [7:0] w14_9,
    output reg signed [7:0] w14_10,
    output reg signed [7:0] w14_11,
    output reg signed [7:0] w15_0,
    output reg signed [7:0] w15_1,
    output reg signed [7:0] w15_2,
    output reg signed [7:0] w15_3,
    output reg signed [7:0] w15_4,
    output reg signed [7:0] w15_5,
    output reg signed [7:0] w15_6,
    output reg signed [7:0] w15_7,
    output reg signed [7:0] w15_8,
    output reg signed [7:0] w15_9,
    output reg signed [7:0] w15_10,
    output reg signed [7:0] w15_11,
    output reg signed [7:0] w16_0,
    output reg signed [7:0] w16_1,
    output reg signed [7:0] w16_2,
    output reg signed [7:0] w16_3,
    output reg signed [7:0] w16_4,
    output reg signed [7:0] w16_5,
    output reg signed [7:0] w16_6,
    output reg signed [7:0] w16_7,
    output reg signed [7:0] w16_8,
    output reg signed [7:0] w16_9,
    output reg signed [7:0] w16_10,
    output reg signed [7:0] w16_11,
    output reg signed [7:0] w17_0,
    output reg signed [7:0] w17_1,
    output reg signed [7:0] w17_2,
    output reg signed [7:0] w17_3,
    output reg signed [7:0] w17_4,
    output reg signed [7:0] w17_5,
    output reg signed [7:0] w17_6,
    output reg signed [7:0] w17_7,
    output reg signed [7:0] w17_8,
    output reg signed [7:0] w17_9,
    output reg signed [7:0] w17_10,
    output reg signed [7:0] w17_11,
    output reg signed [7:0] w18_0,
    output reg signed [7:0] w18_1,
    output reg signed [7:0] w18_2,
    output reg signed [7:0] w18_3,
    output reg signed [7:0] w18_4,
    output reg signed [7:0] w18_5,
    output reg signed [7:0] w18_6,
    output reg signed [7:0] w18_7,
    output reg signed [7:0] w18_8,
    output reg signed [7:0] w18_9,
    output reg signed [7:0] w18_10,
    output reg signed [7:0] w18_11,
    output reg signed [7:0] w19_0,
    output reg signed [7:0] w19_1,
    output reg signed [7:0] w19_2,
    output reg signed [7:0] w19_3,
    output reg signed [7:0] w19_4,
    output reg signed [7:0] w19_5,
    output reg signed [7:0] w19_6,
    output reg signed [7:0] w19_7,
    output reg signed [7:0] w19_8,
    output reg signed [7:0] w19_9,
    output reg signed [7:0] w19_10,
    output reg signed [7:0] w19_11,
    output reg signed [7:0] w20_0,
    output reg signed [7:0] w20_1,
    output reg signed [7:0] w20_2,
    output reg signed [7:0] w20_3,
    output reg signed [7:0] w20_4,
    output reg signed [7:0] w20_5,
    output reg signed [7:0] w20_6,
    output reg signed [7:0] w20_7,
    output reg signed [7:0] w20_8,
    output reg signed [7:0] w20_9,
    output reg signed [7:0] w20_10,
    output reg signed [7:0] w20_11,
    output reg signed [7:0] w21_0,
    output reg signed [7:0] w21_1,
    output reg signed [7:0] w21_2,
    output reg signed [7:0] w21_3,
    output reg signed [7:0] w21_4,
    output reg signed [7:0] w21_5,
    output reg signed [7:0] w21_6,
    output reg signed [7:0] w21_7,
    output reg signed [7:0] w21_8,
    output reg signed [7:0] w21_9,
    output reg signed [7:0] w21_10,
    output reg signed [7:0] w21_11,
    output reg signed [7:0] w22_0,
    output reg signed [7:0] w22_1,
    output reg signed [7:0] w22_2,
    output reg signed [7:0] w22_3,
    output reg signed [7:0] w22_4,
    output reg signed [7:0] w22_5,
    output reg signed [7:0] w22_6,
    output reg signed [7:0] w22_7,
    output reg signed [7:0] w22_8,
    output reg signed [7:0] w22_9,
    output reg signed [7:0] w22_10,
    output reg signed [7:0] w22_11,
    output reg signed [7:0] w23_0,
    output reg signed [7:0] w23_1,
    output reg signed [7:0] w23_2,
    output reg signed [7:0] w23_3,
    output reg signed [7:0] w23_4,
    output reg signed [7:0] w23_5,
    output reg signed [7:0] w23_6,
    output reg signed [7:0] w23_7,
    output reg signed [7:0] w23_8,
    output reg signed [7:0] w23_9,
    output reg signed [7:0] w23_10,
    output reg signed [7:0] w23_11,
    output reg signed [7:0] w24_0,
    output reg signed [7:0] w24_1,
    output reg signed [7:0] w24_2,
    output reg signed [7:0] w24_3,
    output reg signed [7:0] w24_4,
    output reg signed [7:0] w24_5,
    output reg signed [7:0] w24_6,
    output reg signed [7:0] w24_7,
    output reg signed [7:0] w24_8,
    output reg signed [7:0] w24_9,
    output reg signed [7:0] w24_10,
    output reg signed [7:0] w24_11,
    output reg signed [7:0] w25_0,
    output reg signed [7:0] w25_1,
    output reg signed [7:0] w25_2,
    output reg signed [7:0] w25_3,
    output reg signed [7:0] w25_4,
    output reg signed [7:0] w25_5,
    output reg signed [7:0] w25_6,
    output reg signed [7:0] w25_7,
    output reg signed [7:0] w25_8,
    output reg signed [7:0] w25_9,
    output reg signed [7:0] w25_10,
    output reg signed [7:0] w25_11,
    output reg signed [7:0] w26_0,
    output reg signed [7:0] w26_1,
    output reg signed [7:0] w26_2,
    output reg signed [7:0] w26_3,
    output reg signed [7:0] w26_4,
    output reg signed [7:0] w26_5,
    output reg signed [7:0] w26_6,
    output reg signed [7:0] w26_7,
    output reg signed [7:0] w26_8,
    output reg signed [7:0] w26_9,
    output reg signed [7:0] w26_10,
    output reg signed [7:0] w26_11,
    output reg signed [7:0] w27_0,
    output reg signed [7:0] w27_1,
    output reg signed [7:0] w27_2,
    output reg signed [7:0] w27_3,
    output reg signed [7:0] w27_4,
    output reg signed [7:0] w27_5,
    output reg signed [7:0] w27_6,
    output reg signed [7:0] w27_7,
    output reg signed [7:0] w27_8,
    output reg signed [7:0] w27_9,
    output reg signed [7:0] w27_10,
    output reg signed [7:0] w27_11,
    output reg signed [7:0] w28_0,
    output reg signed [7:0] w28_1,
    output reg signed [7:0] w28_2,
    output reg signed [7:0] w28_3,
    output reg signed [7:0] w28_4,
    output reg signed [7:0] w28_5,
    output reg signed [7:0] w28_6,
    output reg signed [7:0] w28_7,
    output reg signed [7:0] w28_8,
    output reg signed [7:0] w28_9,
    output reg signed [7:0] w28_10,
    output reg signed [7:0] w28_11,
    output reg signed [7:0] w29_0,
    output reg signed [7:0] w29_1,
    output reg signed [7:0] w29_2,
    output reg signed [7:0] w29_3,
    output reg signed [7:0] w29_4,
    output reg signed [7:0] w29_5,
    output reg signed [7:0] w29_6,
    output reg signed [7:0] w29_7,
    output reg signed [7:0] w29_8,
    output reg signed [7:0] w29_9,
    output reg signed [7:0] w29_10,
    output reg signed [7:0] w29_11,
    output reg signed [7:0] w30_0,
    output reg signed [7:0] w30_1,
    output reg signed [7:0] w30_2,
    output reg signed [7:0] w30_3,
    output reg signed [7:0] w30_4,
    output reg signed [7:0] w30_5,
    output reg signed [7:0] w30_6,
    output reg signed [7:0] w30_7,
    output reg signed [7:0] w30_8,
    output reg signed [7:0] w30_9,
    output reg signed [7:0] w30_10,
    output reg signed [7:0] w30_11,
    output reg signed [7:0] w31_0,
    output reg signed [7:0] w31_1,
    output reg signed [7:0] w31_2,
    output reg signed [7:0] w31_3,
    output reg signed [7:0] w31_4,
    output reg signed [7:0] w31_5,
    output reg signed [7:0] w31_6,
    output reg signed [7:0] w31_7,
    output reg signed [7:0] w31_8,
    output reg signed [7:0] w31_9,
    output reg signed [7:0] w31_10,
    output reg signed [7:0] w31_11
    );
    localparam width = N * 96; // 96 = 12(no. of weights)x8(weights are 8 bit)
    reg signed [width - 1:0] shift_reg; //each weight gets loaded into this
    reg signed [255:0] bias_reg; // 256 = 32(no. of biases)x8(weights are 8 bit)
    reg [8:0] counter = 0 ; 
    reg [8:0] flag = 0;
    reg [5:0] counter_2 = 0;
    reg [5:0] flag_2 = 0;
    wire [7:0] data_out;
    wire [7:0] bias_out;  
    reg ena_reg = 0;
    reg ena_reg_2 = 0;
    
    
    
    // these brams are used in only READ mode
    blk_mem_gen_0_L1 b0 (.clka(clk),.ena(ena_reg),.addra(counter),.douta(data_out));  //contains weights of layer 1
    blk_mem_gen_1_L1 b1 (.clka(clk),.ena(ena_reg_2),.addra(counter_2),.douta(bias_out)); //contains biases for layer1
    
    always@(posedge clk)begin
        if(reset)begin
            counter <= 0;
            flag <= 0;
            shift_reg <= 0;
            ena_reg <= 0;
        end
        else begin
            if(counter < 386) begin //386 because of 2 cycle latency
                flag = flag + 1; 
                ena_reg = 1; // enables to read from paramter memory
                if(flag > 1) begin
                    shift_reg <= {shift_reg[width -8:0],data_out}; // left-shifting the register. read parameter comes here
                    //bias_reg <= {bias_reg[247:0],bias_out};
                    counter <= counter + 1;
                 end 
             end
             else begin 
                ena_reg = 0;
             end
         end    
     end
    
    always@(posedge clk)begin
        if(reset)begin
            ena_reg_2 = 0;
            counter_2 <= 0;
            bias_reg = 0;
            flag_2 <= 0 ;
        end
        else begin
            if(counter_2 < 34)begin
            flag_2 = flag_2 + 1;
            ena_reg_2 <= 1;
                if(flag_2 > 1)begin
                    counter_2 <= counter_2 + 1;
                    bias_reg <= {bias_reg[247:0],bias_out};
                end
            end
            else
                ena_reg_2 <= 0;
        end
    end
    always@(*)begin
        if(counter_2 == 34)begin // assigning the values read from memory to bias variables
            bias_0 <= bias_reg[256 - (0*8) - 1 : 256 - (1*8)]; 
            bias_1 <= bias_reg[256 - (1*8) - 1 : 256 - (2*8)]; 
            bias_2 <= bias_reg[256 - (2*8) - 1 : 256 - (3*8)]; 
            bias_3 <= bias_reg[256 - (3*8) - 1 : 256 - (4*8)]; 
            bias_4 <= bias_reg[256 - (4*8) - 1 : 256 - (5*8)]; 
            bias_5 <= bias_reg[256 - (5*8) - 1 : 256 - (6*8)]; 
            bias_6 <= bias_reg[256 - (6*8) - 1 : 256 - (7*8)]; 
            bias_7 <= bias_reg[256 - (7*8) - 1 : 256 - (8*8)]; 
            bias_8 <= bias_reg[256 - (8*8) - 1 : 256 - (9*8)]; 
            bias_9 <= bias_reg[256 - (9*8) - 1 : 256 - (10*8)]; 
            bias_10 <= bias_reg[256 - (10*8) - 1 : 256 - (11*8)]; 
            bias_11 <= bias_reg[256 - (11*8) - 1 : 256 - (12*8)]; 
            bias_12 <= bias_reg[256 - (12*8) - 1 : 256 - (13*8)]; 
            bias_13 <= bias_reg[256 - (13*8) - 1 : 256 - (14*8)]; 
            bias_14 <= bias_reg[256 - (14*8) - 1 : 256 - (15*8)]; 
            bias_15 <= bias_reg[256 - (15*8) - 1 : 256 - (16*8)]; 
            bias_16 <= bias_reg[256 - (16*8) - 1 : 256 - (17*8)]; 
            bias_17 <= bias_reg[256 - (17*8) - 1 : 256 - (18*8)]; 
            bias_18 <= bias_reg[256 - (18*8) - 1 : 256 - (19*8)]; 
            bias_19 <= bias_reg[256 - (19*8) - 1 : 256 - (20*8)]; 
            bias_20 <= bias_reg[256 - (20*8) - 1 : 256 - (21*8)]; 
            bias_21 <= bias_reg[256 - (21*8) - 1 : 256 - (22*8)]; 
            bias_22 <= bias_reg[256 - (22*8) - 1 : 256 - (23*8)]; 
            bias_23 <= bias_reg[256 - (23*8) - 1 : 256 - (24*8)]; 
            bias_24 <= bias_reg[256 - (24*8) - 1 : 256 - (25*8)]; 
            bias_25 <= bias_reg[256 - (25*8) - 1 : 256 - (26*8)]; 
            bias_26 <= bias_reg[256 - (26*8) - 1 : 256 - (27*8)]; 
            bias_27 <= bias_reg[256 - (27*8) - 1 : 256 - (28*8)]; 
            bias_28 <= bias_reg[256 - (28*8) - 1 : 256 - (29*8)]; 
            bias_29 <= bias_reg[256 - (29*8) - 1 : 256 - (30*8)]; 
            bias_30 <= bias_reg[256 - (30*8) - 1 : 256 - (31*8)]; 
            bias_31 <= bias_reg[256 - (31*8) - 1 : 256 - (32*8)];          
        end
    else begin
            bias_0 <= 0; 
            bias_1 <= 0; 
            bias_2 <= 0; 
            bias_3 <= 0; 
            bias_4 <= 0; 
            bias_5 <= 0; 
            bias_6 <= 0; 
            bias_7 <= 0; 
            bias_8 <= 0; 
            bias_9 <= 0; 
            bias_10 <= 0; 
            bias_11 <= 0; 
            bias_12 <= 0; 
            bias_13 <= 0; 
            bias_14 <= 0; 
            bias_15 <= 0; 
            bias_16 <= 0; 
            bias_17 <= 0; 
            bias_18 <= 0; 
            bias_19 <= 0; 
            bias_20 <= 0; 
            bias_21 <= 0; 
            bias_22 <= 0; 
            bias_23 <= 0; 
            bias_24 <= 0; 
            bias_25 <= 0; 
            bias_26 <= 0; 
            bias_27 <= 0; 
            bias_28 <= 0; 
            bias_29 <= 0; 
            bias_30 <= 0; 
            bias_31 <= 0;
       end         
    end
       
    always @(*)begin
        if(counter == 386)begin // assigning values read from memory to weight variables
            w0_0 <= shift_reg[width-(0*8)-1:width - (1*8)];
            w0_1 <= shift_reg[width-(1*8)-1:width - (2*8)];
            w0_2 <= shift_reg[width-(2*8)-1:width - (3*8)];
            w0_3 <= shift_reg[width-(3*8)-1:width - (4*8)];
            w0_4 <= shift_reg[width-(4*8)-1:width - (5*8)];
            w0_5 <= shift_reg[width-(5*8)-1:width - (6*8)];
            w0_6 <= shift_reg[width-(6*8)-1:width - (7*8)];
            w0_7 <= shift_reg[width-(7*8)-1:width - (8*8)];
            w0_8 <= shift_reg[width-(8*8)-1:width - (9*8)];
            w0_9 <= shift_reg[width-(9*8)-1:width - (10*8)];
            w0_10 <= shift_reg[width-(10*8)-1:width - (11*8)];
            w0_11 <= shift_reg[width-(11*8)-1:width - (12*8)];
            
            w1_0 <= shift_reg[width-(12*8)-1:width - (13*8)];
            w1_1 <= shift_reg[width-(13*8)-1:width - (14*8)];
            w1_2 <= shift_reg[width-(14*8)-1:width - (15*8)];
            w1_3 <= shift_reg[width-(15*8)-1:width - (16*8)];
            w1_4 <= shift_reg[width-(16*8)-1:width - (17*8)];
            w1_5 <= shift_reg[width-(17*8)-1:width - (18*8)];
            w1_6 <= shift_reg[width-(18*8)-1:width - (19*8)];
            w1_7 <= shift_reg[width-(19*8)-1:width - (20*8)];
            w1_8 <= shift_reg[width-(20*8)-1:width - (21*8)];
            w1_9 <= shift_reg[width-(21*8)-1:width - (22*8)];
            w1_10 <= shift_reg[width-(22*8)-1:width - (23*8)];
            w1_11 <= shift_reg[width-(23*8)-1:width - (24*8)];
            
            w2_0 <= shift_reg[width-(24*8)-1:width - (25*8)];
            w2_1 <= shift_reg[width-(25*8)-1:width - (26*8)];
            w2_2 <= shift_reg[width-(26*8)-1:width - (27*8)];
            w2_3 <= shift_reg[width-(27*8)-1:width - (28*8)];
            w2_4 <= shift_reg[width-(28*8)-1:width - (29*8)];
            w2_5 <= shift_reg[width-(29*8)-1:width - (30*8)];
            w2_6 <= shift_reg[width-(30*8)-1:width - (31*8)];
            w2_7 <= shift_reg[width-(31*8)-1:width - (32*8)];
            w2_8 <= shift_reg[width-(32*8)-1:width - (33*8)];
            w2_9 <= shift_reg[width-(33*8)-1:width - (34*8)];
            w2_10 <= shift_reg[width-(34*8)-1:width - (35*8)];
            w2_11 <= shift_reg[width-(35*8)-1:width - (36*8)];
            
            w3_0 <= shift_reg[width-(36*8)-1:width - (37*8)];
            w3_1 <= shift_reg[width-(37*8)-1:width - (38*8)];
            w3_2 <= shift_reg[width-(38*8)-1:width - (39*8)];
            w3_3 <= shift_reg[width-(39*8)-1:width - (40*8)];
            w3_4 <= shift_reg[width-(40*8)-1:width - (41*8)];
            w3_5 <= shift_reg[width-(41*8)-1:width - (42*8)];
            w3_6 <= shift_reg[width-(42*8)-1:width - (43*8)];
            w3_7 <= shift_reg[width-(43*8)-1:width - (44*8)];
            w3_8 <= shift_reg[width-(44*8)-1:width - (45*8)];
            w3_9 <= shift_reg[width-(45*8)-1:width - (46*8)];
            w3_10 <= shift_reg[width-(46*8)-1:width - (47*8)];
            w3_11 <= shift_reg[width-(47*8)-1:width - (48*8)];
            
            w4_0 <= shift_reg[width-(48*8)-1:width - (49*8)];
            w4_1 <= shift_reg[width-(49*8)-1:width - (50*8)];
            w4_2 <= shift_reg[width-(50*8)-1:width - (51*8)];
            w4_3 <= shift_reg[width-(51*8)-1:width - (52*8)];
            w4_4 <= shift_reg[width-(52*8)-1:width - (53*8)];
            w4_5 <= shift_reg[width-(53*8)-1:width - (54*8)];
            w4_6 <= shift_reg[width-(54*8)-1:width - (55*8)];
            w4_7 <= shift_reg[width-(55*8)-1:width - (56*8)];
            w4_8 <= shift_reg[width-(56*8)-1:width - (57*8)];
            w4_9 <= shift_reg[width-(57*8)-1:width - (58*8)];
            w4_10 <= shift_reg[width-(58*8)-1:width - (59*8)];
            w4_11 <= shift_reg[width-(59*8)-1:width - (60*8)];
            
            w5_0 <= shift_reg[width-(60*8)-1:width - (61*8)];
            w5_1 <= shift_reg[width-(61*8)-1:width - (62*8)];
            w5_2 <= shift_reg[width-(62*8)-1:width - (63*8)];
            w5_3 <= shift_reg[width-(63*8)-1:width - (64*8)];
            w5_4 <= shift_reg[width-(64*8)-1:width - (65*8)];
            w5_5 <= shift_reg[width-(65*8)-1:width - (66*8)];
            w5_6 <= shift_reg[width-(66*8)-1:width - (67*8)];
            w5_7 <= shift_reg[width-(67*8)-1:width - (68*8)];
            w5_8 <= shift_reg[width-(68*8)-1:width - (69*8)];
            w5_9 <= shift_reg[width-(69*8)-1:width - (70*8)];
            w5_10 <= shift_reg[width-(70*8)-1:width - (71*8)];
            w5_11 <= shift_reg[width-(71*8)-1:width - (72*8)];
            
            w6_0 <= shift_reg[width-(72*8)-1:width - (73*8)];
            w6_1 <= shift_reg[width-(73*8)-1:width - (74*8)];
            w6_2 <= shift_reg[width-(74*8)-1:width - (75*8)];
            w6_3 <= shift_reg[width-(75*8)-1:width - (76*8)];
            w6_4 <= shift_reg[width-(76*8)-1:width - (77*8)];
            w6_5 <= shift_reg[width-(77*8)-1:width - (78*8)];
            w6_6 <= shift_reg[width-(78*8)-1:width - (79*8)];
            w6_7 <= shift_reg[width-(79*8)-1:width - (80*8)];
            w6_8 <= shift_reg[width-(80*8)-1:width - (81*8)];
            w6_9 <= shift_reg[width-(81*8)-1:width - (82*8)];
            w6_10 <= shift_reg[width-(82*8)-1:width - (83*8)];
            w6_11 <= shift_reg[width-(83*8)-1:width - (84*8)];
            
            w7_0 <= shift_reg[width-(84*8)-1:width - (85*8)];
            w7_1 <= shift_reg[width-(85*8)-1:width - (86*8)];
            w7_2 <= shift_reg[width-(86*8)-1:width - (87*8)];
            w7_3 <= shift_reg[width-(87*8)-1:width - (88*8)];
            w7_4 <= shift_reg[width-(88*8)-1:width - (89*8)];
            w7_5 <= shift_reg[width-(89*8)-1:width - (90*8)];
            w7_6 <= shift_reg[width-(90*8)-1:width - (91*8)];
            w7_7 <= shift_reg[width-(91*8)-1:width - (92*8)];
            w7_8 <= shift_reg[width-(92*8)-1:width - (93*8)];
            w7_9 <= shift_reg[width-(93*8)-1:width - (94*8)];
            w7_10 <= shift_reg[width-(94*8)-1:width - (95*8)];
            w7_11 <= shift_reg[width-(95*8)-1:width - (96*8)];
            
            w8_0 <= shift_reg[width-(96*8)-1:width - (97*8)];
            w8_1 <= shift_reg[width-(97*8)-1:width - (98*8)];
            w8_2 <= shift_reg[width-(98*8)-1:width - (99*8)];
            w8_3 <= shift_reg[width-(99*8)-1:width - (100*8)];
            w8_4 <= shift_reg[width-(100*8)-1:width - (101*8)];
            w8_5 <= shift_reg[width-(101*8)-1:width - (102*8)];
            w8_6 <= shift_reg[width-(102*8)-1:width - (103*8)];
            w8_7 <= shift_reg[width-(103*8)-1:width - (104*8)];
            w8_8 <= shift_reg[width-(104*8)-1:width - (105*8)];
            w8_9 <= shift_reg[width-(105*8)-1:width - (106*8)];
            w8_10 <= shift_reg[width-(106*8)-1:width - (107*8)];
            w8_11 <= shift_reg[width-(107*8)-1:width - (108*8)];
            
            w9_0 <= shift_reg[width-(108*8)-1:width - (109*8)];
            w9_1 <= shift_reg[width-(109*8)-1:width - (110*8)];
            w9_2 <= shift_reg[width-(110*8)-1:width - (111*8)];
            w9_3 <= shift_reg[width-(111*8)-1:width - (112*8)];
            w9_4 <= shift_reg[width-(112*8)-1:width - (113*8)];
            w9_5 <= shift_reg[width-(113*8)-1:width - (114*8)];
            w9_6 <= shift_reg[width-(114*8)-1:width - (115*8)];
            w9_7 <= shift_reg[width-(115*8)-1:width - (116*8)];
            w9_8 <= shift_reg[width-(116*8)-1:width - (117*8)];
            w9_9 <= shift_reg[width-(117*8)-1:width - (118*8)];
            w9_10 <= shift_reg[width-(118*8)-1:width - (119*8)];
            w9_11 <= shift_reg[width-(119*8)-1:width - (120*8)];
            
            w10_0 <= shift_reg[width-(120*8)-1:width - (121*8)];
            w10_1 <= shift_reg[width-(121*8)-1:width - (122*8)];
            w10_2 <= shift_reg[width-(122*8)-1:width - (123*8)];
            w10_3 <= shift_reg[width-(123*8)-1:width - (124*8)];
            w10_4 <= shift_reg[width-(124*8)-1:width - (125*8)];
            w10_5 <= shift_reg[width-(125*8)-1:width - (126*8)];
            w10_6 <= shift_reg[width-(126*8)-1:width - (127*8)];
            w10_7 <= shift_reg[width-(127*8)-1:width - (128*8)];
            w10_8 <= shift_reg[width-(128*8)-1:width - (129*8)];
            w10_9 <= shift_reg[width-(129*8)-1:width - (130*8)];
            w10_10 <= shift_reg[width-(130*8)-1:width - (131*8)];
            w10_11 <= shift_reg[width-(131*8)-1:width - (132*8)];
            
            w11_0 <= shift_reg[width-(132*8)-1:width - (133*8)];
            w11_1 <= shift_reg[width-(133*8)-1:width - (134*8)];
            w11_2 <= shift_reg[width-(134*8)-1:width - (135*8)];
            w11_3 <= shift_reg[width-(135*8)-1:width - (136*8)];
            w11_4 <= shift_reg[width-(136*8)-1:width - (137*8)];
            w11_5 <= shift_reg[width-(137*8)-1:width - (138*8)];
            w11_6 <= shift_reg[width-(138*8)-1:width - (139*8)];
            w11_7 <= shift_reg[width-(139*8)-1:width - (140*8)];
            w11_8 <= shift_reg[width-(140*8)-1:width - (141*8)];
            w11_9 <= shift_reg[width-(141*8)-1:width - (142*8)];
            w11_10 <= shift_reg[width-(142*8)-1:width - (143*8)];
            w11_11 <= shift_reg[width-(143*8)-1:width - (144*8)];
            
            w12_0 <= shift_reg[width-(144*8)-1:width - (145*8)];
            w12_1 <= shift_reg[width-(145*8)-1:width - (146*8)];
            w12_2 <= shift_reg[width-(146*8)-1:width - (147*8)];
            w12_3 <= shift_reg[width-(147*8)-1:width - (148*8)];
            w12_4 <= shift_reg[width-(148*8)-1:width - (149*8)];
            w12_5 <= shift_reg[width-(149*8)-1:width - (150*8)];
            w12_6 <= shift_reg[width-(150*8)-1:width - (151*8)];
            w12_7 <= shift_reg[width-(151*8)-1:width - (152*8)];
            w12_8 <= shift_reg[width-(152*8)-1:width - (153*8)];
            w12_9 <= shift_reg[width-(153*8)-1:width - (154*8)];
            w12_10 <= shift_reg[width-(154*8)-1:width - (155*8)];
            w12_11 <= shift_reg[width-(155*8)-1:width - (156*8)];
            
            w13_0 <= shift_reg[width-(156*8)-1:width - (157*8)];
            w13_1 <= shift_reg[width-(157*8)-1:width - (158*8)];
            w13_2 <= shift_reg[width-(158*8)-1:width - (159*8)];
            w13_3 <= shift_reg[width-(159*8)-1:width - (160*8)];
            w13_4 <= shift_reg[width-(160*8)-1:width - (161*8)];
            w13_5 <= shift_reg[width-(161*8)-1:width - (162*8)];
            w13_6 <= shift_reg[width-(162*8)-1:width - (163*8)];
            w13_7 <= shift_reg[width-(163*8)-1:width - (164*8)];
            w13_8 <= shift_reg[width-(164*8)-1:width - (165*8)];
            w13_9 <= shift_reg[width-(165*8)-1:width - (166*8)];
            w13_10 <= shift_reg[width-(166*8)-1:width - (167*8)];
            w13_11 <= shift_reg[width-(167*8)-1:width - (168*8)];
            
            w14_0 <= shift_reg[width-(168*8)-1:width - (169*8)];
            w14_1 <= shift_reg[width-(169*8)-1:width - (170*8)];
            w14_2 <= shift_reg[width-(170*8)-1:width - (171*8)];
            w14_3 <= shift_reg[width-(171*8)-1:width - (172*8)];
            w14_4 <= shift_reg[width-(172*8)-1:width - (173*8)];
            w14_5 <= shift_reg[width-(173*8)-1:width - (174*8)];
            w14_6 <= shift_reg[width-(174*8)-1:width - (175*8)];
            w14_7 <= shift_reg[width-(175*8)-1:width - (176*8)];
            w14_8 <= shift_reg[width-(176*8)-1:width - (177*8)];
            w14_9 <= shift_reg[width-(177*8)-1:width - (178*8)];
            w14_10 <= shift_reg[width-(178*8)-1:width - (179*8)];
            w14_11 <= shift_reg[width-(179*8)-1:width - (180*8)];
            
            w15_0 <= shift_reg[width-(180*8)-1:width - (181*8)];
            w15_1 <= shift_reg[width-(181*8)-1:width - (182*8)];
            w15_2 <= shift_reg[width-(182*8)-1:width - (183*8)];
            w15_3 <= shift_reg[width-(183*8)-1:width - (184*8)];
            w15_4 <= shift_reg[width-(184*8)-1:width - (185*8)];
            w15_5 <= shift_reg[width-(185*8)-1:width - (186*8)];
            w15_6 <= shift_reg[width-(186*8)-1:width - (187*8)];
            w15_7 <= shift_reg[width-(187*8)-1:width - (188*8)];
            w15_8 <= shift_reg[width-(188*8)-1:width - (189*8)];
            w15_9 <= shift_reg[width-(189*8)-1:width - (190*8)];
            w15_10 <= shift_reg[width-(190*8)-1:width - (191*8)];
            w15_11 <= shift_reg[width-(191*8)-1:width - (192*8)];
            
            w16_0 <= shift_reg[width-(192*8)-1:width - (193*8)];
            w16_1 <= shift_reg[width-(193*8)-1:width - (194*8)];
            w16_2 <= shift_reg[width-(194*8)-1:width - (195*8)];
            w16_3 <= shift_reg[width-(195*8)-1:width - (196*8)];
            w16_4 <= shift_reg[width-(196*8)-1:width - (197*8)];
            w16_5 <= shift_reg[width-(197*8)-1:width - (198*8)];
            w16_6 <= shift_reg[width-(198*8)-1:width - (199*8)];
            w16_7 <= shift_reg[width-(199*8)-1:width - (200*8)];
            w16_8 <= shift_reg[width-(200*8)-1:width - (201*8)];
            w16_9 <= shift_reg[width-(201*8)-1:width - (202*8)];
            w16_10 <= shift_reg[width-(202*8)-1:width - (203*8)];
            w16_11 <= shift_reg[width-(203*8)-1:width - (204*8)];
            
            w17_0 <= shift_reg[width-(204*8)-1:width - (205*8)];
            w17_1 <= shift_reg[width-(205*8)-1:width - (206*8)];
            w17_2 <= shift_reg[width-(206*8)-1:width - (207*8)];
            w17_3 <= shift_reg[width-(207*8)-1:width - (208*8)];
            w17_4 <= shift_reg[width-(208*8)-1:width - (209*8)];
            w17_5 <= shift_reg[width-(209*8)-1:width - (210*8)];
            w17_6 <= shift_reg[width-(210*8)-1:width - (211*8)];
            w17_7 <= shift_reg[width-(211*8)-1:width - (212*8)];
            w17_8 <= shift_reg[width-(212*8)-1:width - (213*8)];
            w17_9 <= shift_reg[width-(213*8)-1:width - (214*8)];
            w17_10 <= shift_reg[width-(214*8)-1:width - (215*8)];
            w17_11 <= shift_reg[width-(215*8)-1:width - (216*8)];
            
            w18_0 <= shift_reg[width-(216*8)-1:width - (217*8)];
            w18_1 <= shift_reg[width-(217*8)-1:width - (218*8)];
            w18_2 <= shift_reg[width-(218*8)-1:width - (219*8)];
            w18_3 <= shift_reg[width-(219*8)-1:width - (220*8)];
            w18_4 <= shift_reg[width-(220*8)-1:width - (221*8)];
            w18_5 <= shift_reg[width-(221*8)-1:width - (222*8)];
            w18_6 <= shift_reg[width-(222*8)-1:width - (223*8)];
            w18_7 <= shift_reg[width-(223*8)-1:width - (224*8)];
            w18_8 <= shift_reg[width-(224*8)-1:width - (225*8)];
            w18_9 <= shift_reg[width-(225*8)-1:width - (226*8)];
            w18_10 <= shift_reg[width-(226*8)-1:width - (227*8)];
            w18_11 <= shift_reg[width-(227*8)-1:width - (228*8)];
            
            w19_0 <= shift_reg[width-(228*8)-1:width - (229*8)];
            w19_1 <= shift_reg[width-(229*8)-1:width - (230*8)];
            w19_2 <= shift_reg[width-(230*8)-1:width - (231*8)];
            w19_3 <= shift_reg[width-(231*8)-1:width - (232*8)];
            w19_4 <= shift_reg[width-(232*8)-1:width - (233*8)];
            w19_5 <= shift_reg[width-(233*8)-1:width - (234*8)];
            w19_6 <= shift_reg[width-(234*8)-1:width - (235*8)];
            w19_7 <= shift_reg[width-(235*8)-1:width - (236*8)];
            w19_8 <= shift_reg[width-(236*8)-1:width - (237*8)];
            w19_9 <= shift_reg[width-(237*8)-1:width - (238*8)];
            w19_10 <= shift_reg[width-(238*8)-1:width - (239*8)];
            w19_11 <= shift_reg[width-(239*8)-1:width - (240*8)];
            
            w20_0 <= shift_reg[width-(240*8)-1:width - (241*8)];
            w20_1 <= shift_reg[width-(241*8)-1:width - (242*8)];
            w20_2 <= shift_reg[width-(242*8)-1:width - (243*8)];
            w20_3 <= shift_reg[width-(243*8)-1:width - (244*8)];
            w20_4 <= shift_reg[width-(244*8)-1:width - (245*8)];
            w20_5 <= shift_reg[width-(245*8)-1:width - (246*8)];
            w20_6 <= shift_reg[width-(246*8)-1:width - (247*8)];
            w20_7 <= shift_reg[width-(247*8)-1:width - (248*8)];
            w20_8 <= shift_reg[width-(248*8)-1:width - (249*8)];
            w20_9 <= shift_reg[width-(249*8)-1:width - (250*8)];
            w20_10 <= shift_reg[width-(250*8)-1:width - (251*8)];
            w20_11 <= shift_reg[width-(251*8)-1:width - (252*8)];
            
            w21_0 <= shift_reg[width-(252*8)-1:width - (253*8)];
            w21_1 <= shift_reg[width-(253*8)-1:width - (254*8)];
            w21_2 <= shift_reg[width-(254*8)-1:width - (255*8)];
            w21_3 <= shift_reg[width-(255*8)-1:width - (256*8)];
            w21_4 <= shift_reg[width-(256*8)-1:width - (257*8)];
            w21_5 <= shift_reg[width-(257*8)-1:width - (258*8)];
            w21_6 <= shift_reg[width-(258*8)-1:width - (259*8)];
            w21_7 <= shift_reg[width-(259*8)-1:width - (260*8)];
            w21_8 <= shift_reg[width-(260*8)-1:width - (261*8)];
            w21_9 <= shift_reg[width-(261*8)-1:width - (262*8)];
            w21_10 <= shift_reg[width-(262*8)-1:width - (263*8)];
            w21_11 <= shift_reg[width-(263*8)-1:width - (264*8)];
            
            w22_0 <= shift_reg[width-(264*8)-1:width - (265*8)];
            w22_1 <= shift_reg[width-(265*8)-1:width - (266*8)];
            w22_2 <= shift_reg[width-(266*8)-1:width - (267*8)];
            w22_3 <= shift_reg[width-(267*8)-1:width - (268*8)];
            w22_4 <= shift_reg[width-(268*8)-1:width - (269*8)];
            w22_5 <= shift_reg[width-(269*8)-1:width - (270*8)];
            w22_6 <= shift_reg[width-(270*8)-1:width - (271*8)];
            w22_7 <= shift_reg[width-(271*8)-1:width - (272*8)];
            w22_8 <= shift_reg[width-(272*8)-1:width - (273*8)];
            w22_9 <= shift_reg[width-(273*8)-1:width - (274*8)];
            w22_10 <= shift_reg[width-(274*8)-1:width - (275*8)];
            w22_11 <= shift_reg[width-(275*8)-1:width - (276*8)];
            
            w23_0 <= shift_reg[width-(276*8)-1:width - (277*8)];
            w23_1 <= shift_reg[width-(277*8)-1:width - (278*8)];
            w23_2 <= shift_reg[width-(278*8)-1:width - (279*8)];
            w23_3 <= shift_reg[width-(279*8)-1:width - (280*8)];
            w23_4 <= shift_reg[width-(280*8)-1:width - (281*8)];
            w23_5 <= shift_reg[width-(281*8)-1:width - (282*8)];
            w23_6 <= shift_reg[width-(282*8)-1:width - (283*8)];
            w23_7 <= shift_reg[width-(283*8)-1:width - (284*8)];
            w23_8 <= shift_reg[width-(284*8)-1:width - (285*8)];
            w23_9 <= shift_reg[width-(285*8)-1:width - (286*8)];
            w23_10 <= shift_reg[width-(286*8)-1:width - (287*8)];
            w23_11 <= shift_reg[width-(287*8)-1:width - (288*8)];
            
            w24_0 <= shift_reg[width-(288*8)-1:width - (289*8)];
            w24_1 <= shift_reg[width-(289*8)-1:width - (290*8)];
            w24_2 <= shift_reg[width-(290*8)-1:width - (291*8)];
            w24_3 <= shift_reg[width-(291*8)-1:width - (292*8)];
            w24_4 <= shift_reg[width-(292*8)-1:width - (293*8)];
            w24_5 <= shift_reg[width-(293*8)-1:width - (294*8)];
            w24_6 <= shift_reg[width-(294*8)-1:width - (295*8)];
            w24_7 <= shift_reg[width-(295*8)-1:width - (296*8)];
            w24_8 <= shift_reg[width-(296*8)-1:width - (297*8)];
            w24_9 <= shift_reg[width-(297*8)-1:width - (298*8)];
            w24_10 <= shift_reg[width-(298*8)-1:width - (299*8)];
            w24_11 <= shift_reg[width-(299*8)-1:width - (300*8)];
            
            w25_0 <= shift_reg[width-(300*8)-1:width - (301*8)];
            w25_1 <= shift_reg[width-(301*8)-1:width - (302*8)];
            w25_2 <= shift_reg[width-(302*8)-1:width - (303*8)];
            w25_3 <= shift_reg[width-(303*8)-1:width - (304*8)];
            w25_4 <= shift_reg[width-(304*8)-1:width - (305*8)];
            w25_5 <= shift_reg[width-(305*8)-1:width - (306*8)];
            w25_6 <= shift_reg[width-(306*8)-1:width - (307*8)];
            w25_7 <= shift_reg[width-(307*8)-1:width - (308*8)];
            w25_8 <= shift_reg[width-(308*8)-1:width - (309*8)];
            w25_9 <= shift_reg[width-(309*8)-1:width - (310*8)];
            w25_10 <= shift_reg[width-(310*8)-1:width - (311*8)];
            w25_11 <= shift_reg[width-(311*8)-1:width - (312*8)];
            
            w26_0 <= shift_reg[width-(312*8)-1:width - (313*8)];
            w26_1 <= shift_reg[width-(313*8)-1:width - (314*8)];
            w26_2 <= shift_reg[width-(314*8)-1:width - (315*8)];
            w26_3 <= shift_reg[width-(315*8)-1:width - (316*8)];
            w26_4 <= shift_reg[width-(316*8)-1:width - (317*8)];
            w26_5 <= shift_reg[width-(317*8)-1:width - (318*8)];
            w26_6 <= shift_reg[width-(318*8)-1:width - (319*8)];
            w26_7 <= shift_reg[width-(319*8)-1:width - (320*8)];
            w26_8 <= shift_reg[width-(320*8)-1:width - (321*8)];
            w26_9 <= shift_reg[width-(321*8)-1:width - (322*8)];
            w26_10 <= shift_reg[width-(322*8)-1:width - (323*8)];
            w26_11 <= shift_reg[width-(323*8)-1:width - (324*8)];
            
            w27_0 <= shift_reg[width-(324*8)-1:width - (325*8)];
            w27_1 <= shift_reg[width-(325*8)-1:width - (326*8)];
            w27_2 <= shift_reg[width-(326*8)-1:width - (327*8)];
            w27_3 <= shift_reg[width-(327*8)-1:width - (328*8)];
            w27_4 <= shift_reg[width-(328*8)-1:width - (329*8)];
            w27_5 <= shift_reg[width-(329*8)-1:width - (330*8)];
            w27_6 <= shift_reg[width-(330*8)-1:width - (331*8)];
            w27_7 <= shift_reg[width-(331*8)-1:width - (332*8)];
            w27_8 <= shift_reg[width-(332*8)-1:width - (333*8)];
            w27_9 <= shift_reg[width-(333*8)-1:width - (334*8)];
            w27_10 <= shift_reg[width-(334*8)-1:width - (335*8)];
            w27_11 <= shift_reg[width-(335*8)-1:width - (336*8)];
            
            w28_0 <= shift_reg[width-(336*8)-1:width - (337*8)];
            w28_1 <= shift_reg[width-(337*8)-1:width - (338*8)];
            w28_2 <= shift_reg[width-(338*8)-1:width - (339*8)];
            w28_3 <= shift_reg[width-(339*8)-1:width - (340*8)];
            w28_4 <= shift_reg[width-(340*8)-1:width - (341*8)];
            w28_5 <= shift_reg[width-(341*8)-1:width - (342*8)];
            w28_6 <= shift_reg[width-(342*8)-1:width - (343*8)];
            w28_7 <= shift_reg[width-(343*8)-1:width - (344*8)];
            w28_8 <= shift_reg[width-(344*8)-1:width - (345*8)];
            w28_9 <= shift_reg[width-(345*8)-1:width - (346*8)];
            w28_10 <= shift_reg[width-(346*8)-1:width - (347*8)];
            w28_11 <= shift_reg[width-(347*8)-1:width - (348*8)];
            
            w29_0 <= shift_reg[width-(348*8)-1:width - (349*8)];
            w29_1 <= shift_reg[width-(349*8)-1:width - (350*8)];
            w29_2 <= shift_reg[width-(350*8)-1:width - (351*8)];
            w29_3 <= shift_reg[width-(351*8)-1:width - (352*8)];
            w29_4 <= shift_reg[width-(352*8)-1:width - (353*8)];
            w29_5 <= shift_reg[width-(353*8)-1:width - (354*8)];
            w29_6 <= shift_reg[width-(354*8)-1:width - (355*8)];
            w29_7 <= shift_reg[width-(355*8)-1:width - (356*8)];
            w29_8 <= shift_reg[width-(356*8)-1:width - (357*8)];
            w29_9 <= shift_reg[width-(357*8)-1:width - (358*8)];
            w29_10 <= shift_reg[width-(358*8)-1:width - (359*8)];
            w29_11 <= shift_reg[width-(359*8)-1:width - (360*8)];
            
            w30_0 <= shift_reg[width-(360*8)-1:width - (361*8)];
            w30_1 <= shift_reg[width-(361*8)-1:width - (362*8)];
            w30_2 <= shift_reg[width-(362*8)-1:width - (363*8)];
            w30_3 <= shift_reg[width-(363*8)-1:width - (364*8)];
            w30_4 <= shift_reg[width-(364*8)-1:width - (365*8)];
            w30_5 <= shift_reg[width-(365*8)-1:width - (366*8)];
            w30_6 <= shift_reg[width-(366*8)-1:width - (367*8)];
            w30_7 <= shift_reg[width-(367*8)-1:width - (368*8)];
            w30_8 <= shift_reg[width-(368*8)-1:width - (369*8)];
            w30_9 <= shift_reg[width-(369*8)-1:width - (370*8)];
            w30_10 <= shift_reg[width-(370*8)-1:width - (371*8)];
            w30_11 <= shift_reg[width-(371*8)-1:width - (372*8)];
            
            w31_0 <= shift_reg[width-(372*8)-1:width - (373*8)];
            w31_1 <= shift_reg[width-(373*8)-1:width - (374*8)];
            w31_2 <= shift_reg[width-(374*8)-1:width - (375*8)];
            w31_3 <= shift_reg[width-(375*8)-1:width - (376*8)];
            w31_4 <= shift_reg[width-(376*8)-1:width - (377*8)];
            w31_5 <= shift_reg[width-(377*8)-1:width - (378*8)];
            w31_6 <= shift_reg[width-(378*8)-1:width - (379*8)];
            w31_7 <= shift_reg[width-(379*8)-1:width - (380*8)];
            w31_8 <= shift_reg[width-(380*8)-1:width - (381*8)];
            w31_9 <= shift_reg[width-(381*8)-1:width - (382*8)];
            w31_10 <= shift_reg[width-(382*8)-1:width - (383*8)];
            w31_11 <= shift_reg[width-(383*8)-1:width - (384*8)];
                

        end
        else begin   
             w0_0<= 0 ;
             w0_1<= 0 ;
             w0_2<= 0 ;
             w0_3<= 0 ;
             w0_4<= 0 ;
             w0_5<= 0 ;
             w0_6<= 0 ;
             w0_7<= 0 ;
             w0_8<= 0 ;
             w0_9<= 0 ;
             w0_10<= 0 ;
             w0_11<= 0 ;
             
             w1_0<= 0 ;
             w1_1<= 0 ;
             w1_2<= 0 ;
             w1_3<= 0 ;
             w1_4<= 0 ;
             w1_5<= 0 ;
             w1_6<= 0 ;
             w1_7<= 0 ;
             w1_8<= 0 ;
             w1_9<= 0 ;
             w1_10<= 0 ;
             w1_11<= 0 ;
             
             w2_0<= 0 ;
             w2_1<= 0 ;
             w2_2<= 0 ;
             w2_3<= 0 ;
             w2_4<= 0 ;
             w2_5<= 0 ;
             w2_6<= 0 ;
             w2_7<= 0 ;
             w2_8<= 0 ;
             w2_9<= 0 ;
             w2_10<= 0 ;
             w2_11<= 0 ;
             
             w3_0<= 0 ;
             w3_1<= 0 ;
             w3_2<= 0 ;
             w3_3<= 0 ;
             w3_4<= 0 ;
             w3_5<= 0 ;
             w3_6<= 0 ;
             w3_7<= 0 ;
             w3_8<= 0 ;
             w3_9<= 0 ;
             w3_10<= 0 ;
             w3_11<= 0 ;
             
             w4_0<= 0 ;
             w4_1<= 0 ;
             w4_2<= 0 ;
             w4_3<= 0 ;
             w4_4<= 0 ;
             w4_5<= 0 ;
             w4_6<= 0 ;
             w4_7<= 0 ;
             w4_8<= 0 ;
             w4_9<= 0 ;
             w4_10<= 0 ;
             w4_11<= 0 ;
             
             w5_0<= 0 ;
             w5_1<= 0 ;
             w5_2<= 0 ;
             w5_3<= 0 ;
             w5_4<= 0 ;
             w5_5<= 0 ;
             w5_6<= 0 ;
             w5_7<= 0 ;
             w5_8<= 0 ;
             w5_9<= 0 ;
             w5_10<= 0 ;
             w5_11<= 0 ;
             
             w6_0<= 0 ;
             w6_1<= 0 ;
             w6_2<= 0 ;
             w6_3<= 0 ;
             w6_4<= 0 ;
             w6_5<= 0 ;
             w6_6<= 0 ;
             w6_7<= 0 ;
             w6_8<= 0 ;
             w6_9<= 0 ;
             w6_10<= 0 ;
             w6_11<= 0 ;
             
             w7_0<= 0 ;
             w7_1<= 0 ;
             w7_2<= 0 ;
             w7_3<= 0 ;
             w7_4<= 0 ;
             w7_5<= 0 ;
             w7_6<= 0 ;
             w7_7<= 0 ;
             w7_8<= 0 ;
             w7_9<= 0 ;
             w7_10<= 0 ;
             w7_11<= 0 ;
             
             w8_0<= 0 ;
             w8_1<= 0 ;
             w8_2<= 0 ;
             w8_3<= 0 ;
             w8_4<= 0 ;
             w8_5<= 0 ;
             w8_6<= 0 ;
             w8_7<= 0 ;
             w8_8<= 0 ;
             w8_9<= 0 ;
             w8_10<= 0 ;
             w8_11<= 0 ;
             
             w9_0<= 0 ;
             w9_1<= 0 ;
             w9_2<= 0 ;
             w9_3<= 0 ;
             w9_4<= 0 ;
             w9_5<= 0 ;
             w9_6<= 0 ;
             w9_7<= 0 ;
             w9_8<= 0 ;
             w9_9<= 0 ;
             w9_10<= 0 ;
             w9_11<= 0 ;
             
             w10_0<= 0 ;
             w10_1<= 0 ;
             w10_2<= 0 ;
             w10_3<= 0 ;
             w10_4<= 0 ;
             w10_5<= 0 ;
             w10_6<= 0 ;
             w10_7<= 0 ;
             w10_8<= 0 ;
             w10_9<= 0 ;
             w10_10<= 0 ;
             w10_11<= 0 ;
             
             w11_0<= 0 ;
             w11_1<= 0 ;
             w11_2<= 0 ;
             w11_3<= 0 ;
             w11_4<= 0 ;
             w11_5<= 0 ;
             w11_6<= 0 ;
             w11_7<= 0 ;
             w11_8<= 0 ;
             w11_9<= 0 ;
             w11_10<= 0 ;
             w11_11<= 0 ;
             
             w12_0<= 0 ;
             w12_1<= 0 ;
             w12_2<= 0 ;
             w12_3<= 0 ;
             w12_4<= 0 ;
             w12_5<= 0 ;
             w12_6<= 0 ;
             w12_7<= 0 ;
             w12_8<= 0 ;
             w12_9<= 0 ;
             w12_10<= 0 ;
             w12_11<= 0 ;
             
             w13_0<= 0 ;
             w13_1<= 0 ;
             w13_2<= 0 ;
             w13_3<= 0 ;
             w13_4<= 0 ;
             w13_5<= 0 ;
             w13_6<= 0 ;
             w13_7<= 0 ;
             w13_8<= 0 ;
             w13_9<= 0 ;
             w13_10<= 0 ;
             w13_11<= 0 ;
             
             w14_0<= 0 ;
             w14_1<= 0 ;
             w14_2<= 0 ;
             w14_3<= 0 ;
             w14_4<= 0 ;
             w14_5<= 0 ;
             w14_6<= 0 ;
             w14_7<= 0 ;
             w14_8<= 0 ;
             w14_9<= 0 ;
             w14_10<= 0 ;
             w14_11<= 0 ;
             
             w15_0<= 0 ;
             w15_1<= 0 ;
             w15_2<= 0 ;
             w15_3<= 0 ;
             w15_4<= 0 ;
             w15_5<= 0 ;
             w15_6<= 0 ;
             w15_7<= 0 ;
             w15_8<= 0 ;
             w15_9<= 0 ;
             w15_10<= 0 ;
             w15_11<= 0 ;
             
             w16_0<= 0 ;
             w16_1<= 0 ;
             w16_2<= 0 ;
             w16_3<= 0 ;
             w16_4<= 0 ;
             w16_5<= 0 ;
             w16_6<= 0 ;
             w16_7<= 0 ;
             w16_8<= 0 ;
             w16_9<= 0 ;
             w16_10<= 0 ;
             w16_11<= 0 ;
             
             w17_0<= 0 ;
             w17_1<= 0 ;
             w17_2<= 0 ;
             w17_3<= 0 ;
             w17_4<= 0 ;
             w17_5<= 0 ;
             w17_6<= 0 ;
             w17_7<= 0 ;
             w17_8<= 0 ;
             w17_9<= 0 ;
             w17_10<= 0 ;
             w17_11<= 0 ;
            
             w18_0<= 0 ;
             w18_1<= 0 ;
             w18_2<= 0 ;
             w18_3<= 0 ;
             w18_4<= 0 ;
             w18_5<= 0 ;
             w18_6<= 0 ;
             w18_7<= 0 ;
             w18_8<= 0 ;
             w18_9<= 0 ;
             w18_10<= 0 ;
             w18_11<= 0 ;
            
             w19_0<= 0 ;
             w19_1<= 0 ;
             w19_2<= 0 ;
             w19_3<= 0 ;
             w19_4<= 0 ;
             w19_5<= 0 ;
             w19_6<= 0 ;
             w19_7<= 0 ;
             w19_8<= 0 ;
             w19_9<= 0 ;
             w19_10<= 0 ;
             w19_11<= 0 ;
            
             w20_0<= 0 ;
             w20_1<= 0 ;
             w20_2<= 0 ;
             w20_3<= 0 ;
             w20_4<= 0 ;
             w20_5<= 0 ;
             w20_6<= 0 ;
             w20_7<= 0 ;
             w20_8<= 0 ;
             w20_9<= 0 ;
             w20_10<= 0 ;
             w20_11<= 0 ;
           
             w21_0<= 0 ;
             w21_1<= 0 ;
             w21_2<= 0 ;
             w21_3<= 0 ;
             w21_4<= 0 ;
             w21_5<= 0 ;
             w21_6<= 0 ;
             w21_7<= 0 ;
             w21_8<= 0 ;
             w21_9<= 0 ;
             w21_10<= 0 ;
             w21_11<= 0 ;
           
             w22_0<= 0 ;
             w22_1<= 0 ;
             w22_2<= 0 ;
             w22_3<= 0 ;
             w22_4<= 0 ;
             w22_5<= 0 ;
             w22_6<= 0 ;
             w22_7<= 0 ;
             w22_8<= 0 ;
             w22_9<= 0 ;
             w22_10<= 0 ;
             w22_11<= 0 ;
           
             w23_0<= 0 ;
             w23_1<= 0 ;
             w23_2<= 0 ;
             w23_3<= 0 ;
             w23_4<= 0 ;
             w23_5<= 0 ;
             w23_6<= 0 ;
             w23_7<= 0 ;
             w23_8<= 0 ;
             w23_9<= 0 ;
             w23_10<= 0 ;
             w23_11<= 0 ;
            
             w24_0<= 0 ;
             w24_1<= 0 ;
             w24_2<= 0 ;
             w24_3<= 0 ;
             w24_4<= 0 ;
             w24_5<= 0 ;
             w24_6<= 0 ;
             w24_7<= 0 ;
             w24_8<= 0 ;
             w24_9<= 0 ;
             w24_10<= 0 ;
             w24_11<= 0 ;
            
             w25_0<= 0 ;
             w25_1<= 0 ;
             w25_2<= 0 ;
             w25_3<= 0 ;
             w25_4<= 0 ;
             w25_5<= 0 ;
             w25_6<= 0 ;
             w25_7<= 0 ;
             w25_8<= 0 ;
             w25_9<= 0 ;
             w25_10<= 0 ;
             w25_11<= 0 ;
          
             w26_0<= 0 ;
             w26_1<= 0 ;
             w26_2<= 0 ;
             w26_3<= 0 ;
             w26_4<= 0 ;
             w26_5<= 0 ;
             w26_6<= 0 ;
             w26_7<= 0 ;
             w26_8<= 0 ;
             w26_9<= 0 ;
             w26_10<= 0 ;
             w26_11<= 0 ;
            
             w27_0<= 0 ;
             w27_1<= 0 ;
             w27_2<= 0 ;
             w27_3<= 0 ;
             w27_4<= 0 ;
             w27_5<= 0 ;
             w27_6<= 0 ;
             w27_7<= 0 ;
             w27_8<= 0 ;
             w27_9<= 0 ;
             w27_10<= 0 ;
             w27_11<= 0 ;
           
             w28_0<= 0 ;
             w28_1<= 0 ;
             w28_2<= 0 ;
             w28_3<= 0 ;
             w28_4<= 0 ;
             w28_5<= 0 ;
             w28_6<= 0 ;
             w28_7<= 0 ;
             w28_8<= 0 ;
             w28_9<= 0 ;
             w28_10<= 0 ;
             w28_11<= 0 ;
           
             w29_0<= 0 ;
             w29_1<= 0 ;
             w29_2<= 0 ;
             w29_3<= 0 ;
             w29_4<= 0 ;
             w29_5<= 0 ;
             w29_6<= 0 ;
             w29_7<= 0 ;
             w29_8<= 0 ;
             w29_9<= 0 ;
             w29_10<= 0 ;
             w29_11<= 0 ;
            
             w30_0<= 0 ;
             w30_1<= 0 ;
             w30_2<= 0 ;
             w30_3<= 0 ;
             w30_4<= 0 ;
             w30_5<= 0 ;
             w30_6<= 0 ;
             w30_7<= 0 ;
             w30_8<= 0 ;
             w30_9<= 0 ;
             w30_10<= 0 ;
             w30_11<= 0 ;
           
             w31_0<= 0 ;
             w31_1<= 0 ;
             w31_2<= 0 ;
             w31_3<= 0 ;
             w31_4<= 0 ;
             w31_5<= 0 ;
             w31_6<= 0 ;
             w31_7<= 0 ;
             w31_8<= 0 ;
             w31_9<= 0 ;
             w31_10<= 0 ;
             w31_11<= 0 ;
    
        end
        end
endmodule


//////////////////////////////////////

`timescale 1ns / 1ps


module relu(
    input reset,
    input signed [17:0] data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7, data_in_8,
    input signed [17:0] data_in_9, data_in_10, data_in_11, data_in_12, data_in_13, data_in_14, data_in_15, data_in_16,
    input signed [17:0] data_in_17, data_in_18, data_in_19, data_in_20, data_in_21, data_in_22, data_in_23, data_in_24,
    input signed [17:0] data_in_25, data_in_26, data_in_27, data_in_28, data_in_29, data_in_30, data_in_31, data_in_32,
   (*dont_touch = "true"*) output reg signed [17:0] data_out_1, data_out_2, data_out_3, data_out_4, data_out_5, data_out_6, data_out_7, data_out_8,
   (*dont_touch = "true"*) output reg signed [17:0] data_out_9, data_out_10, data_out_11, data_out_12, data_out_13, data_out_14, data_out_15, data_out_16,
   (*dont_touch = "true"*) output reg signed [17:0] data_out_17, data_out_18, data_out_19, data_out_20, data_out_21, data_out_22, data_out_23, data_out_24,
   (*dont_touch = "true"*) output reg signed [17:0] data_out_25, data_out_26, data_out_27, data_out_28, data_out_29, data_out_30, data_out_31, data_out_32
);

    always @(*) begin
        if (reset) begin
            data_out_1 <= 0; data_out_2 <= 0; data_out_3 <= 0; data_out_4 <= 0;
            data_out_5 <= 0; data_out_6 <= 0; data_out_7 <= 0; data_out_8 <= 0;
            data_out_9 <= 0; data_out_10 <= 0; data_out_11 <= 0; data_out_12 <= 0;
            data_out_13 <= 0; data_out_14 <= 0; data_out_15 <= 0; data_out_16 <= 0;
            data_out_17 <= 0; data_out_18 <= 0; data_out_19 <= 0; data_out_20 <= 0;
            data_out_21 <= 0; data_out_22 <= 0; data_out_23 <= 0; data_out_24 <= 0;
            data_out_25 <= 0; data_out_26 <= 0; data_out_27 <= 0; data_out_28 <= 0;
            data_out_29 <= 0; data_out_30 <= 0; data_out_31 <= 0; data_out_32 <= 0;
        end 
        else begin // implements rectification
            data_out_1 <= (data_in_1[17] == 0) ? data_in_1 : 0;
            data_out_2 <= (data_in_2[17] == 0) ? data_in_2 : 0;
            data_out_3 <= (data_in_3[17] == 0) ? data_in_3 : 0;
            data_out_4 <= (data_in_4[17] == 0) ? data_in_4 : 0;
            data_out_5 <= (data_in_5[17] == 0) ? data_in_5 : 0;
            data_out_6 <= (data_in_6[17] == 0) ? data_in_6 : 0;
            data_out_7 <= (data_in_7[17] == 0) ? data_in_7 : 0;
            data_out_8 <= (data_in_8[17] == 0) ? data_in_8 : 0;
            data_out_9 <= (data_in_9[17] == 0) ? data_in_9 : 0;
            data_out_10 <= (data_in_10[17] == 0) ? data_in_10 : 0;
            data_out_11 <= (data_in_11[17] == 0) ? data_in_11 : 0;
            data_out_12 <= (data_in_12[17] == 0) ? data_in_12 : 0;
            data_out_13 <= (data_in_13[17] == 0) ? data_in_13 : 0;
            data_out_14 <= (data_in_14[17] == 0) ? data_in_14 : 0;
            data_out_15 <= (data_in_15[17] == 0) ? data_in_15 : 0;
            data_out_16 <= (data_in_16[17] == 0) ? data_in_16 : 0;
            data_out_17 <= (data_in_17[17] == 0) ? data_in_17 : 0;
            data_out_18 <= (data_in_18[17] == 0) ? data_in_18 : 0;
            data_out_19 <= (data_in_19[17] == 0) ? data_in_19 : 0;
            data_out_20 <= (data_in_20[17] == 0) ? data_in_20 : 0;
            data_out_21 <= (data_in_21[17] == 0) ? data_in_21 : 0;
            data_out_22 <= (data_in_22[17] == 0) ? data_in_22 : 0;
            data_out_23 <= (data_in_23[17] == 0) ? data_in_23 : 0;
            data_out_24 <= (data_in_24[17] == 0) ? data_in_24 : 0;
            data_out_25 <= (data_in_25[17] == 0) ? data_in_25 : 0;
            data_out_26 <= (data_in_26[17] == 0) ? data_in_26 : 0;
            data_out_27 <= (data_in_27[17] == 0) ? data_in_27 : 0;
            data_out_28 <= (data_in_28[17] == 0) ? data_in_28 : 0;
            data_out_29 <= (data_in_29[17] == 0) ? data_in_29 : 0;
            data_out_30 <= (data_in_30[17] == 0) ? data_in_30 : 0;
            data_out_31 <= (data_in_31[17] == 0) ? data_in_31 : 0;
            data_out_32 <= (data_in_32[17] == 0) ? data_in_32 : 0;
        end
    end

endmodule






module max_pooling(
    input clk,
    input reset,
    (*dont_touch = "true"*)  output reset_next_stage,
    input signed [17:0] data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7, data_in_8,
    input signed [17:0] data_in_9, data_in_10, data_in_11, data_in_12, data_in_13, data_in_14, data_in_15, data_in_16,
    input signed [17:0] data_in_17, data_in_18, data_in_19, data_in_20, data_in_21, data_in_22, data_in_23, data_in_24,
    input signed [17:0] data_in_25, data_in_26, data_in_27, data_in_28, data_in_29, data_in_30, data_in_31, data_in_32,
    output signed [17:0] data_out_1, data_out_2, data_out_3, data_out_4, data_out_5, data_out_6, data_out_7, data_out_8,
   (*dont_touch = "true"*) output signed [17:0] data_out_9, data_out_10, data_out_11, data_out_12, data_out_13, data_out_14, data_out_15, data_out_16,
   (*dont_touch = "true"*) output signed [17:0] data_out_17, data_out_18, data_out_19, data_out_20, data_out_21, data_out_22, data_out_23, data_out_24,
   (*dont_touch = "true"*) output signed [17:0] data_out_25, data_out_26, data_out_27, data_out_28, data_out_29, data_out_30, data_out_31, data_out_32
    );
    
    max m1  (.clk(clk),.reset(reset),.data_in(data_in_1),.data_out(data_out_1));
    max m2  (.clk(clk),.reset(reset),.data_in(data_in_2),.data_out(data_out_2));
    max m3  (.clk(clk),.reset(reset),.data_in(data_in_3),.data_out(data_out_3));
    max m4  (.clk(clk),.reset(reset),.data_in(data_in_4),.data_out(data_out_4));
    max m5  (.clk(clk),.reset(reset),.data_in(data_in_5),.data_out(data_out_5));
    max m6  (.clk(clk),.reset(reset),.data_in(data_in_6),.data_out(data_out_6));
    max m7  (.clk(clk),.reset(reset),.data_in(data_in_7),.data_out(data_out_7));
    max m8  (.clk(clk),.reset(reset),.data_in(data_in_8),.data_out(data_out_8));
    max m9  (.clk(clk),.reset(reset),.data_in(data_in_9),.data_out(data_out_9));
    max m10 (.clk(clk),.reset(reset),.data_in(data_in_10),.data_out(data_out_10));
    max m11 (.clk(clk),.reset(reset),.data_in(data_in_11),.data_out(data_out_11));
    max m12 (.clk(clk),.reset(reset),.data_in(data_in_12),.data_out(data_out_12));
    max m13 (.clk(clk),.reset(reset),.data_in(data_in_13),.data_out(data_out_13));
    max m14 (.clk(clk),.reset(reset),.data_in(data_in_14),.data_out(data_out_14));
    max m15 (.clk(clk),.reset(reset),.data_in(data_in_15),.data_out(data_out_15));
    max m16 (.clk(clk),.reset(reset),.data_in(data_in_16),.data_out(data_out_16));
    max m17 (.clk(clk),.reset(reset),.data_in(data_in_17),.data_out(data_out_17));
    max m18 (.clk(clk),.reset(reset),.data_in(data_in_18),.data_out(data_out_18));
    max m19 (.clk(clk),.reset(reset),.data_in(data_in_19),.data_out(data_out_19));
    max m20 (.clk(clk),.reset(reset),.data_in(data_in_20),.data_out(data_out_20));
    max m21 (.clk(clk),.reset(reset),.data_in(data_in_21),.data_out(data_out_21));
    max m22 (.clk(clk),.reset(reset),.data_in(data_in_22),.data_out(data_out_22));
    max m23 (.clk(clk),.reset(reset),.data_in(data_in_23),.data_out(data_out_23));
    max m24 (.clk(clk),.reset(reset),.data_in(data_in_24),.data_out(data_out_24));
    max m25 (.clk(clk),.reset(reset),.data_in(data_in_25),.data_out(data_out_25));
    max m26 (.clk(clk),.reset(reset),.data_in(data_in_26),.data_out(data_out_26));
    max m27 (.clk(clk),.reset(reset),.data_in(data_in_27),.data_out(data_out_27));
    max m28 (.clk(clk),.reset(reset),.data_in(data_in_28),.data_out(data_out_28));
    max m29 (.clk(clk),.reset(reset),.data_in(data_in_29),.data_out(data_out_29));
    max m30 (.clk(clk),.reset(reset),.data_in(data_in_30),.data_out(data_out_30));
    max m31 (.clk(clk),.reset(reset),.data_in(data_in_31),.data_out(data_out_31));
    max m32 (.clk(clk),.reset(reset),.data_in(data_in_32),.data_out(data_out_32));
    
    reset_next_1 m33 (.clk(clk),.reset(reset),.out(reset_next_stage));
    endmodule

module max (
    input clk,
    input signed [17:0]data_in,
    input reset,
  //  output reg reset_next_stage,
   (*dont_touch = "true"*) output reg signed [17:0]data_out
    );
 
    reg signed [17:0] q1,q2 = 0;
    reg [8:0]flag = 1;
    reg [3:0] counter = 0;
    always@(posedge clk)begin
        if(reset)begin
            data_out <= 0;
            q1 <= 0;
            q2 <= 0;
            flag <= 0;
        end
        else begin //say values are 3 and 4. output should be 4
            q1 <= data_in; //1st clk cycle, q1 is 3 and q2 is 0. flag updated to 1
            q2 <= q1; //2nd clk cycle, q1 is 4, q2 is 3. flag updated to 2
            flag = flag + 1; 
            if(flag == 3)begin // 3rd clk cycle flag is 3 but non blocking assigment
                data_out <= (q1>q2)?q1:q2; // so q1 equal to 4 and q2 equal to 3 is considered here
                flag <= 1;
            end   
        end
     end
     
 /*    always@(posedge clk) begin
        if(reset) begin
            reset_next_stage <= 1;
            counter <= 0;
        end
        else begin
            if((counter > 1) && (counter < 6))
                reset_next_stage <= 0;
            else
                reset_next_stage <= 1;    
        counter <= counter + 1;       
     end end      */
   endmodule 
   
   
module reset_next_1( //handles reset output of max_pooling
    input clk,
    input reset,
    output reg out
    );
    reg q1,q2;
    always @(posedge clk)begin
        q1 <= reset;
        q2 <= q1;
        out <= q2;
    end
endmodule
    
