--Structure of a case statement
case A_INT is                   --Expression tested
    when 0 to 3 =>              --Choices
        B_VEC <= "00000001";    --Sequential Statements
    when 4 | 5 =>
        B_VEC <= "00010000";
    when others =>              --Default
        B_VEC <= "00000000";
end case;
--note the special 'or' symbols in case of case
--we can only use 'to' with integers or other numeric types but not vectors
