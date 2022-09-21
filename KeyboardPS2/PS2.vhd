---------------------------------------------------------------------------------
-- File Name: PS2
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
---------------------------------------------------------------------------------
entity PS2 is port(	ps2_clk: in std_logic;
							ps2_data: in std_logic;
							ps2_code: out std_logic_vector(7 downto 0);
							ps2_code_new: out std_logic);
end PS2;
---------------------------------------------------------------------------------
architecture behavioral of PS2 is
	signal dout: std_logic_vector(7 downto 0) := (others => '0');
	signal parity_check: std_logic;
	type state is (start, B0, B1, B2, B3, B4, B5, B6, B7, parity, stop);
	signal pr_state: state;
begin
	process(ps2_clk)
	begin
		if falling_edge(ps2_clk) then
			case pr_state is	when start =>	if (ps2_data = '0') then
															pr_state <= B0;
															parity_check <= '0';
															dout <= X"00";
														end if;
									when B0 =>	pr_state <= B1;
													dout(0) <= ps2_data;
									when B1 =>	pr_state <= B2;
													dout(1) <= ps2_data;
									when B2 =>	pr_state <= B3;
													dout(2) <= ps2_data;
									when B3 =>	pr_state <= B4;
													dout(3) <= ps2_data;
									when B4 =>	pr_state <= B5;
													dout(4) <= ps2_data;
									when B5 =>	pr_state <= B6;
													dout(5) <= ps2_data;
									when B6 =>	pr_state <= B7;
													dout(6) <= ps2_data;
									when B7 =>	pr_state <= parity;
													dout(7) <= ps2_data;
									when parity =>	pr_state <= stop;
														parity_check <=	dout(0) xor dout(1) xor dout(2) xor
																				dout(3) xor dout(4) xor dout(5) xor
																				dout(6) xor dout(7);
														if (ps2_data = parity_check) then
															pr_state <= stop;
														end if;															
									when stop =>	if (ps2_data = '1') then
															ps2_code_new <= '1';
															pr_state <= start;
															ps2_code <= dout;
														end if;
									when others =>	pr_state <= start;
			end case;
		end if;
	end process;
end behavioral;
---------------------------------------------------------------------------------