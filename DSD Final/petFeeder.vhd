library ieee;
use work.servo_package.all;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_signed.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY petFeeder IS
	PORT (  
		inCount: IN std_logic_vector(6 downto 0);
		bars_per_time: IN std_logic_vector(1 downto 0):="00";
		outDisplayLeftMost: OUT std_logic_vector(6 downto 0):="1111111"; --T2
		outDisplayRightMost: OUT std_logic_vector(6 downto 0);--Y
		outDisplayLeftMiddle: OUT std_logic_vector(6 downto 0):="1111111";
		outDisplayRightMiddle: OUT std_logic_vector(6 downto 0);
		clk: IN std_logic;
		sensor: IN std_logic;
		pwm: OUT std_logic);
END ENTITY;

ARCHITECTURE arch OF petFeeder is
	COMPONENT seg7
		PORT (bcd: IN STD_LOGIC_VECTOR(6 downto 0) ;
		led1 : OUT STD_LOGIC_VECTOR(6 downto 0) ;
		led2 : OUT STD_LOGIC_VECTOR(6 downto 0)
	 ) ;
	END COMPONENT;

	COMPONENT gate
		port (clk : IN STD_LOGIC ;
		motorSignal: IN STD_LOGIC_VECTOR(4 downto 0);
		pwm: OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL motorSignal: STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL motorInt: INTEGER;
	SIGNAL s1: STD_LOGIC_VECTOR(6 downto 0):= "1110111";
	SIGNAL s2: STD_LOGIC_VECTOR(6 downto 0):= "1110111";
	
	SIGNAL flag: std_logic:= '0';
	SIGNAL diff,temp1: STD_LOGIC_VECTOR(6 downto 0):= "0000001";
	SIGNAL temp8: STD_LOGIC_VECTOR(6 downto 0):=inCount;
	
	SIGNAL q : INTEGER :=0;
	SIGNAL p : INTEGER :=0;
	
	
BEGIN	
	process(clk,sensor)
		VARIABLE F : STD_LOGIC :='0';
		VARIABLE COUNT : INTEGER range -99 to 100;
		VARIABLE DIFF : INTEGER range 0 to 99;
		VARIABLE seq: STD_LOGIC:= '0';
		CONSTANT adder: STD_LOGIC_VECTOR(4 downto 0):= "00001";
		BEGIN	
		
		if rising_edge(clk) then
			if flag='0' then
				DIFF:=to_integer(unsigned(bars_per_time));
				COUNT:=to_integer(unsigned(inCount));
				outDisplayLeftMost<="1111111";
				outDisplayLeftMiddle<="1111111";
				flag<='1';
			end if;
			q <= q+1;
			if q =500000 then 
				--motorSignal<="00";
				q <=0;
				IF  sensor='0'  AND F='0'THEN	
					COUNT := COUNT - DIFF;
					F:='1';
					IF COUNT>=0 THEN
						CASE motorSignal IS
							 WHEN "00000" => 
										CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "00001";
											WHEN "10" => 	motorSignal <= "00010";
											WHEN "11" => 	motorSignal <= "00011";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00001" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00001";
											WHEN "01" => 	motorSignal <= "00010";
											WHEN "10" => 	motorSignal <= "00011";
											WHEN "11" => 	motorSignal <= "00100";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00010" => CASE bars_per_time IS
											WHEN "00" => 	motorSignal <= "00010";
											WHEN "01" => 	motorSignal <= "00011";
											WHEN "10" => 	motorSignal <= "00100";
											WHEN "11" => 	motorSignal <= "00011";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00011" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "00100";
											WHEN "10" => 	motorSignal <= "00101";
											WHEN "11" => 	motorSignal <= "00110";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00100" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "00101";
											WHEN "10" => 	motorSignal <= "00110";
											WHEN "11" => 	motorSignal <= "00111";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00101" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "00110";
											WHEN "10" => 	motorSignal <= "00111";
											WHEN "11" => 	motorSignal <= "01000";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00110" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "00111";
											WHEN "10" => 	motorSignal <= "01000";
											WHEN "11" => 	motorSignal <= "01001";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "00111" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01000";
											WHEN "10" => 	motorSignal <= "01001";
											WHEN "11" => 	motorSignal <= "01010";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01000" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01001";
											WHEN "10" => 	motorSignal <= "01010";
											WHEN "11" => 	motorSignal <= "01011";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01001" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01010";
											WHEN "10" => 	motorSignal <= "01011";
											WHEN "11" => 	motorSignal <= "01100";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01010" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01011";
											WHEN "10" => 	motorSignal <= "01100";
											WHEN "11" => 	motorSignal <= "01101";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01011" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01100";
											WHEN "10" => 	motorSignal <= "01101";
											WHEN "11" => 	motorSignal <= "01110";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01100" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01101";
											WHEN "10" => 	motorSignal <= "01110";
											WHEN "11" => 	motorSignal <= "01111";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01101" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01110";
											WHEN "10" => 	motorSignal <= "01111";
											WHEN "11" => 	motorSignal <= "10000";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01110" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "01111";
											WHEN "10" => 	motorSignal <= "10000";
											WHEN "11" => 	motorSignal <= "10001";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "01111" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10000";
											WHEN "10" => 	motorSignal <= "10001";
											WHEN "11" => 	motorSignal <= "10010";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10000" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10001";
											WHEN "10" => 	motorSignal <= "10010";
											WHEN "11" => 	motorSignal <= "10011";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10001" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10010";
											WHEN "10" => 	motorSignal <= "10011";
											WHEN "11" => 	motorSignal <= "10100";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10010" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10011";
											WHEN "10" => 	motorSignal <= "10100";
											WHEN "11" => 	motorSignal <= "10101";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10011" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10100";
											WHEN "10" => 	motorSignal <= "10101";
											WHEN "11" => 	motorSignal <= "10110";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10100" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10101";
											WHEN "10" => 	motorSignal <= "10110";
											WHEN "11" => 	motorSignal <= "10111";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							 WHEN "10101" => CASE bars_per_time IS
											WHEN "00" =>	motorSignal <= "00000";
											WHEN "01" => 	motorSignal <= "10110";
											WHEN "10" => 	motorSignal <= "10111";
											WHEN "11" => 	motorSignal <= "11000";
											WHEN OTHERS => motorSignal <= "00000";
										END CASE;
							WHEN OTHERS => motorSignal <= "00000";
							END CASE;
						END IF;
				END IF;
			END IF;
		END IF;
			IF sensor='1' THEN
				F:='0';
			END IF;
			if(COUNT<0) then
				outDisplayRightMiddle<="0101011";
				outDisplayRightMost<="0001100";
				outDisplayLeftMost<="0000110";
				outDisplayLeftMiddle<="0101011";
				--motorSignal<="00000";
			else
			CASE (COUNT MOD 10) IS
				WHEN 0 => outDisplayRightMost <=    "1000000";
				WHEN 1=> outDisplayRightMost <=     "1111001";
				WHEN 2=> outDisplayRightMost <=     "0100100";
				WHEN 3 => outDisplayRightMost <=    "0110000";
				WHEN 4 => outDisplayRightMost <=    "0011001";
				WHEN 5 => outDisplayRightMost <=    "0010010";
				WHEN 6 => outDisplayRightMost <=    "0000010";
				WHEN 7 => outDisplayRightMost <=    "1111000";
				WHEN 8 => outDisplayRightMost <=    "0000000" ;
				WHEN 9 => outDisplayRightMost <=    "0010000";

				WHEN OTHERS => outDisplayRightMost <= "-------";
			END CASE;

				CASE (COUNT/10) IS
			WHEN 0 => outDisplayRightMiddle <=    "1000000";
			WHEN 1=> outDisplayRightMiddle <=     "1111001";
			WHEN 2=> outDisplayRightMiddle <=     "0100100";
			WHEN 3 => outDisplayRightMiddle <=    "0110000";
			WHEN 4 => outDisplayRightMiddle <=    "0011001";
			WHEN 5 => outDisplayRightMiddle <=    "0010010";
			WHEN 6 => outDisplayRightMiddle <=    "0000010";
			WHEN 7 => outDisplayRightMiddle <=    "1111000";
			WHEN 8 => outDisplayRightMiddle <=    "0000000" ;
			WHEN 9 => outDisplayRightMiddle <=    "0010000";

			WHEN OTHERS => outDisplayRightMiddle <= "-------";
			END CASE;
		END iF;
	END PROCESS;
	stageOpenFirst: gate PORT MAP(clk,motorSignal,pwm);
	
END ARCHITECTURE arch;