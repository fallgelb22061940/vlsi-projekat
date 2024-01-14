library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity inkrementer_tb is
end inkrementer_tb;
architecture Behavioral of inkrementer_tb is
    signal input:std_logic_vector(12 downto 0);
    signal output:std_logic_vector(12 downto 0);
    signal clk:std_logic:='1';
    signal hist_start:std_logic;
    signal address:std_logic_vector(7 downto 0);
    constant Tclk:time:= 10ns;
    component inkrementer is
        port(
            input:in std_logic_vector(12 downto 0);
            clk:in std_logic:='0';
            hist_start:in std_logic;
            address:in std_logic_vector(7 downto 0);
            output:out std_logic_vector(12 downto 0)
        );
    end component;
begin
    uut:inkrementer port map(
        input=>input,
        clk=>clk,
        address=>address,
        hist_start=>hist_start,
        output=>output
    );
	clk<=not clk after Tclk/2;
    stimulus:process is
    begin
        hist_start<='0';
        wait for 10ns;
        hist_start<='1';
        input<=std_logic_vector(to_unsigned(0,13));
        address<=std_logic_vector(to_unsigned(0,8));
        wait for Tclk;
        input<=std_logic_vector(to_unsigned(128,13));
        address<=std_logic_vector(to_unsigned(128,8));
        wait for 2*Tclk;
        input<=std_logic_vector(to_unsigned(2480,13));
        address<=std_logic_vector(to_unsigned(240,8));
        wait for Tclk;
        input<=std_logic_vector(to_unsigned(3245,13));
        address<=std_logic_vector(to_unsigned(255,8));
        wait for Tclk;
        input<=std_logic_vector(to_unsigned(2480,13));
        address<=std_logic_vector(to_unsigned(240,8));
        wait;
    end process;
end Behavioral;
