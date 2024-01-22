library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity button_tb is
end button_tb;
architecture Behavioral of button_tb is
    signal dugme:std_logic;
    signal clk:std_logic:='0';
    signal reset:std_logic;
    signal output:std_logic;
    component button is
        port(
            dugme:in std_logic;
            clk:in std_logic;
            reset:in std_logic;
            output:out std_logic
        );
    end component;
begin
    uut:button port map(
        dugme=>dugme,
        clk=>clk,
        reset=>reset,
        output=>output
    );
    clk<=not clk after 10ns;
    stimulus:process is
    begin
        reset<='1';
        wait for 40ns;
        reset<='0';
        wait for 20ns;
        dugme<='1';
        wait for 20ns;
        dugme<='0';
        wait;
    end process;
end Behavioral;
