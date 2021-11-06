--Example of a clocked process with the event attribute
--The event attribute is true when the parameter value has changed
process(clk)
begin
    if clk'event and clk = '1' then
        Q <= D;
    end if;
end process;

--Same example using rising_edge function
process (clk)
begin
    if rising_edge(clk) then
        Q <= D;
    end if;
end process;

--very old style, not used anymore
process
begin
    wait until clk'event and clk = '1';
    Q <= D;
end process;

--Register synthesis
process(clk)
begin
    --A flipflop will be synthesized for all the assignments
    if clk'event and clk = '1' then
        Q <= D;
        OUT_PUT <= '1';
        RESULT <= X;
    end if;
end process;