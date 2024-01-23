library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity final_uart_tb is
end final_uart_tb;
architecture Behavioral of final_uart_tb is
    signal clk:std_logic:='0';
    signal start:std_logic;
    signal send:std_logic;
    signal reset:std_logic;
    signal tx:std_logic;
    signal led0:std_logic;
    component final_uart is
        port(
            clk:in std_logic;
            start:in std_logic;
            send:in std_logic;
            reset:in std_logic;
            tx:out std_logic;
            led0:out std_logic
        );
    end component;
begin
    uut:final_uart port map(
        clk=>clk,
        start=>start,
        send=>send,
        reset=>reset,
        tx=>tx,
        led0=>led0
    );
    clk<=not clk after 10ns;
    stimulus:process is
    begin
        reset<='1';
        wait for 6000us;
        reset<='0';
        wait for 200us;
        start<='1';
        wait for 4000us;
        start<='0';
        wait for 340000us;
        send<='1';
        wait for 6000us;
        send<='0';
        wait for 1200us;
        send<='1';
        wait for 2000us;
        send<='0';
        wait;
    end process;
end Behavioral;
