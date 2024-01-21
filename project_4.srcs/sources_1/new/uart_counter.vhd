library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity uart_counter is
    port(
        start:in std_logic;
        tx_busy:in std_logic;
        ram:out std_logic_vector(2 downto 0);
        ispis:out std_logic;
        adresa:out std_logic_vector(12 downto 0)
    );
end uart_counter;
architecture Behavioral of uart_counter is
    signal counter:unsigned(12 downto 0):=to_unsigned(0,13);
    signal memorija:unsigned(2 downto 0):=to_unsigned(0,3);
    signal load:std_logic;
begin
    process(tx_busy)is
    begin
        if falling_edge(tx_busy)then
            if start='1'then
                load<='1';
            elsif memorija=7 and counter=8191 then
                load<='0';
            else
                load<=load;
            end if;
            if load='1'then
                if counter=8191 then
                    memorija<=memorija+1;
                    counter<=to_unsigned(0,13);
                else
                    ram<=std_logic_vector(memorija);
                    counter<=counter+1;
                    adresa<=std_logic_vector(counter);
                end if;
            else
                ram<=std_logic_vector(memorija);
                adresa<=std_logic_vector(counter);
            end if;
        end if;
        ispis<=load;
    end process;
end Behavioral;
