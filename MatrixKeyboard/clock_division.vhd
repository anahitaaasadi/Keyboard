---------------------------------------------------------------------------------
-- File Name: clock_division
-- Description: This code divides input frequency to a given value (1Hz)
-- Author: Anahita Asadi
-- Date: 2021.20.10
-- Last Modified: 2021.21.10
-- Organization: K. N. Toosi. University
---------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
---------------------------------------------------------------------------------
entity clock_division is	generic(	DIV  :  integer := 10);
									port(		clk_in:	in std_logic;
												clk_out:	out std_logic);
end clock_division;
---------------------------------------------------------------------------------
architecture sequential of clock_division is
	signal	clk:	std_logic := '1';
	begin
		process(clk_in)
			variable i:	integer := 1;
			begin
				if(clk_in'event and clk_in = '1') then
					if (i < DIV) then
						i := i + 1;
					else
						clk <= not(clk);
						i := 1;
					end if;
				end if;
			end process;
	clk_out <= clk;
end sequential;
---------------------------------------------------------------------------------