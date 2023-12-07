module lfsr5b (
    input clk, rst_b,
    output [4:0] q
);

wire comb;
wire q0, q1, q2, q3, q4;

d_ff d_ff_inst0 (.clk(clk), .rst_b(1'd1), .q(q0), .d(q4), .set_b(rst_b));
d_ff d_ff_inst1 (.clk(clk), .rst_b(1'd1), .q(q1), .d(q0), .set_b(rst_b));
d_ff d_ff_inst2 (.clk(clk), .rst_b(1'd1), .q(q2), .d(comb), .set_b(rst_b));
d_ff d_ff_inst3 (.clk(clk), .rst_b(1'd1), .q(q3), .d(q2), .set_b(rst_b));
d_ff d_ff_inst4 (.clk(clk), .rst_b(1'd1), .q(q4), .d(q3), .set_b(rst_b));

assign q[0] = q0;
assign q[1] = q1;
assign q[2] = q2;
assign q[3] = q3;
assign q[4] = q4;

assign comb = q1 ^ q4;

endmodule

module lfsr5b_tb;

reg clk, rst_b;
wire [4:0] q;

lfsr5b uut(.clk(clk), .rst_b(rst_b), .q(q));

initial begin
    clk = 0;
        repeat(70)
        begin
            #50; clk = ~clk;
        end
end

initial begin
    rst_b = 0;
    #25;
    rst_b = 1;
end

endmodule