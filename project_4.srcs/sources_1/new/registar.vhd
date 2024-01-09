library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registar is
    port(
        input:in std_logic_vector(16 downto 0):=(others=>'0');
        output:out std_logic_vector(16 downto 0):=(others=>'0');
        clk:in std_logic
    );
end registar;
architecture Behavioral of registar is
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            output<=input;
        end if;
    end process;
end Behavioral;
