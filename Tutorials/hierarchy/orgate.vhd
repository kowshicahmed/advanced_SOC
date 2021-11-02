entity orgate is
    port ( A    : in bit;
           B    : in bit;
           C    : out bit );
end orgate;

architecture BEHAV of orgate is
begin
    C <= A or B;
end BEHAV;