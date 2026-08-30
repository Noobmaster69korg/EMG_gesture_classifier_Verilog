`timescale 1ns / 1ps



module weight_loader_for_bias (
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
    output reg signed [7:0] bias_32, 
    output reg signed [7:0] bias_33, 
    output reg signed [7:0] bias_34, 
    output reg signed [7:0] bias_35, 
    output reg signed [7:0] bias_36, 
    output reg signed [7:0] bias_37, 
    output reg signed [7:0] bias_38, 
    output reg signed [7:0] bias_39, 
    output reg signed [7:0] bias_40, 
    output reg signed [7:0] bias_41, 
    output reg signed [7:0] bias_42, 
    output reg signed [7:0] bias_43, 
    output reg signed [7:0] bias_44, 
    output reg signed [7:0] bias_45, 
    output reg signed [7:0] bias_46, 
    output reg signed [7:0] bias_47, 
    output reg signed [7:0] bias_48, 
    output reg signed [7:0] bias_49, 
    output reg signed [7:0] bias_50, 
    output reg signed [7:0] bias_51, 
    output reg signed [7:0] bias_52, 
    output reg signed [7:0] bias_53, 
    output reg signed [7:0] bias_54, 
    output reg signed [7:0] bias_55, 
    output reg signed [7:0] bias_56, 
    output reg signed [7:0] bias_57, 
    output reg signed [7:0] bias_58, 
    output reg signed [7:0] bias_59, 
    output reg signed [7:0] bias_60, 
    output reg signed [7:0] bias_61, 
    output reg signed [7:0] bias_62, 
    output reg signed [7:0] bias_63 

    );
    
    reg signed [511:0] bias_reg;
    reg [8:0] counter_2 = 0;
    reg [8:0] flag_2 = 0;
    wire [7:0] bias_out;
    reg ena_reg_2 = 0;
    bram_bias b1 (.clka(clk),.ena(ena_reg_2),.addra(counter_2),.douta(bias_out));
     always@(posedge clk)begin
        if(reset)begin
            ena_reg_2 = 0;
            counter_2 <= 0;
            bias_reg = 0;
            flag_2 <= 0 ;
        end
        else begin
            if(counter_2 < 66)begin
            flag_2 = flag_2 + 1;
            ena_reg_2 <= 1;
                if(flag_2 > 1)begin
                    counter_2 <= counter_2 + 1;
                    bias_reg <= {bias_reg[503:0],bias_out};
                end
            end
            else
                ena_reg_2 <= 0;
        end
    end
    always@(*)begin
        if(counter_2 == 66)begin
            bias_0 <= bias_reg[512 - (0*8) - 1 : 512 - (1*8)]; 
            bias_1 <= bias_reg[512 - (1*8) - 1 : 512 - (2*8)]; 
            bias_2 <= bias_reg[512 - (2*8) - 1 : 512 - (3*8)]; 
            bias_3 <= bias_reg[512 - (3*8) - 1 : 512 - (4*8)]; 
            bias_4 <= bias_reg[512 - (4*8) - 1 : 512 - (5*8)]; 
            bias_5 <= bias_reg[512 - (5*8) - 1 : 512 - (6*8)]; 
            bias_6 <= bias_reg[512 - (6*8) - 1 : 512 - (7*8)]; 
            bias_7 <= bias_reg[512 - (7*8) - 1 : 512 - (8*8)]; 
            bias_8 <= bias_reg[512 - (8*8) - 1 : 512 - (9*8)]; 
            bias_9 <= bias_reg[512 - (9*8) - 1 : 512 - (10*8)]; 
            bias_10 <= bias_reg[512 - (10*8) - 1 : 512 - (11*8)]; 
            bias_11 <= bias_reg[512 - (11*8) - 1 : 512 - (12*8)]; 
            bias_12 <= bias_reg[512 - (12*8) - 1 : 512 - (13*8)]; 
            bias_13 <= bias_reg[512 - (13*8) - 1 : 512 - (14*8)]; 
            bias_14 <= bias_reg[512 - (14*8) - 1 : 512 - (15*8)]; 
            bias_15 <= bias_reg[512 - (15*8) - 1 : 512 - (16*8)]; 
            bias_16 <= bias_reg[512 - (16*8) - 1 : 512 - (17*8)]; 
            bias_17 <= bias_reg[512 - (17*8) - 1 : 512 - (18*8)]; 
            bias_18 <= bias_reg[512 - (18*8) - 1 : 512 - (19*8)]; 
            bias_19 <= bias_reg[512 - (19*8) - 1 : 512 - (20*8)]; 
            bias_20 <= bias_reg[512 - (20*8) - 1 : 512 - (21*8)]; 
            bias_21 <= bias_reg[512 - (21*8) - 1 : 512 - (22*8)]; 
            bias_22 <= bias_reg[512 - (22*8) - 1 : 512 - (23*8)]; 
            bias_23 <= bias_reg[512 - (23*8) - 1 : 512 - (24*8)]; 
            bias_24 <= bias_reg[512 - (24*8) - 1 : 512 - (25*8)]; 
            bias_25 <= bias_reg[512 - (25*8) - 1 : 512 - (26*8)]; 
            bias_26 <= bias_reg[512 - (26*8) - 1 : 512 - (27*8)]; 
            bias_27 <= bias_reg[512 - (27*8) - 1 : 512 - (28*8)]; 
            bias_28 <= bias_reg[512 - (28*8) - 1 : 512 - (29*8)]; 
            bias_29 <= bias_reg[512 - (29*8) - 1 : 512 - (30*8)]; 
            bias_30 <= bias_reg[512 - (30*8) - 1 : 512 - (31*8)]; 
            bias_31 <= bias_reg[512 - (31*8) - 1 : 512 - (32*8)]; 
            bias_32 <= bias_reg[512 - (32*8) - 1 : 512 - (33*8)]; 
            bias_33 <= bias_reg[512 - (33*8) - 1 : 512 - (34*8)]; 
            bias_34 <= bias_reg[512 - (34*8) - 1 : 512 - (35*8)]; 
            bias_35 <= bias_reg[512 - (35*8) - 1 : 512 - (36*8)]; 
            bias_36 <= bias_reg[512 - (36*8) - 1 : 512 - (37*8)]; 
            bias_37 <= bias_reg[512 - (37*8) - 1 : 512 - (38*8)]; 
            bias_38 <= bias_reg[512 - (38*8) - 1 : 512 - (39*8)]; 
            bias_39 <= bias_reg[512 - (39*8) - 1 : 512 - (40*8)]; 
            bias_40 <= bias_reg[512 - (40*8) - 1 : 512 - (41*8)]; 
            bias_41 <= bias_reg[512 - (41*8) - 1 : 512 - (42*8)]; 
            bias_42 <= bias_reg[512 - (42*8) - 1 : 512 - (43*8)]; 
            bias_43 <= bias_reg[512 - (43*8) - 1 : 512 - (44*8)]; 
            bias_44 <= bias_reg[512 - (44*8) - 1 : 512 - (45*8)]; 
            bias_45 <= bias_reg[512 - (45*8) - 1 : 512 - (46*8)]; 
            bias_46 <= bias_reg[512 - (46*8) - 1 : 512 - (47*8)]; 
            bias_47 <= bias_reg[512 - (47*8) - 1 : 512 - (48*8)]; 
            bias_48 <= bias_reg[512 - (48*8) - 1 : 512 - (49*8)]; 
            bias_49 <= bias_reg[512 - (49*8) - 1 : 512 - (50*8)]; 
            bias_50 <= bias_reg[512 - (50*8) - 1 : 512 - (51*8)]; 
            bias_51 <= bias_reg[512 - (51*8) - 1 : 512 - (52*8)]; 
            bias_52 <= bias_reg[512 - (52*8) - 1 : 512 - (53*8)]; 
            bias_53 <= bias_reg[512 - (53*8) - 1 : 512 - (54*8)]; 
            bias_54 <= bias_reg[512 - (54*8) - 1 : 512 - (55*8)]; 
            bias_55 <= bias_reg[512 - (55*8) - 1 : 512 - (56*8)]; 
            bias_56 <= bias_reg[512 - (56*8) - 1 : 512 - (57*8)]; 
            bias_57 <= bias_reg[512 - (57*8) - 1 : 512 - (58*8)]; 
            bias_58 <= bias_reg[512 - (58*8) - 1 : 512 - (59*8)]; 
            bias_59 <= bias_reg[512 - (59*8) - 1 : 512 - (60*8)]; 
            bias_60 <= bias_reg[512 - (60*8) - 1 : 512 - (61*8)]; 
            bias_61 <= bias_reg[512 - (61*8) - 1 : 512 - (62*8)]; 
            bias_62 <= bias_reg[512 - (62*8) - 1 : 512 - (63*8)]; 
            bias_63 <= bias_reg[512 - (63*8) - 1 : 512 - (64*8)]; 
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
            bias_32 <= 0; 
            bias_33 <= 0; 
            bias_34 <= 0; 
            bias_35 <= 0; 
            bias_36 <= 0; 
            bias_37 <= 0; 
            bias_38 <= 0; 
            bias_39 <= 0; 
            bias_40 <= 0; 
            bias_41 <= 0; 
            bias_42 <= 0; 
            bias_43 <= 0; 
            bias_44 <= 0; 
            bias_45 <= 0; 
            bias_46 <= 0; 
            bias_47 <= 0; 
            bias_48 <= 0; 
            bias_49 <= 0; 
            bias_50 <= 0; 
            bias_51 <= 0; 
            bias_52 <= 0; 
            bias_53 <= 0; 
            bias_54 <= 0; 
            bias_55 <= 0; 
            bias_56 <= 0; 
            bias_57 <= 0; 
            bias_58 <= 0; 
            bias_59 <= 0; 
            bias_60 <= 0; 
            bias_61 <= 0; 
            bias_62 <= 0; 
            bias_63 <= 0; 
            
       end         
    end
    endmodule
