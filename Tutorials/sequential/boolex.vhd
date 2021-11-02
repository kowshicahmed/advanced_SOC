--Example of boolean type
entity boolex is
    port ( A     : in integer range 0 to 7;
           B     : in integer range 0 to 7;
           C     : out boolean );
end boolex;

architecture BEHAV of boolex is
begin
    c <= A >= B;    --c gets A greater than or equal B (T or F)
end BEHAV;