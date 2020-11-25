LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.std_logic_arith.all ;


entity VH_signal is
	Port (
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        V_sync : out STD_LOGIC;
        H_sync : out STD_LOGIC
    );
end VH_signal;

architecture Behavioral of VH_signal is
    signal H_counter: integer range 0 to 800 := 0;
    signal V_counter: integer range 0 to 521 := 0;
begin
    process(Clock,Reset)
    begin
        if (Reset = '1') then
            V_counter <= 0;
            H_counter <= 0;
            V_sync <= '0';
            H_sync <= '0';
        elsif Clock'event and Clock = '1' then
                H_counter <= H_counter + 1;
                if (H_counter = 800) then
                    H_counter <= 0;
                    V_counter <= V_counter +1;
                end if;
                if (V_counter = 521) then
                    V_counter <= 0;
                end if;
                if (H_counter < 96) then
                    H_sync <= '0';
                else
                    H_sync <= '1';
                end if;

                if (V_counter < 2) then
                    V_sync <= '0';
                else
                    V_sync <= '1';
                end if;
        end if;
    end process;
end Behavioral;