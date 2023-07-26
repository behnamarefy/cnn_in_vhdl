library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_6_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_6_2;

architecture syn of ram5_6_2 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("111111110011000000000000001111010000111111011100000010111111110010011000",
"000000010011001111000000001001011111000000000101000111000000011001010101",
"111111100110010000111111011100110111111111101111101100111111100000001001",
"000000011110101111000000000011101110000000010110011111111111101100111011",
"111111110101011000111111101111010011111111011111110011111111011001000110",
"000000000000100011111111101011000100111111011001111110000000011010101000",
"111111011001111100000000011010000100000000111000111000000000001011110010",
"111111110011110001111111100010011110000000011010011000111111011001101100",
"111111101000110000000000100001111101111111111100000110000000011011101001",
"000000011011100010111111111110010001111111101111010011000000001000100100",
"000000000000000111000000011001010010000000011110010101000000110111000110",
"000000010010000001000000101101101101000000011010010111000000011000010100",
"000000001011000101000000101110111011000000011000001100111111100111101110",
"000000000111001010000000001010100101111111111111001101000000000000011000",
"111111100100001111000000000110101110111111111010110000000000011100001101",
"111111101010000100000000010000011000000000000000100001111111111101011000",
"111111101100001000000000001111111010111111110001000000000000010110011011",
"000000011000001001111111110110100010111111110000010111111111110000100011",
"000000000100100110111111100111001011111111101010000110111111010001110011",
"111111011101101101111111100100101001111111011100011010111111110000000000",
"111111100111010011000000100101010000000000000110101110111111101101000111",
"000000010001010100000000010000010011000000011001000111111111101100000000",
"000000010111000110111111111101111101111111100011110011000000001101101100",
"000000000000100110000000011011101100000000011001101011111111111111001101",
"111111111100000011111111100011101101111111100000011011111111011110101000",
"111111101011011101111111100011000000000000011100101101111111011111100010",
"000000001010011111000000000010001110111111100010110010111111110011010011",
"000000101101110101000000000110101101111111101101011001111111111110111111",
"000000011111111010000000011010011111111111101111101001000000000000011001",
"000000010001110010111111011101101110111111101110100110000000000100011011",
"111111110001011110111111011100100010111111001011010000111111010111011101",
"111111101111011110111111010110101000111111011010011111111111010000011110",
"000000010000001011000000001100001100111111100000010111111111111101001001",
"000000001011111100000000000101100000000000001000110100111111100110010100",
"000000011110111010111111011111100000111111100010111011111111101100101101",
"111111101010110110000000010101011000111111011100110101000000101000010000",
"000000100001010101000000000111010101000000001001001111111111111000011111",
"111111101101011000111111011110000110111111100101101001000000001111101010",
"111111111001100011111111100100110110000000001000011110111111110101000100",
"111111100101100011111111110100001001000000011110100110111111110101001110",
"000000011100100000000000100000100010000000110001100101111111101010011000",
"000000000100110110000000101001110000000000110000100000000000011000000101",
"111111110001000111000000101010110000111111101010000111000000010100100100",
"111111111100110110000000010001000011000000010111010010111111110100111101",
"111111110000100101111111100101100010111111101111011010111111100110011100",
"111111100110110101000000011101001110000000011111111000111111011111100110",
"111111101110111111000000000011001010111111101110100101111111011101010100",
"111111011010010000111111110101001111000000100011101001111111010011110111",
"111111100000111100111111100000010100111111111100001111111111100010110001",
"111111100110100110000000000000110010111111111110111010111111101111101110",
"111111101110010100000000100001010110000000010011110001000000011111110101",
"111111101100110110111111100111101000111111100001011101000000000110101111",
"111111111111100110111111111010111101111111110001001111111111100010011101",
"000000001010010001111111110001001111111111011110110100000000011110011111",
"111111101011110111111111011111011111111111010010100010111111100010001001",
"000000001010000110111111010110110101111111101101010111111111100001010011",
"111111011111111100111111011100010001000000001111111010000000000100010000",
"000000010100101010000000000100100110000000001011001001111111101001010101",
"111111110100011011111111100110111000111111011010100101111111101110001111",
"000000001001001111111111010001110001111111110001000001111111010100100101",
"000000011000010100000000011000111001000000000011111000000000011000111010",
"111111111011111000000000010110000101000000001000111110000000000110110001",
"000000000100100101000000100010011010000000100101111001000000010111000101",
"000000010010101101111111110001100010111111111011111101111111111001111010",
"000000000001001111000000000011111011000000100010101100111111101000110000",
"000000011010011111111111101011100101111111111101110110000000001010110001",
"000000100010100001111111101111010010000000000000101001000000100100100010",
"000000010111010011000000010010111000000000100101000111000000100110011000",
"111111110001011111000000001011010100000000100101111011000000010000100010",
"000000011111101100111111101110011010111111111000111100111111111001000000",
"000000000110000111000000000010011111111111101011100011000000010101001110",
"111111111111001001111111111000100100111111101100101110000000011010010010",
"000000011100001010000000010101010100111111111011101100111111110111010001",
"111111100011100101000000001110111111000000001000111011000000000111011110",
"111111100101110011111111010100101100000000010001101101111111100010010001",
"111111101000110100111111110010000000000000000111100100111111010011011111",
"000000010100001100000000100100101101000000000010010010111111101010011110",
"111111111011111001111111101100011001000000011101001111111111101100111101",
"000000001110110001111111101100011110111111110010101111000000001111100111",
"000000001011000110111111100011001000111111100001111111111111100111110011",
"000000101001110011000000101010001010000000100011111000111111011111011101",
"000000001000110101000000001110101010000000101111100100111111101011001100",
"111111111111100000000000001110100000111111100100010010000000101011100101",
"000000010010100110111111110110111110000000000010010100111111100000000001",
"111111101100001000111111110000001110111111011010001000000000000010100100",
"111111100100101000000000001000101100000000100011110110000000100001011001",
"111111111110100000000000100110010100000000000011010110111111111111100100",
"111111101111011010111111110111100100000000010111110110000000001101011011",
"111111101001111100000000000011000011000000100110010010111111101110111100",
"111111011110011001000000000000110011111111100111100111111111011011000111",
"000000000100011001000000001111111111000000001011110100000000000010100001",
"000000011110001000000000001001011001111111111100010011000000100000100101",
"000000010000100000111111100110011001111111011110011101000000001111111110",
"000000010000000010000000000010111100000000000111110100000000000000001000",
"111111101111000111111111101100010111111111110000100010000000001001010101",
"111111110110011110111111100111110111111111100101101110111111111111000011",
"111111100010100100111111011011010011111111010110010110111111010010010110",
"111111010100100000000000010100110110000000001011011001111111100011111101",
"000000010111000100000000100001001010000000011001010110111111100111111011",
"111111110000001011000000011010110100111111110010101000000000000100101110",
"111111011001000010111111010000100110111111110110110101000000001000101101",
"000000001101111110000000000011111010111111101100001011111111011011101111",
"111111100011101111111111100101110000000000000100010000111111111011010011",
"111111010010011101111111010001110110111111010101110011111111100110010001",
"000000000111010111111111111001101011000000110000001010000000001010000111",
"000000000000110001111111101110010101111111100010110011000000010000101100",
"111111101101101011000000100000100011000000011101110010000000001110001100",
"000000001001111110111111011010010101111111001011110110111111001111101101",
"000000000101100110111111110010011100000000000010100100000000100111100101",
"111111111101011110000000000011100011000000000000101101000000011000001010",
"000000011110100011000000100010100101000000001000000100000000100100001101",
"000000010001001011000000101010111100000000100000101110000000100011111010",
"111111011110100011000000001011110000111111010000001101111111100110010101",
"111111010111101110111111011000001010111111111111100001111111100101100101",
"000000001010110100000000010011011111000000000100010101000000000101101001",
"111111101110001001111111100111010110111111011100101010111111110110001000",
"000000011010110111000000011101101000000000001101010000000000110111001101",
"000000010100101000000000011000011101111111100000101001000000010000000100",
"000000010000010001000000010000110101111111110001111000000000010110011111",
"111111101100001011111111011100000110111111100100111001000000010101010101",
"000000001110111100000000001011100100000000010101110010000000010101000100",
"111111110110011010111111111011010111111111110110100110000000100100110101",
"000000000001100100000000001000010000111111100011101110000000100000110100",
"111111001010101111000000000111111101111111101000110011000000001000011000",
"000000001101010000000000011111010011000000100110010010000000011011010100",
"111111111111000000000000000100011110111111101100111010111111010101011111",
"000000110001101000000000000010100000000000010000000100111111100100100001",
"000000010100101111000000001011011001000000100011110010000000001111111110",
"111111100110011011000000000101010100111111110000001000000000101100000011",
"111111101000111001000000011100000110111111010101100011111111110100011010",
"000000010111000111000000000000011101000000001101010101000000010010111100",
"111111110100011111000000101011010100000000110111101010111111101110000101",
"000000011111101110111111110011100011111111010011010010111111110110010010",
"111111011001011111111111100101001110111111101111000110111111011000100000",
"111111100101101111111111110111111000000000011001111011000000001110010100",
"111111100100110000000000000011110000000000010011000100000000000010010011",
"111111100011000001000000100000010110000000101111101001000000110111111111",
"000000001000011001111111100101111101000000000100001110111111010101111001",
"000000011101001111111111111101101111111111100001011000111111110011010100",
"000000100000100110000000010100011000000000100110111001000000101001101001",
"000000001101110100111111111000011000111111110000000100000000000110010010",
"000000111110000000000000010011100001000000011011111000111111101000111111",
"111111110010011111000000001001101111000000000011110101111111001111111010",
"000000101000010101111111101111001111000000000101101110111111110101010010",
"000000011100000111000000100001011001000000000011000101000000100000111010",
"111111111110111101000000001110010101111111100100100100000000000110101010",
"111111101110010111000000001011111111111111100110001101000000100110111100",
"111111111001100010111111111101101100000000000000001110111111011000101010",
"111111111110101000000000000001100101000000100011011101111111110000110111",
"000000011000000011111111101001000100000000000110011001000000010101110001",
"111111101100111000111111100000100011000000010110010101000000000011010110",
"111111010110001011111111010011110111111111101010001010111111100101111101",
"111111100011110010111111110010110100000000000011001010111111110000110001",
"111111100001110010111111111101011101111111101111110011111111101101100001",
"111111010010010011000000001110101011111111111110101001111111100000100001",
"000000010100101100111111111111001011111111111111111100111111010100000100",
"111111101011011001111111100010001010111111110101110011000000000110001010",
"000000001100111101000000101000100001111111100001111000000000001101011111",
"000000100001100100000000001101100001000000010101011011111111100000011110",
"111111101101111010000000000011010000000000000101101110000000001011011010",
"000000100001110001000000001111001000000000100000100110111111101010110101",
"111111110110101000000000100111000101111111110111111111000000011000100110",
"111111101111110000111111110101101000111111110110010100000000011111010010",
"111111101001011000000000110110100111000000110000000000000000100101111110",
"000000100011011100000000100011101100000000110011000001111111110111000101",
"000000010000101001111111110100110111000000000111101110000000000111000111",
"111111011110001101111111011011011100000000000101101110111111100110000100",
"111111011111001110000000001010010010111111101110001011111111101010011100",
"111111110010110110111111111001010001111111101111000101111111111001000111",
"000000010110111001000000010000111001111111101110001011111111110110011100",
"111111101100100001111111101010001010111111110011110101000000000110001111",
"111111010111110011000000000101010101000000100000101011111111110111111100",
"000000010010011011111111111010001001000000011101011100111111100101101100",
"000000010011111000000000001011011101111111110101100011000000001000001101",
"111111100001010010111111110010110111111111110110001001000000000111110100",
"111111011011101000111111100000000101111111110000010101111111111110111111",
"000000001100101101111111110010011101000000100010110111111111111110001001",
"000000010100100010000000001001111011111111111110100101111111111111000101",
"000000000101111011000000001111101110000000011110001110111111111111100100",
"000000000000100111000000010100010110000000010100101111000000011000000000",
"111111101011000100111111100101010100000000001101001100111111111001100100",
"111111110000111111111111110011100011000000010000000101111111100001001000",
"111111101001001011000000001000100110000000001000110100000000100000111111",
"111111101110001001000000010101110010000000011011010011111111101001010001",
"000000010001110010111111110011000000111111101001111110111111110100100111",
"111111110101000010000000010010010001111111110000010101000000000101011111",
"000000000101110100000000011011110111000000000010101011000000000001010110",
"000000101010111001000000101101100011111111110011111011000000000010101110",
"111111110010100110000000001000011110000000010010100011000000010111001001",
"000000010101010010000000001001000110000000011100000000000000011100001001",
"111111101010111011000000010100010110000000101110100100111111100111110010",
"111111111101011000111111100111001111111111110010000101000000100110110000",
"000000011101001110111111110010010111000000100011010010000000010111100101",
"111111100011110000000000010100001110111111011000101110111111100101011100",
"111111101001100100000000000110010101111111011010100010000000011010001001",
"111111110110011101000000001011111010111111011000010110111111111111011100",
"111111110010001010000000011100100000000000001100001010111111100100110110",
"000000101001110111111111011100110011111111111001110000000000000010010001",
"000000011101010110000000010000111010000000010010100110000000000111110111",
"111111110111111101000000010111000101111111101110011110111111110111110111",
"000000010111100011111111011001000101000000001010001100111111101001100110",
"111111011101100110000000010000101110111111100100000100111111100001101000",
"000000000010101000111111111010111000000000010101011111111111010100111110",
"000000001100111111000000010010111110111111011101101111111111010110000001",
"000000010010000110000000011101101110000000000111100000111111111010000101",
"111111100011010001000000010000100111000000001011011010111111011101110011",
"111110111011000111111110110011100011111111001101011111111111000010010001",
"111111000010101001111110110100011011111111010111100001111111110000011011",
"000000000101010011111111010010011111111111011000110001111111110000101011",
"111111001111100100000000000100000001000000001010111111111111100100101010",
"111111011110111011111111001111010111111111110011010011111111110011011011",
"111111000011010000111111111100000001000000001011101101000000000111111111",
"000000000001100000000000010110001001111111010101111111000000011111010100",
"111111110110101101111111100100111011111111111111001001000000010010000110",
"111111011010110000111111011101010110111111011101100101111111110111001110",
"000000000010000111111111111000101000000000011011000101000000000000100000",
"000000000100010011111111101010100101000000000010010010000000001100001110",
"000000001010011001000000000001101010000000000110100011000000010011010101",
"111111111010000100000000000010011010000000001001000110000000000110001100",
"111111110010010011111111111101110110000000001000100010111111110001011101",
"111111101110101101111111110111101000000000101100100110000000010000010001",
"000000011001110010000000001101101000111111101100001101111111110000011010",
"111111110011101011000000001010001000111111111101110110000000100000110100",
"000000010101111100000000010001010000000000011000010010000000010111111101",
"111111110001100000111111110011110111111111101110111100000000010010110110",
"000000010110010111111111111010010101111111111010011010111111111110110010",
"111111101011000110111111110001100101111111011111111110000000010111001011",
"000000011111000101000000001010000101000000010110100110111111111000111100",
"111111011011111001111111101111100011111111111001010001111111111010000110",
"000000011000001010000000101010010111111111111010010100000000011110100001",
"000000001110101111111111110010000010111111011000010010000000011000011100",
"000000000110100001111111100001000111000000010000101100111111110011010110",
"000000011000011101111111110000011111000000011110111001000000000100011111",
"111111100000111011111111110100001011111111110101010100000000100110000101",
"111111110001001110111111101010001100000000101111111111111111011010110110",
"000000011011000101000000000000110110111111110100111110111111111100111000",
"111111110010110001000000001100111111111111111000011100000000011111011101",
"111111101100100010111111100011101010111111100111110001111111100001001011",
"000000001001100100111111011111010111000000100111100101000000001001000100",
"111111100111110001000000010101010000111111100111101101000000100001110101",
"111111111000010110000000010011111101000000011001101011111111011110111011",
"111111101010110111111111110000101001111111011111001100000000011111000000",
"000000011010011110111111111001101000000000000001110110000000000010000100",
"000000001000111010000000000110000101000000011010110110111111110110001001",
"000000110000011001111111011001111111000000010101110101000000010111100101",
"000000010100100001111111011110000011111111011101110010111111101001101000",
"000000011010001101111111010110110100111111011011101011000000000110011111",
"111111101001010111000000010100100110111111101111111101111111000111111111",
"000000011100000011000001000111010111000000010011011110000000101000101011",
"111111101001100011000000000110101011111111111111100000111111100100111100",
"111111010011001000000000001001010011111111110111111101111111101000000111",
"111111011000110010000000001111001111000000010101010001111111100111101110",
"111111101111111010000000000100010010000000111010100100111111111100000101",
"000000000100011100111111111111111110000000010100011011000000111000011110",
"000000000111101101111111101100010101111111001110000101111111111010100010",
"111111011101000011111111110111111111111111011101110100000000000001111011",
"111111001110101101111111001001010111111111010011101101111111010111000101",
"111111100101001100111111101101011110111110110010010101111111000101000011",
"111111111011001010111111101010010110000000110000100010000000011010111100",
"111111100110011000000000010000010111000000010000010010000000110010110001",
"000000000101011011111111100000100110000000010010011111000000000001100100",
"000000100111001010000000010111110111111111110100001110000000111000100100",
"111111100100000000111111111010101010000000000111110101111111101001101110",
"000000000110001111111111111000111111000000011010100011000000000111000010",
"111111101101010000111111111110111100111111111101001111111111110000111111",
"000000011100001001000000001100100111000000000101111011000000011110111111",
"111111111011110010111111111111101001000000001100110101111111110010010111",
"111111101110011001111111111010000001000000001100001000111111011111110000",
"000000010011010101000000100000001011111111011100011100000000010111100100",
"000000010000010011000000001000100010000000001111100111111111110111101111",
"000000101010101010000000000010000110000000010100001010000000001011100101",
"000000100010001000000000100011001000000000100001000101000000001100010000",
"000000001101111001000000000000111011111111100111000100000000010100011010",
"000000011010010100111111010001110111111111101011011100111111010010001001",
"111111111011111001111111111110110101111111101100111011111111011100011011",
"000000010010000001000000001101010001000000001010010001111111100000111001",
"111111100010100011000000001011011110111111101110101001000000001111101000",
"000000100000110011000000001100011101000000001101111111000000001110010001",
"111111111011000011000000100011101011000000011101101100000000011011101000",
"111111111000101100111111100110100000000000101011101001000000110101001010",
"111111110011011001000000010100010010000000011000010101111111111110010100",
"000000000111010111111111110010101111000000010100010110111111110000110110",
"111111011101100001111111100000111001000000000101000000111111001110001100",
"000000000100000010000000000110100001000000001011010011000000010111000111",
"111111110010010111000000101010011011111111111110010001000000110000111101",
"000000011001101110000000001101101101000000000110010001000000011101111110",
"111111110100111101111111011101100001111111101000001101000000001011000111",
"111111011000110110111111111000110101111111101011011111000000010111110111",
"111111100100110110000000011001100000111111011010001110111111111111001110",
"000000000110001010000000000111000001111111110101010001111111100000000011",
"111111011010101100000000010000101100111111101010011111000000000010110000",
"000000101000000100111111010111011001000000010001011001000000010101100100",
"000000001001010111111111011011011011111111100000100010111111011011000001",
"000000001000010010000000010111111110000000000000001010000000010001101011",
"111111001001101001111111011100011001000000001011010111111111110101110111",
"000000000100010010111111011100011010111111100011110010111111110010001011",
"111111011001100000111111100110111100111111101100000101111110111101011001",
"111111101111000000111111100010000101000000011010101101111111110100011100",
"000000010011101111000000010100101111000000000011110110000000000000001111",
"000000001001101001111111110000110011111111011000001100111111011001000100",
"000000000011000111000000001001000010111111110111000010111111100101100100",
"000000001111100010000000001110001101000000111110100111111111100110011111",
"111111101111111000111111101010000101111111101010101101111111111000101110",
"111111001000100001111111011000110000111111100101100010111111100100101000",
"111111111001101001111111011000011100000000001001110000111111111100000100",
"111111111010000110000000000001001000111111110101100011111111010110001101",
"000000010001001010000000010101111001111111010100100001000000000110100000",
"111111111011011001111111110000000101000000010010100100111111010000011000",
"111111100011001110000000011110010010111111010110110010000000001100010011",
"000000011011111101111111011100000101000000000110111110000000000010011110",
"000000000110000111111111110111111001111111010101011100000000000000101111",
"111111010010110011111111001001100110000000000101000111000000001011111100",
"111111100010001000111111011110100011000000001011100101000000000111111111",
"000000010011000011111111101000110011111111100001011011000000001101001001",
"111111110110011110000000000101000110111111101001000110111111100101101011",
"111111001100000101111111011011001001111111111101110011000000000101000100",
"000000011100111111111111110101110001111111110111011011000000001110001011",
"000000011010001000000000001100001000000000101011110100000000000001111000",
"000000100100001110111111111101100111000000011111101011000000100001101100",
"000000101100000000000000100011101011000000000100110110000000001110010000",
"111111100010000111111111011010001000111111011001000100111111001001010101",
"111111110111011101111111010011110000111111100010110010000000000010111111",
"111111111000111111000000001001010100111111100101001011111111101110100111",
"111111110101001111111111011111101100111111101000011011111111011110001110",
"000000100110001101000000000100001000000000101010000100000000001000100000",
"111111111001110100000000001100111110000000101100001001000000101001101010",
"000000011010110111111111111111011101111111010101000010111111011100010110",
"111111101010111001000000000111010111111111111101001100000000000101100100",
"000000101101010001000000010001001111111111100111101000000000001001101010",
"111111100111011100111111101000000001111111101011111000111111101101001010",
"000000011011010111000000011110111010111111110000000101000000001001000101",
"000000101011111000111111111001111100000000010111100011111111110001111110",
"000000010001010000000000011111001101000000010110110110000000010101111001",
"111111111110100111111111101000101010111111100101110101000000011001101010",
"111111111011000010111111100001111110111111111110101100000000001010011100",
"111111100001110100000000000001011101000000100011100001000000010110001100",
"111111101001011011111111110110000110111111101111101101111111011000000100",
"111111100101011111111111111111001111000000010000110010000000010100110000",
"000000000011100111111111100111000010111111101110011010111111110111111001",
"111111100000011101111111101111111111111111100100010100111111110101100111",
"000000100011101011111111100100001001111111111011010000000000100100101011",
"111111101110110100000000000111000001111111100001000100111111011010111000",
"000000010100100000111111111111110010000000011011111101000000010100111000",
"111111101000100000111111100110011101000000011000111000000000001100111000",
"111111101101110001000000101001111110111111111011011001000000001101000101",
"111111111001001110000000001010010011000000010101110011000000110110001100",
"000000001101101001000000100010010100000000010011110100111111110000101011",
"000000010111001000111111101011111001000000000001100110000000001001100010",
"111111011101110001000000011001001111111111010101100000000000000100010110",
"111111100111110100111111101101111100111111011101010011000000001101110011",
"111111111111000010111111111100110101111111111011001101111111110000001111",
"111111010001010110111111111001100000111111001011110100111111100110011110",
"000000101000110011111111110110000110111111110100010100000000001110000111",
"000000000010100100000000011001000000111111100011011011000000011000101100",
"111111100010100001111111011111001111111111101001100000111111010000101000",
"111111101010110011111111001110111000111111100100111110000000001011110110",
"111111110101010010111111101001011101111111101000110111111111101000011001",
"111111100000000001111111100100110011111111100010010001111111100000101000",
"000000010101011000000000010011010110000000010011101001000000000100101011",
"000000000010011000111111110000111001000000010100001101000000101010001011",
"111111100100110111111111111000111111000000000110000011000000010101111011",
"000000011111111011111111101001001110000000010101101010000000001011000000",
"000000011001001010111111101101110010000000001001110001000000001000010111",
"111111011110101100000000000001111011000000101000000110111111100011011001",
"111111010101001001000000100010111100111111111010101111111111111111110100",
"000000011001001001111111010111101010111111110000100100111111111000101111",
"000000000000001011111111100011010100111111100001111000111111110001001100",
"111111011011010000000000001100000011111111110111011110111111011010001010",
"000000011100101011111111101111000101000000000111011111000000101010110001",
"000000001111001001000000011100100011000000011000111010111111111111101101",
"111111110101101010111111100101110111111111100101000111000000000000001010",
"000000011000000110111111101000011001000000010111110000000000011001111011",
"111111011011011110000000011110010111000000000000000010000000000011000110",
"000000000001010000111111101100010111000000011010011010000000010010001100",
"000000100000000100111111110100000111000000001011010000111111100101000001",
"111111110011010000111111110110000100000000010001001000000000010100100011",
"000000010001001100111111110001001100111111110000110011000000100110001101",
"111111111101001101111111110110101000111111101100010101000000010010011011",
"111111110100111111000000001001111100111111110000101011000000011001001110",
"111111111101101101111111101001000001000000000011100111111111101001011110",
"111111001111001101111111101000100011111111101000000000000000001011111101",
"000000101101100110111111100111100101000000001011001001000000010101011101",
"111111111110000001111111011010001100111111010100011101111111010011111101",
"000000011000100101111111011101100001111111011100111110000000001100110111",others => (others=> '0'));

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