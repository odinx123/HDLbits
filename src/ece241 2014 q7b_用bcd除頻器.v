module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    bcdcount counter0 (clk, reset, c_enable[0], q1);
    bcdcount counter1 (clk, reset, c_enable[1], q2);
    bcdcount counter2 (clk, reset, c_enable[2], q3);
    
    wire [3:0] q1, q2, q3;
    assign c_enable[0] = 1'b1;  // 每個clk都要active
    assign c_enable[1] = q1 == 4'd9;  // q1數十個clk就要開始數q2
    assign c_enable[2] = q2 == 4'd9 & c_enable[1];  // q1進位且q2等於九(加上進位也要進位)，就開始數q3
    assign OneHertz = q3 == 4'd9 & c_enable[2];

endmodule
