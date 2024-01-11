library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity final is
    port(
        clk:in std_logic;
        start:in std_logic;
        --output:out std_logic_vector(63 downto 0);
        reset:in std_logic
    );
end final;
architecture Structural of final is
    signal read_picture:std_logic;
    signal read_pic_complete:std_logic;
    signal hist_complete:std_logic;
    signal start_kum:std_logic;
    signal kum_complete:std_logic;
    signal start_slika:std_logic;
    signal kraj:std_logic;
    component kontroler is
        port(
            clk:in std_logic;
            start:in std_logic;--traje jedan takt, posle æeš da se bakæeš sa produenjem
            read_picture:out std_logic;
            read_pic_complete:in std_logic;
            hist_complete:in std_logic;
            start_kum:out std_logic;
            kum_complete:in std_logic;
            start_slika:out std_logic;
            kraj:in std_logic;
            reset:in std_logic
        );
    end component;
    component histogram_complete is
        port(
            clk:in std_logic;
            read_picture:in std_logic;
            read_pic_complete:out std_logic;
            hist_complete:out std_logic;
            start_kum:in std_logic;
            kum_complete:out std_logic;
            kraj:out std_logic;
            reset:in std_logic;
            --output:out std_logic_vector(63 downto 0);
            start_slika:in std_logic
        );
    end component;
begin
    control:kontroler port map(
        clk=>clk,
        reset=>reset,
        start=>start,
        read_picture=>read_picture,
        read_pic_complete=>read_pic_complete,
        hist_complete=>hist_complete,
        start_kum=>start_kum,
        kum_complete=>kum_complete,
        kraj=>kraj,
        start_slika=>start_slika
    );
    histogram:histogram_complete port map(
        clk=>clk,
        read_picture=>read_picture,
        read_pic_complete=>read_pic_complete,
        hist_complete=>hist_complete,
        start_kum=>start_kum,
        kum_complete=>kum_complete,
        reset=>reset,
        --output=>output,
        kraj=>kraj,
        start_slika=>start_slika
    );
end Structural;
