library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity final_uart is
    port(
        clk:in std_logic;
        start:in std_logic;
        send:in std_logic;
        reset:in std_logic;
        tx:out std_logic;
        send_ready:out std_logic
    );
end final_uart;
architecture Behavioral of final_uart is
    signal slika:std_logic_vector(63 downto 0);
    signal tx_busy:std_logic;
    signal tx_data:std_logic_vector(7 downto 0);
    signal ram:std_logic_vector(2 downto 0);
    component final is
        port(
            clk:in std_logic;
            start:in std_logic;
            output:out std_logic_vector(63 downto 0);
            send_ready:out std_logic;
            reset:in std_logic;
            ram:out std_logic_vector(2 downto 0);
            salji:in std_logic;
            tx_busy:in std_logic
        );
    end component;
    component uart_tx is
        generic (
                CLK_FREQ    : integer := 50;        -- Main frequency (MHz)
                SER_FREQ    : integer := 115200        -- Baud rate (bps)
        );
        port (
                -- Control
            clk            : in    std_logic;        -- Main clock
            rst            : in    std_logic;        -- Main reset
                -- External Interface
            tx            : out    std_logic;        -- RS232 transmitted serial data
                -- RS232/UART Configuration
            par_en        : in    std_logic;        -- Parity bit enable
                -- uPC Interface
            tx_dvalid   : in    std_logic;                        -- Indicates that tx_data is valid and should be sent
            tx_data        : in    std_logic_vector(7 downto 0);    -- Data to transmit
            tx_busy     : out   std_logic                       -- Active while UART is busy and cannot receive data
        );
    end component;
begin
    histogram:final port map(
        clk=>clk,
        start=>start,
        output=>slika,
        send_ready=>send_ready,
        reset=>reset,
        ram=>ram,
        salji=>send,
        tx_busy=>tx_busy
    );
    uart:uart_tx port map(
        clk=>clk,
        rst=>'0',
        tx=>tx,
        par_en=>'0',
        tx_dvalid=>send,
        tx_busy=>tx_busy,
        tx_data=>tx_data
    );
    process(ram,slika)is
    begin
        case ram is
            when std_logic_vector(to_unsigned(0,3))=>
                tx_data<=slika(7 downto 0);
            when std_logic_vector(to_unsigned(1,3))=>
                tx_data<=slika(15 downto 8);
            when std_logic_vector(to_unsigned(2,3))=>
                tx_data<=slika(23 downto 16);
            when std_logic_vector(to_unsigned(3,3))=>
                tx_data<=slika(31 downto 24);
            when std_logic_vector(to_unsigned(4,3))=>
                tx_data<=slika(39 downto 32);
            when std_logic_vector(to_unsigned(5,3))=>
                tx_data<=slika(47 downto 40);
            when std_logic_vector(to_unsigned(6,3))=>
                tx_data<=slika(55 downto 48);
            when std_logic_vector(to_unsigned(7,3))=>
                tx_data<=slika(63 downto 56);
            when others=>
                tx_data<=slika(7 downto 0);
        end case;
    end process;
end Behavioral;
