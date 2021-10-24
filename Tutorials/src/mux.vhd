entity mux is                   
  port (a, b, sel : in  bit;   
        o         : out bit);  
end mux;

architecture with_process of mux is
begin
  process (a, b, sel)
  begin  
    if sel = '1' then
        o <= a;
    elsif sel = '0' then
        o <= b;
    end if;
  end process;
end with_process;
