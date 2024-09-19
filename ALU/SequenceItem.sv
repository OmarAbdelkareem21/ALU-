package SEQIT ;

class SequenceItem ;

        //  reg [7:0] A; 
        //  reg [7:0] B;
        //  reg                  EN;
        //  reg [3:0]            ALU_FUN;
        //  reg                  RST;  
        //  bit  [15:0]  ALU_OUT;
        //  bit                  OUT_VALID;  

         rand  bit [7:0] A; 
         rand bit [7:0] B;
         rand bit                 EN;
         rand bit [3:0]            ALU_FUN;
         rand   bit               RST;  
         bit [15:0]  ALU_OUT;
       

         // Constructor to initialize the values
    function new(string name = "Sequence Item");
      
    endfunction

    // Task to display the values of the sequence item
    task display();
        $display("A: %0d, B: %0d, EN: %b, ALU_FUN: %0D, RST: %b, ALU_OUT: %0d", 
                 A, B, EN, ALU_FUN, RST, ALU_OUT);
    endtask


endclass 


endpackage : SEQIT