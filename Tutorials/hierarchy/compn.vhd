entity compn is
    port ( X_VEC    : in bit_vector(7 downto 0);
           Y_VEC    : in bit_vector(7 downto 0);
           Z_PAR    : out bit);
end compn;

architecture BEHAV of compn is
    component orgate
        port ( A    : in bit;
               B    : in bit;
               C    : out bit );
    end component;

    component parity
        port ( IN_VEC   : in bit_vector(7 downto 0);
               PAR_OUT  : out bit);
    end component;

    signal PARITY1, PARITY2 : bit;
begin
    U1: parity port map ( IN_VEC => X_VEC,
                          PAR_OUT => PARITY1);
    U2: parity port map ( IN_VEC => Y_VEC,
                          PAR_OUT => PARITY2);
    U3: orgate port map ( A => PARITY1,
                          B => PARITY2,
                          C => Z_PAR);
end BEHAV;