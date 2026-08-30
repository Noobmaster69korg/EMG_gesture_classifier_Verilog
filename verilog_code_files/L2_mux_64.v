`timescale 1ns / 1ps


module mux_64_bias(

input [1:0] sel,
input signed [7:0] data_in_0, 
input signed [7:0] data_in_1, 
input signed [7:0] data_in_2, 
input signed [7:0] data_in_3, 
input signed [7:0] data_in_4, 
input signed [7:0] data_in_5, 
input signed [7:0] data_in_6, 
input signed [7:0] data_in_7, 
input signed [7:0] data_in_8, 
input signed [7:0] data_in_9, 
input signed [7:0] data_in_10, 
input signed [7:0] data_in_11, 
input signed [7:0] data_in_12, 
input signed [7:0] data_in_13, 
input signed [7:0] data_in_14, 
input signed [7:0] data_in_15, 
input signed [7:0] data_in_16, 
input signed [7:0] data_in_17, 
input signed [7:0] data_in_18, 
input signed [7:0] data_in_19, 
input signed [7:0] data_in_20, 
input signed [7:0] data_in_21, 
input signed [7:0] data_in_22, 
input signed [7:0] data_in_23, 
input signed [7:0] data_in_24, 
input signed [7:0] data_in_25, 
input signed [7:0] data_in_26, 
input signed [7:0] data_in_27, 
input signed [7:0] data_in_28, 
input signed [7:0] data_in_29, 
input signed [7:0] data_in_30, 
input signed [7:0] data_in_31, 
input signed [7:0] data_in_32, 
input signed [7:0] data_in_33, 
input signed [7:0] data_in_34, 
input signed [7:0] data_in_35, 
input signed [7:0] data_in_36, 
input signed [7:0] data_in_37, 
input signed [7:0] data_in_38, 
input signed [7:0] data_in_39, 
input signed [7:0] data_in_40, 
input signed [7:0] data_in_41, 
input signed [7:0] data_in_42, 
input signed [7:0] data_in_43, 
input signed [7:0] data_in_44, 
input signed [7:0] data_in_45, 
input signed [7:0] data_in_46, 
input signed [7:0] data_in_47, 
input signed [7:0] data_in_48, 
input signed [7:0] data_in_49, 
input signed [7:0] data_in_50, 
input signed [7:0] data_in_51, 
input signed [7:0] data_in_52, 
input signed [7:0] data_in_53, 
input signed [7:0] data_in_54, 
input signed [7:0] data_in_55, 
input signed [7:0] data_in_56, 
input signed [7:0] data_in_57, 
input signed [7:0] data_in_58, 
input signed [7:0] data_in_59, 
input signed [7:0] data_in_60, 
input signed [7:0] data_in_61, 
input signed [7:0] data_in_62, 
input signed [7:0] data_in_63, 

output reg  signed [7:0] data_out_0, 
output reg  signed [7:0] data_out_1, 
output reg  signed [7:0] data_out_2, 
output reg  signed [7:0] data_out_3, 
output reg  signed [7:0] data_out_4, 
output reg  signed [7:0] data_out_5, 
output reg  signed [7:0] data_out_6, 
output reg  signed [7:0] data_out_7, 
output reg  signed [7:0] data_out_8, 
output reg  signed [7:0] data_out_9, 
output reg  signed [7:0] data_out_10, 
output reg  signed [7:0] data_out_11, 
output reg  signed [7:0] data_out_12, 
output reg  signed [7:0] data_out_13, 
output reg  signed [7:0] data_out_14, 
output reg  signed [7:0] data_out_15

    );
    always@(*)begin
    case(sel)
    2'b00: begin
    data_out_0 <= data_in_0; 
    data_out_1 <= data_in_1; 
    data_out_2 <= data_in_2; 
    data_out_3 <= data_in_3; 
    data_out_4 <= data_in_4; 
    data_out_5 <= data_in_5; 
    data_out_6 <= data_in_6; 
    data_out_7 <= data_in_7; 
    data_out_8 <= data_in_8; 
    data_out_9 <= data_in_9; 
    data_out_10 <= data_in_10; 
    data_out_11 <= data_in_11; 
    data_out_12 <= data_in_12; 
    data_out_13 <= data_in_13; 
    data_out_14 <= data_in_14; 
    data_out_15 <= data_in_15; 
    end
    2'b01:begin
    data_out_0 <= data_in_16; 
    data_out_1 <= data_in_17; 
    data_out_2 <= data_in_18; 
    data_out_3 <= data_in_19; 
    data_out_4 <= data_in_20; 
    data_out_5 <= data_in_21; 
    data_out_6 <= data_in_22; 
    data_out_7 <= data_in_23; 
    data_out_8 <= data_in_24; 
    data_out_9 <= data_in_25; 
    data_out_10 <= data_in_26; 
    data_out_11 <= data_in_27; 
    data_out_12 <= data_in_28; 
    data_out_13 <= data_in_29; 
    data_out_14 <= data_in_30; 
    data_out_15 <= data_in_31; 
    end
    2'b10: begin
    data_out_0 <= data_in_32; 
    data_out_1 <= data_in_33; 
    data_out_2 <= data_in_34; 
    data_out_3 <= data_in_35; 
    data_out_4 <= data_in_36; 
    data_out_5 <= data_in_37; 
    data_out_6 <= data_in_38; 
    data_out_7 <= data_in_39; 
    data_out_8 <= data_in_40; 
    data_out_9 <= data_in_41; 
    data_out_10 <= data_in_42; 
    data_out_11 <= data_in_43; 
    data_out_12 <= data_in_44; 
    data_out_13 <= data_in_45; 
    data_out_14 <= data_in_46; 
    data_out_15 <= data_in_47; 
    end
    2'b11:begin
    data_out_0 <= data_in_48; 
    data_out_1 <= data_in_49; 
    data_out_2 <= data_in_50; 
    data_out_3 <= data_in_51; 
    data_out_4 <= data_in_52; 
    data_out_5 <= data_in_53; 
    data_out_6 <= data_in_54; 
    data_out_7 <= data_in_55; 
    data_out_8 <= data_in_56; 
    data_out_9 <= data_in_57; 
    data_out_10 <= data_in_58; 
    data_out_11 <= data_in_59; 
    data_out_12 <= data_in_60; 
    data_out_13 <= data_in_61; 
    data_out_14 <= data_in_62; 
    data_out_15 <= data_in_63; 
    end
    endcase
    end
    endmodule
