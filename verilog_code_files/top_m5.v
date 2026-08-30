`timescale 1ns / 1ps



module top_mp5(

    input clk_2,
    input clk,
    input reset_data,
    input reset,
    input signed [7:0] ch0,
    input signed [7:0] ch1,
    input signed [7:0] ch2,
    input signed [7:0] ch3,
    input signed [7:0] ch4,
    input signed [7:0] ch5,
   

/*    input clk,
    input clk_2,
    input reset,         // globalreset
    input reset_data,  // data-syn-reset
    input signed [17:0] data_in_0, 
    input signed [17:0] data_in_1, 
    input signed [17:0] data_in_2, 
    input signed [17:0] data_in_3, 
    input signed [17:0] data_in_4, 
    input signed [17:0] data_in_5, 
    input signed [17:0] data_in_6, 
    input signed [17:0] data_in_7, 
    input signed [17:0] data_in_8, 
    input signed [17:0] data_in_9, 
    input signed [17:0] data_in_10, 
    input signed [17:0] data_in_11, 
    input signed [17:0] data_in_12, 
    input signed [17:0] data_in_13, 
    input signed [17:0] data_in_14, 
    input signed [17:0] data_in_15, 
    input signed [17:0] data_in_16, 
    input signed [17:0] data_in_17, 
    input signed [17:0] data_in_18, 
    input signed [17:0] data_in_19, 
    input signed [17:0] data_in_20, 
    input signed [17:0] data_in_21, 
    input signed [17:0] data_in_22, 
    input signed [17:0] data_in_23, 
    input signed [17:0] data_in_24, 
    input signed [17:0] data_in_25, 
    input signed [17:0] data_in_26, 
    input signed [17:0] data_in_27, 
    input signed [17:0] data_in_28, 
    input signed [17:0] data_in_29, 
    input signed [17:0] data_in_30, 
    input signed [17:0] data_in_31,*/
    
  /*  output signed [31:0] data_out_0, 
    output signed [31:0] data_out_1, 
    output signed [31:0] data_out_2, 
    output signed [31:0] data_out_3, 
    output signed [31:0] data_out_4, 
    output signed [31:0] data_out_5, 
    output signed [31:0] data_out_6, 
    output signed [31:0] data_out_7, 
    output signed [31:0] data_out_8, 
    output signed [31:0] data_out_9, 
    output signed [31:0] data_out_10, 
    output signed [31:0] data_out_11, 
    output signed [31:0] data_out_12, 
    output signed [31:0] data_out_13, 
    output signed [31:0] data_out_14, 
    output signed [31:0] data_out_15, 
    output signed [31:0] data_out_16, 
    output signed [31:0] data_out_17, 
    output signed [31:0] data_out_18, 
    output signed [31:0] data_out_19, 
    output signed [31:0] data_out_20, 
    output signed [31:0] data_out_21, 
    output signed [31:0] data_out_22, 
    output signed [31:0] data_out_23, 
    output signed [31:0] data_out_24, 
    output signed [31:0] data_out_25, 
    output signed [31:0] data_out_26, 
    output signed [31:0] data_out_27, 
    output signed [31:0] data_out_28, 
    output signed [31:0] data_out_29, 
    output signed [31:0] data_out_30, 
    output signed [31:0] data_out_31, 
    output signed [31:0] data_out_32, 
    output signed [31:0] data_out_33, 
    output signed [31:0] data_out_34, 
    output signed [31:0] data_out_35, 
    output signed [31:0] data_out_36, 
    output signed [31:0] data_out_37, 
    output signed [31:0] data_out_38, 
    output signed [31:0] data_out_39, 
    output signed [31:0] data_out_40, 
    output signed [31:0] data_out_41, 
    output signed [31:0] data_out_42, 
    output signed [31:0] data_out_43, 
    output signed [31:0] data_out_44, 
    output signed [31:0] data_out_45, 
    output signed [31:0] data_out_46, 
    output signed [31:0] data_out_47, 
    output signed [31:0] data_out_48, 
    output signed [31:0] data_out_49, 
    output signed [31:0] data_out_50, 
    output signed [31:0] data_out_51, 
    output signed [31:0] data_out_52, 
    output signed [31:0] data_out_53, 
    output signed [31:0] data_out_54, 
    output signed [31:0] data_out_55, 
    output signed [31:0] data_out_56, 
    output signed [31:0] data_out_57, 
    output signed [31:0] data_out_58, 
    output signed [31:0] data_out_59, 
    output signed [31:0] data_out_60, 
    output signed [31:0] data_out_61, 
    output signed [31:0] data_out_62, 
    output signed [31:0] data_out_63,*/
  //  output reset_next_stage
    
    output [2:0]max_index,
    output signed [38:0]max_out

    );
  //  wire reset_data;
 //   wire clk_2;
  (*dont_touch = "true"*)  wire signed [31:0] qq [63:0];
  (*dont_touch = "true"*)  wire signed [31:0] qa;
  (*dont_touch = "true"*)  wire signed [38:0] qc; // to hold outputs of dense2 which are fed into hardmax
  (*dont_touch = "true"*)  wire signed [31:0] qb [63:0];
  (*dont_touch = "true"*)  wire signed [17:0] qd [31:0]; //32 18-bit outputs to hold the first_layer output
  (*dont_touch = "true"*)  wire r1,r2,r3,r4,r5;
    
    
    
    
    Layer_1                    a0    (.clk(clk),.clk_2(clk_2),.reset(reset),.data_reset(reset_data),.ch0(ch0),.ch1(ch1),.ch2(ch2),.ch3(ch3),.ch4(ch4),.ch5(ch5),.reset_next_stage(r1),.d_out_1(qd[0]),.d_out_2(qd[1]),.d_out_3(qd[2]),.d_out_4(qd[3]),.d_out_5(qd[4]),.d_out_6(qd[5]),.d_out_7(qd[6]),
                                      .d_out_8(qd[7]),.d_out_9(qd[8]),.d_out_10(qd[9]),.d_out_11(qd[10]),.d_out_12(qd[11]),.d_out_13(qd[12]),.d_out_14(qd[13]),.d_out_15(qd[14]),.d_out_16(qd[15]),.d_out_17(qd[16]),.d_out_18(qd[17]),.d_out_19(qd[18]),.d_out_20(qd[19]),
                                      .d_out_21(qd[20]),.d_out_22(qd[21]),.d_out_23(qd[22]),.d_out_24(qd[23]),.d_out_25(qd[24]),.d_out_26(qd[25]),.d_out_27(qd[26]),.d_out_28(qd[27]),.d_out_29(qd[28]),.d_out_30(qd[29]),.d_out_31(qd[30]),.d_out_32(qd[31]));      
    
    
    
    
    pre_fetch                   a1 (.clk(clk),.clk_2(clk_2),.reset(reset),.reset_data(r1),.data_in_0(qd[0]),.data_in_1(qd[1]),.data_in_2(qd[2]),.data_in_3(qd[3]),.data_in_4(qd[4]),.data_in_5(qd[5]),.data_in_6(qd[6]),.data_in_7(qd[7]),
                                     .data_in_8(qd[8]),.data_in_9(qd[9]),.data_in_10(qd[10]),.data_in_11(qd[11]),.data_in_12(qd[12]),.data_in_13(qd[13]),.data_in_14(qd[14]),.data_in_15(qd[15]),.data_in_16(qd[16]),.data_in_17(qd[17]),.data_in_18(qd[18]),
                                     .data_in_19(qd[19]),.data_in_20(qd[20]),.data_in_21(qd[21]),.data_in_22(qd[22]),.data_in_23(qd[23]),.data_in_24(qd[24]),.data_in_25(qd[25]),.data_in_26(qd[26]),.data_in_27(qd[27]),.data_in_28(qd[28]),.data_in_29(qd[29]),
                                     .data_in_30(qd[30]),.data_in_31(qd[31]),.data_out_0(qq[0]),.data_out_1(qq[1]),.data_out_2(qq[2]),.data_out_3(qq[3]),.data_out_4(qq[4]),.data_out_5(qq[5]),.data_out_6(qq[6]),.data_out_7(qq[7]),.data_out_8(qq[8]),
                                     .data_out_9(qq[9]),.data_out_10(qq[10]),.data_out_11(qq[11]),.data_out_12(qq[12]),.data_out_13(qq[13]),.data_out_14(qq[14]),.data_out_15(qq[15]),.data_out_16(qq[16]),.data_out_17(qq[17]),.data_out_18(qq[18]),
                                     .data_out_19(qq[19]),.data_out_20(qq[20]),.data_out_21(qq[21]),.data_out_22(qq[22]),.data_out_23(qq[23]),.data_out_24(qq[24]),.data_out_25(qq[25]),.data_out_26(qq[26]),.data_out_27(qq[27]),.data_out_28(qq[28]),
                                     .data_out_29(qq[29]),.data_out_30(qq[30]),.data_out_31(qq[31]),.data_out_32(qq[32]),.data_out_33(qq[33]),.data_out_34(qq[34]),.data_out_35(qq[35]),.data_out_36(qq[36]),.data_out_37(qq[37]),.data_out_38(qq[38]),
                                     .data_out_39(qq[39]),.data_out_40(qq[40]),.data_out_41(qq[41]),.data_out_42(qq[42]),.data_out_43(qq[43]),.data_out_44(qq[44]),.data_out_45(qq[45]),.data_out_46(qq[46]),.data_out_47(qq[47]),.data_out_48(qq[48]),
                                     .data_out_49(qq[49]),.data_out_50(qq[50]),.data_out_51(qq[51]),.data_out_52(qq[52]),.data_out_53(qq[53]),.data_out_54(qq[54]),.data_out_55(qq[55]),.data_out_56(qq[56]),.data_out_57(qq[57]),.data_out_58(qq[58]),
                                     .data_out_59(qq[59]),.data_out_60(qq[60]),.data_out_61(qq[61]),.data_out_62(qq[62]),.data_out_63(qq[63]),
                                    .reset_next_stage(r2));
    
    Dense1_top_module           a2 (.clk(clk_2),.reset(r2),.data_in_1(qq[0]),.data_in_2(qq[1]),.data_in_3(qq[2]),.data_in_4(qq[3]),.data_in_5(qq[4]),.data_in_6(qq[5]),.data_in_7(qq[6]),.data_in_8(qq[7]),.data_in_9(qq[8]),.data_in_10(qq[9]),
                                   .data_in_11(qq[10]),.data_in_12(qq[11]),.data_in_13(qq[12]),.data_in_14(qq[13]),.data_in_15(qq[14]),.data_in_16(qq[15]),.data_in_17(qq[16]),.data_in_18(qq[17]),.data_in_19(qq[18]),.data_in_20(qq[19]),
                                   .data_in_21(qq[20]),.data_in_22(qq[21]),.data_in_23(qq[22]),.data_in_24(qq[23]),.data_in_25(qq[24]),.data_in_26(qq[25]),.data_in_27(qq[26]),.data_in_28(qq[27]),.data_in_29(qq[28]),.data_in_30(qq[29]),
                                   .data_in_31(qq[30]),.data_in_32(qq[31]),.data_in_33(qq[32]),.data_in_34(qq[33]),.data_in_35(qq[34]),.data_in_36(qq[35]),.data_in_37(qq[36]),.data_in_38(qq[37]),.data_in_39(qq[38]),.data_in_40(qq[39]),
                                   .data_in_41(qq[40]),.data_in_42(qq[41]),.data_in_43(qq[42]),.data_in_44(qq[43]),.data_in_45(qq[44]),.data_in_46(qq[45]),.data_in_47(qq[46]),.data_in_48(qq[47]),.data_in_49(qq[48]),.data_in_50(qq[49]),
                                   .data_in_51(qq[50]),.data_in_52(qq[51]),.data_in_53(qq[52]),.data_in_54(qq[53]),.data_in_55(qq[54]),.data_in_56(qq[55]),.data_in_57(qq[56]),.data_in_58(qq[57]),.data_in_59(qq[58]),.data_in_60(qq[59]),
                                   .data_in_61(qq[60]),.data_in_62(qq[61]),.data_in_63(qq[62]),.data_in_64(qq[63]),.reset_next_stage(r3),.data_out(qa));
    
    interface_Dense1_and_Dense2 a3 (.clk(clk_2),.reset(r3),.reset_next_stage(r4),.data_in(qa),.data_out_1(qb[0]),.data_out_2(qb[1]),.data_out_3(qb[2]),.data_out_4(qb[3]),.data_out_5(qb[4]),.data_out_6(qb[5]),.data_out_7(qb[6]),.data_out_8(qb[7]),
                                    .data_out_9(qb[8]),.data_out_10(qb[9]),.data_out_11(qb[10]),.data_out_12(qb[11]),.data_out_13(qb[12]),.data_out_14(qb[13]),.data_out_15(qb[14]),.data_out_16(qb[15]),.data_out_17(qb[16]),.data_out_18(qb[17]),
                                    .data_out_19(qb[18]),.data_out_20(qb[19]),.data_out_21(qb[20]),.data_out_22(qb[21]),.data_out_23(qb[22]),.data_out_24(qb[23]),.data_out_25(qb[24]),.data_out_26(qb[25]),.data_out_27(qb[26]),.data_out_28(qb[27]),
                                    .data_out_29(qb[28]),.data_out_30(qb[29]),.data_out_31(qb[30]),.data_out_32(qb[31]),.data_out_33(qb[32]),.data_out_34(qb[33]),.data_out_35(qb[34]),.data_out_36(qb[35]),.data_out_37(qb[36]),.data_out_38(qb[37]),
                                    .data_out_39(qb[38]),.data_out_40(qb[39]),.data_out_41(qb[40]),.data_out_42(qb[41]),.data_out_43(qb[42]),.data_out_44(qb[43]),.data_out_45(qb[44]),.data_out_46(qb[45]),.data_out_47(qb[46]),.data_out_48(qb[47]),
                                    .data_out_49(qb[48]),.data_out_50(qb[49]),.data_out_51(qb[50]),.data_out_52(qb[51]),.data_out_53(qb[52]),.data_out_54(qb[53]),.data_out_55(qb[54]),.data_out_56(qb[55]),.data_out_57(qb[56]),.data_out_58(qb[57]),
                                    .data_out_59(qb[58]),.data_out_60(qb[59]),.data_out_61(qb[60]),.data_out_62(qb[61]),.data_out_63(qb[62]),.data_out_64(qb[63]));
    
    Dense2_top_module           a4 (.clk(clk_2),.reset(r4),.data_in_1(qb[0]),.data_in_2(qb[1]),.data_in_3(qb[2]),.data_in_4(qb[3]),.data_in_5(qb[4]),.data_in_6(qb[5]),.data_in_7(qb[6]),.data_in_8(qb[7]),.data_in_9(qb[8]),.data_in_10(qb[9]),
                                   .data_in_11(qb[10]),.data_in_12(qb[11]),.data_in_13(qb[12]),.data_in_14(qb[13]),.data_in_15(qb[14]),.data_in_16(qb[15]),.data_in_17(qb[16]),.data_in_18(qb[17]),.data_in_19(qb[18]),.data_in_20(qb[19]),
                                   .data_in_21(qb[20]),.data_in_22(qb[21]),.data_in_23(qb[22]),.data_in_24(qb[23]),.data_in_25(qb[24]),.data_in_26(qb[25]),.data_in_27(qb[26]),.data_in_28(qb[27]),.data_in_29(qb[28]),.data_in_30(qb[29]),
                                   .data_in_31(qb[30]),.data_in_32(qb[31]),.data_in_33(qb[32]),.data_in_34(qb[33]),.data_in_35(qb[34]),.data_in_36(qb[35]),.data_in_37(qb[36]),.data_in_38(qb[37]),.data_in_39(qb[38]),.data_in_40(qb[39]),
                                   .data_in_41(qb[40]),.data_in_42(qb[41]),.data_in_43(qb[42]),.data_in_44(qb[43]),.data_in_45(qb[44]),.data_in_46(qb[45]),.data_in_47(qb[46]),.data_in_48(qb[47]),.data_in_49(qb[48]),.data_in_50(qb[49]),
                                   .data_in_51(qb[50]),.data_in_52(qb[51]),.data_in_53(qb[52]),.data_in_54(qb[53]),.data_in_55(qb[54]),.data_in_56(qb[55]),.data_in_57(qb[56]),.data_in_58(qb[57]),.data_in_59(qb[58]),.data_in_60(qb[59]),
                                   .data_in_61(qb[60]),.data_in_62(qb[61]),.data_in_63(qb[62]),.data_in_64(qb[63]),.reset_next_stage(r5),.data_out(qc)); 
    
    hard_max                    a5 (.clk(clk_2),.reset(r5),.data_in(qc),.max_index(max_index),.max_out(max_out));  
endmodule
