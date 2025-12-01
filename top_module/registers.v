module register (input clk ,reset,load,store,wr1,wr2,wr_en,
                 input [31:0]result,memory,
                 input [4:0]rs1,rs2,rd,
                 output reg [31:0]data1,data2,data3);
                 
integer i;

reg [31:0]register[0:31];

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

    if (store) data3<=register[rs2];
    
    else begin
    
      if (wr1) data1<=register[rs1]; 
        
      if (wr2) data2<=register[rs2];
      
    end

end


end
endmodule






             

