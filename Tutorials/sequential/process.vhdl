---------------------------------------------------------
--Example process of a mux and concurrent processes
---------------------------------------------------------
--mux is sensitive to (A,B,SEL)
MUX: process (A,B,SEL)  --the label MUX: is optional
begin   --sequential statements are put here
    if SEL = '1' then
        c <= A;
    else
        C <= B;
    end if;
end process MUX;    --signal assignment is made at the end of the process

--Multiple processes run concurrently
--MUX and ANOTHER_PROCESS will run concurrently if written in the same entity
ANOTHER_PROCESS: process (C)
begin
    if C = '1' then
        D <= '0';
    else
        D <= '1';
    end if;
end process ANOTHER_PROCESS


---------------------------------------------------------
--Example Asynchronous Dilemma
---------------------------------------------------------
process (A,B)
begin
    M <= A;
    N <= B;
end process;
--this is an asynchronous loop that we never want to do in harware
--couses an infinite loop
process (M,N)
begin
    A <= not M;
    B <= not N;
end;