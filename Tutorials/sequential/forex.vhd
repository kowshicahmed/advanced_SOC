--A Example of for loop
--For loop is the only loop that we can use for synthesizing
entity forex is
    port ( A_INT    : in integer range 0 to 7;
           B_VEC    : out bit_vector(7 downto 0));
end forex;

architecture BEHAV of forex is
begin
    process(A_INT)
    begin
        B_VEC <= "00000000"; --default assignment
        for I in 0 to A_INT loop
            B_VEC(I) <= '1';
        end loop;
    end process;
end BEHAV;