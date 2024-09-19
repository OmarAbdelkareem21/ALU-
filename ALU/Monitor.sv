package Mon ;
import MonS::*;

class Monitor ;

    string Name ;

    mailbox Mon_Mail ;
    event Mon_Flag ;    
    virtual InterFace Mon_IF ;
    MonScoreboard Sequencedata;



    function new (string name = "Driver");
        this.Name = name ;
        this.Mon_Mail = new ();
    endfunction 

    task Mon_run () ;

    for (int i = 0 ; i < 100 ; i = i + 1) 
    begin

        Sequencedata = new ();

         @(negedge Mon_IF.CLKIF)
        Sequencedata.A = Mon_IF.AIF;
        Sequencedata.B = Mon_IF.BIF;
        Sequencedata.EN = Mon_IF.ENIF;
        Sequencedata.RST = Mon_IF.RSTIF;
        Sequencedata.ALU_FUN = Mon_IF.ALU_FUNIF;
        #10;
        Sequencedata.ALU_OUT = Mon_IF.ALU_OUTIF;
       
        
        Mon_Mail.put (Sequencedata);
        @(Mon_Flag);
        

    




    end

         $stop;

    endtask






endclass

endpackage : Mon