`timescale 1ns / 1ps


module Dense2_top_module(

input clk,
(*keep = "true" *)input reset,   
input signed [31:0] data_in_1,
input signed [31:0] data_in_2,
input signed [31:0] data_in_3,
input signed [31:0] data_in_4,
input signed [31:0] data_in_5,
input signed [31:0] data_in_6,
input signed [31:0] data_in_7,
input signed [31:0] data_in_8,
input signed [31:0] data_in_9,
input signed [31:0] data_in_10,
input signed [31:0] data_in_11,
input signed [31:0] data_in_12,
input signed [31:0] data_in_13,
input signed [31:0] data_in_14,
input signed [31:0] data_in_15,
input signed [31:0] data_in_16,
input signed [31:0] data_in_17,
input signed [31:0] data_in_18,
input signed [31:0] data_in_19,
input signed [31:0] data_in_20,
input signed [31:0] data_in_21,
input signed [31:0] data_in_22,
input signed [31:0] data_in_23,
input signed [31:0] data_in_24,
input signed [31:0] data_in_25,
input signed [31:0] data_in_26,
input signed [31:0] data_in_27,
input signed [31:0] data_in_28,
input signed [31:0] data_in_29,
input signed [31:0] data_in_30,
input signed [31:0] data_in_31,
input signed [31:0] data_in_32,
input signed [31:0] data_in_33,
input signed [31:0] data_in_34,
input signed [31:0] data_in_35,
input signed [31:0] data_in_36,
input signed [31:0] data_in_37,
input signed [31:0] data_in_38,
input signed [31:0] data_in_39,
input signed [31:0] data_in_40,
input signed [31:0] data_in_41,
input signed [31:0] data_in_42,
input signed [31:0] data_in_43,
input signed [31:0] data_in_44,
input signed [31:0] data_in_45,
input signed [31:0] data_in_46,
input signed [31:0] data_in_47,
input signed [31:0] data_in_48,
input signed [31:0] data_in_49,
input signed [31:0] data_in_50,
input signed [31:0] data_in_51,
input signed [31:0] data_in_52,
input signed [31:0] data_in_53,
input signed [31:0] data_in_54,
input signed [31:0] data_in_55,
input signed [31:0] data_in_56,
input signed [31:0] data_in_57,
input signed [31:0] data_in_58,
input signed [31:0] data_in_59,
input signed [31:0] data_in_60,
input signed [31:0] data_in_61,
input signed [31:0] data_in_62,
input signed [31:0] data_in_63,
input signed [31:0] data_in_64,


output reset_next_stage,
output signed [38:0] data_out


    );
  wire signed [15:0] q [63:0];
  wire signed [7:0] bias_wire;
  brams_for_layer_2 a1 (.clk(clk),.reset(reset),.bias(bias_wire),.data_out_1(q[0]),.data_out_2(q[1]),.data_out_3(q[2]),.data_out_4(q[3]),
                        .data_out_5(q[4]),.data_out_6(q[5]),.data_out_7(q[6]),.data_out_8(q[7]),.data_out_9(q[8]),     
                        .data_out_10(q[9]),.data_out_11(q[10]),.data_out_12(q[11]),.data_out_13(q[12]),.data_out_14(q[13]),
                        .data_out_15(q[14]),.data_out_16(q[15]),.data_out_17(q[16]),.data_out_18(q[17]),.data_out_19(q[18]),
                        .data_out_20(q[19]),.data_out_21(q[20]),.data_out_22(q[21]),.data_out_23(q[22]),.data_out_24(q[23]),
                        .data_out_25(q[24]),.data_out_26(q[25]),.data_out_27(q[26]),.data_out_28(q[27]),.data_out_29(q[28]),
                        .data_out_30(q[29]),.data_out_31(q[30]),.data_out_32(q[31]),.data_out_33(q[32]),.data_out_34(q[33]),
                        .data_out_35(q[34]),.data_out_36(q[35]),.data_out_37(q[36]),.data_out_38(q[37]),.data_out_39(q[38]),
                        .data_out_40(q[39]),.data_out_41(q[40]),.data_out_42(q[41]),.data_out_43(q[42]),.data_out_44(q[43]),
                        .data_out_45(q[44]),.data_out_46(q[45]),.data_out_47(q[46]),.data_out_48(q[47]),.data_out_49(q[48]),
                        .data_out_50(q[49]),.data_out_51(q[50]),.data_out_52(q[51]),.data_out_53(q[52]),.data_out_54(q[53]),
                        .data_out_55(q[54]),.data_out_56(q[55]),.data_out_57(q[56]),.data_out_58(q[57]),.data_out_59(q[58]),
                        .data_out_60(q[59]),.data_out_61(q[60]),.data_out_62(q[61]),.data_out_63(q[62]),.data_out_64(q[63]));
  
  Mac_units2         a2   (.clk(clk),.reset(reset),.bias(bias_wire),.ram_data_1(q[0]),.ram_data_2(q[1]),.ram_data_3(q[2]),.ram_data_4(q[3]),  
                         .ram_data_5(q[4]),.ram_data_6(q[5]),.ram_data_7(q[6]),.ram_data_8(q[7]),.ram_data_9(q[8]),.ram_data_10(q[9]),
                         .ram_data_11(q[10]),.ram_data_12(q[11]),.ram_data_13(q[12]),.ram_data_14(q[13]),.ram_data_15(q[14]),.ram_data_16(q[15]),
                         .ram_data_17(q[16]),.ram_data_18(q[17]),.ram_data_19(q[18]),.ram_data_20(q[19]),.ram_data_21(q[20]),.ram_data_22(q[21]),
                         .ram_data_23(q[22]),.ram_data_24(q[23]),.ram_data_25(q[24]),.ram_data_26(q[25]),.ram_data_27(q[26]),.ram_data_28(q[27]),
                         .ram_data_29(q[28]),.ram_data_30(q[29]),.ram_data_31(q[30]),.ram_data_32(q[31]),.ram_data_33(q[32]),.ram_data_34(q[33]),
                         .ram_data_35(q[34]),.ram_data_36(q[35]),.ram_data_37(q[36]),.ram_data_38(q[37]),.ram_data_39(q[38]),.ram_data_40(q[39]),
                         .ram_data_41(q[40]),.ram_data_42(q[41]),.ram_data_43(q[42]),.ram_data_44(q[43]),.ram_data_45(q[44]),.ram_data_46(q[45]),
                         .ram_data_47(q[46]),.ram_data_48(q[47]),.ram_data_49(q[48]),.ram_data_50(q[49]),.ram_data_51(q[50]),.ram_data_52(q[51]),
                         .ram_data_53(q[52]),.ram_data_54(q[53]),.ram_data_55(q[54]),.ram_data_56(q[55]),.ram_data_57(q[56]),.ram_data_58(q[57]),
                         .ram_data_59(q[58]),.ram_data_60(q[59]),.ram_data_61(q[60]),.ram_data_62(q[61]),.ram_data_63(q[62]),.ram_data_64(q[63]),
                         
                         .data_in_1(data_in_1),.data_in_2(data_in_2),.data_in_3(data_in_3),.data_in_4(data_in_4),.data_in_5(data_in_5),.data_in_6(data_in_6),
                         .data_in_7(data_in_7),.data_in_8(data_in_8),.data_in_9(data_in_9),.data_in_10(data_in_10),.data_in_11(data_in_11),.data_in_12(data_in_12),
                         .data_in_13(data_in_13),.data_in_14(data_in_14),.data_in_15(data_in_15),.data_in_16(data_in_16),.data_in_17(data_in_17),.data_in_18(data_in_18),
                         .data_in_19(data_in_19),.data_in_20(data_in_20),.data_in_21(data_in_21),.data_in_22(data_in_22),.data_in_23(data_in_23),.data_in_24(data_in_24),
                         .data_in_25(data_in_25),.data_in_26(data_in_26),.data_in_27(data_in_27),.data_in_28(data_in_28),.data_in_29(data_in_29),.data_in_30(data_in_30),
                         .data_in_31(data_in_31),.data_in_32(data_in_32),.data_in_33(data_in_33),.data_in_34(data_in_34),.data_in_35(data_in_35),.data_in_36(data_in_36),
                         .data_in_37(data_in_37),.data_in_38(data_in_38),.data_in_39(data_in_39),.data_in_40(data_in_40),.data_in_41(data_in_41),.data_in_42(data_in_42),
                         .data_in_43(data_in_43),.data_in_44(data_in_44),.data_in_45(data_in_45),.data_in_46(data_in_46),.data_in_47(data_in_47),.data_in_48(data_in_48),
                         .data_in_49(data_in_49),.data_in_50(data_in_50),.data_in_51(data_in_51),.data_in_52(data_in_52),.data_in_53(data_in_53),.data_in_54(data_in_54),
                         .data_in_55(data_in_55),.data_in_56(data_in_56),.data_in_57(data_in_57),.data_in_58(data_in_58),.data_in_59(data_in_59),.data_in_60(data_in_60),
                         .data_in_61(data_in_61),.data_in_62(data_in_62),.data_in_63(data_in_63),.data_in_64(data_in_64),.data_out(data_out));
                         
 reset_next_Dense_2   a3 (.clk(clk),.reset(reset),.out(reset_next_stage));
endmodule 


//////////////////////////////////////////// brams for Dense Layer_2 ////////////////////////////////////////////
module brams_for_layer_2 (
    input clk,
    input reset,
    
output signed [7:0] data_out_1,
output signed [7:0] data_out_2,
output signed [7:0] data_out_3,
output signed [7:0] data_out_4,
output signed [7:0] data_out_5,
output signed [7:0] data_out_6,
output signed [7:0] data_out_7,
output signed [7:0] data_out_8,
output signed [7:0] data_out_9,
output signed [7:0] data_out_10,
output signed [7:0] data_out_11,
output signed [7:0] data_out_12,
output signed [7:0] data_out_13,
output signed [7:0] data_out_14,
output signed [7:0] data_out_15,
output signed [7:0] data_out_16,
output signed [7:0] data_out_17,
output signed [7:0] data_out_18,
output signed [7:0] data_out_19,
output signed [7:0] data_out_20,
output signed [7:0] data_out_21,
output signed [7:0] data_out_22,
output signed [7:0] data_out_23,
output signed [7:0] data_out_24,
output signed [7:0] data_out_25,
output signed [7:0] data_out_26,
output signed [7:0] data_out_27,
output signed [7:0] data_out_28,
output signed [7:0] data_out_29,
output signed [7:0] data_out_30,
output signed [7:0] data_out_31,
output signed [7:0] data_out_32,
output signed [7:0] data_out_33,
output signed [7:0] data_out_34,
output signed [7:0] data_out_35,
output signed [7:0] data_out_36,
output signed [7:0] data_out_37,
output signed [7:0] data_out_38,
output signed [7:0] data_out_39,
output signed [7:0] data_out_40,
output signed [7:0] data_out_41,
output signed [7:0] data_out_42,
output signed [7:0] data_out_43,
output signed [7:0] data_out_44,
output signed [7:0] data_out_45,
output signed [7:0] data_out_46,
output signed [7:0] data_out_47,
output signed [7:0] data_out_48,
output signed [7:0] data_out_49,
output signed [7:0] data_out_50,
output signed [7:0] data_out_51,
output signed [7:0] data_out_52,
output signed [7:0] data_out_53,
output signed [7:0] data_out_54,
output signed [7:0] data_out_55,
output signed [7:0] data_out_56,
output signed [7:0] data_out_57,
output signed [7:0] data_out_58,
output signed [7:0] data_out_59,
output signed [7:0] data_out_60,
output signed [7:0] data_out_61,
output signed [7:0] data_out_62,
output signed [7:0] data_out_63,
output signed [7:0] data_out_64,
output reg signed  [7:0] bias
    );
    reg [3:0]counter = 0;
    wire [7:0] temp;
    reg [7:0] q1;
    always@(posedge clk)begin
        if(reset)begin
            counter <= 0;   
        end
        else begin
            if (counter > 5)
                counter <= 1;
            else
                counter <= counter + 1;
        end
    end
    


rom_Dense_layer2_0 A0(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_1));
rom_Dense_layer2_1 A1(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_2));
rom_Dense_layer2_2 A2(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_3));
rom_Dense_layer2_3 A3(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_4));
rom_Dense_layer2_4 A4(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_5));
rom_Dense_layer2_5 A5(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_6));
rom_Dense_layer2_6 A6(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_7));
rom_Dense_layer2_7 A7(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_8));
rom_Dense_layer2_8 A8(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_9));
rom_Dense_layer2_9 A9(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_10));
rom_Dense_layer2_10 A10(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_11));
rom_Dense_layer2_11 A11(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_12));
rom_Dense_layer2_12 A12(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_13));
rom_Dense_layer2_13 A13(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_14));
rom_Dense_layer2_14 A14(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_15));
rom_Dense_layer2_15 A15(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_16));
rom_Dense_layer2_16 A16(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_17));
rom_Dense_layer2_17 A17(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_18));
rom_Dense_layer2_18 A18(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_19));
rom_Dense_layer2_19 A19(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_20));
rom_Dense_layer2_20 A20(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_21));
rom_Dense_layer2_21 A21(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_22));
rom_Dense_layer2_22 A22(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_23));
rom_Dense_layer2_23 A23(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_24));
rom_Dense_layer2_24 A24(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_25));
rom_Dense_layer2_25 A25(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_26));
rom_Dense_layer2_26 A26(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_27));
rom_Dense_layer2_27 A27(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_28));
rom_Dense_layer2_28 A28(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_29));
rom_Dense_layer2_29 A29(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_30));
rom_Dense_layer2_30 A30(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_31));
rom_Dense_layer2_31 A31(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_32));
rom_Dense_layer2_32 A32(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_33));
rom_Dense_layer2_33 A33(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_34));
rom_Dense_layer2_34 A34(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_35));
rom_Dense_layer2_35 A35(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_36));
rom_Dense_layer2_36 A36(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_37));
rom_Dense_layer2_37 A37(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_38));
rom_Dense_layer2_38 A38(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_39));
rom_Dense_layer2_39 A39(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_40));
rom_Dense_layer2_40 A40(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_41));
rom_Dense_layer2_41 A41(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_42));
rom_Dense_layer2_42 A42(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_43));
rom_Dense_layer2_43 A43(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_44));
rom_Dense_layer2_44 A44(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_45));
rom_Dense_layer2_45 A45(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_46));
rom_Dense_layer2_46 A46(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_47));
rom_Dense_layer2_47 A47(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_48));
rom_Dense_layer2_48 A48(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_49));
rom_Dense_layer2_49 A49(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_50));
rom_Dense_layer2_50 A50(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_51));
rom_Dense_layer2_51 A51(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_52));
rom_Dense_layer2_52 A52(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_53));
rom_Dense_layer2_53 A53(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_54));
rom_Dense_layer2_54 A54(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_55));
rom_Dense_layer2_55 A55(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_56));
rom_Dense_layer2_56 A56(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_57));
rom_Dense_layer2_57 A57(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_58));
rom_Dense_layer2_58 A58(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_59));
rom_Dense_layer2_59 A59(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_60));
rom_Dense_layer2_60 A60(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_61));
rom_Dense_layer2_61 A61(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_62));
rom_Dense_layer2_62 A62(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_63));
rom_Dense_layer2_63 A63(.clka(clk),.ena(!reset),.addra((counter - 1)),.douta(data_out_64));
rom_dense2_bias_0 B0 (.clka(clk),.ena(!reset),.addra(counter),.douta(temp));

always@(posedge clk)begin
    q1 <= temp;  
    bias <= q1;      
end
endmodule

//////////////////////////////////////  mac_units (add + mac) ////////////////
module Mac_units2 (
    input clk,
    input reset,
    
input signed [31:0] data_in_1,
input signed [31:0] data_in_2,
input signed [31:0] data_in_3,
input signed [31:0] data_in_4,
input signed [31:0] data_in_5,
input signed [31:0] data_in_6,
input signed [31:0] data_in_7,
input signed [31:0] data_in_8,
input signed [31:0] data_in_9,
input signed [31:0] data_in_10,
input signed [31:0] data_in_11,
input signed [31:0] data_in_12,
input signed [31:0] data_in_13,
input signed [31:0] data_in_14,
input signed [31:0] data_in_15,
input signed [31:0] data_in_16,
input signed [31:0] data_in_17,
input signed [31:0] data_in_18,
input signed [31:0] data_in_19,
input signed [31:0] data_in_20,
input signed [31:0] data_in_21,
input signed [31:0] data_in_22,
input signed [31:0] data_in_23,
input signed [31:0] data_in_24,
input signed [31:0] data_in_25,
input signed [31:0] data_in_26,
input signed [31:0] data_in_27,
input signed [31:0] data_in_28,
input signed [31:0] data_in_29,
input signed [31:0] data_in_30,
input signed [31:0] data_in_31,
input signed [31:0] data_in_32,
input signed [31:0] data_in_33,
input signed [31:0] data_in_34,
input signed [31:0] data_in_35,
input signed [31:0] data_in_36,
input signed [31:0] data_in_37,
input signed [31:0] data_in_38,
input signed [31:0] data_in_39,
input signed [31:0] data_in_40,
input signed [31:0] data_in_41,
input signed [31:0] data_in_42,
input signed [31:0] data_in_43,
input signed [31:0] data_in_44,
input signed [31:0] data_in_45,
input signed [31:0] data_in_46,
input signed [31:0] data_in_47,
input signed [31:0] data_in_48,
input signed [31:0] data_in_49,
input signed [31:0] data_in_50,
input signed [31:0] data_in_51,
input signed [31:0] data_in_52,
input signed [31:0] data_in_53,
input signed [31:0] data_in_54,
input signed [31:0] data_in_55,
input signed [31:0] data_in_56,
input signed [31:0] data_in_57,
input signed [31:0] data_in_58,
input signed [31:0] data_in_59,
input signed [31:0] data_in_60,
input signed [31:0] data_in_61,
input signed [31:0] data_in_62,
input signed [31:0] data_in_63,
input signed [31:0] data_in_64,

input signed [7:0] ram_data_1,
input signed [7:0] ram_data_2,
input signed [7:0] ram_data_3,
input signed [7:0] ram_data_4,
input signed [7:0] ram_data_5,
input signed [7:0] ram_data_6,
input signed [7:0] ram_data_7,
input signed [7:0] ram_data_8,
input signed [7:0] ram_data_9,
input signed [7:0] ram_data_10,
input signed [7:0] ram_data_11,
input signed [7:0] ram_data_12,
input signed [7:0] ram_data_13,
input signed [7:0] ram_data_14,
input signed [7:0] ram_data_15,
input signed [7:0] ram_data_16,
input signed [7:0] ram_data_17,
input signed [7:0] ram_data_18,
input signed [7:0] ram_data_19,
input signed [7:0] ram_data_20,
input signed [7:0] ram_data_21,
input signed [7:0] ram_data_22,
input signed [7:0] ram_data_23,
input signed [7:0] ram_data_24,
input signed [7:0] ram_data_25,
input signed [7:0] ram_data_26,
input signed [7:0] ram_data_27,
input signed [7:0] ram_data_28,
input signed [7:0] ram_data_29,
input signed [7:0] ram_data_30,
input signed [7:0] ram_data_31,
input signed [7:0] ram_data_32,
input signed [7:0] ram_data_33,
input signed [7:0] ram_data_34,
input signed [7:0] ram_data_35,
input signed [7:0] ram_data_36,
input signed [7:0] ram_data_37,
input signed [7:0] ram_data_38,
input signed [7:0] ram_data_39,
input signed [7:0] ram_data_40,
input signed [7:0] ram_data_41,
input signed [7:0] ram_data_42,
input signed [7:0] ram_data_43,
input signed [7:0] ram_data_44,
input signed [7:0] ram_data_45,
input signed [7:0] ram_data_46,
input signed [7:0] ram_data_47,
input signed [7:0] ram_data_48,
input signed [7:0] ram_data_49,
input signed [7:0] ram_data_50,
input signed [7:0] ram_data_51,
input signed [7:0] ram_data_52,
input signed [7:0] ram_data_53,
input signed [7:0] ram_data_54,
input signed [7:0] ram_data_55,
input signed [7:0] ram_data_56,
input signed [7:0] ram_data_57,
input signed [7:0] ram_data_58,
input signed [7:0] ram_data_59,
input signed [7:0] ram_data_60,
input signed [7:0] ram_data_61,
input signed [7:0] ram_data_62,
input signed [7:0] ram_data_63,
input signed [7:0] ram_data_64,
input signed [7:0] bias,
output reg signed [38:0] data_out
); 
wire signed [38:0] q [63:0];
wire signed [7:0] w [63:0];
(*keep = "true" *)wire signed [38:0] e [63:0];
wire signed [38:0] d_out;

always @(posedge clk)begin
    if (reset)
        data_out <= 0 ;
    else
        data_out <= d_out;
end

genvar i;
generate 
    for(i=0;i<64;i=i+1)begin        : mac_units
        MAC2 mod (.clk(clk),.data_in_1(q[i]),.data_in_2(w[i]),.data_out(e[i]));    
    end
    endgenerate
(*keep = "true" *)    add_for_64 add (.data_in_1(e[0]),.data_in_2(e[1]),.data_in_3(e[2]),.data_in_4(e[3]),
            .data_in_5(e[4]),.data_in_6(e[5]),.data_in_7(e[6]),.data_in_8(e[7]),
            .data_in_9(e[8]),.data_in_10(e[9]),.data_in_11(e[10]),.data_in_12(e[11]),
            .data_in_13(e[12]),.data_in_14(e[13]),.data_in_15(e[14]),.data_in_16(e[15]),
            .data_in_17(e[16]),.data_in_18(e[17]),.data_in_19(e[18]),.data_in_20(e[19]),
            .data_in_21(e[20]),.data_in_22(e[21]),.data_in_23(e[22]),.data_in_24(e[23]),
            .data_in_25(e[24]),.data_in_26(e[25]),.data_in_27(e[26]),.data_in_28(e[27]),
            .data_in_29(e[28]),.data_in_30(e[29]),.data_in_31(e[30]),.data_in_32(e[31]),
            .data_in_33(e[32]),.data_in_34(e[33]),.data_in_35(e[34]),.data_in_36(e[35]),
            .data_in_37(e[36]),.data_in_38(e[37]),.data_in_39(e[38]),.data_in_40(e[39]),
            .data_in_41(e[40]),.data_in_42(e[41]),.data_in_43(e[42]),.data_in_44(e[43]),
            .data_in_45(e[44]),.data_in_46(e[45]),.data_in_47(e[46]),.data_in_48(e[47]),
            .data_in_49(e[48]),.data_in_50(e[49]),.data_in_51(e[50]),.data_in_52(e[51]),
            .data_in_53(e[52]),.data_in_54(e[53]),.data_in_55(e[54]),.data_in_56(e[55]),
            .data_in_57(e[56]),.data_in_58(e[57]),.data_in_59(e[58]),.data_in_60(e[59]),
            .data_in_61(e[60]),.data_in_62(e[61]),.data_in_63(e[62]),.data_in_64(e[63]),.bias(bias),.data_out(d_out));
 
assign w[0] = ram_data_1 ; 
assign w[1] = ram_data_2 ; 
assign w[2] = ram_data_3 ; 
assign w[3] = ram_data_4 ; 
assign w[4] = ram_data_5 ; 
assign w[5] = ram_data_6 ; 
assign w[6] = ram_data_7 ; 
assign w[7] = ram_data_8 ; 
assign w[8] = ram_data_9 ; 
assign w[9] = ram_data_10 ; 
assign w[10] = ram_data_11 ; 
assign w[11] = ram_data_12 ; 
assign w[12] = ram_data_13 ; 
assign w[13] = ram_data_14 ; 
assign w[14] = ram_data_15 ; 
assign w[15] = ram_data_16 ; 
assign w[16] = ram_data_17 ; 
assign w[17] = ram_data_18 ; 
assign w[18] = ram_data_19 ; 
assign w[19] = ram_data_20 ; 
assign w[20] = ram_data_21 ; 
assign w[21] = ram_data_22 ; 
assign w[22] = ram_data_23 ; 
assign w[23] = ram_data_24 ; 
assign w[24] = ram_data_25 ; 
assign w[25] = ram_data_26 ; 
assign w[26] = ram_data_27 ; 
assign w[27] = ram_data_28 ; 
assign w[28] = ram_data_29 ; 
assign w[29] = ram_data_30 ; 
assign w[30] = ram_data_31 ; 
assign w[31] = ram_data_32 ; 
assign w[32] = ram_data_33 ; 
assign w[33] = ram_data_34 ; 
assign w[34] = ram_data_35 ; 
assign w[35] = ram_data_36 ; 
assign w[36] = ram_data_37 ; 
assign w[37] = ram_data_38 ; 
assign w[38] = ram_data_39 ; 
assign w[39] = ram_data_40 ; 
assign w[40] = ram_data_41 ; 
assign w[41] = ram_data_42 ; 
assign w[42] = ram_data_43 ; 
assign w[43] = ram_data_44 ; 
assign w[44] = ram_data_45 ; 
assign w[45] = ram_data_46 ; 
assign w[46] = ram_data_47 ; 
assign w[47] = ram_data_48 ; 
assign w[48] = ram_data_49 ; 
assign w[49] = ram_data_50 ; 
assign w[50] = ram_data_51 ; 
assign w[51] = ram_data_52 ; 
assign w[52] = ram_data_53 ; 
assign w[53] = ram_data_54 ; 
assign w[54] = ram_data_55 ; 
assign w[55] = ram_data_56 ; 
assign w[56] = ram_data_57 ; 
assign w[57] = ram_data_58 ; 
assign w[58] = ram_data_59 ; 
assign w[59] = ram_data_60 ; 
assign w[60] = ram_data_61 ; 
assign w[61] = ram_data_62 ; 
assign w[62] = ram_data_63 ; 
assign w[63] = ram_data_64 ; 


assign q[0] = data_in_1 ; 
assign q[1] = data_in_2 ; 
assign q[2] = data_in_3 ; 
assign q[3] = data_in_4 ; 
assign q[4] = data_in_5 ; 
assign q[5] = data_in_6 ; 
assign q[6] = data_in_7 ; 
assign q[7] = data_in_8 ; 
assign q[8] = data_in_9 ; 
assign q[9] = data_in_10 ; 
assign q[10] = data_in_11 ; 
assign q[11] = data_in_12 ; 
assign q[12] = data_in_13 ; 
assign q[13] = data_in_14 ; 
assign q[14] = data_in_15 ; 
assign q[15] = data_in_16 ; 
assign q[16] = data_in_17 ; 
assign q[17] = data_in_18 ; 
assign q[18] = data_in_19 ; 
assign q[19] = data_in_20 ; 
assign q[20] = data_in_21 ; 
assign q[21] = data_in_22 ; 
assign q[22] = data_in_23 ; 
assign q[23] = data_in_24 ; 
assign q[24] = data_in_25 ; 
assign q[25] = data_in_26 ; 
assign q[26] = data_in_27 ; 
assign q[27] = data_in_28 ; 
assign q[28] = data_in_29 ; 
assign q[29] = data_in_30 ; 
assign q[30] = data_in_31 ; 
assign q[31] = data_in_32 ; 
assign q[32] = data_in_33 ; 
assign q[33] = data_in_34 ; 
assign q[34] = data_in_35 ; 
assign q[35] = data_in_36 ; 
assign q[36] = data_in_37 ; 
assign q[37] = data_in_38 ; 
assign q[38] = data_in_39 ; 
assign q[39] = data_in_40 ; 
assign q[40] = data_in_41 ; 
assign q[41] = data_in_42 ; 
assign q[42] = data_in_43 ; 
assign q[43] = data_in_44 ; 
assign q[44] = data_in_45 ; 
assign q[45] = data_in_46 ; 
assign q[46] = data_in_47 ; 
assign q[47] = data_in_48 ; 
assign q[48] = data_in_49 ; 
assign q[49] = data_in_50 ; 
assign q[50] = data_in_51 ; 
assign q[51] = data_in_52 ; 
assign q[52] = data_in_53 ; 
assign q[53] = data_in_54 ; 
assign q[54] = data_in_55 ; 
assign q[55] = data_in_56 ; 
assign q[56] = data_in_57 ; 
assign q[57] = data_in_58 ; 
assign q[58] = data_in_59 ; 
assign q[59] = data_in_60 ; 
assign q[60] = data_in_61 ; 
assign q[61] = data_in_62 ; 
assign q[62] = data_in_63 ; 
assign q[63] = data_in_64 ; 

endmodule



////////////////////////////////  add Module ////////////////////////////////////////

(*dont_touch = "true" *)module add_for_64(
(*dont_touch = "true" *)input signed [38:0] data_in_1,
(*dont_touch = "true" *)input signed [38:0] data_in_2,
(*dont_touch = "true" *)input signed [38:0] data_in_3,
(*dont_touch = "true" *)input signed [38:0] data_in_4,
input signed [38:0] data_in_5,
input signed [38:0] data_in_6,
input signed [38:0] data_in_7,
input signed [38:0] data_in_8,
input signed [38:0] data_in_9,
input signed [38:0] data_in_10,
input signed [38:0] data_in_11,
input signed [38:0] data_in_12,
input signed [38:0] data_in_13,
input signed [38:0] data_in_14,
input signed [38:0] data_in_15,
input signed [38:0] data_in_16,
input signed [38:0] data_in_17,
input signed [38:0] data_in_18,
input signed [38:0] data_in_19,
input signed [38:0] data_in_20,
input signed [38:0] data_in_21,
input signed [38:0] data_in_22,
input signed [38:0] data_in_23,
input signed [38:0] data_in_24,
input signed [38:0] data_in_25,
input signed [38:0] data_in_26,
input signed [38:0] data_in_27,
input signed [38:0] data_in_28,
input signed [38:0] data_in_29,
input signed [38:0] data_in_30,
input signed [38:0] data_in_31,
input signed [38:0] data_in_32,
input signed [38:0] data_in_33,
input signed [38:0] data_in_34,
input signed [38:0] data_in_35,
input signed [38:0] data_in_36,
input signed [38:0] data_in_37,
input signed [38:0] data_in_38,
input signed [38:0] data_in_39,
input signed [38:0] data_in_40,
input signed [38:0] data_in_41,
input signed [38:0] data_in_42,
input signed [38:0] data_in_43,
input signed [38:0] data_in_44,
input signed [38:0] data_in_45,
input signed [38:0] data_in_46,
input signed [38:0] data_in_47,
input signed [38:0] data_in_48,
input signed [38:0] data_in_49,
input signed [38:0] data_in_50,
input signed [38:0] data_in_51,
input signed [38:0] data_in_52,
input signed [38:0] data_in_53,
input signed [38:0] data_in_54,
input signed [38:0] data_in_55,
input signed [38:0] data_in_56,
input signed [38:0] data_in_57,
input signed [38:0] data_in_58,
input signed [38:0] data_in_59,
input signed [38:0] data_in_60,
(*dont_touch = "true" *)input signed [38:0] data_in_61,
(*dont_touch = "true" *)input signed [38:0] data_in_62,
(*dont_touch = "true" *)input signed [38:0] data_in_63,
(*dont_touch = "true" *)input signed [38:0] data_in_64,
input signed [7:0] bias,
output signed [38:0] data_out
);

wire signed [38:0] q[31:0];
wire signed [38:0] w[15:0];
wire signed [38:0] e[7:0];
wire signed [38:0] r[3:0];
wire signed [38:0] t[1:0];

 
assign q[0] = data_in_1 + data_in_2;
assign q[1] = data_in_3 + data_in_4;
assign q[2] = data_in_5 + data_in_6;
assign q[3] = data_in_7 + data_in_8;
assign q[4] = data_in_9 + data_in_10;
assign q[5] = data_in_11 + data_in_12;
assign q[6] = data_in_13 + data_in_14;
assign q[7] = data_in_15 + data_in_16;
assign q[8] = data_in_17 + data_in_18;
assign q[9] = data_in_19 + data_in_20;
assign q[10] = data_in_21 + data_in_22;
assign q[11] = data_in_23 + data_in_24;
assign q[12] = data_in_25 + data_in_26;
assign q[13] = data_in_27 + data_in_28;
assign q[14] = data_in_29 + data_in_30;
assign q[15] = data_in_31 + data_in_32;
assign q[16] = data_in_33 + data_in_34;
assign q[17] = data_in_35 + data_in_36;
assign q[18] = data_in_37 + data_in_38;
assign q[19] = data_in_39 + data_in_40;
assign q[20] = data_in_41 + data_in_42;
assign q[21] = data_in_43 + data_in_44;
assign q[22] = data_in_45 + data_in_46;
assign q[23] = data_in_47 + data_in_48;
assign q[24] = data_in_49 + data_in_50;
assign q[25] = data_in_51 + data_in_52;
assign q[26] = data_in_53 + data_in_54;
assign q[27] = data_in_55 + data_in_56;
assign q[28] = data_in_57 + data_in_58;
assign q[29] = data_in_59 + data_in_60;
assign q[30] = data_in_61 + data_in_62;
assign q[31] = data_in_63 + data_in_64;
 

assign w[0] = q[0] + q[1];
assign w[1] = q[2] + q[3];
assign w[2] = q[4] + q[5];
assign w[3] = q[6] + q[7];
assign w[4] = q[8] + q[9];
assign w[5] = q[10] + q[11];
assign w[6] = q[12] + q[13];
assign w[7] = q[14] + q[15];
assign w[8] = q[16] + q[17];
assign w[9] = q[18] + q[19];
assign w[10] = q[20] + q[21];
assign w[11] = q[22] + q[23];
assign w[12] = q[24] + q[25];
assign w[13] = q[26] + q[27];
assign w[14] = q[28] + q[29];
assign w[15] = q[30] + q[31];

assign e[0] = w[0] + w[1];
assign e[1] = w[2] + w[3];
assign e[2] = w[4] + w[5];
assign e[3] = w[6] + w[7];
assign e[4] = w[8] + w[9];
assign e[5] = w[10] + w[11];
assign e[6] = w[12] + w[13];
assign e[7] = w[14] + w[15];
 
assign r[0] = e[0] + e[1];
assign r[1] = e[2] + e[3];
assign r[2] = e[4] + e[5];
assign r[3] = e[6] + e[7]; 
                
assign t[0] = r[0] + r[1];
assign t[1] = r[2] + r[3];

assign data_out = t[0] + t[1] + bias;              
endmodule


////////////////////////////// MAC2 ///////////////////////////////////////////
(*keep = "true" *)module MAC2(
input clk,
input  signed [38:0] data_in_1,
input  signed [7:0] data_in_2,
output reg signed [36:0] data_out
);

always @(posedge clk) begin
	data_out = data_in_1 * data_in_2;
end
endmodule


///////////////////////////////////////  reset_next_stage_Dense2 //////////////////////////////////

module reset_next_Dense_2 (
    input clk,
    input reset,
(*keep = "ture"*)    output reg out
    );
    reg [3:0] counter = 0;
    always@(posedge clk) begin
        if(reset)begin
            out <= 1;
        end
        else begin
            if (counter > 3)begin
                out <= 0 ;
                counter <= 4;
            end
            else counter <= counter + 1;
        end
    end
    endmodule
