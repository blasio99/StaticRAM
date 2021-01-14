----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 01:43:59 PM
-- Design Name: 
-- Module Name: MemoryMatrix - Behavioral
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

entity MemoryMatrix is
    Port ( 
            clk : in std_logic;
            a : in std_logic_vector(16 downto 0);
            sel: in std_logic_vector (7 downto 0);
            wr : in std_logic;
            bhe: in std_logic;
            d_in : in std_logic_vector (15 downto 0);
            d_out : out std_logic_vector (15 downto 0)
    );
end MemoryMatrix;

architecture Behavioral of MemoryMatrix is

component Submodule is 
  Port (
        clk : in std_logic;
        a : in std_logic_vector (16 downto 0); -- A0 and A1-A16
        wr : in std_logic;
        sel_i : in std_logic;
        bhe: in std_logic;
        d_in: in std_logic_vector (15 downto 0);
        d_out: out std_logic_vector(15 downto 0)
   );
end component;
begin
    
    matrix: for i in 0 to 7 generate
        sub_module: Submodule port map (clk, a, wr, sel(i), bhe, d_in, d_out);
    end generate;
    
end Behavioral;
