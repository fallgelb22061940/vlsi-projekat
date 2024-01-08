library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity sabiraci_tb is
end sabiraci_tb;

architecture sim of sabiraci_tb is
    signal input_data:std_logic_vector(103 downto 0):=(others=>'0');
    signal clk : std_logic:='0';
    signal output_data:std_logic_vector(16 downto 0);
    signal kum_complete_signal:std_logic:='0';
    signal start_kum_signal:std_logic:='0';
	constant clk_period:time:=10 ns;
    component sabiraci
        port (
            input : in std_logic_vector(103 downto 0);
            clk : in std_logic;
            output : out std_logic_vector(16 downto 0);
            kum_complete : out std_logic;
            start_kum : in std_logic
        );
    end component;
begin
    DUT:sabiraci
        port map (
            input=>input_data,
            clk=>clk,
            output=>output_data,
            kum_complete=>kum_complete_signal,
            start_kum=>start_kum_signal
        );
	clk<=not clk after clk_period/2;
	STIMULUS:process is 
	begin 
	   input_data<=(others => '0');
       start_kum_signal<='0';
	   input_data<=std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13))&std_logic_vector(to_unsigned(798,13));
	   wait for 10 ns;
	   start_kum_signal<='1';
	   wait for 8000 ns;
	   wait;
	end process;
end sim;