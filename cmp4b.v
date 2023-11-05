module cmp4b(
    input [3:0] a,b,
    output eq, lt, gt
);

reg eq1, lt1, gt1;
cmp2b tmp1(.a(a[3:2]), .b(b[3:2]), .eq(eq1), .lt(lt1), .gt(gt1));
reg eq2, lt2, gt2;
cmp2b tmp2(.a(a[1:0]), .b(b[1:0]), .eq(eq2), .lt(lt2), .gt(gt2));

assign eq = eq1&eq2;
assign lt = lt1 | (eq1 & lt2);
assign gt = gt1 | (eq1 & gt2);

endmodule

module cmp4b_tb;

reg [3:0] a,b;
wire eq, lt, gt;
cmp4b uut(.a(a), .b(b), .eq(eq), .gt(gt), .lt(lt));
initial 
begin
a = 0; b=0;
#10;
$display("%d %d %d", lt, eq, gt);
a = 3; b=0;
#10;
$display("%d %d %d", lt, eq, gt);
a = 0; b=3;
#10
$display("%d %d %d", lt, eq, gt);
a = 7; b=5;
#10
$display("%d %d %d", lt, eq, gt);
end
endmodule