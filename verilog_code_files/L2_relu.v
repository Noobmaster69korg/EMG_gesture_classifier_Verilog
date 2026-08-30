`timescale 1ns / 1ps



module L2_relu(
    input reset,
    input signed [26:0] data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7, data_in_8,
    input signed [26:0] data_in_9, data_in_10, data_in_11, data_in_12, data_in_13, data_in_14, data_in_15, data_in_16,
   (*dont_touch = "true"*) output reg signed [26:0] data_out_1, data_out_2, data_out_3, data_out_4, data_out_5, data_out_6, data_out_7, data_out_8,
   (*dont_touch = "true"*) output reg signed [26:0] data_out_9, data_out_10, data_out_11, data_out_12, data_out_13, data_out_14, data_out_15, data_out_16
   
);

    always @(*) begin
        if (reset) begin
            data_out_1 <= 0; data_out_2 <= 0; data_out_3 <= 0; data_out_4 <= 0;
            data_out_5 <= 0; data_out_6 <= 0; data_out_7 <= 0; data_out_8 <= 0;
            data_out_9 <= 0; data_out_10 <= 0; data_out_11 <= 0; data_out_12 <= 0;
            data_out_13 <= 0; data_out_14 <= 0; data_out_15 <= 0; data_out_16 <= 0;
            
        end else begin
            data_out_1 <= (data_in_1[26] == 0) ? data_in_1 : 0;
            data_out_2 <= (data_in_2[26] == 0) ? data_in_2 : 0;
            data_out_3 <= (data_in_3[26] == 0) ? data_in_3 : 0;
            data_out_4 <= (data_in_4[26] == 0) ? data_in_4 : 0;
            data_out_5 <= (data_in_5[26] == 0) ? data_in_5 : 0;
            data_out_6 <= (data_in_6[26] == 0) ? data_in_6 : 0;
            data_out_7 <= (data_in_7[26] == 0) ? data_in_7 : 0;
            data_out_8 <= (data_in_8[26] == 0) ? data_in_8 : 0;
            data_out_9 <= (data_in_9[26] == 0) ? data_in_9 : 0;
            data_out_10 <= (data_in_10[26] == 0) ? data_in_10 : 0;
            data_out_11 <= (data_in_11[26] == 0) ? data_in_11 : 0;
            data_out_12 <= (data_in_12[26] == 0) ? data_in_12 : 0;
            data_out_13 <= (data_in_13[26] == 0) ? data_in_13 : 0;
            data_out_14 <= (data_in_14[26] == 0) ? data_in_14 : 0;
            data_out_15 <= (data_in_15[26] == 0) ? data_in_15 : 0;
            data_out_16 <= (data_in_16[26] == 0) ? data_in_16 : 0;
            
        end
    end

endmodule
