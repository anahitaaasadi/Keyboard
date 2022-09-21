library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity keyboard is port(	row: out std_logic_vector(3 downto 0);
									column: in std_logic_vector(3 downto 0);
									clk: in std_logic;
									output: out std_logic_vector(3 downto 0);
									hit: out std_logic);
end keyboard;

architecture behavioral of keyboard is

type state is (check, row1, row2, row3, row4);
signal pr_state: state := check;

begin
process(clk)
	begin
	if rising_edge(clk) then
		case pr_state is	when check =>	row <= "0000";
													if column = "1111" then
														hit <= '0';
														pr_state <= check;
													else
														pr_state <= row1;
													end if;
								when row1 =>	row <= "ZZZ0";
													if column = "1111" then
														hit <= '0';
														pr_state <= row2;
													else
														hit <= '1';
														if column(0) = '0' then
															output <= "0000";
														elsif column(1) = '0' then
															output <= "0001";
														elsif column(2) = '0' then
															output <= "0010";
														elsif column(3) = '0' then
															output <= "0011";
														end if;
														pr_state <= check;
													end if;
								when row2 =>	row <= "ZZ0Z";
													if column = "1111" then
														hit <= '0';
														pr_state <= row3;
													else
														hit <= '1';
														if column(0) = '0' then
															output <= "0100";
														elsif column(1) = '0' then
															output <= "0101";
														elsif column(2) = '0' then
															output <= "0110";
														elsif column(3) = '0' then
															output <= "0111";
														end if;
														pr_state <= check;
													end if;
								when row3 =>	row <= "Z0ZZ";
													if column = "1111" then
														hit <= '0';
														pr_state <= row4;
													else
														hit <= '1';
														if column(0) = '0' then
															output <= "1000";
														elsif column(1) = '0' then
															output <= "1001";
														elsif column(2) = '0' then
															output <= "1010";
														elsif column(3) = '0' then
															output <= "1011";
														end if;
														pr_state <= check;
													end if;
								when row4 =>	row <= "0ZZZ";
													if column = "1111" then
														hit <= '0';
														pr_state <= check;
													else
														hit <= '1';
														if column(0) = '0' then
															output <= "1100";
														elsif column(1) = '0' then
															output <= "1101";
														elsif column(2) = '0' then
															output <= "1110";
														elsif column(3) = '0' then
															output <= "1111";
														end if;
														pr_state <= check;
													end if;
								when others =>	pr_state <= check;
													hit <= '0';
													output <= "0000";
		end case;
	end if;
end process;
end behavioral;