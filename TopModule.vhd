----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 02:09:44 PM
-- Design Name: 
-- Module Name: TopModule - Behavioral
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

entity TopModule is
  Port (
        clk: in std_logic;
        address_bus : in std_logic_vector (23 downto 0);
        data_bus_in : in std_logic_vector (15 downto 0);
        data_bus_out: out std_logic_vector (15 downto 0);
        rd : in std_logic;
        wr : in std_logic       
  );
end TopModule;

architecture Behavioral of TopModule is

component MemoryMatrix is
    Port ( 
            clk : in std_logic;
            a : in std_logic_vector(16 downto 0);
            sel: in std_logic_vector (7 downto 0);
            wr : in std_logic;
            bhe: in std_logic;
            d_in : in std_logic_vector (15 downto 0);
            d_out : out std_logic_vector (15 downto 0)
    );
end component;

component DecoderCircuit is 
  Port (
        clk: in std_logic;
        a_17_23: in std_logic_vector (6 downto 0);
        rd: in std_logic;
        wr: in std_logic;
        sel: out std_logic_vector(7 downto 0);
        sel_module: out std_logic
   );
end component;

signal memory_selection : std_logic_vector (7 downto 0);
signal notWr : std_logic := '0';
signal notRd : std_logic := '0';

begin 
    notRd <= not rd;
    notWr <= not wr;
    -- connected by memory_selection
    decoder: DecoderCircuit port map (clk, address_bus (23 downto 17), notRd, notWr, memory_selection, open);
    memory : MemoryMatrix port map (clk, address_bus(16 downto 0), memory_selection, wr, '1', data_bus_in, data_bus_out);
    -- static memory is done

end Behavioral;
