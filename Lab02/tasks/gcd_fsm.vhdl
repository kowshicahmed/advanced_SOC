library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_fsm is
  generic (N: natural := 32);                   
  port (clk, rst: in  std_logic;
        start   : in  std_logic;
        a, b    : in  unsigned(N-1 downto 0);
        busy    : out std_logic;   
        o       : out unsigned(N-1 downto 0));  
end;

architecture rtl of gcd_fsm is
  type statetype is (-- DEFINE YOUR STATES HERE);  
  signal state: statetype;
  signal x, y : unsigned(N-1 downto 0) := (others=> '0');

begin

  transition_logic: process(clk) 
  begin
    if rst = '1' then
      state <= -- YOUR START STATE HERE;
      busy  <= -- BUSY VALUE AFTER RESET
    elsif rising_edge(clk) then  -- 1-PROCESS FINITE STATE MACHINE
      case state is
        -- DEFINE YOUR STATES HERE AND ALL THE "LOGIC" HERE
      end case;
    end if;  
  end process;

  o <= x;

end;

-- SLACK:
-- CHIP AREA:
-- TOTAL POWER DISSIPATION:

