----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2024 12:57:50
-- Design Name: 
-- Module Name: counters - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

package counter_pkg is
    type integer_array is array (0 to 255) of integer range 0 to 2**32-1;
end package counter_pkg;
use work.counter_pkg.all; -- Use the package to access integer_array
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity counters is
    port(
        data_in:in std_logic_vector(7 downto 0);
        clk:in std_logic;
        data_out:out integer_array
    );
end counters;
architecture Behavioral of counters is
    type CounterArray is array(0 to 255) of unsigned(12 downto 0);
    signal brojac : CounterArray := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            for i in 0 to 255 loop
                if data_in = std_logic_vector(to_unsigned(i, 8)) then
                    brojac(i) <= brojac(i) + 1;
                end if;
            end loop;
        end if;
    end process;

end Behavioral;
