library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity kontroler is
    port(
        clk:in std_logic;
        start:in std_logic;--traje jedan takt, posle æeš da se bakæeš sa produženjem
        read_picture:out std_logic;
        read_pic_complete:in std_logic;
        hist_complete:in std_logic;
        start_kum:out std_logic;
        kum_complete:in std_logic;
        start_slika:out std_logic;
        kraj:in std_logic;
        salji:in std_logic;
        load:in std_logic;
        send:out std_logic;
        reset:in std_logic
    );
end kontroler;
architecture behavioral of kontroler is
    signal counter:unsigned(12 downto 0):=(others=>'0');
    signal read_pic_temp:std_logic:='0';
    component button is
        port(
            taster:in std_logic;
            load:in std_logic;
            clk:in std_logic;
            enable:in std_logic;
            output:out std_logic
        );
    end component;
begin
    dugme:button port map(
        taster=>salji,
        load=>load,
        clk=>clk,
        enable=>kraj,
        output=>send
    );
    brojac:process(clk)is
    begin
        if rising_edge(clk)then
            if start='1'then
                read_pic_temp<='1';
            else
                read_picture<=read_pic_temp;
            end if;
            if (read_pic_complete='1'or reset='1')then
                read_pic_temp<='0';
            else
                read_picture<=read_pic_temp;
            end if;
        end if;
    end process brojac;
    kum_hist:process(clk)is
    begin
        if rising_edge(clk)then
            if hist_complete='1'and reset='0'then
                start_kum<='1';
            else
                start_kum<='0';
            end if;
        end if;
    end process kum_hist;
    ispravljanje:process(clk)is
    begin
        if rising_edge(clk)then
            if kum_complete='1'and reset='0'then
                start_slika<='1';
            else
                start_slika<='0';
            end if;
        end if;
    end process ispravljanje;    
end behavioral;