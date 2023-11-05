module fac(

    input x, y , ci,
    output z, co
);

    
 assign z = ~x&(~y)&ci | (~x)&y&(~ci) | x&(~y)&(~ci) | x&y&ci;
    assign co = ~x&y&ci | x&(~y)&ci | x&y&(~ci) | x&y&ci;

endmodule

module fac_tb;

    reg x,y,ci;
    wire z,co;

    fac uut(.x(x), .y(y), .ci(ci), .z(z), .co(co));

    initial begin

        x = 0; y=0; ci = 0;
        
        #10;
    $display("%d %d", z, co);
        x = 0; y=0; ci = 1;

        #10;
$display("%d %d", z, co);
        x = 0; y=1; ci = 0;

        #10;
$display("%d %d", z, co);
        x = 0; y=1; ci = 1;

        #10;
$display("%d %d", z, co);
        x = 1; y=0; ci = 0;

        #10;
$display("%d %d", z, co);
        x = 1; y=0; ci = 1;

        #10;
$display("%d %d", z, co);
        x = 1; y=1; ci = 0;

        #10;
$display("%d %d", z, co);
        x = 1; y=1; ci = 1;

        #10;
        $display("%d %d", z, co);
    end

endmodule