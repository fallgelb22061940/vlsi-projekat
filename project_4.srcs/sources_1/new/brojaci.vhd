library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity inkrementer is
    port(
        input:in std_logic_vector(12 downto 0):=(others=>'0');
        address:in std_logic_vector(7 downto 0):=(others=>'0');
        hist_start:in std_logic;
        clk:in std_logic;
        output:out std_logic_vector(12 downto 0)
    );
end inkrementer;
architecture Behavioral of inkrementer is
    signal read1:std_logic_vector(7 downto 0);
    signal read2:std_logic_vector(7 downto 0);
    signal read3:std_logic_vector(7 downto 0);
    signal read4:std_logic_vector(7 downto 0);
    signal data:std_logic_vector(12 downto 0);
    signal temp:std_logic;
    component registar_13bit is
        port(
            input:in std_logic_vector(12 downto 0);
            clk:in std_logic;
            output:out std_logic_vector(12 downto 0)
        );
    end component;
    component registar_8bit_real is
        port(
            input:in std_logic_vector(7 downto 0);
            clk:in std_logic;
            output:out std_logic_vector(7 downto 0)
        );
    end component;
    component registar_1bit is
        port(
            input:in std_logic;
            clk:in std_logic;
            output:out std_logic
        );
    end component;
begin
    reg1:registar_8bit_real port map(
        input=>address,
        clk=>clk,
        output=>read1
    );
    reg2:registar_8bit_real port map(
        input=>read1,
        clk=>clk,
        output=>read2
    );
    reg3:registar_1bit port map(
        input=>hist_start,
        clk=>clk,
        output=>temp
    );
    process(clk)is
    begin
        if rising_edge(clk)then
            if hist_start='0'then
                read3<=(others=>'0');
            else
                read3<=read1;
            end if;
            if temp='0'then
                read4<=(others=>'0');
            else
                read4<=read2;
            end if;
            if read3=address or read4=address then
                data<=std_logic_vector(unsigned(input)+1);
            else
                data<=input;
            end if;
            output<=std_logic_vector(unsigned(data)+1);
        end if;
    end process;
end Behavioral;
