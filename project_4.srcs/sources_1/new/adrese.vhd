library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity adrese is
    port(
        clk:in std_logic;
        read_picture:in std_logic;
        read_pic_complete:out std_logic;
        address:out std_logic_vector(12 downto 0)
    );
end adrese;
architecture behavioral of adrese is
    signal counter:unsigned(12 downto 0):=(others=>'0');
    signal picture_read:std_logic:='0';
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            if(read_picture='1')then
                counter<=counter+1;
                address<=std_logic_vector(counter);
                if counter=8191 then
                    read_pic_complete<='1';
                end if;
            end if;
        end if;
    end process;
end behavioral;