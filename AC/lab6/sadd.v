module sadd(
    input clk, rst_b, x, y, output reg z
    );

    localparam S0=0, S1=1;

    reg st, st_nxt;
    always @(*) begin
        case (st)
            S0: if(x&y) st_nxt=S1;
                else    st_nxt=S0;
            S1: if(~x&(~y)) st_nxt=S0;
                else        st_nxt=S1;
        endcase
    end

    always @(*) begin
        case (st)
            S0: if(x&y | (~x&(~y))) z = 0;
                else    z = 1;
            S1: if(x&y | (~x&(~y))) z = 1;
                else        z = 0;
        endcase
    end
    

    always @(posedge clk, negedge rst_b) 
        if(!rst_b) st <= S0;
        else       st <= st_nxt;
endmodule

module sadd_tb;
    reg clk, rst_b, x, y;
    wire z;
    sadd uut(.clk(clk), .rst_b(rst_b), .x(x), .y(y), .z(z));

    initial begin
        clk=0; repeat(20) #50 clk=~clk;
    end

    initial begin
        rst_b=0; #25 rst_b=1;
    end
 
    initial begin
        x=1; y=0;
        #100 y=1;
        #300 x=0; y=0;
    end
    
    initial begin
      #40;
        $display("%d", z); #100;
        $display("%d", z); #100;
        $display("%d", z); #100;
        $display("%d", z); #100;
    end
    
    
 
endmodule