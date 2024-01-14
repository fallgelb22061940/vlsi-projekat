library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
entity brojaci is
    port(
        input:in std_logic_vector(103 downto 0);
        clk:in std_logic;
        hist_start:in std_logic;
        address:in std_logic_vector(63 downto 0);
        output:out std_logic_vector(103 downto 0)
    );
end brojaci;
architecture Behavioral of brojaci is
begin
    counter:for i in 0 to 7 generate
        brojac:entity work.inkrementer(Behavioral) port map(
            input=>input(13*i + 12 downto 13*i),
            output=>output(13*i + 12 downto 13*i),
            clk=>clk,
            hist_start=>hist_start,
            address=>address(8*i+7 downto 8*i)
        );
    end generate;
end Behavioral;
