library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity button is
    port(
        dugme:in std_logic;
        clk:in std_logic;
        reset:in std_logic;
        output:out std_logic
    );
end button;
architecture Behavioral of button is
    signal izlaz:std_logic;
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            if dugme='1'then
                izlaz<='1';
            elsif reset='0'then
                output<=izlaz;
            else
                izlaz<='0';
            end if;
        end if;
    end process;
end Behavioral;
