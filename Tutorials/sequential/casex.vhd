--An Example of case statement
--Case Statement can be used where there is no priority
--Case statement is also sequential like if statement
--So it should be placed inside a process
--Case statement will synthesize into a normal mux
entity casex is
    port ( A_INT    : in integer range 0 to 7;
           B_VEC    : out bit_vector(7 downto 0));
end casex;

architecture BEHAV of casex is
begin
    process (A_INT)
    begin
        case A_INT is
            when 0 =>
                B_VEC <= "00000001";
            when 1 =>
                B_VEC <= "00000010";
            when others =>
                B_VEC <= "00000000";
        end case;
    end process;
end BEHAV;