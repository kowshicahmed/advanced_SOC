library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;
use work.casts.all;
use ieee.std_logic_unsigned.all;

entity csaarraymult is  -- carry-save adder array multiplier
  generic (N: natural := 32);
  port (
    a : in  std_logic_vector(  N-1 downto 0);                    -- multiplier a
    b : in  std_logic_vector(  N-1 downto 0);                    -- muliplicand b
    p : out std_logic_vector(2*N-1 downto 0)                     -- product
  );
end;

architecture rtl of csaarraymult is 

  procedure csa (a, b, ci : in std_logic_vector; co, s: out std_logic_vector) is          -- full adder
    constant n : natural := a'length;
  begin  
    co := (a and b) or (a and ci) or (b and ci);
    s  := a xor b xor ci;
  end; 

  procedure cra (a,b : in std_logic_vector; ci : in std_logic; s: out std_logic_vector) is -- carry-ripple adder
    constant n : natural := a'length;
    variable c : std_logic_vector(n downto 0);
  begin  
    c(0) := ci;
    for j in 0 to n-1 loop
      c(j+1) := (a(j) and b(j)) or ((a(j) or b(j)) and c(j));
    end loop;
    s   := c(n) & (a xor b xor c(n-1 downto 0));
  end; 

begin  

  process(all)
    variable pp        : arr_of_slv (N-1 downto 0)(N-1 downto 0);   -- partial products
    variable s, co     : arr_of_slv (N-1 downto 2)(N-1 downto 0);   -- sums and carry-outs per row
    variable ai, bi, ci: std_logic_vector         (N-1 downto 0);   -- internal a, b, carrys
    variable sum       : std_logic_vector         (N   downto 0);   -- internal sum
  begin
    
    for i in 0 to N-1 loop                        
      pp(i) :=              -- generate partial products
    end loop;

    ai   :=                 -- 1th operand of csa, use of partial product 0
    bi   :=                 -- 2nd operand of csa, use of partial product 1
    ci   :=                 -- 3rd operand of csa, use of partial product 2
 
    csa(ai, bi, ci, ... );  -- first row of carry-save adder

    p(0) <=                 -- product bit 0
    p(1) <=                 -- product bit 1

    for j in 3 to N-1 loop  -- partial product reduction array
      ai :=                 -- 1st operand 
      bi :=                 -- 2nd operand
      ci :=                 -- 3rd operand
      csa(ai, bi, ci,...);  -- carry save adder 
      p(j-1) <=             -- product bit
    end loop;  

    ai   :=                 -- 1st operand
    bi   :=                 -- 2nd operand 
    cra(ai,bi,...);         -- last row: cpa adder (carry-ripple adder)
    p(2*N-1 downto N-1) <=  -- upper product bits

  end process;  

end;

