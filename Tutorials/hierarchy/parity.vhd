entity parity is
    port ( IN_VEC   : in bit_vector(7 downto 0);
           PAR_OUT  : out bit);
end parity;

architecture BEHAV of parity is
begin
    PAR_OUT <= IN_VEC(0) xor
               IN_VEC(1) xor
               IN_VEC(2) xor
               IN_VEC(3) xor
               IN_VEC(4) xor
               IN_VEC(5) xor
               IN_VEC(6) xor
               IN_VEC(7);
end BEHAV;