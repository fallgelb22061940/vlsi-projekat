library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity counter_8bit is
    port(
        clk:in std_logic;
        in_signal:in std_logic;
        output:out std_logic_vector(7 downto 0);
        out_signal:out std_logic
    );
end counter_8bit;
architecture Behavioral of counter_8bit is
    signal counter:unsigned(7 downto 0);
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            if in_signal='1'then
                if counter=255 then
                    counter<=counter;
                    out_signal<='1';
                else
                    counter<=counter+1;
                end if;
            else
                counter<=counter;
            end if;
            output<=std_logic_vector(counter);
        end if;
    end process;
end Behavioral;
