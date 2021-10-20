library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.types.all;
use work.functions.all;
use work.casts.all;

entity logbarrel is
	generic (	N     : natural := 32
          );
	port    (	a     : in  std_logic_vector(N-1       downto 0); -- input data word
            func  : in  std_logic_vector(  2       downto 0); -- ctrl word (000=>>, 001=<<, 010=*>, 011=<*, 100=>>>)
			      shamt : in  std_logic_vector(log2(N)-1 downto 0); -- shift amount
            y     : out std_logic_vector(N-1       downto 0)  -- output data word
          );
end;

architecture rtl1 of logbarrel is
	begin
		process(all)
      constant stage : natural := log2(N);                              -- number of stages
      variable rotr  : arr_of_slv(stage-1 downto 0)(N-1 downto 0);      -- rotated words
      variable mask  : arr_of_slv(    N-1 downto 0)(N-1 downto 0);      -- masks for all possible shifts
			variable sh    : std_logic_vector(shamt'range) := (others =>'0'); -- used as actual shift amount
			
		begin
  
      -- left or right shift
			if TODO then  
				sh := TODO 
			else
				sh := TODO
			end if;
      
      --  1st stage
			if TODO then	 -- shift if needed
				rotr(stage-1) := TODO
			else 
				rotr(stage-1) := TODO
			end if;	
  
      -- i-th stage 
			for i in TODO loop
				if TODO then    -- shift if needed
					rotr(i) := TODO
				else
					rotr(i) := TODO
				end if;	
			end loop;
            
      -- mask the rotated data if needed
			for i in 0 to N-1 loop
				case func is
					when TODO   => mask(i) := TODO -- right shift
					when TODO   => mask(i) := TODO -- left shift
					when TODO   => mask(i) := TODO -- rotate
					when others => mask(i) := TODO -- this case 101 should not occur
				end case; 
			end loop;	
      
      -- output masking
			y <=  TODO when TODO else         -- masking for arith. right shift
						TODO	                      -- masking for all other cases
		end process;
	
  end;