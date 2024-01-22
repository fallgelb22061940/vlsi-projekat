library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity button is
    port(
        taster:in std_logic;
        load:in std_logic;
        clk:in std_logic;
        output:out std_logic
    );
end button;
architecture behavioral of button is
    signal click:std_logic;
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            if taster<='1'and load<='1'then
                click<='1';
            elsif taster<='0'and load<='1'then
                click<=click;
            else
                click<='0';
            end if;
        end if;
    end process;
end behavioral;