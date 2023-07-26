----------------------------------------------------------------------------------

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity conv_module is
    Port ( clk      : in   STD_LOGIC;
           a        : in   signed (17 downto 0);
           b        : in   signed (17 downto 0);
           en       : in   STD_LOGIC;
           conv_num : in   unsigned (2 downto 0);
           ofm      : out  unsigned (32*18-1 downto 0);
      --   busy     : out  std_logic;
           valid    : out  STD_LOGIC);
end conv_module;

architecture Behavioral of conv_module is

signal   a_int             : signed  (17 downto 0):= (others => '0');
signal   b_int             : signed  (17 downto 0):= (others => '0');
signal   en_eng            : std_logic := '0';
--signal   _int            : std_logic := '0';
signal   ofm_int           : unsigned ( 32*18-1 downto 0):= ( others => '0');
signal   valid_int         : std_logic := '0';
signal   conv_num_int      : unsigned  (2 downto 0) := ( others => '0');
signal   a_int_conv        : unsigned  (143 downto 0):= (others => '0');
signal   b_int_conv        : unsigned  (143 downto 0):= (others => '0');
signal   f_int_conv        : unsigned  (32*18*16-1 downto 0):= (others => '0');
signal   conv1_counter      : unsigned   (5 downto 0) := ( others => '0');
component conv_eng
	
	generic ( n_f : integer := 32);--number of filter P.V => 2-4-8-16-32
    Port ( clk      : in STD_LOGIC;
             a      : in unsigned (143 downto 0);
             b      : in unsigned (143 downto 0);
             filter : in unsigned (n_f*18*16-1 downto 0);
             en     : in STD_LOGIC;
           --bias   : in unsigned (n_f*16-1 downto 0);
             valid  : out STD_LOGIC;
             o_o    : out unsigned (n_f*18-1 downto 0)
         --  busy   : out STD_LOGIC
         );
	end component;
	
component	ram1_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram1_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram2_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram2_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram2_3 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram3_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram3_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram3_3 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram3_4 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_3 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_4 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_5 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram4_6 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_1_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_2_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_3_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_4_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_5_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_6_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_7_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_8_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_1_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_2_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_3_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_4_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_5_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_6_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_7_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram5_8_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_1_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_2_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_3_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_4_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_5_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_6_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_7_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_8_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_9_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_10_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_11_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_12_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_1_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_2_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_3_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_4_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_5_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_6_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_7_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_8_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);
do   : out unsigned(71 downto 0)

);

end component;
component	ram6_9_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_10_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_11_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

component	ram6_12_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end component;

COMPONENT fifo_generator_0
  PORT (
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din    : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    wr_en  : IN STD_LOGIC;
    rd_en  : IN STD_LOGIC;
    dout   : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    full   : OUT STD_LOGIC;
    empty  : OUT STD_LOGIC
  );
END COMPONENT;
--------------------input clock and engine clock--------------
signal clk_200mhz : std_logic := '0';
signal clk_50mhz  : std_logic := '0';
-----------------ram signals---------------
--type we_type   is array  (0 to 54 ) of std_logic ;
type addr_type is array  (0 to 54 ) of unsigned ( 8 downto 0) ;
type di_type   is array  (0 to 54 ) of unsigned ( 71 downto 0) ;
type do_type   is array  (0 to 54 ) of unsigned ( 71 downto 0) ;

signal we_int      : std_logic_vector(54 downto 0)   := ( others => ('0'));
signal addr_int    : addr_type := ( others => (others => '0'));
signal di_int      : di_type   := ( others => (others => '0'));
signal do_int      : do_type   := ( others => (others => '0'));
-------input fifio----------------
signal din_int_a   : std_logic_vector ( 17 downto 0);
signal wr_en_int_a : std_logic:= '0';
signal rd_en_int_a : std_logic:= '0';
signal dout_int_a  : std_logic_vector (17 downto 0);
signal full_int_a,empty_int_a : std_logic := '0';

