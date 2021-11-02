--Alternative Asynch Reset in VHDL
entity arclk is
    port ( CLK      : in bit;
           RESET_F  : in bit;
           COUNT    : out integer
         );
end arclk;

architecture RTL of ARCLK is
    signal I_COUNT : integer;
begin
    COUNT <= I_COUNT;
process (CLK, RESET_F)
begin
    if RESET_F = '0' then
        I_COUNT <= 0;
    elsif CLK'event and CLK = '1' then
        if I_COUNT <= 7 then
            I_COUNT <= I_COUNT + 1;
        else
            I_COUNT <= 0;
        end if;
    end if;
end process;
end RTL;