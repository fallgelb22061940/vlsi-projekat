library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity kontroler_tb is
end kontroler_tb;
architecture Behavioral of kontroler_tb is
    component kontroler is
        port(
            clk:in std_logic;
            start:in std_logic;--traje jedan takt, posle æeš da se bakæeš sa produenjem
            read_picture:out std_logic;
            read_pic_complete:in std_logic;
            hist_complete:in std_logic;
            start_kum:out std_logic;
            reset:in std_logic
        );
    end component;
    signal clk:std_logic:='0';
    signal start:std_logic;
    signal read_pic_complete:std_logic;
    signal hist_complete:std_logic;
    signal reset:std_logic;
    constant clk_period : time := 10 ns; -- Adjust as needed
begin
    uut:kontroler
    port map(
        clk=>clk,
        start=>start,
        read_pic_complete=>read_pic_complete,
        hist_complete=>hist_complete,
        reset=>reset
    );
    clk<=not clk after clk_period/2;
    process
    begin
        reset<='1';
        wait for 3*clk_period;
        reset<='0';
        wait for 2*clk_period;
        start<='1';
        wait for clk_period;
        start<='0';
        wait for 8000*clk_period;
        wait;
    end process;
end Behavioral;