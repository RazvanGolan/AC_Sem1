module pktmux(
    input [63:0]pkt, msg_len, input pad_pkt, zero_pkt, mgln_pkt, output reg[63:0] o 
);
    always @(*)
    begin
        if(pad_pkt)
        begin
         o = 64'h80000000;
        end
        else
            if(zero_pkt)
            begin
                o = 64'h0;
            end
        else
            if(mgln_pkt)
            begin
                o = msg_len;
            end
        else
            o = pkt;
    end

endmodule

module pktmux_tb;

reg [63:0]pkt, msg_len;
reg pad_pkt, zero_pkt, mgln_pkt;
wire [63:0]o;

pktmux uut(.pkt(pkt), .msg_len(msg_len), .pad_pkt(pad_pkt), .zero_pkt(zero_pkt), .mgln_pkt(mgln_pkt), .o(o));

task urand64 ( output reg [ 63 : 0 ] r ) ;
 begin
 r [ 63: 32]= $urandom ;
 r [ 31: 0] = $urandom ;
 end
endtask

initial begin

pad_pkt = 0; 
#100 pad_pkt = 1; #100 pad_pkt = 0;
repeat(10) begin 
    #300 pad_pkt = 1; #100 pad_pkt = 0;
end
end

initial begin

zero_pkt = 0; 
#200 zero_pkt = 1; #100 zero_pkt = 0;
repeat(10) begin 
    #300 zero_pkt = 1; #100 zero_pkt = 0;
end
end

initial begin

mgln_pkt = 0; 
#300 mgln_pkt = 1; #100 mgln_pkt = 0;
repeat(10) begin 
    #300 mgln_pkt = 1; #100 mgln_pkt = 0;
end
end

initial begin
repeat(10) begin
urand64(msg_len); urand64(pkt); #100;
end
end

endmodule