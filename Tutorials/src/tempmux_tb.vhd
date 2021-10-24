entity tempmux_tb is 
    
end tempmux_tb;

architecture TEST of tempmux_tb is
component tempmux
    port ( CURRENT_TEMP     : in bit_vector(6 downto 0);
           DESIRED_TEMP     : in bit_vector(6 downto 0);
           DISPLAY_SELECT   : in bit;
           COOL             : in bit;
           HEAT             : in bit;
           A_C_ON           : out bit;
           FURNACE_ON       : out bit;
           TEMP_DISPLAY     : out bit_vector(6 downto 0)
         );
end component;

signal CURRENT_TEMP, DESIRED_TEMP : bit_vector (6 downto 0);
signal TEMP_DISPLAY : bit_vector (6 downto 0);
signal A_C_ON : bit;
signal FURNACE_ON : bit;
signal DISPLAY_SELECT : bit;
signal COOL : bit;
signal HEAT : bit;

begin
    UUT: entity work.tempmux(RTL) port map (
                            CURRENT_TEMP => CURRENT_TEMP,
                            DESIRED_TEMP => DESIRED_TEMP,
                            DISPLAY_SELECT => DISPLAY_SELECT,
                            COOL => COOL,
                            HEAT => HEAT,
                            A_C_ON => A_C_ON,
                            FURNACE_ON => FURNACE_ON,
                            TEMP_DISPLAY => TEMP_DISPLAY);
    
    process
    begin
        CURRENT_TEMP <= "0000000";
        DESIRED_TEMP <= "1111111";
        DISPLAY_SELECT <= '0';
        wait for 10 ns;
        DISPLAY_SELECT <= '1';
        wait for 10 ns;
        HEAT <= '1';
        COOL <= '0';
        wait for 10 ns;

        CURRENT_TEMP <= "1111111";
        DESIRED_TEMP <= "0000000";
        wait for 10 ns;
        COOL <= '1';
        HEAT <= '0';
        wait for 10 ns;

        CURRENT_TEMP <= "1111111";
        DESIRED_TEMP <= "0000000";
        wait for 10 ns;
        COOL <= '0';
        HEAT <= '1';
        wait for 10 ns;

        CURRENT_TEMP <= "0000000";
        DESIRED_TEMP <= "1111111";
        wait for 10 ns;
        COOL <= '1';
        HEAT <= '0';
        wait for 10 ns;
        wait;
    end process;
end;
