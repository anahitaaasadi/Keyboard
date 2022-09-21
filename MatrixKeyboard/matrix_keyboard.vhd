library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE STD.TEXTIO.ALL;

entity matrix_keyboard is port(	clk: in std_logic;
											row: out std_logic_vector(3 downto 0);
											column: in std_logic_vector(3 downto 0);
											output: out bit_vector(7 downto 0);
											common: out std_logic_vector(3 downto 0));
end matrix_keyboard;

architecture Behavioral of matrix_keyboard is

	component debouncer	GENERIC(	counter_size: INTEGER := 10);
								PORT(		clk: IN STD_LOGIC;
											button: IN  STD_LOGIC;
											result: OUT STD_LOGIC);
	END component;
	
	component clock_division generic(DIV  :  integer := 10);
									 port(	clk_in:	in std_logic;
												clk_out:	out std_logic);
	END component;
	
	component keyboard port(row: out std_logic_vector(3 downto 0);
									column: in std_logic_vector(3 downto 0);
									clk: in std_logic;
									output: out std_logic_vector(3 downto 0);
									hit: out std_logic);
	END component;
	
	component sevensegment port(	clk: in std_logic;
											input: in std_logic_vector(3 downto 0);
											output: out bit_vector(7 downto 0);
											com: out std_logic_vector(3 downto 0);
											hit: in std_logic);
	END component;

	signal column_stable: std_logic_vector(3 downto 0) := "0000";
	signal clk_keyboard: std_logic := '0';
	signal output_keyboard: std_logic_vector(3 downto 0) := "0000";
	signal hit: std_logic := '0';
	
begin	

	B0: debouncer generic map (10) port map(clk, column(0), column_stable(0));
	B1: debouncer generic map (10) port map(clk, column(1), column_stable(1));
	B2: debouncer generic map (10) port map(clk, column(2), column_stable(2));
	B3: debouncer generic map (10) port map(clk, column(3), column_stable(3));

	U1: clock_division generic map (25000) port map(clk, clk_keyboard);
	U2: keyboard port map(row, column_stable, clk_keyboard, output_keyboard, hit);
	U3: sevensegment port map(clk, output_keyboard, output, common, hit);

end Behavioral;