----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2021 01:18:03 PM
-- Design Name: 
-- Module Name: MemoryModule - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--synchronous solution
-- submodule circuit
entity MemoryModule is
  Port (
        clk: in std_logic;
        a: in std_logic_vector (15 downto 0);
        cs : in std_logic;
        wr : in std_logic;
        d_in : in std_logic_vector(7 downto 0);
        d_out: out std_logic_vector( 7 downto 0)
   );
end MemoryModule;

architecture Behavioral of MemoryModule is
                       --64k--
type ram_type is array (0 to 65536) of std_logic_vector (7 downto 0);
signal RAM : ram_type := ( x"00", x"11", x"22", x"33", x"44",
                           x"55", x"66", x"77", x"88", x"99",
                           x"AA", x"BB", x"CC", x"DD", x"EE",
                           others => x"FF" );
begin

    process (clk, wr, RAM, cs, a, d_in)
    begin
        if (cs = '1' and rising_edge(clk)) then 
            if(wr = '1') then 
                RAM(to_integer(unsigned(a))) <= d_in ;
            else
                d_out <= RAM(to_integer(unsigned(a)));
            end if;
        end if;
    end process;
end Behavioral;
