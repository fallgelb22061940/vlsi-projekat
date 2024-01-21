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
    signal send_ready:std_logic;
    component final_uart is
        port(
            clk:in std_logic;
            start:in std_logic;
            send:in std_logic;
            reset:in std_logic;
            tx:out std_logic;
            send_ready:out std_logic
        );
    end component;
begin
    uut:final_uart port map(
        clk=>clk,
        start=>start,
        send=>send,
        reset=>reset,
        tx=>tx,
        send_ready=>send_ready
    );
    clk<=not clk after 5ns;
    stimulus:process is
    begin
        reset<='1';
        wait for 30ns;
        reset<='0';
        wait for 10ns;
        start<='1';
        wait for 10ns;
        start<='0';
        wait for 170000ns;
        send<='1';
        wait;
    end process;
end Behavioral;
