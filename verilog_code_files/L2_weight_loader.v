`timescale 1ns/1ps

module weight_loader #(parameter N = 32)(
    input clk,
    input reset,
    input signed [7:0] data_in,
    output reg signed [7:0] w0, 
    output reg signed [7:0] w1, 
    output reg signed [7:0] w2, 
    output reg signed [7:0] w3, 
    output reg signed [7:0] w4, 
    output reg signed [7:0] w5, 
    output reg signed [7:0] w6, 
    output reg signed [7:0] w7, 
    output reg signed [7:0] w8, 
    output reg signed [7:0] w9, 
    output reg signed [7:0] w10, 
    output reg signed [7:0] w11, 
    output reg signed [7:0] w12, 
    output reg signed [7:0] w13, 
    output reg signed [7:0] w14, 
    output reg signed [7:0] w15, 
    output reg signed [7:0] w16, 
    output reg signed [7:0] w17, 
    output reg signed [7:0] w18, 
    output reg signed [7:0] w19, 
    output reg signed [7:0] w20, 
    output reg signed [7:0] w21, 
    output reg signed [7:0] w22, 
    output reg signed [7:0] w23, 
    output reg signed [7:0] w24, 
    output reg signed [7:0] w25, 
    output reg signed [7:0] w26, 
    output reg signed [7:0] w27, 
    output reg signed [7:0] w28, 
    output reg signed [7:0] w29, 
    output reg signed [7:0] w30, 
    output reg signed [7:0] w31, 
    output reg signed [7:0] w32, 
    output reg signed [7:0] w33, 
    output reg signed [7:0] w34, 
    output reg signed [7:0] w35, 
    output reg signed [7:0] w36, 
    output reg signed [7:0] w37, 
    output reg signed [7:0] w38, 
    output reg signed [7:0] w39, 
    output reg signed [7:0] w40, 
    output reg signed [7:0] w41, 
    output reg signed [7:0] w42, 
    output reg signed [7:0] w43, 
    output reg signed [7:0] w44, 
    output reg signed [7:0] w45, 
    output reg signed [7:0] w46, 
    output reg signed [7:0] w47, 
    output reg signed [7:0] w48, 
    output reg signed [7:0] w49, 
    output reg signed [7:0] w50, 
    output reg signed [7:0] w51, 
    output reg signed [7:0] w52, 
    output reg signed [7:0] w53, 
    output reg signed [7:0] w54, 
    output reg signed [7:0] w55, 
    output reg signed [7:0] w56, 
    output reg signed [7:0] w57, 
    output reg signed [7:0] w58, 
    output reg signed [7:0] w59, 
    output reg signed [7:0] w60, 
    output reg signed [7:0] w61, 
    output reg signed [7:0] w62, 
    output reg signed [7:0] w63 
    
    );
    localparam width = N * 16;
    reg signed [width - 1:0] shift_reg;
    reg [8:0] counter = 0 ; 
    reg [8:0] flag = 0;
   
    reg ena_reg = 0;
    
 //   bram_layer2 b0 (.clka(clk),.ena(ena_reg),.addra(counter),.douta(data_out));         // for weights
    
    
    always@(posedge clk)begin
        if(reset)begin
            counter <= 0;
            flag <= 0;
            shift_reg <= 0;
            ena_reg <= 0;
         end
        else begin
            if(counter < 65) begin
                flag = flag + 1; ena_reg = 1;
                if(flag > 1) begin
                    shift_reg <= {shift_reg[width -8:0],data_in};
                    //bias_reg <= {bias_reg[247:0],bias_out};
                    counter <= counter + 1;
                 end 
             end
             else begin 
                ena_reg = 0;
             end
         end    
     end
    always @(*)begin
        if(counter == 65)begin
            w0 <= shift_reg[width-(0*8)-1:width - (1*8)]; 
            w1 <= shift_reg[width-(1*8)-1:width - (2*8)]; 
            w2 <= shift_reg[width-(2*8)-1:width - (3*8)]; 
            w3 <= shift_reg[width-(3*8)-1:width - (4*8)]; 
            w4 <= shift_reg[width-(4*8)-1:width - (5*8)]; 
            w5 <= shift_reg[width-(5*8)-1:width - (6*8)]; 
            w6 <= shift_reg[width-(6*8)-1:width - (7*8)]; 
            w7 <= shift_reg[width-(7*8)-1:width - (8*8)]; 
            w8 <= shift_reg[width-(8*8)-1:width - (9*8)]; 
            w9 <= shift_reg[width-(9*8)-1:width - (10*8)]; 
            w10 <= shift_reg[width-(10*8)-1:width - (11*8)]; 
            w11 <= shift_reg[width-(11*8)-1:width - (12*8)]; 
            w12 <= shift_reg[width-(12*8)-1:width - (13*8)]; 
            w13 <= shift_reg[width-(13*8)-1:width - (14*8)]; 
            w14 <= shift_reg[width-(14*8)-1:width - (15*8)]; 
            w15 <= shift_reg[width-(15*8)-1:width - (16*8)]; 
            w16 <= shift_reg[width-(16*8)-1:width - (17*8)]; 
            w17 <= shift_reg[width-(17*8)-1:width - (18*8)]; 
            w18 <= shift_reg[width-(18*8)-1:width - (19*8)]; 
            w19 <= shift_reg[width-(19*8)-1:width - (20*8)]; 
            w20 <= shift_reg[width-(20*8)-1:width - (21*8)]; 
            w21 <= shift_reg[width-(21*8)-1:width - (22*8)]; 
            w22 <= shift_reg[width-(22*8)-1:width - (23*8)]; 
            w23 <= shift_reg[width-(23*8)-1:width - (24*8)]; 
            w24 <= shift_reg[width-(24*8)-1:width - (25*8)]; 
            w25 <= shift_reg[width-(25*8)-1:width - (26*8)]; 
            w26 <= shift_reg[width-(26*8)-1:width - (27*8)]; 
            w27 <= shift_reg[width-(27*8)-1:width - (28*8)]; 
            w28 <= shift_reg[width-(28*8)-1:width - (29*8)]; 
            w29 <= shift_reg[width-(29*8)-1:width - (30*8)]; 
            w30 <= shift_reg[width-(30*8)-1:width - (31*8)]; 
            w31 <= shift_reg[width-(31*8)-1:width - (32*8)]; 
            w32 <= shift_reg[width-(32*8)-1:width - (33*8)]; 
            w33 <= shift_reg[width-(33*8)-1:width - (34*8)]; 
            w34 <= shift_reg[width-(34*8)-1:width - (35*8)]; 
            w35 <= shift_reg[width-(35*8)-1:width - (36*8)]; 
            w36 <= shift_reg[width-(36*8)-1:width - (37*8)]; 
            w37 <= shift_reg[width-(37*8)-1:width - (38*8)]; 
            w38 <= shift_reg[width-(38*8)-1:width - (39*8)]; 
            w39 <= shift_reg[width-(39*8)-1:width - (40*8)]; 
            w40 <= shift_reg[width-(40*8)-1:width - (41*8)]; 
            w41 <= shift_reg[width-(41*8)-1:width - (42*8)]; 
            w42 <= shift_reg[width-(42*8)-1:width - (43*8)]; 
            w43 <= shift_reg[width-(43*8)-1:width - (44*8)]; 
            w44 <= shift_reg[width-(44*8)-1:width - (45*8)]; 
            w45 <= shift_reg[width-(45*8)-1:width - (46*8)]; 
            w46 <= shift_reg[width-(46*8)-1:width - (47*8)]; 
            w47 <= shift_reg[width-(47*8)-1:width - (48*8)]; 
            w48 <= shift_reg[width-(48*8)-1:width - (49*8)]; 
            w49 <= shift_reg[width-(49*8)-1:width - (50*8)]; 
            w50 <= shift_reg[width-(50*8)-1:width - (51*8)]; 
            w51 <= shift_reg[width-(51*8)-1:width - (52*8)]; 
            w52 <= shift_reg[width-(52*8)-1:width - (53*8)]; 
            w53 <= shift_reg[width-(53*8)-1:width - (54*8)]; 
            w54 <= shift_reg[width-(54*8)-1:width - (55*8)]; 
            w55 <= shift_reg[width-(55*8)-1:width - (56*8)]; 
            w56 <= shift_reg[width-(56*8)-1:width - (57*8)]; 
            w57 <= shift_reg[width-(57*8)-1:width - (58*8)]; 
            w58 <= shift_reg[width-(58*8)-1:width - (59*8)]; 
            w59 <= shift_reg[width-(59*8)-1:width - (60*8)]; 
            w60 <= shift_reg[width-(60*8)-1:width - (61*8)]; 
            w61 <= shift_reg[width-(61*8)-1:width - (62*8)]; 
            w62 <= shift_reg[width-(62*8)-1:width - (63*8)]; 
            w63 <= shift_reg[width-(63*8)-1:width - (64*8)];   
        end
        else begin   
        w0 <= 0; 
        w1 <= 0; 
        w2 <= 0; 
        w3 <= 0; 
        w4 <= 0; 
        w5 <= 0; 
        w6 <= 0; 
        w7 <= 0; 
        w8 <= 0; 
        w9 <= 0; 
        w10 <= 0; 
        w11 <= 0; 
        w12 <= 0; 
        w13 <= 0; 
        w14 <= 0; 
        w15 <= 0; 
        w16 <= 0; 
        w17 <= 0; 
        w18 <= 0; 
        w19 <= 0; 
        w20 <= 0; 
        w21 <= 0; 
        w22 <= 0; 
        w23 <= 0; 
        w24 <= 0; 
        w25 <= 0; 
        w26 <= 0; 
        w27 <= 0; 
        w28 <= 0; 
        w29 <= 0; 
        w30 <= 0; 
        w31 <= 0; 
        w32 <= 0; 
        w33 <= 0; 
        w34 <= 0; 
        w35 <= 0; 
        w36 <= 0; 
        w37 <= 0; 
        w38 <= 0; 
        w39 <= 0; 
        w40 <= 0; 
        w41 <= 0; 
        w42 <= 0; 
        w43 <= 0; 
        w44 <= 0; 
        w45 <= 0; 
        w46 <= 0; 
        w47 <= 0; 
        w48 <= 0; 
        w49 <= 0; 
        w50 <= 0; 
        w51 <= 0; 
        w52 <= 0; 
        w53 <= 0; 
        w54 <= 0; 
        w55 <= 0; 
        w56 <= 0; 
        w57 <= 0; 
        w58 <= 0; 
        w59 <= 0; 
        w60 <= 0; 
        w61 <= 0; 
        w62 <= 0; 
        w63 <= 0; 
        end
        end
endmodule
