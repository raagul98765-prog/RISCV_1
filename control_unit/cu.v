module cu (input clk,reset,
           input [31:0]instruction_code,
           output reg [6:0]instruction,
           output reg [31:0]immi,
           output reg wr1,wr2,
           output reg [4:0]rs1,rs2,rd);


wire  [6:0]opcode;     
assign opcode= instruction_code[6:0];

always @ (posedge clk)begin

if (reset) instruction<=6'b111111;


else begin

if (opcode==7'b0110011) begin
    
    if (instruction_code[14:12]==3'b000)begin
        
        if (instruction_code[31:25]==0)instruction <= 6'b000000; //add

        else instruction <= 6'b000001; //sub
     
    end
       
    else if (instruction_code[14:12]==3'b100) instruction <= 6'b000010;//XOR
    
    else if (instruction_code[14:12]==3'b110) instruction <= 6'b000011;//OR
    
    else if (instruction_code[14:12]==3'b111) instruction <= 6'b000100;//AND
    
    else if (instruction_code[14:12]==3'b001) instruction <= 6'b000101;//sll
    
    else if (instruction_code[14:12]==3'b101)begin
          
          if (instruction_code[31:25]==0)instruction <= 6'b000110;//srl
          
          else instruction <= 6'b000111;//sra
          
    end
    
    else if (instruction_code[14:12]==3'b010)instruction <= 6'b001000;//slt
    
    else instruction <= 6'b001001;//sltu
      
        rd<=instruction_code[11:7];
        rs1<=instruction_code[19:15];wr1=1;
        rs2<=instruction_code[24:20];wr2=1;
        

end 

else if (opcode==7'b0010011) begin

    
    if (instruction_code[14:12]==3'b000)instruction <= 6'b001010; //addi
   
    else if (instruction_code[14:12]==3'b100) instruction <= 6'b001011;//XORi
    
    else if (instruction_code[14:12]==3'b110) instruction <= 6'b001100;//ORi
    
    else if (instruction_code[14:12]==3'b111) instruction <= 6'b001101;//ANDi
    
    else if (instruction_code[14:12]==3'b001) instruction <= 6'b001110;//slli
    
    else if (instruction_code[14:12]==3'b101)begin
          
          if (instruction_code[31:25]==0)instruction <= 6'b001111;//srli
          
          else instruction <= 6'b010000;//srai
          
    end
    
    else if (instruction_code[14:12]==3'b010)instruction = 6'b010001;//slti
    
    else instruction <= 6'b010010;//sltui
      
        rd<=instruction_code[11:8];
        rs1<=instruction_code[19:15];wr1=1;
        immi<={{20{instruction_code[31]}},instruction_code[31:20]};
      
    

end


else if (opcode==7'b0000011) begin

    if (instruction_code[14:12]==3'b000)instruction <= 6'b010011; //loadbyte
   
    else if (instruction_code[14:12]==3'b001) instruction <= 6'b010100;//loadhalf
    
    else if (instruction_code[14:12]==3'b010) instruction <= 6'b010101;//loadword
    
    else if (instruction_code[14:12]==3'b100) instruction <= 6'b010110;//loadbyte
    
    else if (instruction_code[14:12]==3'b101) instruction <= 6'b010111;//loadhalf
    
    rd<=instruction_code[11:7];
    rs1<=instruction_code[19:15];wr1=1;
    immi<={{20{instruction_code[31]}},instruction_code[31:20]};
       

end

else if (opcode==7'b0100011)begin

    if (instruction_code[14:12]==3'b000)instruction <= 6'b011000; //storebyte
   
    else if (instruction_code[14:12]==3'b001) instruction <= 6'b011001;//storehalf_word
    
    else if (instruction_code[14:12]==3'b010) instruction <= 6'b011010;//word

        rs1<=instruction_code[19:15];wr1=1;
        rs2<=instruction_code[24:20];wr2=1;
        immi<={{20{instruction_code[31]}},instruction_code[31:25],instruction_code[11:7]};
        


end

else if (opcode==7'b1100011)begin

    if (instruction_code[9:7]==3'b000) begin 
    instruction <= 6'b011011; //beq
    end
   
    else if (instruction_code[9:7]==3'b001) begin 
    instruction <= 6'b011100;//bneq
    end
    
    else if (instruction_code[9:7]==3'b100) begin 
    instruction <= 6'b011101;//blt
    end

    
    else begin
    instruction <= 6'b100000;//bge
    end
    
    rs1<=instruction_code[14:10];wr1=1;
    rs2<=instruction_code[19:15];wr2=1;
    immi<={{20{instruction_code[31]}},instruction_code[31:20]};

end


else if (opcode==7'b1101111)  begin 
   instruction <= 6'b100001;
   rd<=instruction_code[11:7];
   immi<={{12{instruction_code[31]}},instruction_code[31:12]};
end

     
else if(opcode==7'b0110111)begin
    instruction <= 6'b100010;
    rd<=instruction_code[11:7];
    immi<={{12{instruction_code[31]}},instruction_code[31:12]};
end
     
else if (opcode==7'b0110111) begin
     instruction <= 6'b100011;
     rd<=instruction_code[11:7];
     immi<={{12{instruction_code[31]}},instruction_code[31:12]};
     
end


else instruction<=6'b111111;

end

end


endmodule
