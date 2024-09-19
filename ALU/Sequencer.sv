package SEQ ;
import SEQIT::*;
class Sequencer ;

	string Name ;
    mailbox Seq_Mail ;
    event Seq_Flag ;
    int iterationNum ;
    SequenceItem Sequencedata;




    function new (string name = "Sequencer");
        this.Name = name ;
        this.Seq_Mail = new ();
    endfunction 

    task Seq_run () ;

        Sequencedata = new ();

        iterationNum = 2 ;
        for (int i = 0 ; i < iterationNum ; i = i +1)
            begin
                    if (i ==0)
                        begin
                             Seq_randrESET ();
                        end
                    else begin
                           Seq_randEN ();
                           Seq_rand ();
                    end

            end


       

    endtask

   

     task Seq_rand ();
     for (int i =0 ; i < 80 ; i = i +1)
     begin
        Sequencedata.randomize () with {Sequencedata.EN == 1'd1; Sequencedata.RST == 1'd1; };
        
        // $display ("Iteration = %d" , i);
        // Sequencedata.display();

        Seq_Mail.put (Sequencedata) ;
        @(Seq_Flag);
     end
     endtask

     task Seq_randrESET ();
     for (int i =0 ; i < 2 ; i = i +1)
     begin
        Sequencedata.randomize () with { Sequencedata.RST == 1'd0; };
        
        // $display ("Iteration = %d" , i);
        // Sequencedata.display();

        Seq_Mail.put (Sequencedata) ;
        @(Seq_Flag);
     end
     endtask

     task Seq_randEN ();
     for (int i =0 ; i < 2 ; i = i +1)
     begin
        Sequencedata.randomize () with { Sequencedata.EN == 1'd0; };
        
        // $display ("Iteration = %d" , i);
        // Sequencedata.display();

        Seq_Mail.put (Sequencedata) ;
        @(Seq_Flag);
     end
       

    endtask



endclass 

endpackage : SEQ