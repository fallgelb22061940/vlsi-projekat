library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity histogram_complete is
    port(
        clk:in std_logic;
        read_picture:in std_logic;
        input_addr:in std_logic_vector(12 downto 0);
        read_pic_complete:out std_logic;
        in_data:in std_logic_vector(63 downto 0);
        output:out std_logic_vector(103 downto 0)
    );
end histogram_complete;
architecture Behavioral of histogram_complete is
    signal adresa1:std_logic_vector(12 downto 0);
    signal adresa2:std_logic_vector(63 downto 0);
    signal brojac_data:std_logic_vector(103 downto 0);
    signal output_signal:std_logic_vector(103 downto 0);
    component hist_ram is
        port(
            addra:in std_logic_vector(63 downto 0); --Write address bus, width determined from RAM_DEPTH
            clk:in std_logic;
            --addrb:in std_logic_vector(7 downto 0); -- Read address bus, width determined from RAM_DEPTH
            dina:in std_logic_vector(103 downto 0);-- RAM input data
            wea:in std_logic; --write enable
            enb:in std_logic; --enable
            rstb:in std_logic; -- Output reset (does not affect memory contents)
            regceb: in std_logic;   -- Output register enable
            doutb:out std_logic_vector(103 downto 0) --output data
        );
    end component;
    component adrese is
        port(
            clk:in std_logic;
            read_picture:in std_logic;
            read_pic_complete:out std_logic;
            address:out std_logic_vector(12 downto 0)
        );
    end component;
    component im_ram_inst_example is
        port(
            addra:in std_logic_vector(12 downto 0); --Write address bus, width determined from RAM_DEPTH
            clk:in std_logic;
            addrb:in std_logic_vector(12 downto 0); -- Read address bus, width determined from RAM_DEPTH
            dina:in std_logic_vector(63 downto 0);-- RAM input data
            wea:in std_logic; --write enable
            enb:in std_logic; --enable
            rstb:in std_logic; -- Output reset (does not affect memory contents)
            regceb: in std_logic;   -- Output register enable
            doutb:out std_logic_vector(63 downto 0) --output data
        );
    end component;
    component brojaci is 
        port(
            input:in std_logic_vector(103 downto 0);
            output:out std_logic_vector(103 downto 0)
        );
    end component; 
begin
    adresa:adrese port map(
        clk=>clk,
        read_picture=>read_picture,
        read_pic_complete=>read_pic_complete,
        address=>adresa1
    );
    slika:im_ram_inst_example port map(
        clk=>clk,
        addra=>input_addr,
        addrb=>adresa1,
        doutb=>adresa2,
        dina=>in_data,
        enb=>'1',
        wea=>'0',
        rstb=>'0',
        regceb=>'1'
    );
    histogram:hist_ram port map(
        clk=>clk,
        addra=>adresa2,
        doutb=>output_signal,
        dina=>brojac_data,
        enb=>'1',
        wea=>'1',
        rstb=>'0',
        regceb=>'1'
    );
    brojac:brojaci port map(
        input=>output_signal,
        output=>brojac_data
    );
    output<=output_signal;
end Behavioral;