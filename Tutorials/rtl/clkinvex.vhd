--Falling edge clock example
entity clkinvex is
    port ( D    : in bit;
           clk  : in bit;
           Q    : out bit );
end clkinvex;

architecture RTL of clkinvex is
    signal CLK_INVERSE : bit;
begin
    CLK_INVERSE <= not clk;
    process
    begin
        if CLK_INVERSE'event and CLK_INVERSE = '1' then
            Q <= D;
        end if;
    end process;
end RTL;