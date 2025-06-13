

module tb_ring_counter;
  reg clk, rst, load;
  reg [3:0] D;
  wire [3:0] Qn;
  
  ring_counter dut (.clk(clk), .rst(rst), .load(load), .D(D), .Qn(Qn));
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  initial
    begin
      rst = 1; load = 0; D = 4'b0000;
      #10 rst = 0;
      #10 D = 4'b1000; load = 1;
      #10 load = 0;
      #60 $finish();
    end
  initial
    begin
      $monitor("Time = %0t | Qn = %b", $time, Qn);
    end
  initial
    begin
      $dumpfile ("ring_counter.vcd");
      $dumpvars (0,tb_ring_counter);
    end
endmodule
