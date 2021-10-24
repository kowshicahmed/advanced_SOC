entity tempmux is
    port ( CURRENT_TEMP     : in bit_vector(6 downto 0);
           DESIRED_TEMP     : in bit_vector(6 downto 0);
           DISPLAY_SELECT   : in bit;
           COOL             : in bit;
           HEAT             : in bit;
           A_C_ON           : out bit;
           FURNACE_ON       : out bit;
           TEMP_DISPLAY     : out bit_vector(6 downto 0)
    );
end tempmux;

architecture RTL of tempmux is
    begin
        DISPLAY: process(DISPLAY_SELECT, CURRENT_TEMP, DESIRED_TEMP)
        begin
            if DISPLAY_SELECT = '1' then
                TEMP_DISPLAY <= CURRENT_TEMP;
            else
                TEMP_DISPLAY <= DESIRED_TEMP;
            end if;
        end process;

        THERMOSTAT: process(COOL, HEAT, DESIRED_TEMP)
        begin
            if COOL = '1' and CURRENT_TEMP > DESIRED_TEMP then
                A_C_ON <= '1';
            elsif HEAT = '1' and CURRENT_TEMP < DESIRED_TEMP then
                FURNACE_ON <= '1';
            else
                A_C_ON <= '0';
                FURNACE_ON <= '0';
            end if;
        end process;
    end RTL;