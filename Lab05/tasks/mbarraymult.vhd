library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;
use work.casts.all;

entity mbarraymult is  -- modified booth carry-ripple adder array multiplier
  generic (N: natural := 32);
  port (
    a : in  std_logic_vector(  N-1 downto 0);
    b : in  std_logic_vector(  N-1 downto 0);  -- multiplier a, muliplicand b
    p : out std_logic_vector(2*N-1 downto 0)   -- product
  );
end;

architecture rtl of mbarraymult is 

  procedure cra (a,b : in std_logic_vector; ci : in std_logic; s: out std_logic_vector) is  -- carry-ripple adder
    constant n : natural := a'length;
    variable c : std_logic_vector(n downto 0);
  begin  
    c(0) := ci;
    for j in 0 to n-1 loop
      c(j+1) := (a(j) and b(j)) or ((a(j) or b(j)) and c(j));
    end loop;
    s   := c(n) & (a xor b xor c(n-1 downto 0));
  end; 

  procedure boothr4 (a, b: in std_logic_vector; pp: out arr_of_slv; cv: out std_logic_vector) is -- booth radix 4 partial product generation
    constant N  : natural := a'length;
    variable bi : std_logic_vector(N downto 0);
    variable p  : std_logic_vector(2 downto 0);
    variable e  : std_logic;
  begin
    bi := b & '0';                   -- extend the multiplicand with '0' at the 

    cv := (2*N-1 downto 0 => '0');   -- initialize the correction vector. (see the second figure on page 17)
                                     -- this vector will store all s-bits for the additional ones 
                                     -- when negating a partial product is required 

    for i in 0 to N/2-1 loop         -- calculating the 3 preceding bits of the partial products (see the second figure on page 17)
      if bi(2+2*i downto 2*i) = "000" or bi(2+2*i downto 2*i) = "111" or (bi(2+2*i) = a(N-1)) then
        e := '0'; 
      else 
        e:= '1'; 
      end if; 
      if e = '0' then
        if    i=0     then p:= "...";   -- fill in the correct bitstrings
        elsif i=N/2-1 then p:= "...";
        else               p:= "...";
        end if; 
      else
        if    i=0     then p:= "..."; 
        elsif i=N/2-1 then p:= "...";
        else               p:= "...";
        end if; 
      end if;
       
      case bi(2+2*i downto 2*i) is     -- calculate the i-th partial product and the correction vector entries
        when "001" | "010" => pp(i)   := ...
        when "011"         => pp(i)   := ...  
        when "100"         => pp(i)   := ...
                              cv(1+2*i downto 2*i) := ... 
        when "101" | "110" => pp(i)   := ...
                              cv(1+2*i downto 2*i) := ... 
        when others        => pp(i)	  := ...		  
      end case;
      --report strs(i) & strs(pp(i)) & str(e);  -- for debugging
    end loop;  
  end;    

begin  

  process(all)
    variable pp     : arr_of_slv (N/2-1 downto 0)(  N+3 downto 0); 
    variable sum    : arr_of_slv (N/2-1 downto 0)(2*N-1 downto 0);
    variable ai, bi : std_logic_vector           (2*N-1 downto 0);
    variable cv     : std_logic_vector           (2*N-1 downto 0);
  begin

    boothr4(a,b,pp,cv);        -- generate partial products and the correction vector
    --report "cv:" & str(cv);  -- for debugging

    sum(0) :=                  -- first row - extended partial product 0 
    --report "sum0:" & str(sum(0));
    for i in 1 to N/2-2  loop  -- adder array
      ai :=                    -- 1st adder argument 
      bi :=                    -- 2nd adder argument
      sum(i) :=                -- i-th sum (accumulate partial product)  
      --report "sumi:" & str(sum(i));
    end loop; 
    -- last row adder (CPA)    
    ai :=                      -- 1st operand
    bi :=                      -- 2nd operand
    sum(N/2-1) :=              -- last accumulated partial product
    --report "sumN/2-1:" & str(sum(N/2-1));
    p <=                       -- adding the s-bits stored in the correction vector to the accumulated partial product
    --report "p:" & strs(p) & str(to_sint(p));

  end process;  

end;