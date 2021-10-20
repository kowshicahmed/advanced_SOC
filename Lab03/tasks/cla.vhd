library ieee;
use ieee.std_logic_1164.all;

entity cla is  -- carry-lookahead adder
  generic (N: natural := 32);
  port (
    a,b : in  std_logic_vector(N-1 downto 0);
    ci  : in  std_logic;
    s   : out std_logic_vector(N-1 downto 0);
    co  : out std_logic
  );
end;

architecture rtl of cla is

  signal  p, g, Pr, Ge : std_logic_vector(N-1 downto 0); -- bitwise and groupwise propagate and generate signal vector
  signal  c            : std_logic_vector(N   downto 0); -- carry signall vector

begin

  process(all)
  begin
    ------- Computation of g and p (bitwise):
    p <= -- TODO
    g <= -- TODO
    ------- Computation of Ge and Pr group carry logic:
    Pr(0) <= -- TODO
    Ge(0) <= -- TODO
    c(0)  <= -- TODO
    c(1)  <= -- TODO
    for i in 1 to N-1 loop
      Pr(i)  <= -- TODO
      Ge(i)  <= -- TODO
      c(i+1) <= -- TODO
    end loop; 
    ------- Computation of sum and carry-out:
    s  <= -- TODO
    co <= -- TODO
  end process;  

end architecture;