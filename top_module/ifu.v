module ifu (input clk,reset,stall,
            input beq,bneq,bge,ble,jump,
            input [31:0] immi_address,immi_address_jump,
            output reg [31:0]pc);
            
         
always @(posedge clk)begin
if (reset) begin 
pc<=0;
end

else if (stall)begin 
pc<=pc;
end

else if (beq | bneq | bge | ble) pc<=pc+immi_address;

else if (jump)   pc <= pc + immi_address_jump;


else pc<=pc+4;



end
endmodule





