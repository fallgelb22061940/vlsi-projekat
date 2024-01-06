library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
entity counter_13bit_tb is
end counter_13bit_tb;
architecture testbench of counter_13bit_tb is
    signal clk:std_logic:='0';
    signal in_signal:std_logic:='0';
    signal out_signal:std_logic;
    signal output:std_logic_vector(12 downto 0);
    constant Tclk:time:=10 ns; -- Adjust as needed
    component counter_13bit
        port (
            clk:in std_logic;
            in_signal:in std_logic;
            out_signal:out std_logic;
            output:out std_logic_vector(12 downto 0)
        );
    end component;
begin
    uut:counter_13bit
    port map (
        clk=>clk,
        in_signal=>in_signal,
        out_signal=>out_signal,
        output=>output
    );
    clk<=not clk after Tclk/2;
    -- Stimulus process
    process
    begin
        wait for 20 ns; -- Allow some time before starting the picture read
        in_signal<='1'; -- Start reading picture
        wait for 800000*Tclk; -- Allow some time for picture read to complete
        in_signal<='0'; -- Stop reading picture
        wait for 20 ns; -- Allow some time for the last rising edge of the clock
        wait;
    end process;
end testbench;
