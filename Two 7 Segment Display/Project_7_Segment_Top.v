module Prject_7_Segment_top
	(input i_Clk,
	 input i_Switch_1,
	 output o_Segment2_A,
	 output o_Segment2_B,
	 output o_Segment2_C,
	 output o_Segment2_D,
	 output o_Segment2_E,
	 output o_Segment2_F,
	 output	o_Segment2_G,
	 output o_Segment1_A,
	 output o_Segment1_B,
	 output o_Segment1_C,
	 output o_Segment1_D,
	 output o_Segment1_E,
	 output o_Segment1_F,
	 output	o_Segment1_G
	);
	 
	wire w_Switch_1;
	reg r_Switch_1 = 1'b0;
	reg [3:0] r_Count_ones = 4'b0000;
	reg [3:0] r_Count_tens = 4'b0000;

	wire w_Segment2_A;
	wire w_Segment2_B;
	wire w_Segment2_C;
	wire w_Segment2_D;
	wire w_Segment2_E;
	wire w_Segment2_F;
	wire w_Segment2_G;
	wire w_Segment1_A;
	wire w_Segment1_B;
	wire w_Segment1_C;
	wire w_Segment1_D;
	wire w_Segment1_E;
	wire w_Segment1_F;
	wire w_Segment1_G;

 Debounce_Switch Debounce_Switch_Inst
	(.i_Clk(i_Clk),
	 .i_Switch(i_Switch_1),
	 .o_Switch(w_Switch_1));
	
	//Purpose: When Switch is pressed, increment counter.
	// When counter gets to 9, start back at 0 again.
	
	always @(posedge i_Clk)
	begin
		r_Switch_1<= w_Switch_1;
		
		//increment Count when switch is pushed
		if (w_Switch_1 ==1'b1 && r_Switch_1 == 1'b0)
		begin
			if (r_Count_ones == 9)
				begin
					//chagning second display
					if (r_Count_tens == 9)
						r_Count_tens <= 0;
					else
						r_Count_tens <= r_Count_tens +1;
					
					r_Count_ones <= 0;
				end
			else
				r_Count_ones <= r_Count_ones+1;
			
			
		end

	end
	
	// Instantiate  Binary to 7-Segment Converter
	Binary_To_7Segment InstOnes
		(.i_Clk(i_Clk),
		 .i_Binary_Num(r_Count_ones),
		 .o_Segment_A(w_Segment2_A),
		 .o_Segment_B(w_Segment2_B),
		 .o_Segment_C(w_Segment2_C),
		 .o_Segment_D(w_Segment2_D),
		 .o_Segment_E(w_Segment2_E),
		 .o_Segment_F(w_Segment2_F),
		 .o_Segment_G(w_Segment2_G)
		 );
	Binary_To_7Segment InstTens
		(.i_Clk(i_Clk),
		 .i_Binary_Num(r_Count_tens),
		 .o_Segment_A(w_Segment1_A),
		 .o_Segment_B(w_Segment1_B),
		 .o_Segment_C(w_Segment1_C),
		 .o_Segment_D(w_Segment1_D),
		 .o_Segment_E(w_Segment1_E),
		 .o_Segment_F(w_Segment1_F),
		 .o_Segment_G(w_Segment1_G)
		 );
		 
	
	assign o_Segment2_A = ~w_Segment2_A;
	assign o_Segment2_B = ~w_Segment2_B;
	assign o_Segment2_C = ~w_Segment2_C;
	assign o_Segment2_D = ~w_Segment2_D;
	assign o_Segment2_E = ~w_Segment2_E;
	assign o_Segment2_F = ~w_Segment2_F;
	assign o_Segment2_G = ~w_Segment2_G;
	assign o_Segment1_A = ~w_Segment1_A;
	assign o_Segment1_B = ~w_Segment1_B;
	assign o_Segment1_C = ~w_Segment1_C;
	assign o_Segment1_D = ~w_Segment1_D;
	assign o_Segment1_E = ~w_Segment1_E;
	assign o_Segment1_F = ~w_Segment1_F;
	assign o_Segment1_G = ~w_Segment1_G;
	
	
endmodule // Prject_7_Segment_top