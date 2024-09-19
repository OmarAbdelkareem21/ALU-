package Dri ;
import SEQIT::*;

class Driver ;

	string Name ;

    mailbox Drive_Mail ;
    event Drive_Flag ;    
    virtual InterFace Drive_IF ;
	SequenceItem SeqDrive;


    function new (string name = "Driver");
        this.Name = name ;
        this.Drive_Mail = new ();
    endfunction 

    task Drive_run () ;

    forever 
    begin

        SeqDrive = new ();
        Drive_Mail.get(SeqDrive);

       
        Drive_IF.RSTIF = SeqDrive.RST ;
        Drive_IF.AIF = SeqDrive.A ;
        Drive_IF.BIF = SeqDrive.B ;
        Drive_IF.ENIF = SeqDrive.EN ;
        Drive_IF.ALU_FUNIF = SeqDrive.ALU_FUN ;
        Drive_IF.ALU_OUTIF = SeqDrive.ALU_OUT ;
        
         @(posedge Drive_IF.CLKIF)

        -> Drive_Flag ;
    


    end

    endtask




endclass 

endpackage : Dri