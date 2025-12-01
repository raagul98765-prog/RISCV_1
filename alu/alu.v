module alu (input  [31:0]pc,
            input  [5:0]  instruction,
            input  [31:0] data1,data2,
            input  [31:0] immi,
            output reg [31:0] mem_addr,
            output reg [31:0] immi_address,immi_address_jump,
            output reg[31:0] result,
            output reg beq,bneq,bge,ble,jump,load,store,wr_en);
            

always @(*)begin

wr_en=0;beq=0;bneq=0;bge=0;ble=0;jump=0;load=0;store=0;

if (instruction==6'b000000) begin 
result = data1 + data2 ;
wr_en=1;
end

else if (instruction==6'b000001) begin 
result = data1- data2;
wr_en=1;
end

else if (instruction==6'b000010) begin 
result = data1 ^ data2;
wr_en=1;
end

else if (instruction==6'b000011) begin 
result = data1 | data2;
wr_en=1;
end

else if (instruction==6'b000100) begin 
result = data1 & data2;
wr_en=1;
end

else if (instruction==6'b000101) begin 
result = data1 << data2[4:0];
wr_en=1;
end

else if (instruction==6'b000110) begin 
result = data1 >> data2[4:0];
wr_en=1;
end

else if (instruction==6'b000111) begin 
result = $signed(data1) >>> data2[4:0]; 
wr_en=1;
end

else if (instruction==6'b001000) begin 
result = ($signed(data1) < $signed(data2))?1:0;
wr_en=1;
end

else if (instruction==6'b001001) begin 
result = (data1 < data2)?1:0;
wr_en=1;
end

else if (instruction==6'b001010)begin 
result = data1 + immi ;
wr_en=1;
end

else if (instruction==6'b001011)begin
result = data1 ^ immi ;
wr_en=1;
end 

else if (instruction==6'b001100)begin
result = data1 | immi ;
wr_en=1;
end

else if (instruction==6'b001101)begin
result = data1 & immi ;
wr_en=1;
end

else if (instruction==6'b001110)begin
result = data1 << immi[4:0] ;
wr_en=1;
end

else if (instruction==6'b001111) begin 
result = data1 >> immi[4:0] ;
wr_en=1;
end

else if (instruction==6'b010000)begin
result = $signed (data1) >>> immi[4:0];
wr_en=1;
end

else if (instruction==6'b010001)begin 
result = ($signed(data1) < $signed(immi))?1:0;
wr_en=1;
end

else if (instruction==6'b010010) begin 
result = (data1 < immi)?1:0;
wr_en=1;
end

else if (instruction==6'b010011) begin 
load=1;
mem_addr = data1 + immi ;
end

else if (instruction==6'b010100)  begin 
load=1;
mem_addr = data1 + immi ;
end

else if (instruction==6'b010101)  begin 
load=1;
mem_addr = data1 + immi ;
end

else if (instruction==6'b010110)  begin 
load=1;
mem_addr = data1 + immi ;
end

else if (instruction==6'b010111)  begin 
load=1;
mem_addr = data1 + immi ;
end

else if (instruction==6'b011000) begin 
mem_addr= data1 + immi;
store=1;
end

else if (instruction==6'b011001) begin 
mem_addr= data1 + immi ; 
store=1;
end

else if (instruction==6'b011010) begin
mem_addr= data1 + immi ;
store=1;
end

else if (instruction==6'b011011) begin 
    if (data1 == data2) begin
       beq=1;
       immi_address=immi;
     end
end

else if (instruction==6'b011100) begin 
    if (data1 != data2) begin
       bneq=1;
       immi_address=immi;
     end
end

else if (instruction==6'b011101) begin 
    if (data1 < data2) begin
       ble=1;
       immi_address=immi;
     end
end

else if (instruction==6'b100000) begin 
    if (data1 >= data2) begin
       bge=1;
       immi_address=immi;
     end
end

else if (instruction==6'b100001) begin 
jump=1;
wr_en=1;
result = pc+4;
immi_address_jump = immi;
end

else if (instruction==6'b100010) begin
jump=1;   
wr_en=1;
result = pc+4;
immi_address_jump = {(data1+immi),1'b0};
end

else if (instruction==6'b100010) begin 
result=immi;
wr_en=1;
end

else wr_en=0;

end
endmodule
