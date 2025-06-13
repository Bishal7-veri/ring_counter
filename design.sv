// ring counter code 
module ring_counter(
input wire clk, rst, load,
  input wire [3:0] D,
  output reg [3:0] Qn);
  always @ (posedge clk or posedge rst)
    begin
      if(rst)
        begin
          Qn <= 4'b0000;
        end
      else if (load)
        begin
          Qn <= D;
        end
      else 
        begin
          Qn <= {Qn[0], Qn[3:1]};
        end
    end
endmodule
