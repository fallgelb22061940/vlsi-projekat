library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.RAM_definitions_PK.all;
entity hist_ram is
    port (
        addra:in std_logic_vector(12 downto 0); --Write address bus, width determined from RAM_DEPTH
        clk:in std_logic;
        addrb:in std_logic_vector(12 downto 0); -- Read address bus, width determined from RAM_DEPTH
        dina:in std_logic_vector(63 downto 0);-- RAM input data
        wea:in std_logic:='1'; --write enable
        enb:in std_logic:='1'; --enable
        rstb:in std_logic:='0'; -- Output reset (does not affect memory contents)
        regceb: in std_logic:='1';   -- Output register enable
        doutb:out std_logic_vector(63 downto 0) --output data
    );
end hist_ram;

architecture rtl of hist_ram is
   
    constant C_IMAGE_DIM : integer := 256;
    constant C_NUM_MEMS  : integer := 8;
    constant C_MEM_DEPTH : integer := 256*8192/8;--8192

    type Mem_data_array_t is array(0 to C_NUM_MEMS-1) of std_logic_vector(7 downto 0);
    signal wr_data : Mem_data_array_t;
    signal wr_addr : unsigned(clogb2(C_MEM_DEPTH)-1 downto 0);--unsigned 12 downto 0
    signal wren    : std_logic_vector(C_NUM_MEMS-1 downto 0);--7 downto 0
    signal rd_data : Mem_data_array_t;
    signal rd_addr : unsigned(clogb2(C_MEM_DEPTH)-1 downto 0);
    
begin

    IM_MEMS: for i in 0 to C_NUM_MEMS-1 generate
        IM_MEMi : entity work.hist_ram_block(Behavioral)
            generic map (
                G_RAM_WIDTH => 8,
                G_RAM_DEPTH => C_MEM_DEPTH,
                G_RAM_PERFORMANCE => "HIGH_PERFORMANCE"
                --G_RAM_INIT_FILE => "lenaCorrupted" & integer'image(i) & ".dat"
            ) 
            port map (
                addra  => std_logic_vector(wr_addr),
                addrb  => std_logic_vector(rd_addr),
                dina   => wr_data(i),
                clka   => clk,
                wea    => wren(i),
                enb    => '1',
                rstb   => '0',
                regceb => '1',
                doutb  => rd_data(i)
            );
    end generate;
        
        
end rtl;
