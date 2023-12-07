module sisr4b (
    input clk, rst_b, i,
    output [3:0] q
);

wire comb, comb2;
wire q0, q1, q2, q3;

d_ff d_ff_inst0 (.clk(clk), .rst_b(1'd1), .q(q0), .d(comb2), .set_b(rst_b));
d_ff d_ff_inst1 (.clk(clk), .rst_b(1'd1), .q(q1), .d(comb), .set_b(rst_b));
d_ff d_ff_inst2 (.clk(clk), .rst_b(1'd1), .q(q2), .d(q1), .set_b(rst_b));
d_ff d_ff_inst3 (.clk(clk), .rst_b(1'd1), .q(q3), .d(q2), .set_b(rst_b));

assign q[0] = q0;
assign q[1] = q1;
assign q[2] = q2;
assign q[3] = q3;

assign comb = q0 ^ q3;
assign comb2 = q3 ^ i;

endmodule
