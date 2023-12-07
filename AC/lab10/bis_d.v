module d_ff (
    input clk, rst_b, set_b, d,
    output reg q
);

always @(negedge rst_b or negedge set_b)
begin
  if(set_b == 0)
        q = 1;
        else
    if(rst_b == 0)
        q = 0;
end

always @(posedge clk)
begin

    if(rst_b == 1 && set_b == 1)
        q = d;
end

endmodule