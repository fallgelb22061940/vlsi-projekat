library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity histogram_complete is
    port(
        clk:in std_logic;
        read_picture:in std_logic;
        input_addr:in std_logic_vector(12 downto 0);
        read_pic_complete:out std_logic;
        hist_complete:out std_logic;
        in_data:in std_logic_vector(63 downto 0);
        start_kum:in std_logic;
        kum_complete:out std_logic;
        output:out std_logic_vector(12 downto 0)
    );
end histogram_complete;
architecture Behavioral of histogram_complete is
    signal adresa1:std_logic_vector(12 downto 0);
    signal adresa2:std_logic_vector(63 downto 0);
    signal inkrementer_data:std_logic_vector(103 downto 0);
    signal output_signal:std_logic_vector(103 downto 0);
    signal input_2:std_logic_vector(63 downto 0);
    signal kum_brojac_output:std_logic_vector(7 downto 0);
    signal write_2:std_logic;
    signal output_kumul:std_logic_vector(16 downto 0);
    signal dina2:std_logic_vector(103 downto 0);
    signal histogram_complete:std_logic;
    signal kum_rezultat:std_logic_vector(12 downto 0);
    signal kum_rezultat2:std_logic_vector(12 downto 0);
    component hist_ram is
        port(
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
    component kum_brojac is
        port(
            start_kum:in std_logic;
            output:out std_logic_vector(7 downto 0);
            clk:in std_logic
        );
    end component;
    component brojaci is 
        port(
            input:in std_logic_vector(103 downto 0);
            output:out std_logic_vector(103 downto 0);
            clk:in std_logic;
            hist_complete:out std_logic
            
        );
    end component; 
    component sabiraci is
        port(
            input:in std_logic_vector(103 downto 0);
            clk:in std_logic;
            output:out std_logic_vector(16 downto 0);
            kum_complete:out std_logic;
            start_kum:in std_logic
        );
    end component;
begin
    process(start_kum)is
    begin
        if start_kum='1'then
            input_2<=kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output;
        else
            input_2<=adresa2;
        end if;
    end process;
    process(start_kum)is
    begin
        if start_kum='1'then
            dina2<=kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2;
        else
            dina2<=inkrementer_data;
        end if;
    end process;
    write_2<=not histogram_complete and start_kum;
    kum_rezultat<="000"&output_kumul(16 downto 7);
    process(kum_rezultat)
    begin
        if unsigned(kum_rezultat) > 255 then
            kum_rezultat2 <= std_logic_vector(to_unsigned(255, kum_rezultat'length));
        else
            kum_rezultat2<=kum_rezultat;
        end if;
    end process;
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
        addra=>input_2,
        addrb=>input_2,
        doutb=>output_signal,
        dina=>dina2,
        enb=>'1',
        wea=>write_2,
        rstb=>'0',
        regceb=>'1'
    );
    inkrementer:brojaci port map(
        input=>output_signal,
        clk=>clk,
        hist_complete=>histogram_complete,
        output=>inkrementer_data
    );
    hist_complete<=histogram_complete;
    kumul_brojac:kum_brojac port map(
        start_kum=>start_kum,
        clk=>clk,
        output=>kum_brojac_output
    );
    sabiraci_kumul:sabiraci port map(
        input=>output_signal,
        clk=>clk,
        start_kum=>start_kum,
        kum_complete=>kum_complete,
        output=>output_kumul
    );
end Behavioral;