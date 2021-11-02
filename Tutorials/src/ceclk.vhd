--Clock Enable Alternative in VHDL

entity ceclk is
    port ( DATA     : in bit;
           Enable   : in bit;
           CLK      : in bit;
           RESET_F  : in bit;
           DATA_OUT : out bit
         );
end ceclk;

architecture RTL of ceclk is
    signal I_DATA : bit;
begin
    DATA_OUT <= I_DATA;
process (CLK, RESET_F)
begin
    if RESET_F = '0' then
        I_DATA <= '0';
    elsif CLK'event and CLK = '1' then
        if ENABLE = '1' then
            I_DATA <= DATA;
        else
            I_DATA <= I_DATA;
        end if;
    end if;
end process;
end RTL;
