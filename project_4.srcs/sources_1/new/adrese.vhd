----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Vlada Jeremi�
-- Create Date: 30.12.2023 12:36:11
-- Design Name: 
-- Module Name: projekat - Behavioral
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


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--package RAM_definitions_PK is
--    impure function clogb2 (depth: in natural) return integer;
--end RAM_definitions_PK;

--package body RAM_definitions_PK is
--    --  The following function calculates the address width based on specified RAM depth
--    impure function clogb2( depth : natural) return integer is
--        variable temp    : integer := depth;
--        variable ret_val : integer := 0;
--    begin
--        while temp > 1 loop
--            ret_val := ret_val + 1;
--            temp    := temp / 2;
--        end loop;
--        return ret_val;
--    end function;
--end package body RAM_definitions_PK;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity adrese is
    port(
        clk:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
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
            if(read_picture='1'and picture_read='0')then
                counter<=counter+1;
                address<=std_logic_vector(counter);
                if counter=8191 then
                    picture_read<='1';
                    read_pic_complete<='1';
                end if;
            end if;
        end if;
    end process;
end behavioral;