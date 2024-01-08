library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity histogram_complete is
    port(
        clk:in std_logic;
        read_picture:in std_logic;
        read_pic_complete:out std_logic;
        hist_complete:out std_logic;
        start_kum:in std_logic;
        kum_complete:out std_logic;
        kraj:out std_logic;
        output:out std_logic_vector(63 downto 0);
        start_slika:in std_logic
    );
end histogram_complete;
architecture Structural of histogram_complete is
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
    signal hist_start:std_logic;
    signal hist_start_tmp:std_logic;
    signal ulaz_hist_inkrementer:std_logic_vector(12 downto 0);
    signal izlaz_hist_inkrementer:std_logic_vector(12 downto 0);
    signal kum_gotov:std_logic;
    signal start_kum_tmp:std_logic;
    signal input_address:std_logic_vector(12 downto 0);
    component klamper is
        port(
            input:in std_logic_vector(12 downto 0);
            output:out std_logic_vector(12 downto 0)
        );
    end component;
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
    component counter_13bit is
        port(
            clk:in std_logic;
            in_signal:in std_logic;
            output:out std_logic_vector(12 downto 0);
            out_signal:out std_logic
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
    component counter_8bit is
        port(
            in_signal:in std_logic;
            output:out std_logic_vector(7 downto 0);
            out_signal:out std_logic;
            clk:in std_logic
        );
    end component;
    component brojaci is 
        port(
            input:in std_logic_vector(103 downto 0);
            output:out std_logic_vector(103 downto 0)
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
    component registar_1bit is 
        port(
            input:in std_logic;
            clk:in std_logic;
            output:out std_logic
        );
    end component;
begin
    process(start_kum,start_slika)is
    begin
        if start_kum='1'and start_slika='0'then
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
    write_2<=(not histogram_complete and start_kum) or read_picture;
    kum_rezultat<="000"&output_kumul(16 downto 7);
    output<=adresa2;
    klamp:klamper port map(
        input=>kum_rezultat,
        output=>kum_rezultat2
    );
    adresa:counter_13bit port map(
        clk=>clk,
        in_signal=>read_picture or start_slika,
        out_signal=>read_pic_complete,
        output=>adresa1
    );
    slika:im_ram_inst_example port map(
        clk=>clk,
        addra=>adresa1,
        addrb=>adresa1,
        doutb=>adresa2,
        dina=>output_signal(98 downto 91)&output_signal(85 downto 78)&output_signal(72 downto 65)&output_signal(59 downto 52)&output_signal(46 downto 39)&output_signal(33 downto 26)&output_signal(20 downto 13)&output_signal(7 downto 0),
        enb=>'1',
        wea=>start_slika,
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
    reg1:registar_1bit port map(
        input=>hist_start_tmp,
        clk=>clk,
        output=>hist_start
    );
    reg2:registar_1bit port map(
        input=>read_picture,
        clk=>clk,
        output=>hist_start_tmp
    );
    reg3:registar_1bit port map(
        clk=>clk,
        input=>start_kum,
        output=>start_kum_tmp
    );
    hist_count:counter_13bit port map(
        in_signal=>hist_start,
        out_signal=>histogram_complete,
        clk=>clk,
        output=>open
    );
    inkrementers:brojaci port map(
        input=>output_signal,
        output=>inkrementer_data
    );
    hist_complete<=histogram_complete;
    kum_brojac:counter_8bit port map(
        in_signal=>start_kum,
        clk=>clk,
        out_signal=>kum_gotov,
        output=>kum_brojac_output
    );
    sabiraci_kumul:sabiraci port map(
        input=>output_signal,
        clk=>clk,
        start_kum=>start_kum_tmp,
        kum_complete=>kum_complete,
        output=>output_kumul
    );
end Structural;