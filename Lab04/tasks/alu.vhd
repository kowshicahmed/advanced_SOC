library IEEE; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.types.all;
use work.functions.all;
use work.records.all;
use work.casts.all;

entity alu is
  generic ( N: integer := 32);
  port    ( a, b      : in  std_logic_vector(N-1 downto 0);  -- input operands a and b
            ci        : in  std_logic;                       -- carry-input
            ctrl      : in  std_logic_vector(  1 downto 0);  -- control word selects operation (+|-|^|v)
            result    : out std_logic_vector(N-1 downto 0);  -- output result 
            flags     : buffer flagType                      -- output flags (Z, N, V, C, LT, LE, GT, GE)
          );
end;

architecture rtl of alu is
  constant zero : std_logic_vector(N-1 downto 0) := (others => '0'); -- defining a constant  zero
  signal   bi   : std_logic_vector(N-1 downto 0) := (others => '0'); -- internal b operand
  signal   sum  : std_logic_vector(N   downto 0);                    -- sum output signal from adder

  

begin

  add_inst: entity work.add generic map (N)    -- adder instantiation
                            port    map ( TODO );
  
  process(all)
  begin
     
    bi       <= TODO                 -- internal b operand, depends on operation
    
    result   <= TODO when TODO else  -- result output of the alu
                TODO when TODO else
                TODO
    -- Flags
    flags.z  <= TODO
    flags.c  <= TODO
    flags.n  <= TODO
    flags.v  <= TODO
    flags.lt <= TODO
    flags.le <= TODO
    flags.gt <= TODO
    flags.ge <= TODO
  end process;

end;

--     5  = 0101      5  = 00101    (-5) = 01011    (-5) = 1011      3  = 0011     (-6) = 01010 
-- - (-3) = 0011    - 3  = 01101   -  3  = 01101  - (-3) = 0011  - (-5) = 0101    -  3  = 01101 
--     c    1110      c  = 11010      c  = 11110      c  = 0110      c  = 1110       c  = 10000 
-- -------------    ------------   -------------  -------------  -------------    ------------- 
--     8  = 1000      2  = 10010     -8  = 11000     -2  = 1110      8  = 1000      -9  = 10111 
--  ZNVC  = 0110    ZNVC =  0001    ZNVC =  0101    ZNVC = 0100    ZNVC = 0110     ZNVC =  0011



