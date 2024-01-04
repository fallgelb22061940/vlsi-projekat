library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
entity brojaci is
    port(
        input:in std_logic_vector(103 downto 0);
        output:out std_logic_vector(103 downto 0)
    );
end brojaci;
architecture Behavioral of brojaci is
begin
    counter:for i in 0 to 7 generate
        brojac:entity work.brojac(Behavioral)
            port map(
                input=>input(13*i + 12 downto 13*i),
                output=>output(13*i + 12 downto 13*i)
            );
    end generate;
end Behavioral;
