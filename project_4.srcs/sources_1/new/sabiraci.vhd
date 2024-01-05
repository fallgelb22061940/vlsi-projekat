library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
entity sabiraci is
    port(
        input:in std_logic_vector(103 downto 0);
        clk:in std_logic;
        output:out std_logic_vector(12 downto 0)
    );
end sabiraci;
architecture Behavioral of sabiraci is
    signal signal1:std_logic_vector(51 downto 0);
    signal signal2:std_logic_vector(25 downto 0);
    signal signal3:std_logic_vector(12 downto 0);
    signal signal4:std_logic_vector(12 downto 0);
    signal output_signal:std_logic_vector(12 downto 0);
begin
    sabiraci1:for i in 0 to 3 generate
        sabirac1:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>input((2*i+1)*13+12 downto (2*i+1)*13),
                ulaz2=>input(2*i*13+12 downto 2*i*13),
                izlaz=>signal1(i*13+12 downto i*13)
            );
     end generate;
     sabiraci2:for i in 0 to 1 generate
        sabirac2:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>signal1((2*i+1)*13+12 downto (2*i+1)*13),
                ulaz2=>signal1(2*i*13+12 downto 2*i*13),
                izlaz=>signal2(i*13+12 downto i*13)
            );
     end generate;
     sabiraci3:for i in 0 to 0 generate
        sabirac3:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>signal2((2*i+1)*13+12 downto (2*i+1)*13),
                ulaz2=>signal2(2*i*13+12 downto 2*i*13),
                izlaz=>signal3(i*13+12 downto i*13)
            );
     end generate;
     sabiraci4:for i in 0 to 0 generate
        sabirac4:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>signal3,
                ulaz2=>signal4,
                izlaz=>output_signal
            );
     end generate;
     registar:for i in 0 to 0 generate
        registar1:entity work.registar(Behavioral)
            port map(
                clk=>clk,
                output=>signal4,
                input=>output_signal
            );
     end generate;
     output<=output_signal;
end Behavioral;
