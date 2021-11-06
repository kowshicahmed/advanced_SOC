--Signal clocking alternative in VHDL
entity sigclk is
    port ( DATA_BUS         : in bit_vector(15 downto 0);
           DATA_STROBE      : in bit;
           clk              : in bit;
           RESET_F          : in bit;
           REGISTERED_DATA  : out bit_vector (15 downto 0) );
end sigclk;

architecture RTL of 