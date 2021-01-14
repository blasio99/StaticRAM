----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 01:49:58 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
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
end decoder;

architecture Behavioral of decoder is

begin
    process (clk)
        variable v_concatenate : std_logic_vector (2 downto 0);
    begin 
        v_concatenate := A & B & C;
        
        if(rising_edge(clk)) then
            if(E1 = '0' or E2 = '0' or E3 = '1') then
                case v_concatenate is
                    when "000" => o <= "11111110";
                    when "001" => o <= "11111101";
                    when "010" => o <= "11111011";
                    when "011" => o <= "11110111";
                    when "100" => o <= "11101111";
                    when "101" => o <= "11011111";
                    when "110" => o <= "10111111";
                    when "111" => o <= "01111111";
                    when others => o <= x"11";
                end case;
            else
                o <= x"00";
            end if;
        end if;
    end process;
                    

end Behavioral;
