module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = q[3:0] == 4'd9;
    assign ena[2] = q[7:4] == 4'd9 & ena[1];
    assign ena[3] = q[11:8] == 4'd9 & ena[2];
    bcd_cnt bcd1 [3:0] (clk, reset, {ena, 1'b1}, q);

endmodule

module bcd_cnt(clk, reset, cin, q);  // 如果把進位寫在這裡，那麼就會有clk的延遲出現部分錯誤
    
    input clk, reset, cin;
    output reg [3:0] q;
    
    always @(posedge clk) begin
        if (reset) begin
        	q <= 4'd0;
        end
        else if (cin) begin
            if (q == 4'd9) begin
                q <= 4'd0;
            end
            else begin
               	q <= q + 1'b1; 
            end
        end
    end
    
endmodule
