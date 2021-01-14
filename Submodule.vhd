----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 01:32:27 PM
-- Design Name: 
-- Module Name: Submodule - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Submodule is
  Port (
        clk : in std_logic;
        a : in std_logic_vector (16 downto 0); -- A0 and A1-A16
        wr : in std_logic;
        sel_i : in std_logic;
        bhe: in std_logic;
        d_in: in std_logic_vector (15 downto 0);
        d_out: out std_logic_vector(15 downto 0)
   );
end Submodule;

architecture Behavioral of Submodule is

component MemoryModule is 
Port (
        clk: in std_logic;
        a: in std_logic_vector (15 downto 0);
        cs : in std_logic;
        wr : in std_logic;
        d_in : in std_logic_vector(7 downto 0);
        d_out: out std_logic_vector( 7 downto 0)
   );
   end component;
  
signal sel_iL : std_logic := '0';
signal sel_iH : std_logic := '0';

begin
    sel_iL <= sel_i or not a(0);
    sel_iH <= sel_i or bhe;
    
    memory_0_7: MemoryModule port map (clk, A(16 downto 1), sel_iL, wr, d_in(7 downto 0), d_out(7 downto 0));
    memory_8_15: MemoryModule port map (clk, A(16 downto 1), sel_iH, wr, d_in(15 downto 8), d_out(15 downto 8));

end Behavioral;
