--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:52:35 11/12/2021
-- Design Name:   
-- Module Name:   D:/ISE/az5/sevensegment_t2.vhd
-- Project Name:  az5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sevensegment
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sevensegment_t2 IS
END sevensegment_t2;
 
ARCHITECTURE behavior OF sevensegment_t2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sevensegment
    PORT(
         clk : IN  std_logic;
         din_ones : IN  std_logic_vector(3 downto 0);
         din_tens : IN  std_logic_vector(3 downto 0);
         dout : OUT  bit_vector(7 downto 0);
         com : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din_ones : std_logic_vector(3 downto 0) := (others => '0');
   signal din_tens : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dout : bit_vector(7 downto 0);
   signal com : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sevensegment PORT MAP (
          clk => clk,
          din_ones => din_ones,
          din_tens => din_tens,
          dout => dout,
          com => com
        );

	clk <= not(clk) after 10 ns;
	din_ones <= "0110" after 1 ns;
	din_tens <= "1000" after 1 ns;

END;
