library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registar_1bit is
    port(
        input:in std_logic;
        clk:in std_logic;
        output:out std_logic
    );
end registar_1bit;
architecture Behavioral of registar_1bit is
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            output<=input;
        end if;
    end process;
end Behavioral;
