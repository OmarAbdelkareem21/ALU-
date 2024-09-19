package SB ;
import MonS::*;


class scoreboard ;

    string Name ;

    mailbox SB_Mail ;
    event SB_Flag ;    
    MonScoreboard SeqDrive;

    function new (string name = "ScoreBoard");
        this.Name = name ;
        this.SB_Mail = new ();
    endfunction 


    task SB_run () ;

    forever 
    begin

        SeqDrive = new ();
        SB_Mail.get(SeqDrive);
        -> SB_Flag ;

        goldenModel (SeqDrive.A , SeqDrive.B , SeqDrive.ALU_FUN , SeqDrive.RST , SeqDrive.EN , SeqDrive.ALU_OUT);

          
      
        

    end

    endtask

    task goldenModel (input logic [7:0]  A , input logic [7:0] B , input logic [3:0] ALU_FUN , input logic RST , input logic EN , input logic [15:0] out) ;
        
        logic [15 : 0] ALU_OUT_Comb ;
        if (!RST | !EN)
            begin
                if (out == 0)
                begin
                    $display ("Valid");
                    // $display ("SB");
                    // $display ("A = %h",SeqDrive.A);
                    // $display ("B = %H",SeqDrive.B);
                    // $display ("RST = %D",SeqDrive.RST);
                    // $display ("EN = %D",SeqDrive.EN);
                    // $display ("ALUFUN = %D",SeqDrive.ALU_FUN);
                    // $display ("OUT = %H",SeqDrive.ALU_OUT);
                end
                else
                begin
                    $display("FailedA");
                    // $display ("SB");
                    // $display ("A = %h",SeqDrive.A);
                    // $display ("B = %H",SeqDrive.B);
                    // $display ("RST = %D",SeqDrive.RST);
                    // $display ("EN = %D",SeqDrive.EN);
                    // $display ("ALUFUN = %D",SeqDrive.ALU_FUN);
                    // $display ("OUT = %H",SeqDrive.ALU_OUT);
                end
            end
        else if (EN)
            begin

                    case (ALU_FUN) 
     4'b0000: begin
               ALU_OUT_Comb = A+B;
              end
     4'b0001: begin
               ALU_OUT_Comb = A-B;
              end
     4'b0010: begin
               ALU_OUT_Comb = A*B;
              end
     4'b0011: begin
               ALU_OUT_Comb = A/B;
              end
     4'b0100: begin
               ALU_OUT_Comb = A & B;
              end
     4'b0101: begin
               ALU_OUT_Comb = A | B;
              end
     4'b0110: begin
               ALU_OUT_Comb = ~ (A & B);
              end
     4'b0111: begin
               ALU_OUT_Comb = ~ (A | B);
              end     
     4'b1000: begin
               ALU_OUT_Comb =  (A ^ B);
              end
     4'b1001: begin
               ALU_OUT_Comb = ~ (A ^ B);
              end           
     4'b1010: begin
              if (A==B)
                 ALU_OUT_Comb = 'b1;
              else
                 ALU_OUT_Comb = 'b0;
              end
     4'b1011: begin
               if (A>B)
                 ALU_OUT_Comb = 'b10;
               else
                 ALU_OUT_Comb = 'b0;
              end 
     4'b1100: begin
               if (A<B)
                 ALU_OUT_Comb = 'b11;
               else
                 ALU_OUT_Comb = 'b0;
              end     
     4'b1101: begin
               ALU_OUT_Comb = A>>1;
              end
     4'b1110: begin 
               ALU_OUT_Comb = A<<1;
              end
    default: begin
               ALU_OUT_Comb = 'b0;
             end
    endcase

            
        if (out == ALU_OUT_Comb)
        begin
                    $display ("Valid");
                       
        end
                else
                    begin

                    $display("Failed");
                    $display ("SB");
                    $display ("A = %h",SeqDrive.A);
                    $display ("B = %H",SeqDrive.B);
                    $display ("RST = %D",SeqDrive.RST);
                    $display ("EN = %D",SeqDrive.EN);
                    $display ("ALUFUN = %D",SeqDrive.ALU_FUN);
                    $display ("OUT = %H",SeqDrive.ALU_OUT);
                     $display ("OUTin = %H",ALU_OUT_Comb);
                    end
            end
    endtask


endclass
endpackage : SB