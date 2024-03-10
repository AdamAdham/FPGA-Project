library ieee;
use ieee.std_logic_1164.all;
use work.servo_package.all;
use ieee.numeric_std.all;
use ieee.math_real.round;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY gate is 
port ( clk : IN STD_LOGIC ;
motorSignal: IN STD_LOGIC_VECTOR(4 downto 0);
pwm: OUT STD_LOGIC);
END gate;

ARCHITECTURE gate_arch of gate is 

constant clk_hz : real := 10.0e6; 
constant pulse_hz : real := 50.0;
constant min_pulse_us : real := 500.0; 
constant max_pulse_us : real := 2500.0; 
constant step_bits : positive := 9; 
constant step_count : positive := 2**step_bits;
signal rotation : integer range 0 to step_count - 1;

BEGIN

PROCESS ( motorSignal ) 
	BEGIN
		
		
	CASE motorSignal IS
		 WHEN "00000" => rotation <= 0;
		 WHEN "00001" => rotation <= 12;
		 WHEN "00010" => rotation <= 24;
		 WHEN "00011" => rotation <= 36;
		 WHEN "00100" => rotation <= 48;
		 WHEN "00101" => rotation <= 60;
		 WHEN "00110" => rotation <= 72;
		 WHEN "00111" => rotation <= 84;
		 WHEN "01000" => rotation <= 96;
		 WHEN "01001" => rotation <= 108;
		 WHEN "01010" => rotation <= 120;
		 WHEN "01011" => rotation <= 132;
		 WHEN "01100" => rotation <= 144;
		 WHEN "01101" => rotation <= 156;
		 WHEN "01110" => rotation <= 168;
		 WHEN "01111" => rotation <= 180;
		 WHEN "10000" => rotation <= 192;
		 WHEN "10001" => rotation <= 204;
		 WHEN "10010" => rotation <= 216;
		 WHEN "10011" => rotation <= 228;
		 WHEN "10100" => rotation <= 240;
		 WHEN "10101" => rotation <= 252;
		 WHEN OTHERS => rotation <= 0; -- Default case, adjust as needed
END CASE;
END PROCESS;

stageServo : servo GENERIC MAP (
		 clk_hz, pulse_hz, min_pulse_us, max_pulse_us , step_count 
	)
	PORT MAP (
		 clk,'0',rotation, pwm
	);	
	
END gate_arch;