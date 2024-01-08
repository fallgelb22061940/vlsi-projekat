library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity hist_ram_tb is
end hist_ram_tb;
architecture Behavioral of hist_ram_tb is
    signal adresa:std_logic_vector(7 downto 0);
    signal ulaz:std_logic_vector(103 downto 0);
    signal wea:std_logic;
    signal izlaz:std_logic_vector(103 downto 0);
    signal clk:std_logic:='0';
	constant Tclk:time:=10 ns;
    component hist_ram is
        port (
            addra:in std_logic_vector(63 downto 0); --Write address bus, width determined from RAM_DEPTH
            clk:in std_logic;
            addrb:in std_logic_vector(63 downto 0); -- Read address bus, width determined from RAM_DEPTH
            dina:in std_logic_vector(103 downto 0);-- RAM input data
            wea:in std_logic; --write enable
            enb:in std_logic; --enable
            rstb:in std_logic; -- Output reset (does not affect memory contents)
            regceb: in std_logic;   -- Output register enable
            doutb:out std_logic_vector(103 downto 0) --output data
        );
    end component;
begin
    uut:hist_ram port map(
        addra=>adresa,
        addrb=>adresa,
        dina=>ulaz,
        wea=>wea,
        enb=>'1',
        rstb=>'1',
        regceb=>'1',
        doutb=>izlaz,
        clk=>clk
    );
	clk<=not clk after Tclk/2;
	stimulus:process is
	begin
	end process;
end Behavioral;
