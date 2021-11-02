--Conditional signal Assignment Example
entity condex is
    port ( A_INT    : in integer range 0 to 3;
           B_VEC    : out bit_vector(3 downto 0));
end condex;

architecture BEHAV of condex is
begin
    --this assigment also describes priority mux
    --this is same as an if else statement
    B_VEC <= "0001" when A_INT = 0 else     --highest priority
             "0010" when A_INT = 1 else
             "0100" when A_INT = 2 else
             "1000";                        --default
end BEHAV;