--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:10:42 11/12/2021
-- Design Name:   
-- Module Name:   D:/ISE/az5/PS2_t1.vhd
-- Project Name:  az5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PS2
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
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PS2_t1 IS
END PS2_t1;
 
ARCHITECTURE behavior OF PS2_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PS2
    PORT(
         ps2_clk : IN  std_logic;
         ps2_data : IN  std_logic;
         ps2_code : OUT  std_logic_vector(7 downto 0);
         ps2_code_new : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ps2_clk : std_logic := '0';
   signal ps2_data : std_logic := '0';

 	--Outputs
   signal ps2_code : std_logic_vector(7 downto 0);
   signal ps2_code_new : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PS2 PORT MAP (
          ps2_clk => ps2_clk,
          ps2_data => ps2_data,
          ps2_code => ps2_code,
          ps2_code_new => ps2_code_new
        );

	ps2_clk	<= not(ps2_clk) after 10 ns;
					
	ps2_data <= '1' after 70 ns, '0' after 150 ns, '1' after 190 ns;

END;
