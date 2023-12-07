module tabla(
    input clk, rst_b, a, b, output reg n, m
    );

    localparam S0=0, S1=1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;

    reg st, st_nxt;
    always @(*) begin
        case (st)
            S0: if(a) st_nxt=S1;
                else    st_nxt=S0;
            S1: st_next = S2;
            S2: if((~a&b)) st_nxt=S3;
                else if(a&(~b))       st_nxt=S4;
            S3: if(a&b)st_next = S0;
            S4: if(b) st_next=S3;
               else if(~b) st_next=S5;
            S5: st_next = S0;
            
        endcase
    end

    always @(*) begin
        case (st)
            S0: begin 
            n=1; m=0; end
            S1: begin 
            n=0;m=0;end
            S2: begin
            n=1;m=1; end
            S3: begin
              n=1;m=0; end
            S4: begin
              n=0; m=1; end
            S5: begin 
              n=0;m=0;end
        endcase
    end
    

    always @(posedge clk, negedge rst_b) 
        if(!rst_b) st <= S0;
        else       st <= st_nxt;
endmodule

module tabla_tb;
    reg clk, rst_b, a,b;
    wire n,m;
    tabla uut(.clk(clk), .rst_b(rst_b), .a(a), .b(b), .n(n), .m(m));

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