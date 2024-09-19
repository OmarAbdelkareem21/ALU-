
`include "Environment.sv"
module TestBench ();


	InterFace InterFaceEnv ();
	Environment Env ;
	


	// ALU DUT 
	
	ALU DUT (
	
		.A(InterFaceEnv.AIF),
		.B(InterFaceEnv.BIF),
		.EN(InterFaceEnv.ENIF),
		.ALU_FUN(InterFaceEnv.ALU_FUNIF),
		.CLK(InterFaceEnv.CLKIF),
		.RST(InterFaceEnv.RSTIF),
		.ALU_OUT(InterFaceEnv.ALU_OUTIF)
		
	
	);
	
	initial
	begin
		InterFaceEnv.CLKIF = 1;
	end
	
	
	always #5 InterFaceEnv.CLKIF = !InterFaceEnv.CLKIF ;
	
	initial 
	begin
		Env = new ();
		Env.IF = InterFaceEnv;
		Env.run ();
	end


endmodule