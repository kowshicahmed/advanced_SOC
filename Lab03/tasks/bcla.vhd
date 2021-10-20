
library IEEE;
use IEEE.std_logic_1164.all;
use work.types.all;

entity bcla is -- blockwise carry-lookahead adder
  generic ( N     : natural := 32;
            blocks: natural := 4);  
  port    ( a, b  : in  std_logic_vector(N-1 downto 0); 
            ci    : in  std_logic;
            s     : out std_logic_vector(N-1 downto 0); 
            co    : out std_logic);
end;

architecture structural of bcla is
  constant bits     : natural := N/blocks;  -- number of bits per block
  signal ai,bi      : arr_of_slv      (blocks-1 downto 0)(bits-1 downto 0); -- internal blockwise a, b signal
  signal c          : std_logic_vector(blocks   downto 0);                  -- carry signal vector
  signal p, g       : std_logic_vector(blocks-1 downto 0);                  -- propagate, generate signal vector
begin

  c(0) <= -- TODO

  bl: for i in 0 to blocks-1 generate
    ai(i)   <= -- TODO
    bi(i)   <= -- TODO
    adder_inst: entity work.clpga 
                generic map(bits)
                port    map( -- TODO
    c(i+1)  <= -- TODO 
  end generate;  
  
  co   <= -- TODO 

end;  