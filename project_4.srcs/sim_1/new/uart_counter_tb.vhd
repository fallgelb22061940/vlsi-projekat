library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity uart_counter_tb is
end uart_counter_tb;
architecture sim of uart_counter_tb is
    component uart_counter is
        port(
            start:in std_logic;
            tx_busy:in std_logic;
            ram:out std_logic_vector(2 downto 0);
            ispis:out std_logic;
            clk:in std_logic;
            adresa:out std_logic_vector(12 downto 0)
        );
    end component;
    signal start:std_logic;
    signal tx_busy:std_logic:='0';
    signal ram:std_logic_vector(2 downto 0);
    signal adresa:std_logic_vector(12 downto 0);
    signal ispis:std_logic;
    signal clk:std_logic:='0';
begin
    uut:uart_counter port map(
        start=>start,
        tx_busy=>tx_busy,
        ram=>ram,
        ispis=>ispis,
        clk=>clk,
        adresa=>adresa
    );
    tx_busy<=not tx_busy after 80ns;
    clk<=not clk after 5ns;
    stimulus:process is
    begin
        start<='0';
        wait for 10 ns;
        start<='1';
        wait for 10 ns;
        start<='0';
        wait;
    end process;
end sim;
