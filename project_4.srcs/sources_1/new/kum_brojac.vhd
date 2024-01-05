library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity kum_brojac is
    port(
        start_kum:in std_logic;
        output:out std_logic_vector(7 downto 0);
        clk:in std_logic
    );
end kum_brojac;
architecture Behavioral of kum_brojac is
    signal counter:std_logic_vector(7 downto 0);
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            counter<=std_logic_vector(unsigned(counter)+1);
            output<=counter;
        end if;
    end process;
end Behavioral;