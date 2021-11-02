--An example for integer type
--Integer is like an array of bits
--IEEE 32 bit integer range: -2^32-1 to +2^31-1
--It is a good idea to add range to integers to specify the bit
entity intex is
    port ( A    : in integer range 0 to 7;
           B    : in integer range 0 to 7;
           C    : out bit );
end intex;

architecture BEHAV of INTEX is
begin
    process (A,B)
    begin
        if A > B then
            C <= '1';
        else
            C <= '0';
        end if;
    end process;
end BEHAV;
