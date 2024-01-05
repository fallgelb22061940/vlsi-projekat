library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
entity sabiraci is
    port(
        input:in std_logic_vector(103 downto 0);
        clk:in std_logic;
        output:out std_logic_vector(16 downto 0);
        kum_complete:out std_logic;
        start_kum:in std_logic
    );
end sabiraci;
architecture Behavioral of sabiraci is
    signal signal1:std_logic_vector(67 downto 0);
    signal signal2:std_logic_vector(33 downto 0);
    signal signal3:std_logic_vector(16 downto 0);
    signal signal4:std_logic_vector(16 downto 0);
    signal output_signal:std_logic_vector(16 downto 0);
    signal counter:std_logic_vector(7 downto 0);
begin
    sabiraci1:for i in 0 to 3 generate
        sabirac1:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>"0000"&input((2*i+1)*13+12 downto (2*i+1)*13),
                ulaz2=>"0000"&input(2*i*13+12 downto 2*i*13),
                izlaz=>signal1(i*17+16 downto i*17)
            );
     end generate;
     sabiraci2:for i in 0 to 1 generate
        sabirac2:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>signal1((2*i+1)*17+16 downto (2*i+1)*17),
                ulaz2=>signal1(2*i*17+16 downto 2*i*17),
                izlaz=>signal2(i*17+16 downto i*17)
            );
     end generate;
     sabiraci3:for i in 0 to 0 generate
        sabirac3:entity work.sabirac(Behavioral)
            port map(
                ulaz1=>signal2((2*i+1)*17+16 downto (2*i+1)*17),
                ulaz2=>signal2(2*i*17+16 downto 2*i*17),
                izlaz=>signal3(i*17+16 downto i*17)
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
     counting:process(clk)is
     begin
        if rising_edge(clk)then
            if start_kum='1'then
                if unsigned(counter)=255 then
                    counter<=counter;
                    kum_complete<='1';
                else
                    counter<=std_logic_vector(unsigned(counter)+1);
                end if;
            else
                counter<=counter;
            end if;
        end if;
    end process;  
end Behavioral;
