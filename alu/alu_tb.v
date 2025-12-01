module alu_tb ();
    
reg  [31:0]pc;
reg [5:0]  instruction;
reg  [31:0] data1,data2;
reg  [31:0] immi;
wire  [31:0] mem_addr;
wire [31:0] immi_address,immi_address_jump;
wire [31:0] result;
wire beq,bneq,bge,ble,jump,load,wr_en;

alu uut (pc,instruction,data1,data2,immi,mem_addr,immi_address,immi_address_jump,result,beq,bneq,bge,ble,jump,load,wr_en);


initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0);

    instruction=0;data1=32'h0005;data2=32'h000f;#10;
    #10;
    $finish;
    


end


endmodule