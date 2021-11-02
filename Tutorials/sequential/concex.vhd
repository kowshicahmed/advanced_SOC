--An Example of concatenation
entity concex is
    port ( A_BIT    : in bit;
           B_BIT    : in bit;
           C_BIT    : in bit;
           X_VEC    : out bit_vector(3 downto 0);
           Y_VEC    : out bit_vector(7 downto 0));
end concex;

architecture BEHAV of concex is
begin
    --concatenation is positional
    --Both sides must be of same size
    --Signals can be concatenated with literals
    --Signal types must match or be closely related
    
    X_VEC <= A_BIT & B_BIT & C_BIT & '0';
    --bit 6 gets 1, 5 gets B_BIT, bits 4,3,2 gets 0,
    Y_VEC <= "01" & B_BIT & "000" & A_BIT & '0';
end BEHAV;