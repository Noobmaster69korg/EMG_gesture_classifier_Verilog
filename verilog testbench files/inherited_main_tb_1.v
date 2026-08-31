`timescale 1ns / 1ps

module top_tb;

    // Clock and reset
    reg clk;
  //  reg clk_2;
    reg reset;
    reg reset_data;
    reg signed [7:0] ch0,ch1,ch2,ch3,ch4,ch5;
    // Inputs
  /*  reg signed [17:0] data_in_0,data_in_1,data_in_2,data_in_3,data_in_4,data_in_5,data_in_6,data_in_7,data_in_8,data_in_9,data_in_10,
                      data_in_11,data_in_12,data_in_13,data_in_14,data_in_15,data_in_16,data_in_17,data_in_18,data_in_19,data_in_20,data_in_21,
                      data_in_22,data_in_23,data_in_24,data_in_25,data_in_26,data_in_27,data_in_28,data_in_29,data_in_30,data_in_31;   */
                      
    wire signed [31:0] max_out;
    wire [2:0] max_index; 
  /*  wire signed [31:0] data_out_0,data_out_1,data_out_2,data_out_3,data_out_4,data_out_5,data_out_6,data_out_7,data_out_8,data_out_9,data_out_10,data_out_11,
                       data_out_12,data_out_13,data_out_14,data_out_15,data_out_16,data_out_17,data_out_18,data_out_19,data_out_20,data_out_21,data_out_22,
                       data_out_23,data_out_24,data_out_25,data_out_26,data_out_27,data_out_28,data_out_29,data_out_30,data_out_31,data_out_32,data_out_33,data_out_34,
                       data_out_35,data_out_36,data_out_37,data_out_38,data_out_39,data_out_40,data_out_41,data_out_42,data_out_43,data_out_44,data_out_45,data_out_46,
                       data_out_47,data_out_48,data_out_49,data_out_50,data_out_51,data_out_52,data_out_53,data_out_54,data_out_55,data_out_56,data_out_57,data_out_58,
                       data_out_59,data_out_60,data_out_61,data_out_62,data_out_63; */
    
 //   wire reset_next_stage;
    
    top_mp5 dut(
        .clk(clk),
    //    .clk_2(clk_2),
        .reset(reset),
        .reset_data(reset_data),
        .ch0(ch0), .ch1(ch1), .ch2(ch2), .ch3(ch3), .ch4(ch4), .ch5(ch5),
     /*   .data_in_0(data_in_0),
        .data_in_1(data_in_1),
        .data_in_2(data_in_2),
        .data_in_3(data_in_3),
        .data_in_4(data_in_4),
        .data_in_5(data_in_5),
        .data_in_6(data_in_6),
        .data_in_7(data_in_7),
        .data_in_8(data_in_8),
        .data_in_9(data_in_9),
        .data_in_10(data_in_10),
        .data_in_11(data_in_11),
        .data_in_12(data_in_12),
        .data_in_13(data_in_13),
        .data_in_14(data_in_14),
        .data_in_15(data_in_15),
        .data_in_16(data_in_16),
        .data_in_17(data_in_17),
        .data_in_18(data_in_18),
        .data_in_19(data_in_19),
        .data_in_20(data_in_20),
        .data_in_21(data_in_21),
        .data_in_22(data_in_22),
        .data_in_23(data_in_23),
        .data_in_24(data_in_24),
        .data_in_25(data_in_25),
        .data_in_26(data_in_26),
        .data_in_27(data_in_27),
        .data_in_28(data_in_28),
        .data_in_29(data_in_29),
        .data_in_30(data_in_30),
        .data_in_31(data_in_31),*/
   /*     .data_out_0(data_out_0), 
        .data_out_1(data_out_1), 
        .data_out_2(data_out_2), 
        .data_out_3(data_out_3), 
        .data_out_4(data_out_4), 
        .data_out_5(data_out_5), 
        .data_out_6(data_out_6), 
        .data_out_7(data_out_7), 
        .data_out_8(data_out_8), 
        .data_out_9(data_out_9), 
        .data_out_10(data_out_10), 
        .data_out_11(data_out_11), 
        .data_out_12(data_out_12), 
        .data_out_13(data_out_13), 
        .data_out_14(data_out_14), 
        .data_out_15(data_out_15), 
        .data_out_16(data_out_16), 
        .data_out_17(data_out_17), 
        .data_out_18(data_out_18), 
        .data_out_19(data_out_19), 
        .data_out_20(data_out_20), 
        .data_out_21(data_out_21), 
        .data_out_22(data_out_22), 
        .data_out_23(data_out_23), 
        .data_out_24(data_out_24), 
        .data_out_25(data_out_25), 
        .data_out_26(data_out_26), 
        .data_out_27(data_out_27), 
        .data_out_28(data_out_28), 
        .data_out_29(data_out_29), 
        .data_out_30(data_out_30), 
        .data_out_31(data_out_31), 
        .data_out_32(data_out_32), 
        .data_out_33(data_out_33), 
        .data_out_34(data_out_34), 
        .data_out_35(data_out_35), 
        .data_out_36(data_out_36), 
        .data_out_37(data_out_37), 
        .data_out_38(data_out_38), 
        .data_out_39(data_out_39), 
        .data_out_40(data_out_40), 
        .data_out_41(data_out_41), 
        .data_out_42(data_out_42), 
        .data_out_43(data_out_43), 
        .data_out_44(data_out_44), 
        .data_out_45(data_out_45), 
        .data_out_46(data_out_46), 
        .data_out_47(data_out_47), 
        .data_out_48(data_out_48), 
        .data_out_49(data_out_49), 
        .data_out_50(data_out_50), 
        .data_out_51(data_out_51), 
        .data_out_52(data_out_52), 
        .data_out_53(data_out_53), 
        .data_out_54(data_out_54), 
        .data_out_55(data_out_55), 
        .data_out_56(data_out_56), 
        .data_out_57(data_out_57), 
        .data_out_58(data_out_58), 
        .data_out_59(data_out_59), 
        .data_out_60(data_out_60), 
        .data_out_61(data_out_61), 
        .data_out_62(data_out_62), 
        .data_out_63(data_out_63) */

       .max_out(max_out),
       .max_index(max_index)
        );
        
        
  /*      
      integer i,j;
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
   end
   
   initial begin
    clk_2 = 0;
    forever #10 clk_2 = ~clk_2;
   end
   
   
   initial begin 
    reset_data = 1;
    #760;
    reset_data = 0;
   end
    initial begin
        $display("Starting simulation...");
        
        reset = 1; 
        #100;
        reset = 0;
    #660;
    for(j = 0 ;j < 52 ; j = j+1) begin
        for (i = 0; i < 509; i = i + 1)begin
              data_in_0 = 1; 
            data_in_1 = 1; 
            data_in_2 = 1; 
            data_in_3 = 1; 
            data_in_4 = 1; 
            data_in_5 = 1; 
            data_in_6 = 1; 
            data_in_7 = 1; 
            data_in_8 = 1; 
            data_in_9 = 1; 
            data_in_10 = 1; 
            data_in_11 = 1; 
            data_in_12 = 1; 
            data_in_13 = 1; 
            data_in_14 = 1; 
            data_in_15 = 1; 
            data_in_16 = 1; 
            data_in_17 = 1; 
            data_in_18 = 1; 
            data_in_19 = 1; 
            data_in_20 = 1; 
            data_in_21 = 1; 
            data_in_22 = 1; 
            data_in_23 = 1; 
            data_in_24 = 1; 
            data_in_25 = 1; 
            data_in_26 = 1; 
            data_in_27 = 1; 
            data_in_28 = 1; 
            data_in_29 = 1; 
            data_in_30 = 1; 
            data_in_31 = 1; #20;
        end
       end
        $finish;
    end

endmodule
*/

integer i,j ;             
   initial begin
    clk = 0;
    forever #5 clk = ~clk;
   end
   initial begin
    reset_data = 1;
    #120;
    #3850;
    reset_data = 0;
   end
   initial begin
    #120;
    #3850;
    
    for( j = 0 ; j < 1019 ; j = j+1)begin
    for(i = 1 ; i< 2 ; i = i+1)begin
        ch0 <= i;
        ch1 <= i;
        ch2 <= i;
        ch3 <= i;
        ch4 <= i;
        ch5 <= i;
        #10;
    end end
   end
   initial begin
    reset = 1; 
    #90;
    reset = 0;
    #4000;
   end
endmodule


