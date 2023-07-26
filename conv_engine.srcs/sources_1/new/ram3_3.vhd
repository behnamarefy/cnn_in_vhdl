library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram3_3 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram3_3;

architecture syn of ram3_3 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("111111101010000110111111011011010011111111110011111100000000100100100100",
"111111111110011110000000111100100101000000001101100111000000001110110010",
"000001101011001011000001100111001101000000101101011101000001000101011111",
"111111110001010100111111011010101110111111111110010110000000110110100101",
"000000001110101111111111011101010101000000000011101101111111000110111001",
"000000000001110100000000100010111010111111001010101110111111001001001110",
"111111110100101111111111011011100000000000011101010000000000101001000001",
"000000010010000110000000010010110101000000101010110000111111000011101101",
"000000110001000010000000100010001100000000111000101110111111110010001100",
"111111111000001010111111000100100110000000100110111011000000110111001011",
"000000111010000010111111101101011001111111110111111011111111110010011001",
"000000010111000101111111001100011000000000100110001101000000011000001111",
"000000000111011001000000110011001001000000001001001010000000000110101101",
"000000111011111010111111100001000010000000110100011100111111100111001011",
"111111101111100110000000000101101110111111010000111001111111111111011101",
"111111101100000011111111101010101010000000100001010011111111111101100000",
"000000001000100110111111011010001111000000111011100101111111111010001000",
"000000110111010110000000000011100010111111100100011101000000010101111010",
"111111110000000011111111010011010011111111010111100011000000111100100001",
"111111101110001111111111011101100010000000010110110111000000010110010000",
"111111111101001111111111111001010100000000000100011101111111110100100101",
"000000101110111010000000100000101101000000101010101011111111010010101000",
"000000011001011001111111011110101000111111000100101110111111011100010011",
"000000000010100110000000010110100111000000111011100000000000000010001101",
"000000011111011001000000100101110010000000010001011101111111101111101001",
"000000111001111000000000101010010101000000000000001110111110110110011011",
"111111100111111000000000000110001001111111011111110001111111101011011111",
"111111110001110011111111011100100010111111100001010101000000000010010111",
"111111011001011100111111101000101001111111011010100001111111111101100110",
"000000111110011110000000111000101001111111101101011110111110111001001101",
"111110100101111101111110001010011011111110001101001110111111000011010000",
"000000011010001111000000111010000010000000011011111100111110111011001111",
"000000000000011111000000001001011010111111111011110110000000110111001000",
"000000101000010111111111011000001101111111110110011011000001000010111001",
"111111010110010010000000010010101101111111000010011110000000001010111001",
"111111101000011001111111111001100100000000000110011100000000010101101011",
"111111100110001110000000010000000001000000010010011110000000111010000111",
"000000111000011110111111010010111111111111100001111100111111101000011011",
"111111000011100100111111011101001000000000101001111000000000100110110001",
"000000101011001010000000110101110000111111111000101111111110111111101110",
"000000010101100111000000100110100111111111101111000000000000100001111110",
"000000110010011001111111001111011100000000010010011100000000001101101110",
"111111100000011101111111001000010011000000001000101100000000100010100111",
"000000000110100100000000011011000010111111100110000111111111101101101101",
"000000001110100101000000100101111101000001010101010111000000010011111000",
"111111110001000110000000001110010101000000101011011000000000100001111101",
"111111111111010000111111101100101110000000001011111010000000101001010111",
"111111110110000001000000000011101111000000000000111001000000100100110111",
"000000000100001011000000011001010001111111111011100101111111111101000111",
"000000100111001011000000010010111101000000010110101111111111111000101001",
"111110111001010011000000110111100110111111111101011001111111111101001110",
"111111101011010100111110000001000111111100000100100101111011110001011010",
"111111001101110111111110110000011110111111101010100101000000100100010101",
"000000100011110101000000100001111101000000101010011110111111010001111001",
"111111010011101100000000111111101110000000001110000111000000001101000001",
"111111011001010011111111001000010100111111111001101111000000001111100110",
"000000001100000001000000011111000111000000001101011001111111111010001101",
"111111110000011111111111111000010101111111000010110001000000011011111111",
"000000100001110110111111110001101000111111000111010101000000000101100110",
"000000100101010001000000101000101110000000111011000111000000010000010111",
"111111000111010100111111010111111111000000100010000111111111101100111011",
"000000011000010100000000101011100000000000111010010001111111101011001011",
"000000100001000010111111110101101011111111010101010001000000011001100110",
"000000100010110101000001000000110101000001101011010000000001001100011101",
"000000000011000101000000100000000111111111110111010000111111010110110110",
"111111110110111111000000110111010000111111100100110001111110001101100011",
"111111111110010011111111011100011010111111110001000000111111001101110100",
"000001011000011011000000010111111010000001001110111011000000000010010011",
"000000011011000011000000001100001100111111001111110000111111011100011000",
"111111110011111110000000111101100111000000110000011100000000110111101100",
"000000011100000001000000011101001101111111110011100110000000001010111100",
"000000010000001111111111110110011001000000001000011110000001011110001010",
"111111101111111010000000010001100111000000110100001110000000001110011111",
"000000110010000111000000000111000000000000101101011111111111101110101001",
"111111001101110011111111001000110110111111110111011111000000011100100101",
"111111101010001111000001000111000110000001000100101011000000000000011101",
"111111010001010010111111001110111100000000001011111111111110111111000100",
"111111010101001001111111101000111110000000110111001011111111000100101001",
"000000010011111001000000011001111101111111111110100000000000100101111010",
"111111111111000001000000010010101001111111011111101100000000001110110011",
"000000011001110101000000001110111110111111111010011000111111111011100011",
"000000101010000000000000001011111000000000000010100011000000100001110101",
"111111000010111101111111000011110111000000011000111110111111011010001001",
"111110111010010110111111100100110111111111110011011011111111011100110101",
"000000010110001010000000001110010100111111110000001000000000000011001011",
"000000001110011001000000110101110010000000000100001001000000100011010001",
"000000000111110000000000101100001101111111101100010010000000001111111000",
"111111101001001010111111110000100011111111111010000100111111000100100011",
"111111011101011000111111111000010000000000010100011010111111110111010111",
"111111100011001010000000101011010010111111110111100110111111101000111111",
"000000001000011111111111111011000111000000000101001001000000010101000111",
"111111111111111110000000000110100000111111010011011011000000000110001101",
"000010011110011101000001011111101001111111010111001011111110100111010100",
"000000000001011010000000110001101100000000001001001110000001101010101000",
"000000011111101101000000000001111100000000011010000010000000101000110110",
"111111011001010000111111010011000000111110000111001010111111110010100111",
"000000011101010001000000010011010110111111111000100111111111110110111011",
"111111100110110000111111100000011100000000110100100000111111101001011000",
"000000001011000111111111101001000111111111110000110011111111010101000101",
"111111110111110111000000000110111110000000100111110101111111101100010001",
"111111111000010101000000000101000100111111001001100100111110110001101000",
"111111010011001100000000000000100011111111000010000011000000010011110101",
"111111010010011000111111001010010100111111000101010100111111000101110110",
"000000010010110001111111111011011110000000010010101001111111011110111010",
"000000101010101110000000000010111111000000101010011000000000110110101111",
"111111100100100000000000000000101101000000101011110110000000001110000101",
"000000010010011010111111100001001001111111110111101010111111011111111111",
"000000000100101010111111110101110101000000111111110110111111110001010000",
"000000000101101110111111101011101011111111010101111100111111001011101100",
"111111001100000100000000101110011110111111111100001111111111011000010100",
"111111101011001100000000001110010100000000010001010001111111111110110101",
"111111111101101111111111100000010011111111010000001100000000000010010000",
"000000010001001001000000101110100101000000100101111101000000101001000000",
"111111100100101111111111111010010011000000001100111110111111111010000110",
"111111101101101001111111000001001111111111000110111010111111000011011010",
"111111101101100100111111001001000000000000001100000110111111100101011100",
"111110111111010111000000100011100110000000111000110100111111100001001100",
"111111100110111000111111101111111110111111011011000110000000101111011000",
"111110111101001100111111001010101101111111001000101110111111101011001000",
"000000110011100001000000011000111010111111111100111110111111110110000100",
"111111000001111001111111011001011101000000011010101000111111101011110101",
"111111011111001110000000000010001011111111000100011010111110101000111101",
"111111100111001011111111000100111010111111111100011001000000110101100101",
"111111101100000000111111100001111000000000011011011011111111011010100100",
"000000001001001100111111100100000100111111110111111101000000000000111000",
"000000000001100011000000000001110010111110111011010100111111110000101000",
"000000101011101011111111111011011110000000010111101010000000100111010100",
"000000001110110101111111011110001110000000000000100100111111001101111011",
"000000010111011011111111110000011001111111111101001000111111011100111010",
"111111110001000011000000001010011000111111010111100110000000011011111111",
"111111100100111111111111000110100001000000101010111100111111110001110001",
"000000010101100001111111000001110111111111100111111100111111111011000101",
"111110111001001111111111101111111101111111011000010101111111101011000111",
"111111100101101100000000100111010001111111011011100111000000001111100011",
"111111101100000100000000000000010011111110101111100010000000100100111101",
"111111110011010110111111101000111010111111110011000001000000000010011110",
"111111110000011001000000000110010111111111011110010010000000010111010111",
"000000011111010001000000111101001100000001000100000000000000110010111011",
"111111000111110011000000100100111100000000001011101000111111110000001010",
"111111100011110100000000000111110000000000111001101011111111100111101100",
"000000001011010101111111001111010000000000110011100010111111100110011000",
"111111010010010000111110111010000011111111110000110100111111110111111000",
"111111111110110011111111110100111101111110110010011010000000001001100101",
"000000000100001101111111000001111010000000101101111100000000000111110111",
"111111101110111010111111000110110000111111000100011001000000000100100010",
"000000100100000001000000011101000001111111000100000010000000101010101111",
"111110111000000010111111110000001101000001001011111100111110110110001110",
"111110110001100000111111010110011110000000011100110101000001001010001100",
"111110111101110100111111001100001110000000010110110100111110111101110111",
"000000000011100101111111101000010100111111110110110010000000011000010011",
"000000000000001100000000001000111011000000000000100110111111000111010000",
"111111110010100001000000101101111001111110111110001001000000001101010000",
"000000010100100100111111001000110100000000001010110111111111011100111101",
"111111101100010010111111101001101111000000001011001110000000000001110001",
"000000000011001010000000000101111010000000001110010101111111001101011011",
"000000011010011111111111001101010100111111100101101110111111111011010111",
"000000010101001100000000001011011100111110110111000100111111011100100001",
"111111100010100110111111011100011000111111011111110010111111001101111111",
"000000010000111001111111110100000110111111111100011110111111011001011111",
"000000011000101110111111111110010011000000100001011010000000001111110011",
"111111011011001000000000010101010001000000011001011000111111110110111001",
"000000010010001101111111100101001111000000001011110111111111110100111001",
"111111000101110110111111001110111111111110111000011100000000010001110000",
"111111011000110010111111101101000000000000000110011101111111011111111011",
"000001000000100101000001000011110001111111001100100001000000011101001010",
"111111110100100101000000010111110010000000000010100011000000001010011100",
"111111011110111011000000001111110110000000010011111111111111011001001000",
"111111110100001000111111001100001011111111100001010010000001001011001100",
"111111100111000100000000001110000001111110110111010101111111100001111110",
"000000101100111110111111110010111101111111001100000101111111001001010001",
"111111100101100010000000000010000101111111001110001101000000011100001111",
"000000011011101101000000011000111000111111011001101111111111000001100111",
"000000011011101000111111010011010111111111110000110000111111000010100100",
"111111100000000100000000010011110000000000001001000011000000011001110110",
"000000011001101011111111000000110011111111011101110100111111110011000011",
"000000001100110110000000100000111010111111101011000100111111000110100011",
"111111100010110111000000100100010111000000110000100110000000000001001001",
"000001000110000010000000010000100100111111011111010111000000101011000000",
"000000110001011110000000001111101010111111100111011000111111110101101111",
"111111011100010110111111101001110001000000001101100001111111011100011011",
"111111101001010101000000001111111110111111100001100101111111000110100010",
"000000000110001101000000011100011010000000111000100100111111001111111011",
"111111010101100011111111010011010100000000010110100001000000011001011010",
"111111101111011001000000001000001101000000010110101000111111011110010010",
"000000010110100111111111110010101101000000001100001001111111110001000101",
"111111111110101110000000000111110000111111011011100110000000000011100000",
"111111110010110100111111011100100000000000110100001110000000000110110101",
"000000111000000101000000000000000001111111110010001000111111111010001000",
"111111111001111010111111110110100011000000011010111100111111110110000100",
"000001000110111001000001100101011111000000101101010101000000101011011011",
"111111011100000010000000100001011111000000010010110011000000001110111111",
"111111110001101110111111111110101010000000000010110100000000110110101111",
"111110011000110100111111111110010100000000100100011110000000010101111010",
"000000111100100010111111110100111000000000101110100100000000010100010100",
"111110011111000001000001100011011111111110000110010101000000001000010100",
"000000100101000000111111100111111100111111110001101110000001000000000110",
"111111110000011000111111111110010100111111110010100000111111100000001001",
"111111000011011111111111111010011011000000000000111110000000100010010001",
"111111000100000100000000111001001010111111001010001011000000000001010100",
"000000010100100101111111010001001011111111100010001001111111100110111000",
"111111011000111010111111100100101011111111011101110000111111111000010011",
"000000001011001101111111101011010101000000111001011001111111010000000001",
"111111001110001001111110110100100111000001000000111010000001001001100100",
"111111000111110100111111100111111001000001001010000101000000010101001001",
"111110110000011101000001000100000100000000011011110100111111100000001000",
"111111001100100010111111111111100101000001011000111010111111100010100110",
"000000100010000011000000100010001101111110111101001101111111111001011010",
"111111100011101111000000011001001000000000000110000011111111100010110110",
"000000111011101110111111111111101010111111001111010010000000101001000101",
"111111101101110111111111010011110101000000010111101110111110011101001111",
"000000111010010100111111000000000100111111101011000111111111110011000000",
"111111111100000010000000110101010111111110101001011010111111111001001010",
"111110101111100011111111010100001110000000000111110101000000100011101011",
"000000001000001111000000111110011010000001001000110111000000001101011011",
"111111110101011111000000110111110010111111011100011001000000011011111001",
"000000000011111000111111100110011011000000001000001110000001011011100000",
"000001000100001100111111111000100110000000001101110001000000010100100011",
"000000011000001101000001001010111000111111100000110000111110100010111100",
"111111010011100010111111111110011011000000110101111001111111100001000000",
"000000100000000110111110111100100110111111011110011100111111010110101111",
"111111111100111010111111000110100110111111100101111100111111111010101100",
"111111101001001111000000001000001010000000100001011010111111101011010111",
"000001000100110001111110101111101100000001000001011000111111101100000011",
"111111101000000001000000010010000110111111011010000000000000001101101010",
"111111010111111101000001011000111110111111110101110100111111011000010011",
"000000000011110110111111101101101001000000100011101011111111001100001110",
"111111111011111010111111101000010111000000000001011001000000010010100001",
"000000001001101110000000011111001110000000100011110011000000110101010000",
"000001111110011111111111011010010110111110100001111111000000001100000110",
"000000011111100111000000010111111000000001010000010000111111111010100110",
"000000001100010110111110111101110110000000000011110110000000011001100100",
"111111010110110011000000000011000001111110101100001110000000010111101111",
"000000100100100001000000011010001111111111110001011101000000010000111001",
"111111110110011110111111101110000010111111100000100011000000001001101011",
"111111011111000101111111101010011111111111010110001011000000011110111010",
"111111100111000101000000010011100000111111011011110011111111010000100111",
"111110011010000001111110110100001101111110000000100100111111010110010100",
"111111101100100000111111010000100101000000000101101001111111010011101010",
"111111111101011100000000110100101000000000010000101001111111110101110000",
"111111001101011101111111010110100011111111101001110010000000001110010011",
"111111100101010100111111010001000110111111110101000110111111011011010111",
"111111100110001111000000101000000100111111100101011101111111111110100101",
"111111111101111100000000010111110010111111000001010010111111101011101011",
"111110111111001000111111010101101101000000001011110110111111110010111011",
"111111100010110110111111010010001001000000010001111000000000001010010101",
"111111001001100001111111101110110110000000010010100111111111001000010100",
"111111011001000001000000001111011110111111001111000000111111010111100110",
"111111100001011010111110111011101101111110110100101110000000010001011000",
"000000001001111011000000010100010101111110101101100010111111101111000111",
"111111111001011101111111111111000000111111010110111101111111110100111000",
"000000011111010011000000001101010110111111111111110111000000001011010110",
"111111010010000001111111110000110011000001000111011001111111101100111100",
"111111001011000001111111111011000001111111110100001110000000000100001000",
"000000001111011111000000011011101101111111101000011100111111111110101110",
"111111111100111100000001000100101010000000011111111011000000100011011011",
"111111101100011110111111111100000001111111111110100011000000000111000100",
"000000010001111110111111101001000101000000011011001011111111100110100011",
"111111101010001110000000011110000000111111110010001001000000001001111001",
"000000011110010111111111011111101011000000100110110011111111101010011100",
"000000010010010000111111010101100001111111011010101001000000010000101010",
"111111010011001110000000011010000101111111101101101110111111101011000110",
"111111001110110010111111010100011000000000100100100001000000000010011100",
"111111010011101011000000011011111001111111011100000110111111101110010011",
"111111100101101001000001000100011011111111101001001111111111011111011100",
"000000110100000101111111000101000101111111000000110110111111010100001001",
"111111101001100101111111111010110011111110100110100111000000001110011101",
"000000001001110110111111110110010100000000011101101100111111011011010000",
"000001000111101001111111010001110001000000101100100001111111110001110001",
"000000011000010100111111110101011000000000001011001111111111011110011110",
"111111110111110001000000010110100000000000010000110100111111011101110010",
"111111110100111011111111010100000100111111000010100111111111010001011111",
"111111001101110111111111010110011101000000011010110111111110101010110111",
"000000000011000110111111010011000000000000011101101101111111010111011000",
"111111111011100010111111110100001011000000001100101110111111100011110101",
"000000000111000011111111000011101110111111100100101100111110111000110000",
"111111101101000000000000010111010100000000010100000101000000000000010110",
"111111010001111101111111100011011001000000011100110000111110111101111111",
"000000000010110011000000010001111111000000100101101111000000011010000011",
"000000010100010101000000001011001000111111010111000010111110110000100101",
"111111111000100011111111010001001101111111111011001100111111010100001011",
"000000010010000101111111110101100110000000010100011010111111011011111101",
"111111111001000111111111001101101111000000101001100100111111011101010011",
"111111001100001000111111111010100001111111110110001010111111010011111010",
"000000010001000000000000011100100111111111000110100100111111101001100111",
"000001011001110001111111111000000110000000011011101100000000010100110000",
"111111101100000010000000111100000100000000111011110111111111011101010001",
"111111100111111110111111110011001001111110111011000110111111001100100100",
"000000101011101001111111011100000100111111011001101011000000000001110100",
"111111010000010100000000100111010111000000011000000111111111100000100011",
"111111100001011011111111111011011100000000011111111011000000001111101100",
"000000110110000001000000010100111100000000001101001011111111100100010011",
"000000001000101000000000001011100011111111011000100011000000100101111001",
"111111111010111001111111111100111111111111110100100010111111110001010010",
"000000010000110000000000100010101010000000100011100110111111011000111101",
"000001000010110101111111010010000111111111111011001001111111111101011000",
"111111110100010110000000101011111110000000010000100110000000101001101010",
"000000010010101011000000010111110100111111010010010100111111010001011001",
"111111001101011001111111101000000100111110110011001100000000000001110010",
"000000101110100001111111001100000001111111101001100110000000001110110010",
"000000000000000110111110111100001001111111011110000001000000110101100011",
"000000010110011101000000100011000010111110111001011101111111000100111010",
"111111111111110110111111100010100011000000111100110000000000100110010110",
"111111011100001011000000100010000101000000010111101001111111101110110100",
"111111111100110010111111011111100111111111011110001001111111100000100101",
"000000100000101101111111111001100001111111110101100001000000010100000011",
"000000011111010101111111001101001010111111110100110010000000011111110101",
"111111101000110000111110111111010111000000001010101010000000000101011011",
"000000010010011001111111000101111100111111111011001000000001001111100111",
"111111111010110010000000101111010001111111100010111111111111111010110001",
"111111100001010010000001000111010001000000101001110111000000110001010100",
"000000010100110110111111001101110011111111100111100111111111101111101001",
"111111100010001001111111111110000100111111010111110000111111010100100100",
"000000110000110111000000000100111101111110101010000010111111001110110100",
"111111111001000110111111100101111011000000011100111010000001001011010110",
"000000010101100011000000010100001000111110111100101110111110110110011101",
"111111011001011100111111011111011110111110111100111011111111001010110110",
"000000000100000000000000010100101010111111010111110100111111111100110100",
"000000110010100111111111010011010110111111110110111001000000011010100011",
"000000110000011111111110111100010111111111011001101010000001000001100110",
"000000010100011001111111110000101001111111011000010100111111100110011011",
"111111101000110000000000010011111010111111110101100100111111010110111001",
"111111110101001111000000110111010100111111100111010000000000110110010111",
"000000110010011001111111110011010000111110110111000110111111000111101101",
"111111011011001000000000010110011111111111110100101001000000010111100100",
"000001001110001010111111100011111011000000010100110001111110111101110000",
"111111110001111000000000101111100010111111010100001000000001000000101100",
"000000110001010000000000001110000000111111111010001000111111111010100101",
"000000000101001111111111100010110010000000110110111101111111101011000010",
"111110111110010000111111000100000001000000010100110110111111110010111011",
"111111101101111111111110110111010010000000101110000100000000100110100111",
"000000010110111011000000011110011001111111110010111100111111110100101000",
"111111010000011000000000001011100111000000011110010111111111001001100001",
"000001101010111001000000100011001100000000100010000010000000011010100011",
"000000010111100101111111101001100001111111101010001000000000010010000011",
"111110111011110101111111111001100101111111001010000100000000011011001100",
"111111000011001000000000010111111101111111011011001100111110110100000100",
"111111110101011111111111000110110011000000101101011101000000110100000001",
"000000011111110111000000010011110101000000100001011111111111000100010001",
"111111101110100111111111001011010011111111001001011011111111111000101011",
"000000011110100111111111011111000100111111101010100100000000010111000101",
"000000110000000100000000011010100001111111010001100111000000001101101010",
"111111100101001011000000100100110111000000010001111001000000000010101010",
"111111001000111110000000100111001001111111111010000111111111011110110011",
"000000011111000001111111100010001101111111001010001101111111001110001011",
"000000100100010010111111011000111101000000111001001110111111110111011100",
"000000100010101100111111011011101111000000001100000001111111100011011101",
"111111100101101110000000101000110111111111100100000101111111010101011101",
"000000001111001011111111101000110001111111111101101101000000111000001100",
"000000101000001001111111100010001010111111100010011010000000000100111000",
"111111100001010100111111001011111010000000000111011010111111001101000001",
"111111011101111000000000111100000100000000001000100110000000010000111001",
"111111110110010010000000100111000110000000011101100000000000010001000110",
"111111001100110101000000111111111011111111111010100110111111110000011100",
"111111001001000101000000001110100011000000001010110001000000011101010001",
"000000011111001100000000011100010001000000101101100000000000110100111101",
"111111011010000101000000011001110000111111111000110011000000101110100001",
"111111110010010001111111011011101001000000010111000101000000010101110010",
"000000000001001110000001000010100110111111010010010001111111011100111000",
"111111110100100010000000010100100010111111010000111100000000101101011111",
"000000101110101110000000100101011000111111111011100010000000010000101000",
"111111101111110110111111111101100000000000011110001101000000101001110111",
"000000110000001110111111110111010011000000011001010100111111011100000100",
"000001001110110110000000001100010010000000001110000100000001001110001010",
"000001101011000001000000010110001000000000110111101001111111111111000111",
"111111010001011110000000010001101110111111010010110111000000000001110010",
"000000000001100001000000000111101110111111101001110011000000111000011101",
"111111101001111010111111110100111111111110110111101011111110000111101011",
"111110100101001100111110000001001110111111000011000100111110011111101001",
"111111001101000110111111011110000111000000001010000101111111011101111111",
"000000010100001101111111110000010010000000000101001010000000101000000010",
"000000010001110000111111010101101100000000000010011000000000010101100110",
"000000000101011100000000001110100001111111001000101111111111110010001111",
"000000101011001110111111001010010010000000011111110100111111011100000011",
"000000010011101001000000000000110001000000100010111001000000000101111000",
"111111010010010001111111011011010000000000000110100001111111011101101110",
"111111001000101001000000000011000111111111101011101110000000101100001000",
"000000000101101110111111111101010001000000011101011110000000010101111001",
"000000010111111000000000011101100101000000011101011101000001000001000010",
"111111110000100110000000000101101000000000011110101110111111110000010000",
"111111101111000111000000001000001100111111111111000010000000100110011001",
"000000011010011001000000010100010011000001001001110001000000100010010000",
"000000010011000100000000000111010111000000010100101110000001000110011000",
"000000011111001001111111001110000101111111110011111000111111101010111000",
"111111110010111100000000100001101100111111101000000101111111100000000100",others => (others=> '0'));

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