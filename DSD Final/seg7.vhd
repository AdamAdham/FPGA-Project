library ieee;
use work.servo_package.all;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY seg7 IS
    PORT (bcd: IN INTEGER ;
    leds : OUT STD_LOGIC_VECTOR(6 downto 0)) ;
END seg7 ;

ARCHITECTURE Behavior OF seg7 IS
BEGIN
    PROCESS (bcd)
    BEGIN
        CASE bcd IS          ---gfedcba
            WHEN 0 => leds <=  "1000000";
            WHEN 1 => leds <=  "1111001";
            WHEN 2 => leds <=  "0100100";
            WHEN 3 => leds <=  "0110000";
            WHEN 4 => leds <=  "0011001";
            WHEN 5 => leds <=  "0010010";
            WHEN 6 => leds <=  "0000010";
            WHEN 7 => leds <=  "1111000";
            WHEN 8 => leds <=  "0000000";
            WHEN 9 => leds <=  "0010000";
            WHEN 10 => leds <= "0000110"; --E
            WHEN 11 => leds <= "0101011"; --M
            WHEN 12 => leds <= "0001100"; --P
            WHEN 13 => leds <= "1111110"; --T1
            WHEN 14 => leds <= "1001110"; --T2
            WHEN 15 => leds <= "0010001"; --Y
            WHEN OTHERS => leds <= "1111111";
        END CASE;
    END PROCESS;
END Behavior;