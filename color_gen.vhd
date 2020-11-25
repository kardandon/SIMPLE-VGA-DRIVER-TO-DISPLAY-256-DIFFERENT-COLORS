-- Synthesizable Simple VGA Driver to Display All Possible Colors
-- EE240 class Bogazici University  
-- Implemented on Xilinx Spartan VI FPGA chip  
 
LIBRARY ieee ; 
USE ieee.std_logic_1164.all ; 
USE ieee.std_logic_signed.all ;  
USE ieee.std_logic_arith.all ; 
USE ieee.std_logic_unsigned.all; 
 
entity color_gen is      
  port (            
         reset: in std_logic;           
         clk: in std_logic;                      
         red: out std_logic_vector(2 downto 0);           
         green: out std_logic_vector(2 downto 0);          
         blue: out std_logic_vector(1 downto 0));
  end;  
 
architecture arch_color_gen of color_gen is  
    signal count : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
begin
    process (clk,reset)
    begin
        if (reset = '1') then
            count <= "00000000";
        elsif (clk'event and clk = '1') then
            if (count = "11111111") then
                count <= "00000000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    red <= count(7 downto 5);
    green <= count(4 downto 2);
    blue <= count(1 downto 0);
end arch_color_gen; 