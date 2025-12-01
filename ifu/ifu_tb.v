module ifu_tb ();
reg clk,reset,stall;
reg beq,bneq,bge,ble,jump;
reg [31:0] immi_address,immi_address_jump;
wire [31:0]pc;

always #5 clk=~clk;

ifu uut (clk,reset,stall,beq,bneq,bge,ble,jump,immi_address,immi_address_jump,pc);


initial begin

$dumpfile("ifu.vcd");
$dumpvars(0,ifu_tb);

clk=0;reset=0;#10;
reset=1;#10;
reset=0;#20;
beq=1;immi_address=32'h0004;#10;
beq=0;jump=1;immi_address_jump=32'h0002;#10;
jump=0;

end
endmodule

