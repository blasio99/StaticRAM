----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 01:59:03 PM
-- Design Name: 
-- Module Name: DecoderCircuit - Behavioral
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

entity DecoderCircuit is
  Port (
        clk: in std_logic;
        a_17_23: in std_logic_vector (6 downto 0);
        rd: in std_logic;
        wr: in std_logic;
        sel: out std_logic_vector(7 downto 0);
        sel_module: out std_logic
   );
end DecoderCircuit;

architecture Behavioral of DecoderCircuit is

component decoder is 
  Port ( 
        clk : in std_logic;
        A : in std_logic;
        B: in std_logic;
        C : in std_logic;
        E1: in std_logic;
        E2: in std_logic;
        E3 : in std_logic;
        O : out std_logic_vector(7 downto 0)
  );
end component;

signal E1_control : std_logic := '1';
signal E2_control : std_logic := '1';
signal E3_control : std_logic := '1';
signal A21 : std_logic := '0';
signal A20 : std_logic := '0';

begin

    A21 <= not A_17_23(4);
    A20 <= not A_17_23(3);
    
    E1_control <= not (A_17_23(6) and A_17_23(5) and A21 and A20);
    E2_control <= rd and wr;
    
    sel_module <= E1_control or E2_control;
    
    decode: decoder port map (clk, A_17_23 (3), A_17_23(2), A_17_23(1), E1_control, E2_control, E3_control, sel);



end Behavioral;
