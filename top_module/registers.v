module register (input clk,reset,load,store,wr1,wr2,wr_en,
                 input [31:0]result,memory,
                 input [4:0]rs1,rs2,rd,
                 output  [31:0]data1,data2,
                 output reg [31:0] data3);
                 
integer i;

reg [31:0]register[0:31];

    
assign  data1=(wr1)?register[rs1]:0; 
assign  data2=(wr2)?register[rs2]:0;

always @ (posedge clk)begin

if (reset)begin
  for (i=0;i<32;i=i+1)begin
  register[i]<=i;
  end
end


else if (wr_en)begin

    if (load) register[rd]<=memory;
      
    else   register[rd]<=result;
    
end

else begin

     data3<=register[rs2];
      
end


end
endmodule






             

