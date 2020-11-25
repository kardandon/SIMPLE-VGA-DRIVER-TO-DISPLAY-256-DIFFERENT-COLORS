-- Synthesizable Simple VGA Driver to Display All Possible Colors
-- EE240 class Bogazici University  
-- Implemented on Xilinx Spartan VI FPGA chip  
 
LIBRARY ieee ; 
USE ieee.std_logic_1164.all ; 
USE ieee.std_logic_signed.all ;  
USE ieee.std_logic_arith.all ; 
USE ieee.std_logic_unsigned.all; 
 
entity ee240_vgadriver is      
  port (            
         nreset: in std_logic;           
         board_clk: in std_logic;            
         vsync: out std_logic;            
         hsync: out std_logic;             
         red: out std_logic_vector(2 downto 0);           
         green: out std_logic_vector(2 downto 0);          
         blue: out std_logic_vector(1 downto 0));
  end;  
 
architecture arch_vga_driver of ee240_vgadriver is  
  component VH_signal is
    Port (
          Reset : in STD_LOGIC;
          Clock : in STD_LOGIC;
          V_sync : out STD_LOGIC;
          H_sync : out STD_LOGIC
      );
  end component;
  component divider is
    Port (
          clk_in : in  STD_LOGIC;
          Reset : in STD_LOGIC;
          clk_out: out STD_LOGIC
      );
  end component;
  component color_gen is      
  port (            
         reset: in std_logic;           
         clk: in std_logic;                      
         red: out std_logic_vector(2 downto 0);           
         green: out std_logic_vector(2 downto 0);          
         blue: out std_logic_vector(1 downto 0));
  end component;
  signal CLK25 : STD_LOGIC;
  begin
    divider0: divider port map(clk => board_clk, Reset => nreset, clk_out => CLK25);
    color_gen0: color_gen port map(reset => nreset, clk => CLK25, red => red, green => green, blue => blue);
    VH_signal0: VH_signal port map(Reset => nreset, Clock => CLK25, V_sync => vsync, H_sync => hsync);
end arch_vga_driver; 