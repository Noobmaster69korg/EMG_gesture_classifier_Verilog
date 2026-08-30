module interface_Dense1_and_Dense2 #(parameter N = 32)(

	input clk,
	input reset,   
	input signed  [31:0] data_in,
(*dont_touch = "true" *)	output reg reset_next_stage,       
(*dont_touch = "true" *)	output reg signed [31:0] data_out_1,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_2,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_3,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_4,
	output reg signed [31:0] data_out_5,
	output reg signed [31:0] data_out_6,
	output reg signed [31:0] data_out_7,
	output reg signed [31:0] data_out_8,
	output reg signed [31:0] data_out_9,
	output reg signed [31:0] data_out_10,
	output reg signed [31:0] data_out_11,
	output reg signed [31:0] data_out_12,
	output reg signed [31:0] data_out_13,
	output reg signed [31:0] data_out_14,
	output reg signed [31:0] data_out_15,
	output reg signed [31:0] data_out_16,
	output reg signed [31:0] data_out_17,
	output reg signed [31:0] data_out_18,
	output reg signed [31:0] data_out_19,
	output reg signed [31:0] data_out_20,
	output reg signed [31:0] data_out_21,
	output reg signed [31:0] data_out_22,
	output reg signed [31:0] data_out_23,
	output reg signed [31:0] data_out_24,
	output reg signed [31:0] data_out_25,
	output reg signed [31:0] data_out_26,
	output reg signed [31:0] data_out_27,
	output reg signed [31:0] data_out_28,
	output reg signed [31:0] data_out_29,
	output reg signed [31:0] data_out_30,
	output reg signed [31:0] data_out_31,
	output reg signed [31:0] data_out_32,
	output reg signed [31:0] data_out_33,
	output reg signed [31:0] data_out_34,
	output reg signed [31:0] data_out_35,
	output reg signed [31:0] data_out_36,
	output reg signed [31:0] data_out_37,
	output reg signed [31:0] data_out_38,
	output reg signed [31:0] data_out_39,
	output reg signed [31:0] data_out_40,
	output reg signed [31:0] data_out_41,
	output reg signed [31:0] data_out_42,
	output reg signed [31:0] data_out_43,
	output reg signed [31:0] data_out_44,
	output reg signed [31:0] data_out_45,
	output reg signed [31:0] data_out_46,
	output reg signed [31:0] data_out_47,
	output reg signed [31:0] data_out_48,
	output reg signed [31:0] data_out_49,
	output reg signed [31:0] data_out_50,
	output reg signed [31:0] data_out_51,
	output reg signed [31:0] data_out_52,
	output reg signed [31:0] data_out_53,
	output reg signed [31:0] data_out_54,
	output reg signed [31:0] data_out_55,
	output reg signed [31:0] data_out_56,
	output reg signed [31:0] data_out_57,
	output reg signed [31:0] data_out_58,
	output reg signed [31:0] data_out_59,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_60,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_61,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_62,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_63,
(*dont_touch = "true" *)	output reg signed [31:0] data_out_64
);


    localparam width = N * 64;             // 64 numbers of 32 bit //
    reg signed [width - 1:0] shift_reg;
(*keep = "ture"*)    reg [6:0]counter = 0 ;
   
    
(*dont_touch = "true" *)    always@(posedge clk)begin
		if(reset) begin
		    counter <= 0;
		 //   flag    <= 0;
		    shift_reg <= 0;
        end
        else begin
            if(counter < 65) begin
					shift_reg <= {shift_reg[width - 33:0],data_in};
					counter <= counter + 1;
		    end
        end    
	end  
	
/*	localparam width = N * 64;             // 64 numbers of 32 bit //
    reg signed [width - 1:0] shift_reg;
    reg [6:0]counter = 0 ;
    reg [1:0] delay_counter = 0;          // Counter for initial delay
    reg start_counting = 0;
 (*dont_touch = "true" *)  always @(posedge clk) begin
        if (reset) begin
            counter <= 0;
            delay_counter <= 0;
            start_counting <= 0;
            shift_reg <= 0;
        end else begin
            if (delay_counter <0) begin
                delay_counter <= delay_counter + 1; // Count initial delay
            end else begin
                start_counting <= 1; // Enable counting after delay
            end
            if (start_counting && counter < 65) begin
                shift_reg <= {shift_reg[width - 33:0], data_in};
                counter <= counter + 1;
            end
        end
    end  */
	
