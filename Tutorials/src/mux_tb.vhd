entity mux_tb is 
    
end;

architecture with_process of mux_tb is
  signal a:   bit := '1';
  signal b:   bit := '0';
  signal sel: bit := '0';
  signal o: bit;
begin

  mux_inst: entity work.mux(with_process) port map (a,b,sel,o);
  
  process begin
    --wait on o;
    wait for 1 us;
    --sel <= '0';
    report "mux(" & bit'image(a) & "," 
                  & bit'image(b) & "," 
                  & bit'image(sel) & ") = " & bit'image(o);
  end process;  
end;
