library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registar_13bit is
    port(
        input:in std_logic_vector(12 downto 0);
        clk:in std_logic;
        output:out std_logic_vector(12 downto 0)
    );
end registar_13bit;
architecture Behavioral of registar_13bit is
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            output<=input;
        end if;
    end process;
end Behavioral;
