module add2b(
    input [1:0]x, y, 
    input ci,
    output [1:0]z, output co
);

wire co_tmp;
fac fac1(.x(x[0]), .y(y[0]), .ci(ci), .co(co_tmp), .z(z[0]));
fac fac2(.x(x[1]), .y(y[1]), .ci(co_tmp), .z(z[1]), .co(co));



endmodule

module add2b_tb;

reg ci;
reg [1:0]x, y;
wire [1:0]z;
wire co;

add2b uub(.x(x), .y(y), .ci(ci), .z(z), .co(co));

initial
begin

x = 0; y = 0; ci = 0;
#10
$display("%d", z);

x = 2'd1; y = 2'd3; ci = 0;
#10
$display("%d", z);
end

endmodule