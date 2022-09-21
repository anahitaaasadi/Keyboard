---------------------------------------------------------------------------------
-- File Name: sevensegment
-- Description:
-- Author: Anahita Asadi
-- Date: 2021.12.11
-- Last Modified: 2021.12.11
-- Organization: K. N. Toosi. University
---------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE STD.TEXTIO.ALL;
---------------------------------------------------------------------------------
entity sevensegment is port(	clk: in std_logic;
										din_ones: in std_logic_vector(3 downto 0);
										din_tens: in std_logic_vector(3 downto 0);
										dout: out bit_vector(7 downto 0);
										com: out std_logic_vector(3 downto 0));
end sevensegment;
---------------------------------------------------------------------------------
architecture behavioral of sevensegment is
	type RAM_type is array (0 to 15) of bit_vector(7 downto 0);
	
	function ram_initialize(filename: in string) return RAM_type is
		file file1: text is in filename;
		variable line1: line;
		variable RAM1: RAM_type;
		begin for i in RAM_type'range loop	readline(file1, line1);
														read(line1, RAM1(i));
												end loop;
		return RAM1;
	end function;	
	signal RAM: RAM_type := ram_initialize("values.txt");
	begin
	process(clk)
		variable flag: std_logic := '0';
	begin			
	if rising_edge(clk) then
		if (flag = '0') then
			com <= "0001";
			dout <= RAM(conv_integer(din_ones));
			flag := '1';
		else
			com <= "0010";
			dout <= RAM(conv_integer(din_tens));
			flag := '0';
		end if;
	end if;
	end process;	
end behavioral;
---------------------------------------------------------------------------------