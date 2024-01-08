library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
entity final_tb is
end final_tb;
architecture sim of final_tb is
    signal clk:std_logic:='0';
    signal start:std_logic;
    signal output:std_logic_vector(63 downto 0);
    signal reset:std_logic;
    constant Tclk:time:=10 ns; -- Adjust as needed
    component final is
        port(
            clk:in std_logic;
            start:in std_logic;
            output:out std_logic_vector(63 downto 0);
            reset:in std_logic
        );
    end component;
begin
    uut:final port map(
        clk=>clk,
        start=>start,
        output=>output,
        reset=>reset
    );
    clk<=not clk after Tclk/2;
    process is
    begin
        reset<='1';
        start<='0';
        wait for 3*Tclk;
        reset<='0';
        wait for 1*Tclk;
        start<='1';
        wait for 1*Tclk;
        start<='0';
        wait;
    end process;
end sim;