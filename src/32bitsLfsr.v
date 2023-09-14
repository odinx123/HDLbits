module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    reg [31:0] next_q;
    
    always @(*) begin
        next_q = q[31:1];  // 右移一位
        next_q[31] = q[0];  // q[0] ^ 0化簡
        next_q[21] = q[22] ^ q[0];
        next_q[1] = q[2] ^ q[0];
        next_q[0] = q[1] ^ q[0];
    end

    always @(posedge clk) begin
        if (reset) begin
            q <= 32'd1;
        end
        else begin
            q <= next_q;
        end
    end

    /*
    always @(posedge clk) begin
        if (reset) begin
            q <= 32'd1;
        end
        else begin
            q[31] <= 1'b0 ^ q[0];
            q[30:22] <= q[31:23];
            q[21] <= q[22] ^ q[0];
            q[20:2] <= q[21:3];
            q[1] <= q[0] ^ q[2];
            q[0] <= q[1] ^ q[0];
        end
    end
    */

endmodule
