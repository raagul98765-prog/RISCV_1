module imu_tb();

reg [31:0]pc;
wire [31:0]instruction_code;

imu uut (pc,instruction_code);

initial begin

$dumpfile("imu.vcd");
$dumpvars(0,imu_tb);

$monitor ("time=%0t | PC =%0d | Instruction=%h", $time,pc,instruction_code);
pc=0;#10;
repeat (8)begin
pc=pc+4;
#10;
end


end
endmodule
