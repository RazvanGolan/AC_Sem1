module cmp2b(
    input [1:0] a,b,
    output eq, lt, gt
)
/*
A > B : A1B1’ + A0B1’B0’ + A1A0B0’
A = B : A1’A0’B1’B0’ + A1’A0B1’B0 + A1A0B1B0 + A1A0’B1B0’
           : A1’B1’ (A0’B0’ + A0B0) + A1B1 (A0B0 + A0’B0’)
           : (A0B0 + A0’B0’) (A1B1 + A1’B1’)
           : (A0 Ex-Nor B0) (A1 Ex-Nor B1)
A < B : A1’B1 + A0’B1B0 + A1’A0’B0
*/
assign gt = a[1]&(~b[1]) | a[0]&~(b[1])&(~b[0]) | a[1]&a[0]&(~b[0]);
assign eq = (a[0](~^b)[0])&(a[1](~^b)[1]);
assign lt = (~a[1])&b[1] | (~a[0])&b[1]&b[0] | (~a[1])&(~a[0])&b[0]; 

endmodule

module cmp2b_tb;

reg [1:0] a,b;
wire eq,lt,gt;

cmp2b uut(.a(a), .b(b), .eq(eq), .lt(lt), .gt(gt));

initial begin
    a = 1; b=0;
    #10;
    $display("%d", gt);
    #10

    a=1; b=1;
    #10
    $display("%d %d %d", eq, gt, lt);
    
    a=1; b=2;
    #10
    $display("%d %d %d", eq, gt, lt);
end

endmodule
