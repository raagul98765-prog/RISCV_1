module top (input clk,reset,stall);

wire [31:0]pc,current_pc;
wire [31:0] immi_address,immi_address_jump;
wire [31:0]instruction_code;
wire [5:0]instruction;
wire [31:0]immi;
wire [4:0]rs1,rs2,rd;
wire [31:0] data1,data2,data3;
wire [31:0] mem_addr;
wire [31:0] result;
wire [31:0]memory;
wire beq,bneq,bge,ble,jump,load,store,wr_en;

imu       imu1   (pc,instruction_code);
ifu       fetch  (clk,reset,stall,beq,bneq,bge,ble,jump,immi_address,immi_address_jump,pc);
cu        cu1    (clk,reset,instruction_code,instruction,immi,wr1,wr2,rs1,rs2,rd);
alu       alu1   (pc,instruction,data1,data2,immi,mem_addr,immi_address,immi_address_jump,result,beq,bneq,bge,ble,jump,load,store,wr_en);
register  r1     (clk ,reset,load,store,wr1,wr2,wr_en,result,memory,rs1,rs2,rd,data1,data2,data3);
data_mem  d1     (clk,reset,load,mem_addr,data3,wr_en,memory);



endmodule


