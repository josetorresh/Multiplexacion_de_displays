
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MULT_V2 is
    Port ( CLK : in  STD_LOGIC;
           SEGMENTOS : out  STD_LOGIC_VECTOR (7 downto 0);
           DISPLAYS : out  STD_LOGIC_VECTOR (1 downto 0));
end MULT_V2;

architecture Behavioral of MULT_V2 is

	signal CONTADOR : INTEGER range 0 to 100000;
	signal SELECTOR : STD_LOGIC_VECTOR (1 downto 0) :="00";
	signal MOSTRADOR : STD_LOGIC_VECTOR (1 downto 0) :="00";
	signal Num1,Num2 : STD_LOGIC_VECTOR (7 downto 0);
	
begin

	CONTADOR_CLK: PROCESS(CLK)
		BEGIN
			if rising_edge(CLK) then
				if CONTADOR < 100000 then
					CONTADOR <= CONTADOR + 1;
				else
					SELECTOR <= SELECTOR + 1;
					CONTADOR <= 0;   
				end if;
			end if;
		END PROCESS;
		
		Mostrar_Displays: PROCESS(SELECTOR,MOSTRADOR,Num1,Num2)
	BEGIN
		case SELECTOR is
			when "00" =>
				MOSTRADOR <= "10";
			when "01" =>
				MOSTRADOR <= "01";
			when others =>
				MOSTRADOR <= "11";
		end case;
		
		case MOSTRADOR is
			when "10" =>
				SEGMENTOS <= Num1;
			when "01" =>
				SEGMENTOS <= Num2;
			when others =>
				SEGMENTOS <= "11111111";
		end case;
	END PROCESS;
	
		DISPLAYS <= MOSTRADOR;
	Num1 <= "10011111";
	Num2 <= "00100101";

end Behavioral;

