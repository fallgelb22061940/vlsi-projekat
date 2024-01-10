library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sabirac is
    port(
        ulaz1:in std_logic_vector(16 downto 0);
        ulaz2:in std_logic_vector(16 downto 0);
        izlaz:out std_logic_vector(16 downto 0);
        enable:in std_logic
    );
end sabirac;
architecture Behavioral of sabirac is
begin
    process(enable,ulaz1,ulaz2)is
    begin
        if enable='1'then
            izlaz<=std_logic_vector(unsigned(ulaz1)+unsigned(ulaz2));
        else
            izlaz<=(others=>'0');
        end if;
    end process;
end Behavioral;