signal din_int_b   : std_logic_vector ( 17 downto 0);
signal wr_en_int_b : std_logic:= '0';
signal rd_en_int_b : std_logic:= '0';
signal dout_int_b  : std_logic_vector (17 downto 0);
signal full_int_b,empty_int_b : std_logic := '0';
------------------counters----------------------
signal count_f1 : integer := 0;
signal count_f2 : integer := 0;
signal count_f3 : integer := 0;
signal count_f4 : integer := 0;
signal count_f5 : integer := 0;
signal count_f6 : integer := 0;

type in_buffer  is array (0 to 7) of signed(17 downto 0);
signal buffer_1   : in_buffer := (others => (others => '0' ));
signal buffer_2   : in_buffer := (others => (others => '0' ));





begin

valid        <= valid_int;
ofm          <= ofm_int;





input_fifo_a : fifo_generator_0
	  PORT MAP (
		 wr_clk 			=> clk_50mhz,
		 rd_clk 			=> clk_200mhz,
		 din 				=> std_logic_vector(a),
		 wr_en 			=> wr_en_int_a,
		 rd_en 			=> rd_en_int_a,
		 dout 			=> dout_int_a,
		 full 			=> full_int_a,
		 empty 			=> empty_int_a
	  );
	  
	  input_fifo_b : fifo_generator_0
	  PORT MAP (
		 wr_clk 			=> clk_50mhz,
		 rd_clk 			=> clk_200mhz,
		 din 				=> std_logic_vector(b),
		 wr_en 			    => wr_en_int_b ,
		 rd_en 			    => rd_en_int_b ,
		 dout 			    => dout_int_b,
		 full 			    => full_int_b,
		 empty 			    => empty_int_b
	  );
	  
	  
ram0 : ram1_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(0),
                   addr   => addr_int(0),
                   di     => di_int(0),
                   do    => do_int(0)
                          );
ram1 : ram1_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(1),
                   addr   => addr_int(1),
                   di     => di_int(1),
                   do    => do_int(1)
                          );
                          
ram2 : ram2_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(2),
                   addr   => addr_int(2),
                   di     => di_int(2),
                   do    => do_int(2)
                          );                                                    
ram3 : ram2_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(3),
                   addr   => addr_int(3),
                   di     => di_int(3),
                   do    => do_int(3)
                          );   
ram4 : ram2_3 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(4),
                   addr   => addr_int(4),
                   di     => di_int(4),
                   do    => do_int(4)
                          );                          
ram5 : ram3_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(5),
                   addr   => addr_int(5),
                   di     => di_int(5),
                   do    => do_int(5)
                          );                          
 ram6 : ram3_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(6),
                   addr   => addr_int(6),
                   di     => di_int(6),
                   do    => do_int(6)
                          );     
                          
ram7 : ram3_3 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(7),
                   addr   => addr_int(7),
                   di     => di_int(7),
                   do    => do_int(7)
                          );                          
 ram8 : ram3_4 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(8),
                   addr   => addr_int(8),
                   di     => di_int(8),
                   do    => do_int(8)
                          );  
                          
 ram9 : ram4_1 
       PORT MAP
                (
                  clk     => clk_200mhz  ,
                   we     => we_int(9),
                   addr   => addr_int(9),
                   di     => di_int(9),
                   do    => do_int(9)
                          );                         
                          
  ram10 : ram4_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(10),
                   addr   => addr_int(10),
                   di     => di_int(10),
                   do    => do_int(10)
                          );                        
                          
ram11 : ram4_3
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(11),
                   addr   => addr_int(11),
                   di     => di_int(11),
                   do    => do_int(11)
                          );
                          
ram12 : ram4_4 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(12),
                   addr   => addr_int(12),
                   di     => di_int(12),
                   do    => do_int(12)
                          );                                                    
ram13 : ram4_5 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(13),
                   addr   => addr_int(13),
                   di     => di_int(13),
                   do    => do_int(13)
                          );   
ram14 : ram4_6
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(14),
                   addr   => addr_int(14),
                   di     => di_int(14),
                   do    => do_int(14)
                          );                          
ram15 : ram5_1_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(15),
                   addr   => addr_int(15),
                   di     => di_int(15),
                   do    => do_int(15)
                          );                          
 ram16 : ram5_2_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(16),
                   addr   => addr_int(16),
                   di     => di_int(16),
                   do    => do_int(16)
                          );     
                          
