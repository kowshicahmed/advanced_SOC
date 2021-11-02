--An Example of Selected Signal Assignment
entity selex is
    port ( B_VEC    : in bit_vector(3 downto 0);
           A_INT    : out integer range 0 to 3 );
end selex;

architecture BEHAV of selex is
begin
    --this will synthesize as a normal mux
    --this is same as a case statement
    with B_VEC select 
        A_INT <= 0 when "0001",
                 1 when "0010",
                 2 when "0100",
                 3 when "1000",
                 0 when others;

end BEHAV;