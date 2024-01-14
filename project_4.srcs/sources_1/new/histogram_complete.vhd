library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity histogram_complete is
    port(
        clk:in std_logic;
        read_picture:in std_logic;
        read_pic_complete:out std_logic:='0';
        hist_complete:out std_logic:='0';
        start_kum:in std_logic;
        kum_complete:out std_logic:='0';
        kraj:out std_logic;
        reset:in std_logic;
        --output:out std_logic_vector(63 downto 0);
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
    signal write_2_tmp:std_logic;
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
    signal histogram_complete_tmp:std_logic;
    signal input_3:std_logic_vector(63 downto 0);
    signal input_4:std_logic_vector(63 downto 0);
    signal input_5:std_logic_vector(63 downto 0);
    signal histogram_complete_tmp2:std_logic;
    signal write_2:std_logic;
    signal hist_start_tmp2:std_logic;
    signal hist_start_tmp3:std_logic;
    signal histogram_complete_tmp3:std_logic;
    signal start_kum1:std_logic;
    signal hist_complete_tmp:std_logic;
    signal start_kum2:std_logic;
    signal start_adder:std_logic;
    signal start_kum3:std_logic;
    signal start_adder2:std_logic;
    signal start_adder3:std_logic;
    signal start_slika_edge:std_logic;
    signal start_slika_tmp:std_logic;
    signal adresa1tmp:std_logic_vector(12 downto 0);
    signal read_pic_complete_tmp:std_logic;
    signal kraj_tmp:std_logic;
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
    component edge_detector is
        port ( 
            clk : in std_logic;
            in_signal : in std_logic;
            edge : out std_logic
        );
    end component;
    component counter_13bit is
        port(
            clk:in std_logic;
            in_signal:in std_logic;
            reset:in std_logic;
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
            hist_start:in std_logic;
            clk:in std_logic;
            address:in std_logic_vector(63 downto 0);
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
    component registar_13bit is
        port(
            input:in std_logic_vector(12 downto 0);
            output:out std_logic_vector(12 downto 0);
            clk:in std_logic
        );
    end component;
    component registar_8bit is
        port(
            input:in std_logic_vector(63 downto 0);
            clk:in std_logic;
            output:out std_logic_vector(63 downto 0)
        );
    end component;
begin
    adrese2:process(clk)is
    begin
        if rising_edge(clk)then
            if start_kum2='1'and start_slika_tmp='0'then
                input_2<=kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output&kum_brojac_output;
            else
                input_2<=adresa2;
            end if;
        end if;
    end process adrese2;
    process(clk)is
    begin
        if rising_edge(clk)then
            if histogram_complete/='1' then
                dina2<=inkrementer_data;
            elsif start_kum2='1'then
                dina2<=kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2&kum_rezultat2;
            else
                dina2<=(others=>'0');
            end if;
        end if;
    end process;
    reg5:registar_1bit port map(
        input=>histogram_complete_tmp,
        output=>histogram_complete_tmp2,
        clk=>clk
    );
    reg6:registar_1bit port map(
        input=>histogram_complete_tmp3,
        output=>hist_complete_tmp,
        clk=>clk
    );
    reg10:registar_1bit port map(
        input=>histogram_complete_tmp2,
        output=>histogram_complete_tmp3,
        clk=>clk
    );
    write_2_tmp<=(start_kum2 or hist_start)and not start_slika_tmp;
    reg8:registar_1bit port map(
        input=>write_2_tmp,
        output=>write_2,
        clk=>clk
    );
    kum_rezultat<="0000"&output_kumul(16 downto 8);
    --output<=adresa2;
    klamp:klamper port map(
        input=>kum_rezultat,
        output=>kum_rezultat2
    );
    adresa:counter_13bit port map(
        clk=>clk,
        in_signal=>read_picture or start_slika_tmp,
        reset=>reset or start_slika_edge,
        out_signal=>read_pic_complete_tmp,
        output=>adresa1
    );
    read_pic_complete<=read_pic_complete_tmp;
    process(read_pic_complete_tmp,read_picture)is
    begin
        if read_pic_complete_tmp='1'and histogram_complete='1'then
            kraj_tmp<='1';
        else
            kraj_tmp<='0';
        end if;
    end process;
    reg16:registar_1bit port map(
        clk=>clk,
        input=>start_slika,
        output=>start_slika_tmp
    );
    kraj<=kraj_tmp;
    slika:im_ram_inst_example port map(
        clk=>clk,
        addra=>adresa1tmp,
        addrb=>adresa1,
        doutb=>adresa2,
        dina=>output_signal(98 downto 91)&output_signal(85 downto 78)&output_signal(72 downto 65)&output_signal(59 downto 52)&output_signal(46 downto 39)&output_signal(33 downto 26)&output_signal(20 downto 13)&output_signal(7 downto 0),
        enb=>'1',
        wea=>start_slika_tmp and not kraj_tmp,
        rstb=>'0',
        regceb=>'1'
    );
    diferencijator:edge_detector port map(
        clk=>clk,
        in_signal=>start_slika_tmp,
        edge=>start_slika_edge
    );
    histogram:hist_ram port map(
        clk=>clk,
        addra=>input_3,
        addrb=>input_2,
        doutb=>output_signal,
        dina=>dina2,
        enb=>'1',
        wea=>write_2,
        rstb=>'0',
        regceb=>'1'
    );
    reg1:registar_1bit port map(
        input=>hist_start_tmp2,
        clk=>clk,
        output=>hist_start_tmp3
    );
    reg7:registar_1bit port map(
        input=>hist_start_tmp,
        clk=>clk,
        output=>hist_start_tmp2
    );
    reg2:registar_1bit port map(
        input=>read_picture,
        clk=>clk,
        output=>hist_start_tmp
    );
    reg12:registar_1bit port map(
        input=>hist_complete_tmp,
        output=>histogram_complete,
        clk=>clk
    );
    reg3:registar_1bit port map(
        clk=>clk,
        input=>start_kum1,
        output=>start_kum_tmp
    );
    reg4:registar_8bit port map(
        clk=>clk,
        input=>input_2,
        output=>input_3
    );
    reg9:registar_1bit port map(
        clk=>clk,
        input=>hist_start_tmp3,
        output=>hist_start
    );
    reg13:registar_1bit port map(
        clk=>clk,
        input=>start_kum_tmp,
        output=>start_kum2
    );
    reg14:registar_1bit port map(
        clk=>clk,
        input=>start_kum2,
        output=>start_kum3
    );
    reg15:registar_1bit port map(
        clk=>clk,
        input=>start_kum3,
        output=>start_adder
    );
    reg18:registar_1bit port map(
        clk=>clk,
        input=>start_adder,
        output=>start_adder2
    );
    reg17:registar_1bit port map(
        clk=>clk,
        input=>start_adder2,
        output=>start_adder3
    );
    hist_count:counter_13bit port map(
        in_signal=>hist_start,
        out_signal=>histogram_complete_tmp,
        reset=>reset,
        clk=>clk,
        output=>open
    );
    inkrementers:brojaci port map(
        input=>output_signal,
        clk=>clk,
        address=>input_3,
        hist_start=>hist_start,
        output=>inkrementer_data
    );
    reg11:registar_1bit port map(
        input=>start_kum,
        output=>start_kum1,
        clk=>clk
    );
    hist19:registar_13bit port map(
        input=>adresa1,
        output=>adresa1tmp,
        clk=>clk
    );
    hist_complete<=histogram_complete;
    kum_brojac:counter_8bit port map(
        in_signal=>start_kum2,
        clk=>clk,
        out_signal=>kum_gotov,
        output=>kum_brojac_output
    );
    sabiraci_kumul:sabiraci port map(
        input=>output_signal,
        clk=>clk,
        start_kum=>start_adder3,
        kum_complete=>kum_complete,
        output=>output_kumul
    );
end Structural;