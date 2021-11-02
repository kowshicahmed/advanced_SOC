--Example of literal Assignment
entity litass is
    port ( A_BIT    : out bit;
           B_VEC    : out bit_vector(7 downto 0);
           C_INT    : out integer;
           D_BOOL   : out boolean );
end litass;

architecture BEHAV of litass is
begin
    A_BIT <= '1';
    B_VEC <= "10001010"; --vectors are compared bit by bit from left to right
    C_INT <= 15;
    D_BOOL <= TRUE;
end BEHAV;