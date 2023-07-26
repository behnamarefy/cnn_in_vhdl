library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram3_4 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram3_4;

architecture syn of ram3_4 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := (                                                      
"111111111101011000111111110101000101000000100101100010111111100110000010",
"111111110010010111111111110111111000111111101100100010111111000110001000",
"111111000100010000111110111011000101111111011111001101111111110011001001",
"111111111100101100111111111001000110000001010001011101111111010111011010",
"000000110110000001000000101111001110111111110000111001000000101001110111",
"000000011011111001000000110101100000000000010100011101111111011110101111",
"111111110100101101111111111110010010111111001011000111000000010110010001",
"000000001111111101000000100111101001000000001100000011111111111100111010",
"111111001011011110111110001100110100111111011011000001111111000110011111",
"000000010000011111111111111101010101000000000110100101000000010000111111",
"000000000110110010111111111001110101000000100101101000000000011111111100",
"000000000010011110111111000001011010111111010000011110000000101000101000",
"000000001111100000000000001000000010000000000010001100111111011011110110",
"000000110111100110000000110011110011000000010011000000000000101100111100",
"000000010101001110000000000111001101000000101100101100111111110001011010",
"111111011001111000111111111000010101000000000011010011000000100100101111",
"000000011000011111000000010100101001111111100101011100000000011110000111",
"000000101010100100000000001001111010000000110000100001111111100010110001",
"111111001110111110111110111010001011000000011011011010000000000110100110",
"000000000011111100000000101100000011000001001001011110111111110111100000",
"000000001110001001111111010010011110111111101111011100111111101110101011",
"000000100110100001000000001010001000111110111111000111000000001011111010",
"111111001010110111000000000001111000111111101100001100111111110111010011",
"000000100001001000111111010111111000000000010110101010111111111001010010",
"000000011010100000111111110110010010111111001100011101000000000000101010",
"111110111001110111111111101110010110000000010000011111111111111000110010",
"000000101000000010000000110101000001111111011000011100000000000001100111",
"000000100100110010000000100111000001000000100011010010111111111101001001",
"111111101110100000000000001011001010111111100110010110000001000011000001",
"000000100110111001000000101110011101000001000110011011000001000110010011",
"111111000100010101000000000101000100000000000011110000111111101000111100",
"000000000011110011111110111111010110111111100010011101111111010001111000",
"111111010010100111111111100011001011000000100111000110111111010000111000",
"000000110010011110111111011110111011111111001100110011000000000001001011",
"000000110111000001000000001001110111000000010111100110000000011010011101",
"000000001101101110000000010100001110000000101011000010000000101111000111",
"111110110000101111111111111001101001111110101101011101111111101110001111",
"111111010111010100000000010101100111111111011100000110111111111011100011",
"000000010001100111111111100000001101000000011110111001111111111010001000",
"000000010100000101000000101110011001000000010010001100111111110100011001",
"000000011011000011111111011000110101111111110100110010111111011100011111",
"111111101001000010000000000111001010111111010011101110000000000100111001",
"000000000000101111000000101001110010111111001111110111111111011110110001",
"111111011100110000111111111101100101111111101001010010000001001001110010",
"111111111000100001000000100011101000000000100100011111000000000011010101",
"000000100100001011111111100111101100111111111000011001111111001101110000",
"111111110000110100000001000000111100000000001110001001000000001011110010",
"000000001011001101111111111100010000000000100001100101000000010111101010",
"000001000111001011111111101011010000111111111000000111111111100111101000",
"111111101110100000111111111100001100111111110110101101111111010111101111",
"000001010011100010111110111111100110111111000110010110000000010010111110",
"111111101111011110111110000001100011111111101010111101000000111111001010",
"000000100110000110000000101110111010000000111010110111000000101011100000",
"111111101000011111000000011111011100000000001101000000111111101101100110",
"000000111011100100111111001110011001000000001001111000000000001000010111",
"000000111011011001000000101100000001000000011000001111111111011100011010",
"111111110110101001000000011110010100000000000100001111000000010001011001",
"111111111100000101000001001000110000000000010101110101111111001011011101",
"111111101001011001000000011100100010000000101011010111111111111011111110",
"000000001000001001000000111010010001111111111100110110000000010001100010",
"111111100110110010000000101101110110000000100101001100111111100011011010",
"000000011010011111000000100001011000000000000101110001000000010111000111",
"111110011101101100111110110111011111111111010111110000111111001010011101",
"111111010110111001111111101010110100111111111011001100111111010100000000",
"111111100111101110000000011100110010000000010110100001000000001001000100",
"000000011010101111000000001011010110111111011101110101000001001101010000",
"000000010110101110111111101100010110000000100101001100111111010111111000",
"000000111011010100111111011110100101111111001011001110111111110000011001",
"111111011010010010111111000111110111111111010101101010000000010000111000",
"000000001000100001111111111100100011111111111000011010000000010000110100",
"000000101011011101000000101100000100000000111110100001111111111000011100",
"000000000000110111000000100000110010111111110111110101111111110001010100",
"000000111011111011000000001101001110000000000100010110111111101101110000",
"111111100010011111000000111110100010111111111010111100000000001011001011",
"111111010010000010000000001000010000111111010010001000000000110010001000",
"000000011001110001111111101100111000000000001101001000000000010111000011",
"000000110001010110111111000000001011000000011100001001111111011010001110",
"000000010001010000111111110000011110000000110010010100000000101110001110",
"000001000011110001111111010110011111111110110111011100000000100000100010",
"111111111000000001000000000000001001000000011101101000000000001000001111",
"000001000000010100000000010110001001000000001000111001000000010100010100",
"000000010001100010000000110011110011000000101111100110111111110100001010",
"000000011111101101111111011000000011000000011011000100111111100010011111",
"000000010101110110111111100111110001000000011010100100111111100010100011",
"111111101000011101000000100011100001000000010000111101111111111111110011",
"111111011010110110111111110011011001111111100101000110000000101000111001",
"000000100100110101111111001011101100000000001010101111000000000001101010",
"000000100010000010000000110101101100111111011000010000111111011101100000",
"000000000010101100000000101010001100000000011011011001000000011100010110",
"111111101111110000111111010011010001111111110000111111000000001000010110",
"111111011101100011111111000101101100111111111100001100111111010001011011",
"111110110011111111111111011101100110111111110000010000000000011011010010",
"111111011001011110000000100111110110111111100001111110111111100111101100",
"111111001101110010111111101110100100000001100011001000111111011101100101",
"000000001101000001000000001111000111111111011100010011111111001011001000",
"000000000011100101000000110011101000000000101110101010111111110010001101",
"000000000000110110000000001001010010000000111010111001111111100001000011",
"000000000101010011000000000110001001000000010000011011111111000111101000",
"000000010010101010111111100010100110000001000111001011111111111111110110",
"111111100010001000111111110001111010000000100001101011000000000011001111",
"111111110100100011111111010101010110000000010010000000000000000011110000",
"111111001000110000111111010111011100000000001011100100000000010110000110",
"000000100000100100111111001011000100111111001011101110000000010100111011",
"111111100100110010000000010011000001000000001100001110000000001001110010",
"000000110000101110111111110100110001000000011110110000000000010011110010",
"000001001011111100000001001111111100111111111101101100000000011001010101",
"000000110111100110000000111001111011000000011111000010000001001000100111",
"000000010001110111000000111101000101111111110110010101000000111001011101",
"111111111000000001111111011110110010000000000010100100111111100111010000",
"000000100100011000111111111101000011000000000000101010000000001111001000",
"111111100011011110000000001000000100111111101100001101111111111001001111",
"111111101101001000000000111010001111111111010100011101111111011101000111",
"111111111110110101111111111101010100111111010100011110000000001110111110",
"000000000101010000111111110111101110000000000110010110111111100100000110",
"111111111100101100000000101001110001000000101010001111000000001010011110",
"111111110110100011111110111101000011111111100100111111000000100111011011",
"000000001101110101000000011000010101111111101010011000111111101001110100",
"111111110011011101000000001100000000000000011110011010000000111000100010",
"111111010010110100111111011001001011000000000010001100111111110010110101",
"111111011011000001111111001101101100000000000111000011111111011110010100",
"111111001001000000111110110111110000000000001010000101000000011011010011",
"111111110000001100000001010011100000111111101101111111000000100100000110",
"111111010100011000111111011000100100111111111101100011111111001100101111",
"111111110100011100000000000011000011000000001111010100111111000010110101",
"000000101010000100000000010000101111111111110110110101000000011100100111",
"111111111001000001000000000110110100000000011000100110111111101011001100",
"111110101110101010111110011011101100111111000101010000111111010011011011",
"111110111010010001111110100011010111111110110101011110111110011010001110",
"111111101111100010111111101100011011111111101101110000000000110001100001",
"111111010101101010111111100110111011000000000011011011111111011111010111",
"000000001000001100111111000011110000111111010111011000111111110100100011",
"000000001111010100000000111001000101111111100100111100111111111100000100",
"000000011011000001000000001100100111000000100001110101000001010110111110",
"111111101010000001111111011111001010000000100100110000111111101001001010",
"111111101100010001000000001100001001111111100010001011111111011011001011",
"000000010110010000111111001000001000111111000101010111111111011011010010",
"111111110101100001111111111011100001000000011001000001111111001100001110",
"111111010001000001111111110011000011111111100011100110111111100011110010",
"000000010001110011000000100001101100111111100000101111111111101011100111",
"111111011101010100000000000111011111111111011110010011111111011100001000",
"111111100111011000111111110000100110111111100011111011000000100101100011",
"000000110100010011000000110011100001000000100011000010000000111000111000",
"000000001010100111111111011101000000111111011110010011111111100000110001",
"000000110001010000000000101011111101111111111101011101000000101001110000",
"111111011000000010000000011100110010000000011110001110111111001110110111",
"111111000101011010000000000101101000111111110110101111111111011001100000",
"111111110111000110000000110000100011000001011100011001000000001100001101",
"000000010001000100000000110110110101000000010101010110000000011101101010",
"111111101100110010111111011000110010000000001111100101000000110111111111",
"111111101111001111111111100010000010111111101101011011111111111101001101",
"000000000000100010111111100101001011000000101001111010000000010010111111",
"000000011000110111111111110110010111111111011011011101000000010011110000",
"000000000010101101000000111011110001000000010100000100000000011011010000",
"000000010111110000000000100011111110111110110011010110111111000011011101",
"111111110001111001111111001111111001000000111001000010000000000010010100",
"111111010110000000111111001111111100111110111101101101000000000110010011",
"111111001100100100111111101100101010111111100111010110000000001001001110",
"111111101110101001111111001010000100111111101100001110000000000100110001",
"000001000110101111111111100000001010000000001001101000000000000011000100",
"000000000011010101000000010011000010111110111111010001111111100101111001",
"000000011100100010000000000111101001111111110010011100000000111110101111",
"111111000001001010000000010001111101000000011110111100111111001111100000",
"000000100000111001000000100000001100000000001110000011000000110011100010",
"111111100100100001111111010000010111111111011101100011000000110011001010",
"000000001000010101111111011100001110000000111001000110000000111001101001",
"000000001010011011000000101000001011111111101110111111000000100101011101",
"000000011000101001111111011111011101111111111011010011111111011010111111",
"000000001100011111000000001111110100111111011011110011111111011000000101",
"000000111010101101000000101111110101111111111000100011000000011111010110",
"000000010011001101111111001010111000111111001110101100111111101000100000",
"111110100100001000111111000010000100111111011100100010111111001100011000",
"111111011001100000111111000111010010111111001010110110111111001001111001",
"111111100000111100111111100111011110111111111001101111000000010000110101",
"111111000001100011111111101100101100111111001111100010000000011001011010",
"111111000110100010111111111100001110000000001000101011111111110000010100",
"000001001011000011000000110111001010111111010101110001111111101101011010",
"111111011000001010000001001100011111000000100110110010000000000101000011",
"111111100111010100111111100110001011000000010100101101111111100101001010",
"111110111011000110111111011001100111111111110011111000000000100111100110",
"000000100110010111000000000110011000000000011110111010000000010100111100",
"111111111011001110111111100111010011111111001111001111111111101111001111",
"111111011001101001111111101101011010000000000110000101000000010010101111",
"111111110000011011111111111110011100000000010111000101000000111010010111",
"111111110000110010111111010010111110111111010010010110111111100100111001",
"111111101011010000111111111101101111111111010010111101000000000110111010",
"111111101010011010111111100101011111000000010111000010000000101011011100",
"111111001101001001000000101010000111111111100110000011000000000011000111",
"111111101110100011111111110001011001111111100010101010111111010111100110",
"000000010001011000000000000000011110000001000011001000000000101001111011",
"000000111011010001111111110001101100000000101101010011111111001011011001",
"111110111111010011111111011111111010111111001010001111111111010101001000",
"111111111010111111000000010110001100111110111000111101111111010111010010",
"111111000110010000000000010100010011000000011011111110111111011101001101",
"000000001111001001111111100011011010111111111011101011000000101001100110",
"111110001101000010000001001011110101000000101000010110111111110010110001",
"111111100011110001000000001111100001111110000100001001000001100100100011",
"111111101110010100111111011111101101000000000011010100000000100101110001",
"000000011010100001000000011110011011111111011111011100111111100010011111",
"111111111000101101000000101010100111000000001010101101111111111100000111",
"000000010101101101000000000011111111111111111001100100111111101101000010",
"000001000000100100000000011011101010000000100000111100000001011011000101",
"111111100010010010111111100011100010111111100010010100000000011001110111",
"000000001100010100000000010000000111000000101110010100000000111010001000",
"000000000100111000000000001110110000000000110101111100000000010000101100",
"000000011100101001000000011010010100000000011101101110000000111000110000",
"000000000111011001111111000000110000111111010111000111000001000000110001",
"000001001011011011000000001111111000111111100001111110000000100111101100",
"111111011101110110111111011010001011111111101011101110111111101101111001",
"111111101100000010000001000000100001000000010110111010000000011000011100",
"111111101011000110111111011101000100000000101000110100111111000000011011",
"111111101111001100000001001000110000111111111110100100000000010011110101",
"111110101001100010000000010011011011111111100010110001111110100100101001",
"111111001111111111111110100001100001111111110011111001111111101100011000",
"000000111001011001000001000001101100000000011101011111111111111101001110",
"111111001101100101111111010000010000111110111111000000111111001101111011",
"000000100111101100000000110010011010111111111011101100000000010001101011",
"111111100100011000000001010011101100111111011010110001000000000111110101",
"111111100100000011000000010011000100111111100100100001111111000110000001",
"000000001001001100111111101001100110111111111110110001111111010011111011",
"000000011001101111000000011100110001000000100100001000111111101111000011",
"111111110000000110111110110010111110111111101110100110111111111010110011",
"111111111000000111000000001010110010000000011101001001111111101110110010",
"000001000110011010111111110110110101000001000011011010000000110110111001",
"111110111100011001111111101111100111111111101111100011111110111110010000",
"111111011001010111000001101101001110111111101101110110111111011100110000",
"111111100100100111111111010010111110000000111010010111000000010110000101",
"111111001111111100111110111100010011111110101110001111111111110010110111",
"000000000011101110000000100101001001111111000111000010111111011110100001",
"000000000101010001111111011101010011111111000011001010000000010001000101",
"111111101000011000000000010101101000000001000001011111111111100001010110",
"111111101100000111000000100100110001000000011111111111000001000010010101",
"111111010110000101000000111100001101111111011100100000111111100101100100",
"111111011101100111111111100011001000111111101110000111111111001000010010",
"000000001100110110000000001000000101111111100000110110000000110000010011",
"111110111101111100111111111110000110111111100100010000000000011111011000",
"000000011100011111000000001001100010111111111101011000111110111000011101",
"000000111000011110111111101000000110111111110011101000000000000000111000",
"000000010110010001111111111101111111111110100101100000111111100101000000",
"000000000110100101111111111010001110111110110011010011000000000010010001",
"111111101010101100000000111000010100000000011010010011000000111010000110",
"111111111110100001111110111001010111111111110000111010111111110111001101",
"111111111100000000111111001101000011111111010010110001111111111010001010",
"000000101101010101000001011011011001111111100100111100000000010010010111",
"000000101000011010000000010111000101000000101010101100000001010001011101",
"111111111001010010000000000011110100111111011100111011111111111100001101",
"000000100001000111111111111100101011111111110001011001111111110110001110",
"111111100111000101111111110001111110000000001010000011000000011101110100",
"111111010101000101000000101111001001000000100001000000000000010100110110",
"000001010000111110111111101111111110111111010111000001111111000101000011",
"111111110000110000111111011101000000000000100100010010000001100010000100",
"000000000101001001000000010101010101111111111011110101111111101010101110",
"111111011010000000000000010101000100000000011110010000000000011000110010",
"000000011001101110000000101011011100111111011000010101000000100101100011",
"000000101010000110000000011100111111111111111001001100000001101000110011",
"111111110001100001111111001111101110111111101000111000111111011110101111",
"000000010001001000000000000000000111000000010111000101111111100010001101",
"111111010100110100111111000001001111111111100101110000000000001011000101",
"111111110011010000111111111000011000111111100101001101111111001110111100",
"000000000110011101000000011010001101111111101001010011000000110010110000",
"111111010101100110111110100100111011000000100011111000111111111100111011",
"000000000011010100111111111000100100111111110000000101111111011111110011",
"111111000111111111000000011010110101111111010100011001000000001000110010",
"111111100010100100000000000110001011111111101010100000111111110110100010",
"111111101110011010111111000010100101000000000001000000111111100110111010",
"111111101110110111111110101100001000111110100011101100111111101000000001",
"111111010010010101111111010100001011000000010011100111111111111000101101",
"000000110010010100111111101111011001000000001111111110000000001100101011",
"000000101001111101000000010100011000000000101111011000000000001000100100",
"000001101010001010000000111001000001000000011110011101111111110110101111",
"000000111001111010000000000111011011000000100110001101000000011100100101",
"111111001101101011111110100101111101111111011110110001000000000011101110",
"000000010111110110000000111011101010111111001001001111111111001101100111",
"111110111100011110111110111110011111111111001010100100111111001111110010",
"111111110111110000111111001010101011000000101111110111111111111001100011",
"000000000110100110000000010100110101000000010111011100000000000011111101",
"000000111100110000000000000010110010000001000001111110000000101110110010",
"000000011001101001000001010010001010000000010101001110111111000101000001",
"111111111100111111111111101001110010111111100110111101111111101100011001",
"111111101111011110111111011010001110000000000010000111000000000100011001",
"111111110111110011000000100100000011111111000001001100000000101100100100",
"000000011110110001000000001110110001000000011001100010000000011011001111",
"000000010001100110111111110101101110111111110100111110111111101011010010",
"000000101000110101000000000010011010000000001100110101000000110111111100",
"111111110111001011111111011000011001000000100010100111111111110000010110",
"000000110001110101000000100100000000000000101101101010111111000100000110",
"000000001000101101111111011110000111000000011101011101000000110110101000",
"000001011011111000000001000101011010000001010000111110000001000000101010",
"000000100110011010111111111001111000000000111001000111000000100110100010",
"111111111100100111111111011110110101000000001111100111000000101100010011",
"000000101000000010111111011110000100000000011001011011111111110100101100",
"111111000100110000000000001100011011111111100100100100111111111011100100",
"111111111001011111000000001010001011000000100110111111111111111101111110",
"000000000011011001000000100101101011000000000011010011111111011111110000",
"111111101111001110000000010010000011111111001110001110000000000100011110",
"111111001110100000000000000011100001000000111010001100000000000001010011",
"111110111110110111000000010111011100111111001100011101111111000011101000",
"111110000010010110111110011110001101000001010011111011000001011101010100",
"111111111010010111111111011010000001111111100100000010000000100001110101",
"111110110010001110111111100010001110000000111101001100000000010000000001",
"111111101010010100111111110010001010111111100010001000000000011001111001",
"111110001001010110111111011101000110000001110100110000111111111100110011",
"111111111100001110111111101010010100000000011100111010111111011100000100",
"000000010001111001111111110100101100000000100001001001000000010111101100",
"000000010110000101111111100101110010000000110111010101111111011010111111",
"000000010001101010000001000100110110111111000110101111111111011110110010",
"000000011010111001111111010111000100000001011110111011111111100111101110",
"111101110101110001000000100001111011000000110100001001000000110111011011",
"000000001101000100000000010100011111000000001101110001111110100110010011",
"111111100111010111111111010001001111000000011100011100111111100001111111",
"000000101011001011111111111111101110000000000110011101111111110000011010",
"111111011010010011111111100111110011000000001111011100000000101001000001",
"000000001011101110111111101001111110000000110110111001000000000011110010",
"111110000101010111111111111110100101000001010101000101000001010110010001",
"000000001111101000111111001100110001111111110001000110111111010000111111",
"000000000111011101000000011110100100000000001110110000000000000010001101",
"000000111011100111000000000000100001000000001000101010111111100100001000",
"111111110110100101111111101000010111000001001100001010111111101000001000",
"111111111101111100111111011010110101000000000101110101000000011000100000",
"111111011111010000111110101101011111111110011110011101000001100010111101",
"111111111001100010111101110001100001000000010110110011000001101110010011",
"111111110010011100111111100110011010111111010101100001111111101010110110",
"000000100110111101111111101000111101000000001110001000111111111001011101",
"000000100010111010000000010101110100111111110111101011111111111010111000",
"000000000010000001000000001100101010000000000111010001000000100101101010",
"000000011010101000000000011000000110111111000000100001000000011111100000",
"111111111101010010111111110101011011000000100011101011111111111001101010",
"000000010110101110000000001011010001000000000110011011111111111011101000",
"000000000011001100000000011001101000000000000111101000111110100100001010",
"000000001100010101000000000110110000111111111110111010000000000101001001",
"000000000111110110000000011011011011000000110110110000000000011000110100",
"111111101001011001111111011010111000111111110110011110000000000101011111",
"111111100101111101111111101011100010000000010011010110111111101000100100",
"111111001001100101111101111011111110111111011001010001000001110011101100",
"111111111010011101000000001000100010000000011101111000000000001010010110",
"000000000010100000111111100001000000111111001001111101111111100110001001",
"111111001100000000111111111110100011000000100100101011111111111010100011",
"111111011101111000000000111000111011000000000000000001111111100011000010",
"000000001011100000111111010110110111000000100010111101111111010010100010",
"000000011111001100000001101101011011111111010011010000000000011000011011",
"111111100000011011111110101001010100000000111001101100000000011000011101",
"111111110010100111000000100010010111111111111111101001000001011111001010",
"000000010100011010111111011111011100111111111111010100000000010110110101",
"000000010001110110000000010110100101000000000111000001000000010000010101",
"111111110001111001111111100010001001111111100110000111111111001110100000",
"000000000111110110111110111111101101111110111100100111111111101010101101",
"111111011011010110000000001000111001000000110000000110111111110101110111",
"111111011100101111111111000011010001000000010111011101000000001111110111",
"111111100001001001000000011001110110000000110010101010111110110100111110",
"000000000110010011000000100110000001000000011100101001111111011010111001",
"111111111011010001000000110011000100000000100000101111000000010100111010",
"111110111001111111111110101001000110111111001001001000000000000110000011",
"000000000000011100000000000011011100000000110110110011111111101000111011",
"000001010010100101111110110111010001111111011000000100111111011010011110",
"000000010000000101000000010110100101111111111001001110000000010001111001",
"111111011010001100111110101100110000000000010111100111000000001111101101",
"111111110011110010111111110100010000111111011010101010000000101011111111",
"111110111100101011000000101110001001000001001100110011000000010000011110",
"111111011110010101111111110001011101111110110011110100000000100001001101",
"000000010111110110111111101101000111111111010011100000000000001011110110",
"000000000000110101111111001111001011111111100011101101111111101111011011",
"000000101110101011111110101001000111000000010100010100000000001100001011",
"111111100100100101111111101100001010111110110000111100000000001001011100",
"111111011111011011111111000111111101000000011000001100111111011000111001",
"111111010101110111111111001001001001111111100100101001111111101101100100",
"000001000100000000000000011000011111000001001001010000000000011001011111",
"111111100010010101111111111100110001000000011010101011000000100110111001",
"000000101111110011000000001111101001000000100101010111000000000101001000",
"000000001011110011000000111111111001000000010001101010000000001101101110",
"111111100100001101111111011000001110111111000101101111000000011011010101",
"000000100010000111000000100110101111111111001010001100111110111010000101",
"000000100101000000000000010111011100000001001000100010000001000011010110",
"111111010000010001000000000100011111111111001101010100111111111101010010",
"000000100010100010000000000010000011000000101100110011111111010100111111",
"111111111100111100111111101101101101111111001011001010111111010000000111",
"000000001001010111111111111101101001000000100001111101111111111111000111",
"000000000011001010000000001100001101000000000101000111000000010000111001",
"000000001100001010000000010111000101111111100011011111000000000010110111",
"000000001001001101111111001011100011111111110011100010000000001101111011",
"000000001011001110111111111001110001000000000000001011000000010011101011",
"000000001010000010000000010001100101000000101101010000000000101100010001",
"111111111000110001111110101011100010111110000001000100111111111100011011",
"000000000011100101111111011100001100000001000101000011111111100001000110",
"000001110101011110000010000010000001000000011011000101000000110010110101",
"000000011001111110111111110001001101000000000101101010000001000001110011",others => (others=> '0'));

begin

process(clk)

begin

if rising_edge(clk) then

if we = '1' then

RAM(to_integer(unsigned(addr))) <= di;

end if;

do <= RAM(to_integer(unsigned(addr)));

end if;

end process;

end syn; 