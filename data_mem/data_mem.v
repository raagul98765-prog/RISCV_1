module data_mem(input clk,reset,load,
                input [31:0]mem_addr,data3,
                output reg wr_en,
                output reg [31:0] memory);
                
                
reg [31:0]mem[0:255];
reg [31:0] i;


always @ (posedge clk) begin
wr_en<=0;
if (reset) begin
  for (i=0;i<256;i=i+1)begin
  mem[i]<=i;
  end

end

else if (load)begin       //load
 memory<=mem[mem_addr];
 wr_en<=1;

end

else mem[mem_addr]<=data3;//store
   

end

endmodule
