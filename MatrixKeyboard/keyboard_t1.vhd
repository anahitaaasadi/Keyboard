--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:11:01 12/08/2021
-- Design Name:   
-- Module Name:   D:/ISE/az8/keyboard_t1.vhd
-- Project Name:  az8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keyboard
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY keyboard_t1 IS
END keyboard_t1;
 
ARCHITECTURE behavior OF keyboard_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyboard
    PORT(
         row : OUT  std_logic_vector(3 downto 0);
         column : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0);
         hit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal column : std_logic_vector(3 downto 0) := "1111";
   signal clk : std_logic := '0';

 	--Outputs
   signal row : std_logic_vector(3 downto 0);
   signal output : std_logic_vector(3 downto 0);
   signal hit : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keyboard PORT MAP (
          row => row,
          column => column,
          clk => clk,
          output => output,
          hit => hit
        );

	clk		<=	not(clk) after 10 ns;
	column	<=	"1101" after 8 ns, "1111" after 28 ns, "1111" after 48 ns, "1101" after 68 ns,
					"1101" after 88 ns, "1111" after 108 ns, "1111" after 128 ns, "1101" after 148 ns,
					"1101" after 168 ns, "1111" after 188 ns, "1111" after 208 ns, "1101" after 228 ns;
	
END;
