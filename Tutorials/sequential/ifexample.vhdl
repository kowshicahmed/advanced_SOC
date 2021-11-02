--An Example of if else statement
--If-else statements will be synthesized as priority mux
--A single if statement can create a latch which should be avoided
--We can use default assignment if we need only one if statement
architecture BEHAV of ifexample is
begin
    process(X_INT)
    begin
        if X_INT < 5 then
            Y_BOOL <= TRUE;
            Z_INT <= 1;
        elsif X_INT < 7 then
            Y_BOOL <= TRUE;
            Z_INT <= 44;
        else
            Y_BOOL <= FALSE;
            Z_INT <= 0;
        end if;
    end process;
end BEHAV;

--Another example
if X_INT = 25 and Y_BIT = '1' then  --highest priority
    M_VEC <= "1010";
    K_INT <= 100;
elsif Y_BIT = '1' then
    M_VEC <= "0000";
    K_INT <= 0;
else
    M_VEC <= "1111";
    K_INT <= 500;
end if;

--default assignment
M_VEC <= "1111";    --default assignment
if X_INT = 25 then
    M_VEC <= "1010";
end if;
