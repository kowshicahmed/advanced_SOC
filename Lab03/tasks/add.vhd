library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add is 
  generic (N: integer := 8);  
  port( a, b : in  std_logic_vector(N-1 downto 0); 
        ci   : in  std_logic;
        s    : out std_logic_vector(N-1 downto 0); 
        co   : out std_logic
      );
end;

architecture withplus of add is
  signal sum: std_logic_vector(N downto 0);  
begin

  sum <= -- TODO
  s   <= -- TODO
  co  <= -- TODO

end;  
