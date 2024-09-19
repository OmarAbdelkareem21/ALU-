`include "Monitor.sv"

import SEQ::*;
import Dri::*;
import SB::*;
import Mon::*;



class Environment ;

    string Name ;
    virtual InterFace IF ;
    Sequencer S ;
    Driver D;
    Monitor M;
    scoreboard scb;


    function new (string name = "Environment");
        this.Name = name ;
    endfunction 

    task run () ;
    // Initialization
        S = new ();
        D = new ();
        M = new ();
        scb = new ();

        D.Drive_Mail = S.Seq_Mail;
        D.Drive_Flag = S.Seq_Flag; 

        scb.SB_Mail = M.Mon_Mail ;
        scb.SB_Flag = M.Mon_Flag;

        D.Drive_IF = IF ;
        M.Mon_IF = IF;

    fork
         S.Seq_run ();
         D.Drive_run ();
         M.Mon_run();
         scb.SB_run();
    join
       
    endtask

 







endclass 