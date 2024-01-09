library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sabirac is
    port(
        ulaz1:in std_logic_vector(16 downto 0);
        ulaz2:in std_logic_vector(16 downto 0);
        izlaz:out std_logic_vector(16 downto 0)
    );
end sabirac;
architecture Behavioral of sabirac is
begin
    izlaz<=std_logic_vector(unsigned(ulaz1)+unsigned(ulaz2));
end Behavioral;