library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usmult is 
  generic (N: natural := 4);
  port (
    a : in  std_logic_vector(  N-1 downto 0);
    b : in  std_logic_vector(  N-1 downto 0);
    u : in  std_logic;
    p : out std_logic_vector(2*N-1 downto 0)
  );
end;

architecture rtl of usmult is
  signal prod  : signed(2*N+1 downto 0);
  signal ai, bi: std_logic_vector(N downto 0);
begin 
  process(all)
  begin

    ai   <= -- internal a signal
    bi   <= -- internal b signal

    prod <= -- internal product
    p    <= -- output product
  end process; 

end;

-- N     :         8          16          32          64         
-- Area  :
-- Fmax  :
-- Power :