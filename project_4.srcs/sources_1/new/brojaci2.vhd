library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
entity brojaci is
    port(
        input:in std_logic_vector(103 downto 0);
        output:out std_logic_vector(103 downto 0);
        hist_complete:out std_logic:='0';
        clk:in std_logic
    );
end brojaci;
architecture Behavioral of brojaci is
    signal counting:unsigned(12 downto 0);
begin
    count:process(clk)is
    begin
        if rising_edge(clk)then
            if counting=8191 then
                counting<=counting;
                hist_complete<='1';
            else
                counting<=counting+1;
            end if;
        end if;
    end process count;
    counter:for i in 0 to 7 generate
        brojac:entity work.brojac(Behavioral)
            port map(
                input=>input(13*i + 12 downto 13*i),
                output=>output(13*i + 12 downto 13*i)
            );
    end generate;
end Behavioral;