(*dont_touch = "true" *)	always@(*)begin
	   if(counter > 64)
(*keep = "true" *)	       reset_next_stage <= 0;
	   else
(*keep = "true" *)	       reset_next_stage <= 1;   
	end
    
(*dont_touch = "true" *)    always @(*)begin
        if(counter > 64)begin
            data_out_1 <= shift_reg[width - (0*32) - 1 : width - (1*32)];
			data_out_2 <= shift_reg[width - (1*32) - 1 : width - (2*32)];
			data_out_3 <= shift_reg[width - (2*32) - 1 : width - (3*32)];
			data_out_4 <= shift_reg[width - (3*32) - 1 : width - (4*32)];
			data_out_5 <= shift_reg[width - (4*32) - 1 : width - (5*32)];
			data_out_6 <= shift_reg[width - (5*32) - 1 : width - (6*32)];
			data_out_7 <= shift_reg[width - (6*32) - 1 : width - (7*32)];
			data_out_8 <= shift_reg[width - (7*32) - 1 : width - (8*32)];
			data_out_9 <= shift_reg[width - (8*32) - 1 : width - (9*32)];
			data_out_10 <= shift_reg[width - (9*32) - 1 : width - (10*32)];
			data_out_11 <= shift_reg[width - (10*32) - 1 : width - (11*32)];
			data_out_12 <= shift_reg[width - (11*32) - 1 : width - (12*32)];
			data_out_13 <= shift_reg[width - (12*32) - 1 : width - (13*32)];
			data_out_14 <= shift_reg[width - (13*32) - 1 : width - (14*32)];
			data_out_15 <= shift_reg[width - (14*32) - 1 : width - (15*32)];
			data_out_16 <= shift_reg[width - (15*32) - 1 : width - (16*32)];
			data_out_17 <= shift_reg[width - (16*32) - 1 : width - (17*32)];
			data_out_18 <= shift_reg[width - (17*32) - 1 : width - (18*32)];
			data_out_19 <= shift_reg[width - (18*32) - 1 : width - (19*32)];
			data_out_20 <= shift_reg[width - (19*32) - 1 : width - (20*32)];
			data_out_21 <= shift_reg[width - (20*32) - 1 : width - (21*32)];
			data_out_22 <= shift_reg[width - (21*32) - 1 : width - (22*32)];
			data_out_23 <= shift_reg[width - (22*32) - 1 : width - (23*32)];
			data_out_24 <= shift_reg[width - (23*32) - 1 : width - (24*32)];
			data_out_25 <= shift_reg[width - (24*32) - 1 : width - (25*32)];
			data_out_26 <= shift_reg[width - (25*32) - 1 : width - (26*32)];
			data_out_27 <= shift_reg[width - (26*32) - 1 : width - (27*32)];
			data_out_28 <= shift_reg[width - (27*32) - 1 : width - (28*32)];
			data_out_29 <= shift_reg[width - (28*32) - 1 : width - (29*32)];
			data_out_30 <= shift_reg[width - (29*32) - 1 : width - (30*32)];
			data_out_31 <= shift_reg[width - (30*32) - 1 : width - (31*32)];
			data_out_32 <= shift_reg[width - (31*32) - 1 : width - (32*32)];
			data_out_33 <= shift_reg[width - (32*32) - 1 : width - (33*32)];
			data_out_34 <= shift_reg[width - (33*32) - 1 : width - (34*32)];
			data_out_35 <= shift_reg[width - (34*32) - 1 : width - (35*32)];
			data_out_36 <= shift_reg[width - (35*32) - 1 : width - (36*32)];
			data_out_37 <= shift_reg[width - (36*32) - 1 : width - (37*32)];
			data_out_38 <= shift_reg[width - (37*32) - 1 : width - (38*32)];
			data_out_39 <= shift_reg[width - (38*32) - 1 : width - (39*32)];
			data_out_40 <= shift_reg[width - (39*32) - 1 : width - (40*32)];
			data_out_41 <= shift_reg[width - (40*32) - 1 : width - (41*32)];
			data_out_42 <= shift_reg[width - (41*32) - 1 : width - (42*32)];
			data_out_43 <= shift_reg[width - (42*32) - 1 : width - (43*32)];
			data_out_44 <= shift_reg[width - (43*32) - 1 : width - (44*32)];
			data_out_45 <= shift_reg[width - (44*32) - 1 : width - (45*32)];
			data_out_46 <= shift_reg[width - (45*32) - 1 : width - (46*32)];
			data_out_47 <= shift_reg[width - (46*32) - 1 : width - (47*32)];
			data_out_48 <= shift_reg[width - (47*32) - 1 : width - (48*32)];
			data_out_49 <= shift_reg[width - (48*32) - 1 : width - (49*32)];
			data_out_50 <= shift_reg[width - (49*32) - 1 : width - (50*32)];
			data_out_51 <= shift_reg[width - (50*32) - 1 : width - (51*32)];
			data_out_52 <= shift_reg[width - (51*32) - 1 : width - (52*32)];
			data_out_53 <= shift_reg[width - (52*32) - 1 : width - (53*32)];
			data_out_54 <= shift_reg[width - (53*32) - 1 : width - (54*32)];
			data_out_55 <= shift_reg[width - (54*32) - 1 : width - (55*32)];
			data_out_56 <= shift_reg[width - (55*32) - 1 : width - (56*32)];
			data_out_57 <= shift_reg[width - (56*32) - 1 : width - (57*32)];
			data_out_58 <= shift_reg[width - (57*32) - 1 : width - (58*32)];
			data_out_59 <= shift_reg[width - (58*32) - 1 : width - (59*32)];
			data_out_60 <= shift_reg[width - (59*32) - 1 : width - (60*32)];
			data_out_61 <= shift_reg[width - (60*32) - 1 : width - (61*32)];
			data_out_62 <= shift_reg[width - (61*32) - 1 : width - (62*32)];
			data_out_63 <= shift_reg[width - (62*32) - 1 : width - (63*32)];
			data_out_64 <= shift_reg[width - (63*32) - 1 : width - (64*32)];
        end
        else begin
			data_out_1 <= 0;
			data_out_2 <= 0;
			data_out_3 <= 0;
			data_out_4 <= 0;
			data_out_5 <= 0;
			data_out_6 <= 0;
			data_out_7 <= 0;
			data_out_8 <= 0;
			data_out_9 <= 0;
			data_out_10 <= 0;
			data_out_11 <= 0;
			data_out_12 <= 0;
			data_out_13 <= 0;
			data_out_14 <= 0;
			data_out_15 <= 0;
			data_out_16 <= 0;
			data_out_17 <= 0;
			data_out_18 <= 0;
			data_out_19 <= 0;
			data_out_20 <= 0;
			data_out_21 <= 0;
			data_out_22 <= 0;
			data_out_23 <= 0;
			data_out_24 <= 0;
			data_out_25 <= 0;
			data_out_26 <= 0;
			data_out_27 <= 0;
			data_out_28 <= 0;
			data_out_29 <= 0;
			data_out_30 <= 0;
			data_out_31 <= 0;
			data_out_32 <= 0;
			data_out_33 <= 0;
			data_out_34 <= 0;
			data_out_35 <= 0;
			data_out_36 <= 0;
			data_out_37 <= 0;
			data_out_38 <= 0;
			data_out_39 <= 0;
			data_out_40 <= 0;
			data_out_41 <= 0;
			data_out_42 <= 0;
			data_out_43 <= 0;
			data_out_44 <= 0;
			data_out_45 <= 0;
			data_out_46 <= 0;
			data_out_47 <= 0;
			data_out_48 <= 0;
			data_out_49 <= 0;
			data_out_50 <= 0;
			data_out_51 <= 0;
			data_out_52 <= 0;
			data_out_53 <= 0;
			data_out_54 <= 0;
			data_out_55 <= 0;
			data_out_56 <= 0;
			data_out_57 <= 0;
			data_out_58 <= 0;
			data_out_59 <= 0;
			data_out_60 <= 0;
			data_out_61 <= 0;
			data_out_62 <= 0;
			data_out_63 <= 0;
			data_out_64 <= 0;

        end
    end
endmodule
