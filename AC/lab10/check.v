module check (
    input [4:0] i,
    output reg o
);

always @(*)
begin
    if((i + 3) % 4 == 0)
        o = 1;
    else
        o = 0;
end

endmodule