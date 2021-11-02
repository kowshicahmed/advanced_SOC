--Signal Clocking Alternative in VDHL

entity sigclk is
    port ( DATA_BUS         : in bit_vector(15 downto 0);
           DATA_STROBE      : in bit;
           CLK              : in bit;
           RESET_F          : in bit;
           REGISTERED_DATA  : out bit_vector(15 downto 0)  
         );
end sigclk;

architecture RTL of sigclk is
    signal I_REG_DATA : bit_vector(15 downto 0);
begin
    REGISTERED_DATA <= I_REG_DATA;
process(CLK, RESET_F)
begin
    if RESET_F = '0' then
        I_REG_DATA <= (others => '0');
    elsif CLK'event and CLK = '1' then
        if DATA_STROBE = '1' then
            I_REG_DATA <= DATA_BUS;
        else
            I_REG_DATA <= I_REG_DATA;
        end if;
    end if;
end process;
end RTL;