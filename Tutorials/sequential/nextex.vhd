--Example of next
entity nextex is
    port ( A_INT    : in integer range 0 to 7;
           B_VEC    : out bit_vector(7 downto 0));
end nextex;

architecture BEHAV of nextex is
begin
    process (A_INT)
    begin
        B_VEC <= "00000000";
        for I in 0 to 7 loop
            --skips the bit number determined by A_INT to set
            next when I = A_INT;    
            B_VEC(I) <= '1';
        end loop;
    end process;
end BEHAV;