library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity inkrementer_tb is
end inkrementer_tb;
architecture Behavioral of inkrementer_tb is
    signal input:std_logic_vector(103 downto 0);
    signal output:std_logic_vector(103 downto 0);
    component brojaci is
        port(
            input:in std_logic_vector(103 downto 0);
            output:out std_logic_vector(103 downto 0)
        );
    end component;
begin
    uut:brojaci port map(
        input=>input,
        output=>output
    );
    stimulus:process is
    begin
        input<=std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13))&std_logic_vector(to_unsigned(10884,13));
        wait for 20 ns;
        input<=std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13));
        wait;
    end process;
end Behavioral;
