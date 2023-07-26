library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_8_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_8_1;

architecture syn of ram5_8_1 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("000000100101111110111111111011011001000000011101011101111111100111100101",
"000000001110100001000000010111001011000000000001010011000000001010010011",
"000000000111111101000000011110011111111111010101111001111111111010110001",
"111111101001011000111111001010101000111110111100011101000000010001110011",
"000000001110010001111111101100100011000000001110111011111111111110110111",
"111111100100001110111111101101000111111111111011100001000000010011100001",
"111111111011001001111111111010001000000000001001011101000000011101110011",
"000000010111011101000000110100011010000000011000100111111111110100011111",
"000000010011111000111111011000000101111111110011010010111111100100011100",
"111111100011110000111111011010011011000000001101000010000000100010101000",
"111111110110101001111111100000100010111111100011101010000000011011001001",
"111111100110010110000000101001010011000000011011111101111111110111110011",
"111111011010110010000000010101010110111111011010010010111111110011101011",
"000000001111110111111111011010111110000000001100111001111111000001110101",
"111111110101100000000000111001000101000000001101001110000000000110100011",
"111111111010100000111111101100001000000000011001000100111111110011000101",
"000000000011010010000000001110001000000000001101000010111111010101000111",
"111111110110011100111111110100100100111111011010001100111111000001000111",
"111111110100100100000000001111010111111111110100111010111111100111011011",
"000000100010111110111111110100110000111111111010001101111111111100010001",
"000000010011111001111111011010110001000000001100010110111111101010110110",
"000000100101000100111111001111100110000000001110100010000000010011001010",
"111111011011100001000000011010001010111111110101001110000000000111010101",
"111111100100000101000000011001010101111111100111110110000000000110111100",
"111111110010010011000000010110100110111111111100101011000000010101010110",
"000000100100010011000000010100000010000000000000110011111111101111101110",
"111111101010011111111111010100011000111111010010100010111111001100010100",
"111111011011101111111111101011001001111111101101000101000000010100100101",
"111111100011101111111111011011001100111111010100001011111111100000010000",
"111111101000001001111111100011011101111111100011100101000000001010001101",
"000000010010100110111111011001111011111111100111100101111111101010110110",
"111111111000100111111111111010100000000000000111100100000000011010100111",
"000000001111101101111111111110100010111111100001010000111111110001110111",
"000000010101100111000000001001101001000000000100101001000000001110011101",
"000000010111010111000000100110010101000000011001000011111111100110010000",
"111111101100010110111111111011100011111111010101110111000000010011011000",
"000000011101011101000000000111100111111111110001010001000000100000100101",
"000000000010001111111111111110111100000000110011000000111111111001111011",
"000000001010101011000000011101011111000000000100010110111111111001000111",
"000000100011011000000000000000010100000000010101100000000000101101000000",
"111111110101000000111111011101111010111111111100100000111111111001001001",
"111111100101110110111111100111111100111111010010000111111111100011001000",
"000000110000011101111111111010110000111111101110101000111111100110110001",
"000000010110001110111111100111010000000000000010011000000000100000000011",
"111110111000111111111111001100100111111111110011100000111111000101001101",
"111111011110101100000000011011101000000000000001100000111111101110011111",
"111111010110010011111111111110100000111111001111111100000000000010101000",
"111111001100011000000000001011110011111111100011111001000000011100011101",
"111111001111111110111111101001111100111111001100101001111111110100111001",
"000000010011100111111111111000100001111111100110111110111111100011011001",
"000000000111111010000000100110011011111111111011011001111111110110010011",
"000000100110111111000000010100111100000000000111111100111111101011101111",
"000000010110111101111111011100111010111111110110000000000000001110010100",
"111111101010000001111111110100111000000000000000110100111111001111111100",
"111111001111000100000000000000010100111111110010100001111111110100001110",
"111111010001001111000000010101101100111111101001010101111111011010000000",
"111111100000010101111111101100010100000000101010101100111111101100010100",
"000000010100010010111111111101101000111111011011011111111111101001111110",
"000000010100000111000000101110110111111111101010101100000000011001000110",
"000000011111100010111111110011001001000000011101001000000000011110001001",
"111111011001111101000000000101100100111111101011001111111111110011011000",
"111111110110011001111111101111100101111111110110110100111111011010010011",
"111111101101000110111111010111000111111111010110110100111111010110011011",
"111111001101010101000000000110110110111111110100110000000000010011001010",
"111111011111111001000000001111101101111111110110110110000000010010111010",
"000000010111111000000000000001011100111111101010110100111111100001111001",
"000000010000100100000000101100100110111111111100000001000000011010100011",
"000000000101100110111111101110111011000000100000110000000000011000111010",
"111111101100000100111111001100110101111111100111001111111111100001011110",
"111111011100100001111111111100100100111111001100100110111111101100011101",
"111111100011100110000000010010000000111111110000100000111111101111100010",
"000000010001110101111111110010010110000000010011001100000000100011110010",
"000000100000111010000000000001001010111111110000000000111111101111110100",
"000000100011110111111111100100111111000000000011000101000000011101111011",
"111111011110100011111111011010011111111111101011010001111111110011100100",
"111111110001000100111111011000111100111111110100100100111111111111101000",
"000000000100000101000000000100011100000000100000111110000000100010100011",
"000000001010100101111111101100011010111111110010000110111111101001010100",
"111111011111111011111111111111000111111111011000111101000000001110011000",
"000000010001110110000000010100110011000000001101101110111111100001000011",
"000000001000010101111111101011100110000000000100000100000000010011111100",
"111111110000001110111111110011110010111111100110100011111111101111010100",
"111111100110100000000000010110010010111111101110100100000000001011110011",
"000000010011100000000000010000111001000000010111010001000000000011011000",
"111111110011011000111111110110001101111111100011101111111111111010100010",
"111111101000100010000000010010101000000000100010011111000000100010100011",
"000000011110000001111111100100011010000000001111011101000000000010100001",
"111111101000110111111111101001110111111111100111001110111111100001111001",
"000000000010100111111111110111110000111111110100110001111111110011000110",
"111111100100110110111111101101110100111111100111001101000000001000101001",
"111111011011011101000000000100010010000000101010111010000000011010111000",
"111111110010100000000000010001000101000000010001100110111111101111110101",
"111111110010010111000000100110100100000000001011111110000000111000000110",
"000000010110101010111111111000001000111111111111000100111111100111100111",
"000000001011010101000000011100110110111111011100111000111111101010100001",
"000000000100101100000000011010110011000000001100011001111111100111000011",
"000000000000101001000000000000110011000000010111101011000000011100110011",
"000000001100111011000000000011100001000000010100101001111111100001010110",
"000000110000011110000000000011101001111111100101111010000000100000110001",
"000000010111010011000000001011011011000000000000100010111111101011001100",
"000000010000010010111111111010111010000000001011001110111111110101001001",
"111111111000000000000000000011010010111111011100000001000000001101011010",
"111111111011010100000000010110011100111111110010101101111111100001110110",
"111111101000011011111111100100100101000000001011010101000000010010111110",
"111111011110110000111111101001111010000000000101011111000000000110101001",
"111111011000010011000000011101001001000000010000011100111111011010000011",
"000000000111000111111111110111111100000000011001110101111111111101111101",
"000000011000011111000000011111011101000000100011011110111111111000100000",
"000000010110011100000000010101101100111111010011110010111111100111101011",
"000000010110101101111111111111001010111111011100100001000000010010100001",
"111111101001010101111111101000010000000000001011110101000000100011010001",
"000000011001000100000000000111000101111111100111100111000000011001001110",
"111111101101011000111111101011101110111111100110011101000000001111110111",
"000000001001010000111111010000010101111111101011100101111111110001010000",
"111111011101011100000000000101111010000000010011000000111111010000010001",
"000000000000001011000000001100000101000000010111101010000000001100001111",
"111111110011001010111111100000100010000000000111101011111111011100100010",
"111111110101010010111111010110010100000000001010111000111111101010101110",
"111111111110110011111111011001010000111111100011001011111111111111101001",
"111111110101011110000000000010111101000000010101110010111111111101001110",
"000000001010101011000000011101010000000000001111110011111111100101010110",
"111111110011000111000000001110000101000000000101111100111111010000011010",
"111111111100010001111111110101110011000000000110000001000000010110010010",
"111111111111100101111111101110001001111111101100110111111111111000110010",
"111111111000110101111111110110011100111111111010100001000000001010000000",
"000000000110000011111111011010011010000000000001010111111111110000111111",
"111111010111000000000000001001101100111111101011000110000000010111000010",
"111111110010111100111111111101010011111111001111000011000000001100100100",
"000000001001101001111111100000010100111111111011111110111111100010011001",
"000000001011000011111111010010000011111111111011010000111111010110001101",
"111111111010010111000000001000101000000000001101010100000000011011100001",
"111111110110000100111111011111010111111111101100011010111111110011101111",
"000000000010101000000000101010000111000000001111111000000000011010010101",
"000000000101101110000000000101110110000000010011111101111111101010111101",
"000000100000001101111111100100000010111111111111100110000000011011100011",
"000000010110011101000000100000011010000000100000111011000000001110111001",
"111111100011101011111111100001010011000000000010101000111111111110111000",
"111111100110001100111111111011100100000000010110000010111111110110000011",
"111111011001001101000000001011110011111111111011010111000000001011101101",
"111111110101010001000000000110110000000000100111110111111111011111011010",
"111111110111001010111111111001110100111111011000100110111111101000011111",
"000000011011001000111111100010001000111111101000001101000000110000011011",
"000000010000000010000000011010100000000000000000100101000000001111010110",
"000000010001000110111111111000101101111111010111011000111111101110101001",
"111111010100111001111111011110111000111111100001100000111111011110101011",
"000000010100101011000000010011000011111111101100110000111111110011101011",
"000000001011000010000000010101111110111111101110111000000000001101001000",
"111111011111000100000000000011010011000000010010011110111111101001000110",
"111111110001011110111111000100110001000000001110010101111111110011111010",
"000000000001111111111111110011111111111111011010100101111111111000100010",
"000000000001100101111111101111101011000000001010100101111111100101100001",
"000000000101100100000000000101100100111111110010001000111111101000011001",
"111111011101011011000000010010110000111111100001010110111111111111010101",
"000000001011011011000000011110001010000000000010100011000000000011110111",
"000000110110011110000000100111101100000000101110010101000000101011001000",
"000000101110111010000000010010011101000000011000011010000000001100100000",
"111111111111001110111111101000101100111111110010110001111111110100100101",
"111111110001110110000000011000110010111111101011110011111111101111100111",
"111111110101000000111111011000100110000000010101101010000000100010001111",
"111111100101111001000000000111011000000000001001011001000000000010010000",
"000000001000001111000000011001100000000000101010011110000000001110011111",
"000000010011100011000000010101100110000000010100010110000000100001010111",
"000000000000010001000000010100010000000000001011010010111111100011101000",
"111111011001101101000000000110011000111111110001101111111111100010100011",
"000000100101101000000000101111001011000000010011100000000000010100010100",
"000000001001010101000000100010010011111111110100011100000000010111011110",
"111111111110001101000000001000001100111111111110010010000000101000010101",
"000000100110001101111111111101110110000000010110110011000000101011010111",
"000000001111000111000000000010011110111111010110100001111111100110010100",
"000000001100010011111111100111001101111111011110100110111111011101101110",
"111111110100000101111111010010011011000000000100001110111111011110100000",
"111111011010111101000000001001011010111111101000101011111111010111010110",
"111111100001000010000000011001110010111111100100110001000000010000101010",
"000000011010101111000000000110110111111111011010100011000000010010111001",
"111111100101010111111111100010000101111111101100011011000000001001100010",
"000000000100111001111111110001000000111111110010000011111111011110100000",
"000000011111000001000000010010001011000000010111011001111111010010011111",
"000000011110001001000000001101101111000000100101010001111111110011010111",
"111111110111011101000000000010011110000000000011001100000000000000101001",
"111111100110101111000000010111010001000000000100000001111111111110010100",
"111111011111010010111111111101100000111111000111110110111111100110000110",
"111111010010011111111111001111101100111111001101010011111111100101010101",
"111111111001011111000000001010100110000000000000101010111111011111011011",
"111111101111001001000000010010111101111111111101010111111111010110110011",
"111111111110001011111111101100100011000000011010111100111111100111110011",
"000000011001101001111111100010110111000000100110110101111111011001001101",
"000000100101000101111111111111111000111111110010011001000000001000110001",
"000000001111111110000000100010110011111111101000110100000000010111111001",
"000000000101000101000000001011000100111111001100000111111111011100101001",
"000000000101011101000000001101111111111111001101101111111111111001011001",
"000000100000010111111111110010001010000000011011001100111111100111000110",
"000000100110011011000000010011101111111111111010100100000000001001000111",
"111111100110110101000000010111010110000000001101011110000000010101111010",
"111111010111101111000000010100001101111111111011010101000000100000101001",
"111111101110001100111111110010101000000000001101011001111111101101101110",
"111111011101101110000000001111110001111111100011110101111111111000000010",
"111111011111101000111111111111111010000000001101110001000000011010001000",
"000000100100100100000000011110100100000000100011100011000000100101100001",
"111111101011010000000000011010001000111111011000110111000000010000011001",
"111111101000001111000000011001001100000000100100110111111111101010000011",
"111111011110000111000000011111001110000000001000000111000000010111011100",
"000000010001110110111111100101011010000000010101100011000000101001010101",
"111111110001000011111111111110100011000000001001111110000000000010111011",
"000000000011101011111111100011100111111111100011111001000000001001111001",
"111111101100011001111111010001010101111111101101101011111111101011110000",
"111111101010100110111111101000011010111111010101110011111111011010001100",
"000000100010111000111111110000110001000000011011101101000000011111110101",
"111111111000111001000000010110011110111111010111101101111111011001111011",
"000000011011111101000000000001001111111111100111110000000000010001011110",
"000000001110010110111111100111110101000000001010011111111111111100111111",
"000000000100011010111111011000101000111111011011010011000000001110010000",
"000000100010000001111111101111110101000000010011010110000000001111010111",
"000000100010100011111111101000101110000000100100100111000000000011101111",
"000000011110100011000000100110010111000000011000001001000000001101001100",
"000000011001001000111111101111100100000000100000001111111111111100010110",
"000000001100001110111111111101100111111111100010101010000000011100011111",
"111111101000011001111111010110101111111111101110000101111111110110101110",
"111111111011001001111111100100101101111111100101011000000000001100011001",
"000000011000101100111111111000000011111111110100100000000000001100111100",
"111111001111100100111111111100000000111111010110010110000000001110010101",
"111111110001000000000000001011101000111111111000010001000000010011111001",
"111111101110000111000000000000000001000000100100001111000000011001000111",
"000000010100101001000000100011000010000000000000001110000000010101011100",
"111111100101001011000000010011110001000000011101110101111111100111010001",
"000000100110100001000000010101101110000000000100100011111111100000110010",
"000000000111100100111111111111010000000000001000110111000000010000001001",
"000000010110011000000000001010000001111111110010011111111111111000010111",
"000000011111010111000000011110100000000000011101101100111111100100000000",
"000000001011000010111111101100001110000000001111000011111111011110100101",
"000000011001001010111111111001111011000000000000010000111111011011111101",
"000000011011001101000000010110101011000000010111010001111111111010101000",
"000000000010100101111111011100111100111111011101000000000000010010010001",
"000000010000111101000000110011000000000000100010011110000000000100101010",
"000000101001010001111111111011011100000000000000111011000000011100001010",
"111111111010100001000000011110111111000000000111111000000000010100111101",
"000000100010001100000000000101001110111111101010101101111111111000101111",
"111111100001001100000000001001011101111111101001100010000000000101101110",
"111111100001101011111111010111110111111111100111111100111111100100111011",
"000000000010011000111111110100111000111111101000110000000000000010010000",
"111111110010111110111111110000110100111111011000011010111111101001110101",
"000000001010111111111111010111000010111111111111101000000000011101000100",
"111111101010011010111111110000110101111111100111100001111111011111100111",
"111111010010010000000000001101101001000000000010100000111111100011011110",
"111111111000101100000000010000010010000000001110100010111111101000011100",
"000000010110011100111111011001100111111111110100011100111111101011010100",
"000000000101101010000000000111111111000000001100100000111111111111111000",
"111111011110111110000000000101001010111111111100111010000000001111000100",
"000000001010110100111111111111011001111111110100111000000000010000100100",
"111111100101110111111111110101011011111111110100111100111111100001111000",
"111111101010010100111111110101001101111111111000011100111111100001011101",
"000000010111010111111111101001010100000000010000000111000000100001011000",
"111111110011010101111111011010010000111111110001101001111111110011010011",
"000000000111010011111111110010000100000000101000010110000000010010110111",
"111111111011011111000000001010000001111111110001011001000000100000000100",
"000000010100010001000000100000000001000000001010010001111111010011101000",
"000000011101100100000000001001111100000000000010010000000000001111001100",
"111111110010101100000000101000101101000000100101101100111111011001101100",
"111111110111010011000000110001011010000000100111110000000000100000100011",
"111111110010101101111111101101011101111111111001011011111111110011110100",
"111111001010101101111111001100001000000000001000011010111111001110000110",
"000000110111001000111111100100000110000000010101110000000000011101011001",
"000000001100000100111111111100011011111111110111111101000000011000011000",
"000000010111101101111111110101001111000000010000011010000000001110100111",
"111111110011101010000000001101011001111111011101010100000000100110110010",
"111111010110101001111111111001110001111111000011101110111111000000000101",
"111111110100111110111111010110100000111111100110011011111111011000100101",
"000000010011110110000000010110000101000000100010111111000000000000000110",
"000000000101000000111111101110100011111111011001111001000000100110001110",
"111111111010101110000000000011010011000000010010001110111111110111000010",
"111111110001011110111111101100010111000000100000001111111111110110010101",
"000000000010001111000000001010110111111111100001100100111111100111011111",
"111111011011011000000000010001010100111111110010110110111111110011100101",
"111111100010111011000000011101010100111111010100100110111111111111001101",
"111111011010110100000000011001101101111111111110000111111111111010100101",
"111111101100011101000000011100101100111111010110111101111111110110010110",
"000000010000011111111111111011000011000000001110001011111111101000010100",
"000000001000011011000000001101100000111111111101101010000000000101011001",
"111111010111000000111111100110111110111111100111001011000000000110011101",
"111111100110110111111111111000110110111111011110010111000000110101010101",
"000000100100100111000000001111111101000000000010000101111111100001110000",
"000000000110100000000000110101000100000000001110000000000000000100001010",
"000000100001000011000000011101110000111111111000010010000000100111010110",
"111111100000111010111111011001100101111111100111010111000000001010011101",
"111111011101000110111111100101011110111111100111000110111111111111001101",
"000000010101010010111111110111010111111111111101101011111111101010111001",
"000000010011100011000000100010011101111111100010001100111111111101110111",
"111111111100010110111111100001111100000000000101110100111111010101110111",
"000000000101000101111111111111111100111111111110000010000000100010111111",
"111111011100000100111111111000011000000000010100011100000000000011001100",
"111111101010010001000000011000111100000000010011100100000000000011001101",
"111111011100110100000000010100001111111111100111110110000000101110000110",
"000000101100000110000000000110110000000000011000000001000000010010011011",
"111111110100110011111111100000110010111111110001000101111111011011011100",
"000000100011100111111111111001000101000000000001100101000000000001111000",
"000000010100001010000000011000011110111111111011011111000000011001011011",
"000000001010000100000000001100111111000000011101000001111111110001000101",
"000000001110010101000000100011000001111111100010010010000000010100110110",
"111111100000101100111111111110001011111111111011110111111111101111000010",
"111111101111001010000000010110101110111111101001101101111111101111010100",
"111111100001001101111111101001100000111111101010000001111111110011011010",
"111111000101111111111111110101111111111111000111001011111111100011111101",
"000000000000001011111111011100101110111111100000101010111111000010001011",
"111111110011000110111111111010011101111111110010100011111111101011010000",
"000000001010001000111111110001111000111111101111011111000000011100000001",
"111111100011011100111111100010000011111111111000100101111111111101110000",
"000000000110011111111111111011000000000000000000000101111111110100010011",
"000000011001101100000000011010010110111111101010001000000000100001001011",
"111111111100110110000000010100101001111111111010001001111111101101011001",
"000000011010001011000000100010111000111111100101010101111111011110101001",
"111111111011110100111111111000011111000000100010011010000000000100110011",
"111111100011111101000000110010000001111111110001100101000000101100011001",
"111111111101011101111111111011011011111111111100011010111111101100010001",
"000000011000011100000000010100101100000000011100101111000000010110100010",
"000000000010100011000000000110000010000000001001010110000000000111101011",
"111111011001110111111111010011101111111111011001010111111111100111100110",
"000000011011000000000000000110111111111111110101100010000000001100100010",
"111111110110110000111111111101110110000000000000111000111111111011011100",
"000000011001101001000000011101101111111111110001001100111111010010000011",
"111111111010000111111111101001011011111111111011100110111111101100110111",
"111111101101110001000000010100111010000000011001100101111111011110011001",
"000000010101010101000000000110011110000000000011101010000000011000111011",
"111111100011110111000000100000000010111111100100101001111111110111000111",
"000000110110001111000000011001010011111111101011011010000000011111011011",
"111111110011110001000000011111111001000000011110000011000000110110111001",
"000000100010100011000000010101110000000000001000100111000000001011111001",
"000000010011010000111111110001010010000000101001010111000000011000100010",
"000000001110011010111111010100111100111111110010001010111111110111001001",
"000000001111100001000000001001011101111111101100010000000000010000101011",
"000000010000010101111111111010100010111111101000011101000000100001000111",
"111111100100111111000000011011011111000000000111100010000000000011110010",
"111111111111010011000000000101010000000000010000010000111111010101011100",
"111111101000101000111111011100011010000000011001111000000000000110001011",
"111111011010111010111111011000011001000000000110010011111111110001011100",
"111111011000110000111111111000110100111111110100101101111111011100001111",
"000000011001101001000000100101001110111111110011000000111111100100011011",
"111111110110001010111111101011001110111111111110101000111111111010100100",
"111111011110100010111111101101001110000000000110101010111111101001101000",
"111111110110110001111111101011011101111111111110010011111111111011010100",
"111111110100010010000000000010110010111111001111101101000000000000000110",
"111111100001010011111111100111110101111111001011110001000000000110001100",
"111111110111010001000000100111011100000000011000101101000000011011101111",
"111111110100100101000000011111001110000000000100011110000000000011000111",
"111111100011010001000000000001010111000000001110011001000000000110100100",
"111111110111001011111111101101011100111111110111111101000000010110010011",
"111111110000111001000001000001001101000000001110001000000000101100001100",
"000000010101001111111111111100010011000000101101011011000000001000011111",
"000000011100110001000000010110010100000000100110100010000000111111111111",
"000000111101101011000000100110010000111111111011001000000000100101100011",
"000000011100100011111111101000101100111111100111001110111111110111101000",
"000000010000110100000000001001000101000000000100101001111111111100000000",
"111111011100100011111111111111100111111111101000110110111111100010101110",
"000000000011110100111111010100100000111111011000110101111111100111110001",
"111111101101110000000000010100111011000000001011011010000000001000101100",
"111111110000000001111111111101001000111111110010010000111111111010001100",
"000000011110000111000000100110011110000000000000100100000000101110101000",
"000000101010001101000000101101110010000000011111111000111111011110011110",
"111111100111111100111111000111000110111111110001000100111111001011000001",
"111111011011110001111111011000001100111111111010100001111111100011001011",
"111111101011111001000000001110010010000000011110111001000000001110110110",
"000000010000000110000000000110111000000000010110011101000000011101101110",
"000000101010110010000000101011111110111111111000011111000000100000010101",
"111111101100101100111111100001010111000000011000000100000000010001101010",
"111111100011110001111111110001101001111111110011011001111111110001010011",
"111111100111111001111111101111001011111111101011001111111111010011010111",
"000000010010001001000000001110001101111111111110101000000000000111100101",
"000000010100000010111111111000010001000000000000111001111111110110000111",
"111111100111011010111110111111111110111111111001001110000000001011100100",
"111111111000100010111111111010011000111111001011010110000000000110111001",
"111111110100010010111111101010001011111111110110011001111111101011100110",
"111111011000110001111111100101110000111111110011011111111111110001001101",
"111111100011000000000000001110101010000000001100011101111111001101011010",
"111111100010110011111111101011110110111111100001000110111111011011100101",
"000000010001101000000000001100001100000000011111100101111111100011011010",
"111111101100011100111111110100100110111111011011010000111111111110000011",
"111111111111100101111111110111110000111111011101111100111111110000011011",
"000000001011010011111111010110000000111111010011101100000000001010000000",
"000000010011011001000000100011111010000000110000000111000000000001101100",
"000000111110001100000000101011101010000000100100111111111111111110000100",
"111111101000010101111111011110010110000000011000000101000000011101101101",
"111111100101000001111111010010111111000000001110001111000000100000011110",
"000000010001110110111111110011101001000000101011111011000000110011010001",
"000000100001111111111111111110010010111111101101000000000000110110010100",
"111111110101110111000000001110111000111111100101111100111111100000111010",
"000000000010011000000000001110111110000000001101011010000000000101111001",others => (others=> '0'));

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