LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.std_logic_arith.all ;


entity divider is
	Port (
        clk_in : in  STD_LOGIC;
        Reset : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end divider;

architecture Behavioral of divider is
    signal temporal: STD_LOGIC := '0';
    signal counter : integer range 0 to 3 := 0;
begin
    process ( clk_in,Reset) 
    begin
        if (Reset ='1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 3) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;