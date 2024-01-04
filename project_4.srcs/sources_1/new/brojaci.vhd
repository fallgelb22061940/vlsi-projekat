----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2024 16:13:34
-- Design Name: 
-- Module Name: brojaci - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity brojaci is
    port(
        input:in std_logic_vector(12 downto 0);
        output:out std_logic_vector(12 downto 0)
    );
end brojaci;

architecture Behavioral of brojaci is

begin
    output<=std_logic_vector( unsigned(input)+1);
end Behavioral;
