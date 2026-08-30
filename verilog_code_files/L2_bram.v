`timescale 1ns / 1ps

`timescale 1ns / 1ps

module bram(
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
        output signed [7:0] data_out_64
    );
    reg [6:0]counter = 0;
    always@(posedge clk)begin
        if(reset)begin
            counter <= 0;   
        end
        else begin
            if(counter > 63)
                counter <= 64;
            else counter <= counter + 1;    
        end
    end
    
blk_mem_gen_0 A0(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_1));
blk_mem_gen_1 A1(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_2));
blk_mem_gen_2 A2(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_3));
blk_mem_gen_3 A3(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_4));
blk_mem_gen_4 A4(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_5));
blk_mem_gen_5 A5(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_6));
blk_mem_gen_6 A6(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_7));
blk_mem_gen_7 A7(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_8));
blk_mem_gen_8 A8(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_9));
blk_mem_gen_9 A9(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_10));
blk_mem_gen_10 A10(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_11));
blk_mem_gen_11 A11(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_12));
blk_mem_gen_12 A12(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_13));
blk_mem_gen_13 A13(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_14));
blk_mem_gen_14 A14(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_15));
blk_mem_gen_15 A15(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_16));
blk_mem_gen_16 A16(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_17));
blk_mem_gen_17 A17(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_18));
blk_mem_gen_18 A18(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_19));
blk_mem_gen_19 A19(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_20));
blk_mem_gen_20 A20(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_21));
blk_mem_gen_21 A21(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_22));
blk_mem_gen_22 A22(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_23));
blk_mem_gen_23 A23(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_24));
blk_mem_gen_24 A24(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_25));
blk_mem_gen_25 A25(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_26));
blk_mem_gen_26 A26(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_27));
blk_mem_gen_27 A27(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_28));
blk_mem_gen_28 A28(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_29));
blk_mem_gen_29 A29(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_30));
blk_mem_gen_30 A30(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_31));
blk_mem_gen_31 A31(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_32));
blk_mem_gen_32 A32(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_33));
blk_mem_gen_33 A33(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_34));
blk_mem_gen_34 A34(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_35));
blk_mem_gen_35 A35(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_36));
blk_mem_gen_36 A36(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_37));
blk_mem_gen_37 A37(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_38));
blk_mem_gen_38 A38(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_39));
blk_mem_gen_39 A39(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_40));
blk_mem_gen_40 A40(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_41));
blk_mem_gen_41 A41(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_42));
blk_mem_gen_42 A42(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_43));
blk_mem_gen_43 A43(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_44));
blk_mem_gen_44 A44(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_45));
blk_mem_gen_45 A45(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_46));
blk_mem_gen_46 A46(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_47));
blk_mem_gen_47 A47(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_48));
blk_mem_gen_48 A48(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_49));
blk_mem_gen_49 A49(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_50));
blk_mem_gen_50 A50(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_51));
blk_mem_gen_51 A51(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_52));
blk_mem_gen_52 A52(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_53));
blk_mem_gen_53 A53(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_54));
blk_mem_gen_54 A54(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_55));
blk_mem_gen_55 A55(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_56));
blk_mem_gen_56 A56(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_57));
blk_mem_gen_57 A57(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_58));
blk_mem_gen_58 A58(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_59));
blk_mem_gen_59 A59(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_60));
blk_mem_gen_60 A60(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_61));
blk_mem_gen_61 A61(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_62));
blk_mem_gen_62 A62(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_63));
blk_mem_gen_63 A63(.clka(clk),.ena(!reset),.addra(counter),.douta(data_out_64));



endmodule 
