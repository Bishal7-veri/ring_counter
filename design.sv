module ring_counter (
    input wire clk,
    input wire rst,
    output reg [3:0] Qn
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            Qn <= 4'b1000;  // Initialize with starting pattern
        else
            Qn <= {Qn[0], Qn[3:1]};  // Right circular shift
    end

endmodule
