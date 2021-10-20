library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;
use work.casts.all;
use ieee.std_logic_unsigned.all;

entity usmbwarraymult is  -- unsigned / signed modified baugh wooley array
  generic (N: natural := 4);
  port (
    a, b : in  std_logic_vector(  N-1 downto 0);                    -- multiplier a, muliplicand b
    u    : in  std_logic;                                           -- unsigned = '1' / signed = '0'
    p    : out std_logic_vector(2*N-1 downto 0)                     -- product
  );
end;

architecture rtl of usmbwarraymult is  -- modified baugh wooley array multiplier
begin

  process(all)
    variable pp : arr_of_slv (N-1 downto 0)(N downto 0); 
    variable s  : std_logic; 
  begin
    
    s       := not u;      -- indicates signed operation, has historical reason 
    pp(0)   :=             -- calculate partial product 0  
    p(0)    <=             -- product bit 0
    pp(1)   :=             -- calculate 1st partial product 1 and add the partial product to it
    p(1)    <=             -- product bit 1 

    for i in 2 to N-2 loop -- array of adders 
      pp(i) :=             -- calculate i-th partial product and add the i-th partial product to it
      p(i)  <=             -- i-th product bit
    end loop;

    pp(N-1) :=             -- calculate (N-1)-th partial product and add the (N-2)-th partial product to it
    p(2*N-1 downto N-1) <= -- upper product bits                  

  end process;  

end;

