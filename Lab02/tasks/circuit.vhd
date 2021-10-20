
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is
    generic (N : natural := 8);
    port (  clk    :in  std_logic;                       
            reset  :in  std_logic;                        
            enable :in  std_logic;                        
            o      :out std_logic_vector (N-1 downto 0)   
    );
end entity;

-- non generic version

architecture rtl of circuit is
    signal count :unsigned (7 downto 0);
begin
    process (clk, reset) begin
        if (reset = '1') then
            count <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= count + 1;
            end if;
        end if;
    end process;
    o <= (count(7) & 
            (count(7) xor count(6)) & 
            (count(6) xor count(5)) & 
            (count(5) xor count(4)) & 
            (count(4) xor count(3)) & 
            (count(3) xor count(2)) & 
            (count(2) xor count(1)) & 
            (count(1) xor count(0)) ); 
end architecture;

architecture withfunc of circuit is
    signal x : unsigned(N-1 downto 0);
  
    function f (v: unsigned) return std_logic_vector is
      -- YOUR FUNCTION IMPLEMENTATION HERE
    end function; 
  
  begin
  
    counter:
    x <= (others=>'0') when reset = '1' else
    x + 1              when rising_edge(clk) and enable = '1';
   
    o <= f(x);
  
  end;
  
  architecture withprocess of circuit is
    signal x : unsigned(N-1 downto 0);
  
  begin

    counter:
    x <= (others=>'0') when reset = '1' else
    x + 1              when rising_edge(clk) and enable = '1';
  
    process (x, clk, reset)
      -- YOUR PROCESS IMPLEMENTATION HERE
    end process;   
  end;
  
  architecture withgenerate of circuit is
    
    signal x : unsigned(N-1 downto 0);
  
  begin
  
    counter:
    x <= (others=>'0') when reset = '1' else
         x + 1         when rising_edge(clk) and enable = '1';
  
    -- YOUR GENERATE IMPLEMENTATION HERE
  
  end;
