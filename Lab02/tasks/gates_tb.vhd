library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.casts.all;

entity gates_tb is 
end;

architecture asserttest of gates_tb is              
  signal a, b       : std_logic;
  signal y1, y2     : std_logic_vector(6 downto 0);
  
begin

  gates_1: entity work.gates(slice)        port map (a, b, y1);
  -- YOUR INSTANTIATION HERE

  process
  begin
    
    for i in 0 to 1 loop
      if i=0 then a <= '0';
             else a <= '1';
      end if;       
      for j in 0 to 1 loop
        if j=0 then b <= '0';
               else b <= '1';
        end if;       
        wait for 10 ns;

        -- YOUR ASSERT STATEMENT HERE
          report -- YOUR MODIFACTIONS FOR THE ERROR MESSAGE HERE IN THIS REPORT STATEMENT
                "(a,b)=(" 
                 & std_logic'image(a) & "," 
                 & std_logic'image(b) & "):"
                 & to_string(y1); 
      end loop;  
    end loop;  
    wait;
  end process;

end;