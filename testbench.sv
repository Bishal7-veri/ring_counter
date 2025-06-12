

module tb;
    reg clk, rst;
    wire [3:0] Qn;

    ring_counter uut (
        .clk(clk),
        .rst(rst),
        .Qn(Qn)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk\trst\tQn");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, rst, Qn);

        rst = 1;
        #10 rst = 0;

        #100 $finish;
    end
endmodule
