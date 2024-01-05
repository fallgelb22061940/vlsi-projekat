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
        reset:in std_logic
    );
end kontroler;
architecture behavioral of kontroler is
    type state is (idle,histogram,kumulativni,slika);
    signal counter:unsigned(12 downto 0):=(others=>'0');
    signal read_pic_temp:std_logic:='0';
    signal state_reg,next_state:state;
begin
    state_transition:process(clk)is
    begin
        if rising_edge(clk)then
            if reset='1'then
                state_reg<=idle;
            else
                state_reg<=next_state;
            end if;        
        end if;
    end process state_transition;
    taster_logic:process(clk)is
    begin
        if rising_edge(clk)then
            if reset='0'then
                next_state<=idle;
            elsif start='1'then
                next_state<=histogram;
            elsif read_pic_complete='1'then
                next_state<=kumulativni;
            else
                next_state<=state_reg;
            end if;
        end if;
    end process taster_logic;
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
            if hist_complete='1'then
                start_kum<='1';
            else
                start_kum<='0';
            end if;
        end if;
    end process kum_hist;
end behavioral;