ram17 : ram5_3_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(17),
                   addr   => addr_int(17),
                   di     => di_int(17),
                   do    => do_int(17)
                          );                          
 ram18 : ram5_4_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(18),
                   addr   => addr_int(18),
                   di     => di_int(18),
                   do    => do_int(18)
                          );  
                          
 ram19 : ram5_5_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(19),
                   addr   => addr_int(19),
                   di     => di_int(19),
                   do    => do_int(19)
                          );   
 ram20 : ram5_6_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(20),
                   addr   => addr_int(20),
                   di     => di_int(20),
                   do    => do_int(20)
                          );                                                              
 ram21 : ram5_7_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(21),
                   addr   => addr_int(21),
                   di     => di_int(21),
                   do    => do_int(21)
                          );
                          
ram22 : ram5_8_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(22),
                   addr   => addr_int(22),
                   di     => di_int(22),
                   do    => do_int(22)
                          );                                                    
ram23 : ram5_1_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(23),
                   addr   => addr_int(23),
                   di     => di_int(23),
                   do    => do_int(23)
                          );   
ram24 : ram5_2_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(24),
                   addr   => addr_int(24),
                   di     => di_int(24),
                   do    => do_int(24)
                          );                          
ram25 : ram5_3_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(25),
                   addr   => addr_int(25),
                   di     => di_int(25),
                   do    => do_int(25)
                          );                          
 ram26 : ram5_4_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(26),
                   addr   => addr_int(26),
                   di     => di_int(26),
                   do    => do_int(26)
                          );     
                          
ram27 : ram5_5_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(27),
                   addr   => addr_int(27),
                   di     => di_int(27),
                   do    => do_int(27)
                          );                          
 ram28 : ram5_6_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(28),
                   addr   => addr_int(28),
                   di     => di_int(28),
                   do    => do_int(28)
                          );  
                          
 ram29 : ram5_7_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(29),
                   addr   => addr_int(29),
                   di     => di_int(29),
                   do    => do_int(29)
                          );   
 ram30 : ram5_8_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(30),
                   addr   => addr_int(30),
                   di     => di_int(30),
                   do    => do_int(30)
                          );                                                        
ram31 : ram6_1_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(31),
                   addr   => addr_int(31),
                   di     => di_int(31),
                   do    => do_int(31)
                          );
ram32 : ram6_2_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(32),
                   addr   => addr_int(32),
                   di     => di_int(32),
                   do    => do_int(32)
                          );
                          
ram33 : ram6_3_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(33),
                   addr   => addr_int(33),
                   di     => di_int(33),
                   do    => do_int(33)
                          );                                                    
ram34 : ram6_4_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(34),
                   addr   => addr_int(34),
                   di     => di_int(34),
                   do    => do_int(34)
                          );   
ram35 : ram6_5_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(35),
                   addr   => addr_int(35),
                   di     => di_int(35),
                   do    => do_int(35)
                          );                          
ram36 : ram6_6_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(36),
                   addr   => addr_int(36),
                   di     => di_int(36),
                   do    => do_int(36)
                          );                          
 ram37 : ram6_7_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(37),
                   addr   => addr_int(37),
                   di     => di_int(37),
                   do    => do_int(37)
                          );     
                          
ram38 : ram6_8_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(38),
                   addr   => addr_int(38),
                   di     => di_int(38),
                   do    => do_int(38)
                          );                          
 ram39 : ram6_9_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(39),
                   addr   => addr_int(39),
                   di     => di_int(39),
                   do    => do_int(39)
                          );  
                          
 ram40 : ram6_10_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(40),
                   addr   => addr_int(40),
                   di     => di_int(40),
                   do    => do_int(40)
                          );                         
                          
  ram41 : ram6_11_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(41),
                   addr   => addr_int(41),
                   di     => di_int(41),
                   do    => do_int(41)
                          );                        
                          
ram42 : ram6_12_1 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(42),
                   addr   => addr_int(42),
                   di     => di_int(42),
                   do    => do_int(42)
                          );
                          
