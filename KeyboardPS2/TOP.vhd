---------------------------------------------------------------------------------
-- File Name: TOP
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
entity TOP is port(	ps2_clk: in std_logic;
							clk_50MHz: in std_logic;
							ps2_data: in std_logic;
							ps2_code_out: out bit_vector(7 downto 0);
							ps2_code_new: out std_logic;
							com: out std_logic_vector(3 downto 0));
end TOP;
---------------------------------------------------------------------------------
architecture structral of TOP is
	component debouncer	GENERIC(	counter_size  :  INTEGER := 10);
								PORT(	clk     : IN  STD_LOGIC;
										button  : IN  STD_LOGIC;
										result  : OUT STD_LOGIC);
	END component;
	component sevensegment port(	clk: in std_logic;
											din_ones: in std_logic_vector(3 downto 0);
											din_tens: in std_logic_vector(3 downto 0);
											dout: out bit_vector(7 downto 0);
											com: out std_logic_vector(3 downto 0));
	end component;
	component PS2 port(	ps2_clk: in std_logic;
								ps2_data: in std_logic;
								ps2_code: out std_logic_vector(7 downto 0);
								ps2_code_new: out std_logic);
	end component;
	signal ps2_clk_debounced: std_logic := '0';
	signal ps2_data_debounced: std_logic := '0';
	signal ps2_code: std_logic_vector(7 downto 0):= X"00";
begin	
	U1: debouncer generic map (10) port map(clk_50MHz, ps2_clk, ps2_clk_debounced);
	U2: debouncer generic map (10) port map(clk_50MHz, ps2_data, ps2_data_debounced);
	U3: PS2 port map(ps2_clk_debounced, ps2_data_debounced, ps2_code, ps2_code_new);
	U4: sevensegment port map(clk_50MHz, ps2_code(3 downto 0), ps2_code(7 downto 4), ps2_code_out, com);
end structral;
---------------------------------------------------------------------------------