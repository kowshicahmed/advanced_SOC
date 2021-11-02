--An example of Aggregation
entity aggex is
    port ( A_BIT    : in bit;
           B_BIT    : in bit;
           C_BIT    : in bit;
           X_VEC    : out bit_vector(3 downto 0);
           Y_VEC    : out bit_vector(7 downto 0));
end aggex;

architecture BEHAV of aggex is
begin
    X_VEC <= (A_BIT, B_BIT, C_BIT, '0'); --A_BIT goes to index 3, B_BIT to index 2 so on
    Y_VEC <= (1 => A_BIT, 5 => B_BIT, 6 => '1', others => '0'); --A_BIT at index 1
    Y_VEC <= (others => '0'); --All the bits of Y_VEC gets 0
end BEHAV;