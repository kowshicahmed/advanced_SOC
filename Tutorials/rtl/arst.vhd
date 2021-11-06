--Aynchronous reset example
entity arst is
    port ( D        : in bit;
           clk      : in bit;
           RESET    : in bit;
           Q        : out bit);
end arst;

architecture RTL of arst is
begin
    --activelow reset
    process (clk, RESET)
    begin
        if RESET = '0' then --reset has priority over clk
            Q <= '0';
        elsif clk'event and clk = '1' then
            Q <= D;
        end if;
    end process;
end RTL;
    