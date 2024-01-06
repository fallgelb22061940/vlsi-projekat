library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity klamper is
    port(
        input:in std_logic_vector(12 downto 0);
        output:out std_logic_vector(12 downto 0)
    );
end klamper;
architecture Behavioral of klamper is
begin
    process(input)is
    begin
        if unsigned(input) > 255 then
            output <= std_logic_vector(to_unsigned(255, input'length));
        else
            output<=input;
        end if;
    end process;
end Behavioral;
