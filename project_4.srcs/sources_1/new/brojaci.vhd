library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity brojac is
    port(
        input:in std_logic_vector(12 downto 0);
        output:out std_logic_vector(12 downto 0)
    );
end brojac;
architecture Behavioral of brojac is
begin
    output<=std_logic_vector(unsigned(input)+1);
end Behavioral;
