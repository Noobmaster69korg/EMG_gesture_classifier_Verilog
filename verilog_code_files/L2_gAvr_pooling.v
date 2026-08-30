`timescale 1ns/1ps


module mux_sel_acc(
input clk,
input reset,
input reset_acc,
input [26:0] data_in_0, 
input [26:0] data_in_1, 
input [26:0] data_in_2, 
input [26:0] data_in_3, 
input [26:0] data_in_4, 
input [26:0] data_in_5, 
input [26:0] data_in_6, 
input [26:0] data_in_7, 
input [26:0] data_in_8, 
input [26:0] data_in_9, 
input [26:0] data_in_10, 
input [26:0] data_in_11, 
input [26:0] data_in_12, 
input [26:0] data_in_13, 
input [26:0] data_in_14, 
input [26:0] data_in_15,
output [1:0] out,
output signed [31:0] data_out_0, 
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
output signed [31:0] data_out_63
);
wire q1;
wire signed [26:0] data_in_wire [0:15];
wire signed [31:0] w1 [0:15];
wire signed [31:0] w2 [0:15];
wire signed [31:0] w3 [0:15];
wire signed [31:0] w4 [0:15];
genvar i;
generate 
for(i = 0 ; i < 16 ; i = i + 1)begin
    top q (.clk(clk),.reset(reset),.reset_acc(reset_acc),.data_in(data_in_wire[i]),.pulse(q1),.data_out_1(w1[i]),.data_out_2(w2[i]),.data_out_3(w3[i]),.data_out_4(w4[i]));
end //top's inputs/outputs are inputs/outputs of channel tp the channels

counter_509_cycle a1 (.clk(clk),.rst(reset),.pulse(q1),.out(out));

assign data_in_wire[0] = data_in_0;
assign data_in_wire[1] = data_in_1; 
assign data_in_wire[2] = data_in_2; 
assign data_in_wire[3] = data_in_3; 
assign data_in_wire[4] = data_in_4; 
assign data_in_wire[5] = data_in_5; 
assign data_in_wire[6] = data_in_6; 
assign data_in_wire[7] = data_in_7; 
assign data_in_wire[8] = data_in_8; 
assign data_in_wire[9] = data_in_9; 
assign data_in_wire[10] = data_in_10; 
assign data_in_wire[11] = data_in_11; 
assign data_in_wire[12] = data_in_12; 
assign data_in_wire[13] = data_in_13; 
assign data_in_wire[14] = data_in_14; 
assign data_in_wire[15] = data_in_15; 


assign data_out_0 = w1[0]; 
assign data_out_16 = w2[0]; 
assign data_out_32 = w3[0]; 
assign data_out_48 = w4[0]; 
assign data_out_1 = w1[1]; 
assign data_out_17 = w2[1]; 
assign data_out_33 = w3[1]; 
assign data_out_49 = w4[1]; 
assign data_out_2 = w1[2]; 
assign data_out_18 = w2[2]; 
assign data_out_34 = w3[2]; 
assign data_out_50 = w4[2]; 
assign data_out_3 = w1[3]; 
assign data_out_19 = w2[3]; 
assign data_out_35 = w3[3]; 
assign data_out_51 = w4[3]; 
assign data_out_4 = w1[4]; 
assign data_out_20 = w2[4]; 
assign data_out_36 = w3[4]; 
assign data_out_52 = w4[4]; 
assign data_out_5 = w1[5]; 
assign data_out_21 = w2[5]; 
assign data_out_37 = w3[5]; 
assign data_out_53 = w4[5]; 
assign data_out_6 = w1[6]; 
assign data_out_22 = w2[6]; 
assign data_out_38 = w3[6]; 
assign data_out_54 = w4[6]; 
assign data_out_7 = w1[7]; 
assign data_out_23 = w2[7]; 
assign data_out_39 = w3[7]; 
assign data_out_55 = w4[7]; 
assign data_out_8 = w1[8]; 
assign data_out_24 = w2[8]; 
assign data_out_40 = w3[8]; 
assign data_out_56 = w4[8]; 
assign data_out_9 = w1[9]; 
assign data_out_25 = w2[9]; 
assign data_out_41 = w3[9]; 
assign data_out_57 = w4[9]; 
assign data_out_10 = w1[10]; 
assign data_out_26 = w2[10]; 
assign data_out_42 = w3[10]; 
assign data_out_58 = w4[10]; 
assign data_out_11 = w1[11]; 
assign data_out_27 = w2[11]; 
assign data_out_43 = w3[11]; 
assign data_out_59 = w4[11]; 
assign data_out_12 = w1[12]; 
assign data_out_28 = w2[12]; 
assign data_out_44 = w3[12]; 
assign data_out_60 = w4[12]; 
assign data_out_13 = w1[13]; 
assign data_out_29 = w2[13]; 
assign data_out_45 = w3[13]; 
assign data_out_61 = w4[13]; 
assign data_out_14 = w1[14]; 
assign data_out_30 = w2[14]; 
assign data_out_46 = w3[14]; 
assign data_out_62 = w4[14]; 
assign data_out_15 = w1[15]; 
assign data_out_31 = w2[15]; 
assign data_out_47 = w3[15]; 
assign data_out_63 = w4[15]; 




endgenerate
endmodule




module top(
input clk,
input reset,
input reset_acc,
input signed [26:0] data_in,
input pulse,
output signed [31:0] data_out_1,
output signed [31:0] data_out_2,
output signed [31:0] data_out_3,
output signed [31:0] data_out_4
);
//wire q1;
wire signed [31:0] q2;
wire signed [31:0] q3;
wire signed [31:0]data_out;
accumulator a1 (.clk(clk),.data_in(data_in),.reset(reset_acc),.pulse(pulse),.data_out(data_out));
//counter_509_cycle a2 (.clk(clk),.rst(reset),.pulse(q1),.out(out)); 
shift a3 (.clk(clk),.data_in(data_out),.data_out(q2));     // DFF
divide a4 (.data_in(q2),.data_out(q3));
shift_register a5 (.clk(clk),.reset_main(reset),.reset(pulse),.data_in(q3),.data_out_1(data_out_1),.data_out_2(data_out_2),.data_out_3(data_out_3),.data_out_4(data_out_4));
endmodule



module divide ( // divides the accumalated value by 512 (INSTANTLY)
    input  signed [31:0] data_in,        // 31-bit signed input
    output reg signed [31:0] data_out    // Output stays 31-bit
);
    always @(*) begin
        // Sign-extend to 32 bits, then shift
        data_out = $signed({data_in[31], data_in}) >>> 9;
    end
endmodule



module shift_register(
input clk,
input reset_main,    // reset to reset the counter : Connected to main reset of the module i.e, reset_data
input reset, // this reset doesnt works like an reset. Comes every 508 counts for one clock cycle
input signed [31:0]data_in,
output reg signed [31:0] data_out_1,
output reg signed [31:0] data_out_2,
output reg signed [31:0] data_out_3,
output reg signed [31:0] data_out_4
);
reg [16:0] counter = 17'b0;
reg [127:0] shift_reg =128'b0; // think this in terms of 4 groups of 32 bits
always@(posedge clk)begin 
    if(reset_main)begin 
        counter <= 0;
    end 
    else begin
        counter <= counter + 1;
        if(reset)begin
            shift_reg <= {shift_reg[95:0],data_in}; // left shifted
        end
        else begin
            if(counter >= 2033)begin
                data_out_4 <= shift_reg[31:0];
                data_out_3 <= shift_reg[63:32];
                data_out_2 <= shift_reg[95:64];
                data_out_1 <= shift_reg[127:96];   
            end
            else begin // initially all values are 0
                data_out_1 <= 0;
                data_out_2 <= 0;
                data_out_3 <= 0;
                data_out_4 <= 0;
            end    
        end
    end
end
endmodule

module shift(  //It is a D FLIPFLOP. delays the accumalation by one clock cycle
input signed [31:0] data_in,
input clk,
output reg signed [31:0] data_out
);
//reg signed [26:0] q1;
always@(posedge clk)begin
data_out <= data_in;
//data_out <= q1;
end
endmodule

module accumulator ( // input of GAP enters here basically.
input clk,
input signed [26:0] data_in,
input reset,
input pulse,
output reg signed [31:0] data_out
); // as name suggests it keeps on adding the data_in value to data_out
wire signed [31:0]q2;
reg signed [31:0] q3;
//wire signed [26:0] q1;
//assign q0 = data_in & {18{~reset}};
always @(*)begin
    if(reset)begin
        data_out <= 0;
    end
    else begin
        data_out <= q3 + data_in;
    end
end

always@(*)begin
    if(pulse)begin
        q3 <= 0;
    end
    else begin
        q3 <= q2;
    end
end
Dff d1 (.clk(clk),.D(data_out),.reset(reset),.Q(q2));
endmodule

module Dff (
input signed [31:0] D,
input reset,
input clk,
output reg signed [31:0] Q
);

always @(posedge clk)begin
    if(reset)begin
        Q <= 0;
    end
    else begin
        Q <= D;
    end
end
endmodule





module counter_509_cycle ( // continously generates a PULSE after 508 clk cycles. 
    input wire clk,
    input wire rst,           // Active-high synchronous reset(RESET of entire module)
    output reg [1:0] out,     // 2-bit output to cycle through 0 to 3
    output reg pulse          // Pulse signal: high for 1 clock at every output change
);

    // Counter to count up to 509 cycles
    reg [8:0] cycle_counter = 9'b0;  // 9 bits needed for counting up to 509

    always @(posedge clk) begin
        if (rst) begin
            cycle_counter <= 9'd0;
            out <= 2'd0;
            pulse <= 1'b0;
        end else begin
            if (cycle_counter == 9'd508) begin
                cycle_counter <= 9'd1;
                out <= out + 1;
                pulse <= 1'b1;   // Generate pulse after every 508 cycles 
            end else begin
                cycle_counter <= cycle_counter + 1;
                pulse <= 1'b0;   // Pulse is only high for 1 cycle
            end
        end
    end

endmodule


/*
module reset_next_stage(
    input clk,
    input reset,
    output reg reset_next_stage
);
reg [12:0] counter  = 13'b0;
always@(posedge clk)begin
if(reset)begin
    counter <= 0;
    reset_next_stage <= 1;
end else begin
    if(counter < 2034)begin
        counter <= counter + 1;
        reset_next_stage <= 1;
    end
    else begin
        counter = 2034;
        reset_next_stage  = 0 ;
    end
end
end

endmodule
*/

module reset_next_stage (
    input clk,
    input in,
    output reg out
);

    // State encoding
    parameter A = 1'b0;
    parameter B = 1'b1;

    reg state, next_state;
    reg [11:0] counter;  // 12-bit counter to count up to 2034

    // Initial conditions
    initial begin
        state = A;
        counter = 12'd0;
    end

    // State and counter registers
    always @(posedge clk) begin
        state <= next_state;

        // Counter active only in state B and below 2034
        if (state == B && counter < 12'd2244) // changed from 2235 to 2244
            counter <= counter + 1;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            A: begin
                if (in == 1'b1)
                    next_state = A;
                else
                    next_state = B;
            end
            B: begin
                next_state = B;  // Stay in B forever
            end
            default: next_state = A;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            A: out = 1'b1;
            B: out = (counter < 12'd2244) ? 1'b1 : 1'b0;
            default: out = 1'b0;
        endcase
    end

endmodule

