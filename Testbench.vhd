----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 06:53:25 PM
-- Design Name: 
-- Module Name: Testbench - Behavioral
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

entity Testbench is
--  Port ( );
end Testbench;

architecture Behavioral of Testbench is

component TopModule is
  Port (
        clk: in std_logic;
        address_bus : in std_logic_vector (23 downto 0);
        data_bus_in : in std_logic_vector (15 downto 0);
        data_bus_out: out std_logic_vector (15 downto 0);
        rd : in std_logic;
        wr : in std_logic       
  );
end component;

signal clk: std_logic := '0';
signal address_bus : std_logic_vector (23 downto 0) := (others => '-');
signal data_bus_in : std_logic_vector (15 downto 0) := (others => '-');
signal data_bus_out: std_logic_vector (15 downto 0) := (others => '0');
signal rd : std_logic := '-';
signal wr : std_logic := '-';   

begin
    
    top: TopModule port map (clk, address_bus, data_bus_in, data_bus_out, rd, wr);
    
    clock: process
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;
    
    memory: process
    begin
        wait for 100ns;
        address_bus <= x"C00000";
        data_bus_in <= x"DAD1";
        rd <= '0';
        wr <= '1';
        
        wait for 100ns;
        address_bus <= x"C00008";
        data_bus_in <= x"ABBA";
        rd <= '0'; 
        wr <= '1'; 
        
        wait for 100ns;
        address_bus <= x"C00000";
        rd <= '1';
        wr <= '0'; 
        
        wait for 100ns;
        address_bus <= x"C00008";
        rd <= '1';
        wr <= '0'; 
        
        wait;
    
    end process;

end Behavioral;
