library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registar_8bit is
    port(
        input:in std_logic_vector(63 downto 0);
        clk:in std_logic;
        output:out std_logic_vector(63 downto 0)
    );
end registar_8bit;
architecture Behavioral of registar_8bit is
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            output<=input;
        end if;
    end process;
end Behavioral;