ram43 : ram6_1_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(43),
                   addr   => addr_int(43),
                   di     => di_int(43),
                   do    => do_int(43)
                          );                                                    
ram44 : ram6_2_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(44),
                   addr   => addr_int(44),
                   di     => di_int(44),
                   do    => do_int(44)
                          );   
ram45 : ram6_3_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(45),
                   addr   => addr_int(45),
                   di     => di_int(45),
                   do    => do_int(45)
                          );                          
ram46 : ram6_4_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(46),
                   addr   => addr_int(46),
                   di     => di_int(46),
                   do    => do_int(46)
                          );                          
 ram47 : ram6_5_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(47),
                   addr   => addr_int(47),
                   di     => di_int(47),
                   do    => do_int(47)
                          );     
                          
ram48 : ram6_6_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(48),
                   addr   => addr_int(48),
                   di     => di_int(48),
                   do    => do_int(48)
                          );                          
 ram49 : ram6_7_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(49),
                   addr   => addr_int(49),
                   di     => di_int(49),
                   do    => do_int(49)
                          );  
                          
 ram50 : ram6_8_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(50),
                   addr   => addr_int(50),
                   di     => di_int(50),
                   do    => do_int(50)
                          );   
 ram51 : ram6_9_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(51),
                   addr   => addr_int(51),
                   di     => di_int(51),
                   do    => do_int(51)
                          );                                                              
 ram52 : ram6_10_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(52),
                   addr   => addr_int(52),
                   di     => di_int(52),
                   do    => do_int(52)
                          );
                          
ram53 : ram6_11_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(53),
                   addr   => addr_int(53),
                   di     => di_int(53),
                   do    => do_int(53)
                          );                                                    
ram54 : ram6_12_2 
       PORT MAP
                (
                  clk     => clk_200mhz,
                   we     => we_int(54),
                   addr   => addr_int(54),
                   di     => di_int(54),
                   do    => do_int(54)
                          );   

  convolution_engine : conv_eng
  
                       port map 
                                (
                                clk      => clk_200mhz ,
                                a        => a_int_conv,
                                b        => b_int_conv ,
                                filter   => f_int_conv,
                                en       => en_eng,
                                valid    => valid_int,
                                o_o      => ofm_int);                        
                          
  process ( clk_200mhz ) 
  
  begin
  
  if rising_edge (clk_200mhz  )   then
  
  if en ='1' then
  
--   a_int   <= a;
--   b_int   <= b;
   conv_num_int <= conv_num;
   
  case conv_num_int is 
  
 
  

  
  when  "000" =>  --conv 0 there is 16 1*8*2 kernel  , input 1* 1031 * 2 
  
     
  
        buffer_1(7) <= a_int ;
        buffer_1(6) <= buffer_1(7) ;
        buffer_1(5) <= buffer_1(6) ;
        buffer_1(4) <= buffer_1(5) ;
        buffer_1(3) <= buffer_1(4) ;
        buffer_1(2) <= buffer_1(3) ;
        buffer_1(1) <= buffer_1(2) ;
        buffer_1(0) <= buffer_1(1) ;
        
        buffer_2(7) <= b_int ;
        buffer_2(6) <= buffer_2(7) ;
        buffer_2(5) <= buffer_2(6) ;
        buffer_2(4) <= buffer_2(5) ;
        buffer_2(3) <= buffer_2(4) ;
        buffer_2(2) <= buffer_2(3) ;
        buffer_2(1) <= buffer_2(2) ;
        buffer_2(0) <= buffer_2(1) ;
        
        
 
  
  conv1_counter <= conv1_counter + 1 ;
  

 
   
  
  when "001" =>  -- conv 1 there is 24 1*8*16 kernel
  
  
  
  
  when  "010" =>--conv 2 there is 32 1*8*24 kernel 
  
  
  when "011" =>-- conv 3 there is 48 1*8*32 
  
  
  when "100" =>  -- conv 4 there is 64 1*8* 48 kernel 
  
  
  
  
  
  when "101" => -- conv 5 there is 96 1*8*64 
  
  
  
  
  
  
  
  
  when others => 
  
  end case;
   end if;
  end if;
  end process;                                               
                                                                     
end Behavioral;
