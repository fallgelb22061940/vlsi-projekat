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
entity kontroler is
    port(
        clk:in std_logic;
        read_picture:out std_logic;
        read_pic_complete:in std_logic;
        reset:in std_logic
    );
end kontroler;
architecture behavioral of kontroler is
begin
    process(clk)is
    begin
        if rising_edge(clk)then
            if reset='0'then
                read_picture<='0';
            else
                read_picture<='1';
                if read_pic_complete='1'then
                    read_picture<='0';
                end if;
            end if;
        end if;
    end process;
end behavioral;