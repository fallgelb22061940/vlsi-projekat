library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity sabirac_tb is
end sabirac_tb;
architecture Behavioral of sabirac_tb is
    signal ulaz1:std_logic_vector(16 downto 0);
    signal ulaz2:std_logic_vector(16 downto 0);
    signal izlaz:std_logic_vector(16 downto 0);
    signal enable:std_logic;
    component sabirac is
        port(
            ulaz1:in std_logic_vector(16 downto 0);
            ulaz2:in std_logic_vector(16 downto 0);
            izlaz:out std_logic_vector(16 downto 0);
            enable:in std_logic
        );
    end component;
begin
    uut:sabirac port map(
        ulaz1=>ulaz1,
        ulaz2=>ulaz2,
        izlaz=>izlaz,
        enable=>enable
    );
    stimulus:process is
    begin
        enable<='0';
        ulaz1<=std_logic_vector(to_unsigned(1088,17));
        ulaz2<=std_logic_vector(to_unsigned(1234,17));
        wait for 10 ns;
        enable<='1';
        wait for 20 ns;
        ulaz2<=std_logic_vector(to_unsigned(3456,17));
        wait for 10 ns;
        ulaz1<=std_logic_vector(to_unsigned(1345,17));
        wait for 20 ns;
        enable<='0';
        wait;
    end process stimulus;
end Behavioral;
