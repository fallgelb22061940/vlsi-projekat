library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.RAM_definitions_PK.all;
entity im_ram_inst_example is
    port (
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
end im_ram_inst_example;

architecture rtl of im_ram_inst_example is
   
    constant C_IMAGE_DIM : integer := 256;
    constant C_NUM_MEMS  : integer := 8;
    constant C_MEM_DEPTH : integer := C_IMAGE_DIM*C_IMAGE_DIM/C_NUM_MEMS;--8192

    type Mem_data_array_t is array(0 to C_NUM_MEMS-1) of std_logic_vector(7 downto 0);
    signal wr_data : Mem_data_array_t;
    signal wr_addr : unsigned(clogb2(C_MEM_DEPTH)-1 downto 0);--unsigned 12 downto 0
    signal wren    : std_logic_vector(C_NUM_MEMS-1 downto 0);--7 downto 0
    signal rd_data : Mem_data_array_t;
    signal rd_addr : unsigned(clogb2(C_MEM_DEPTH)-1 downto 0);
    
begin

    IM_MEMS: for i in 0 to C_NUM_MEMS-1 generate
        IM_MEMi : entity work.im_ram(Behavioral)
            generic map (
                G_RAM_WIDTH => 8,
                G_RAM_DEPTH => C_MEM_DEPTH,
                G_RAM_PERFORMANCE => "HIGH_PERFORMANCE",
                G_RAM_INIT_FILE => "lenaCorrupted" & integer'image(i) & ".dat") 
            port map (
                addra  => addra,
                addrb  => addrb,
                dina   => dina(8*i + 7 downto 8*i),
                clka   => clk,
                wea    => wea,
                enb    => enb,
                rstb   => rstb,
                regceb => regceb,
                doutb  => doutb(8*i + 7 downto 8*i)
            );
    end generate;
        
        
end rtl;
