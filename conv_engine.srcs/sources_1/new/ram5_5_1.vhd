library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_5_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_5_1;

architecture syn of ram5_5_1 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("000000000000101101000000101100111010000000001101001010111111100111101100",
"000000001101111100111111100100110010111111101010100001000000001011110111",
"111111101101010100111111011001111001111111010110111000111111100010011101",
"000000001001111101000000010011010101111111100001100000111111110011010100",
"000000001011100111000000010100101101000000001110011000111111101011000000",
"000000010111011011111111111010110001111111110100000111111111111011101001",
"000000100101111101000000010111101011000000110001101001000000001001010000",
"000000011111000111111111110000011001000000100010100100000000101010101010",
"000000011011001001111111110111010110000000010000101000000000011111100111",
"111111101101101001111111111011101100111111110010100100000000000011011110",
"111111011010010010111111011110101110111111110011111010111111011000100000",
"111111011100010100111111110010100000111111101110110101111111101010111001",
"111111010101101111111111010101010100000000001001010010111111110110110010",
"111111100001110110000000000001010011000000001001000101111111010111100010",
"000000011100010101000000000010011011000000100101111110000000000100010100",
"000000001101100010111111110000011010111111111011000010000000010011000101",
"111111111011000010000000011101001001111111101001101110111111101010101110",
"000000000011001101000000011100110010111111011101010110000000001010101101",
"000000000010100101111111100111111111111111011100101001000000000101100101",
"111111101000000111000000000010100010111111011100100010111111001111010101",
"111111111001100000000000101100001011111111111111110000000000010000001001",
"111111110011111011111111111011011011000000010101110011111111111101101000",
"000000000001110111111111111111000011000000000011000100000000000101110001",
"111111010111101001000000011111111110111111111111100110111111001011011111",
"111111011001011000000000001000101101000000000100011000111111010011001010",
"111111001100010000111111011101101000111111010101111100000000000010000100",
"000000100101111000000000000101000010000000000010001110000000000011111100",
"111111100110110010111111111101001001111111100010101110000000010011101000",
"000000001000110010000000000101000010111111101101110000111111100010110110",
"111111100010111010111111101001010000111111010001111011111111011000111101",
"000000010110001111111111100110011100111111111111111101111111001101001110",
"111111101101110110000000001001011100000000001010010111111111110010110111",
"000000000110011111000000011011110101000000001010100110111111100100100010",
"111111100100100100000000001111110100000000011011011001111111101000010100",
"111111101000110001111111110000101100111111101010010100111111010000111010",
"000000010101010110111111111011011000111111101101011101111111010100101000",
"000000011111101011000000100001000110111111111011001101111111010111101111",
"111111011011101001111111110010000010111111101110101001000000001001010010",
"111111110011010001000000000111111011000000010001000101000000101000001101",
"000000000011001001000000011110000010000000010001000100111111100000100001",
"000000001010100100000000000111101110111111111110010011111111001111010000",
"000000001011011001111111101011110001111111011010111010111111101101100101",
"111111010001000100000000000011011100111111100010110011000000001011100111",
"111111100101110010111111100111001111000000010011111001000000001011101101",
"000000011001010101111111010101010010000000011101001110111111101000111101",
"111111100110111110111111100011101010111111110011011000000000010100100001",
"000000100101001010000000001010000100000000011110000000111111111010010010",
"111111110111110001000000100100110101000000010001110000000000000001011100",
"000000000011101111111111110100101011111111101111101010111111101011110010",
"111111100011011011111111110000110110111111101010000111000000011110001011",
"111111111000100100111111100000000110000000001111111010000000100100011001",
"000000010100101111111111111010011010111111111010001001111111011001111010",
"111111110000110101111111111010010110111111110011000110111111111001111000",
"111111111000011010111111101100111111111111100110110010111111111000111000",
"111111010000001111111111101010100101111111100101101101111111001100011000",
"111111010111100010111111011111101100111111111011011010111111010101101100",
"111111111010101100111111111110011010000000001011010010000000011011101011",
"111111010000101101111111011111010000111111111011000111111111011100011001",
"111111110000000100000000000011100100000000110111010010000000000100101000",
"111111100011001111111111100110000100000000100011110000111111111101110011",
"000000001100000010000000101100000100000000000101110110111111111111111000",
"000000000011111010000000001101001100000000000011010011000000101100100001",
"000000000010101110111111101100001000111111100011001001000000001101111011",
"111111101010001010111111101000011110111111011111011001000000011010011100",
"000000000100101011000000000010000010000000000011100110000000011010110101",
"000000011100011101000000100110111100000000010000111100111111110001100111",
"000000010101001100111111111110111101000000001001001111000000010011011111",
"111111111101100110111111101011001110111111000010000101111111100001101111",
"000000000101011000111111110111100010000000001001110010111111110101001000",
"111111101110110111111111101101001101000000100111011110111111110000100011",
"000000001101011001111111011011110111111111111100011010000000001100010000",
"111111111011111101000000011011110000000000010000000111000000000010000101",
"000000010001000101000000110010111001111111101111011001111111100111011111",
"111111111010010010000000000011001111111111110011011111111111110011011111",
"111111011100011000111111100101100110111111111011110101111111100011100100",
"111111111000010111000000000110110000111111101011100001000000010101111010",
"111111110000011010111111101110100011111111110001000000000000011010001110",
"000000001101011000000000100101010010000000010011011100111111101010111110",
"000000001011011110000000000111101110111111101001001001000000010010000110",
"111111110000101101000000100010110010000000010100111100000000010011110110",
"111111011101011111111111101101000011000000000001100111000000100001101001",
"111111111001001110111111011110011011000000001000101001000000011000111001",
"000000010000100110000000011111011000000000000111011101111111111111011010",
"000000101100110010000000101010101000111111100101101111111111101001101001",
"111111011100001100111111110110000101111111010110100010111111110011110100",
"000000001000011000000000000000010111111111101100110111000000001101110010",
"000000010100000001000000000011100000000000000011111110111111111111101010",
"111111110110110010111111011100100010111111100010100001000000100001101111",
"111111010101001100111111101111011110000000000100001010111111111010111100",
"111111011100010100111111010101001100000000001001011111000000000010100100",
"111111101001111101000000011111001000000000001100100100111111101000011111",
"111111101001101000111111010110100000111111110010011001111111101010110100",
"000000011101111011000000001010100111000000110100101001000000011010001101",
"111111011111111110000000101101000001000000100011011101000000110110011110",
"111111100100101110000000000101100000111111001111011110111111111101101111",
"000000010000011011000000000000101001111111110110001011000000100011010011",
"000000010100100111111111101001110100111111011110011101000000010001011111",
"111111100100011101111111100111000011111111110010010011111111011101010010",
"000000111010100010000000000000000100000000011001110111000000011000011010",
"111111100011111011111111010011100110111111100000101110111111101011111110",
"000000101101110110111111101001010010111111111010111110000000100101100011",
"000000011010111110000000000111000101111111110010001011111111101001001001",
"000000010101010001111111100111010110111111111011011111111111111111001111",
"111111101101001001000000010110110100111111111010001111111111100010100010",
"000000000000110000111111100011101000111111101011111011000000001100001000",
"111111101110110011000000001000110110000000101011010101000000000110111101",
"000000010011011100000000000101101011000000010010111101111111111101110111",
"111111011010111011000000010110001001111111111010000100000000000110100101",
"000000011100111010111111011010110011000000000011111001000000010000011000",
"111111101101011011111111011101000110000000001010101001000000100001111011",
"000000010011010000000000110010001010000000000111001000000000111000111111",
"000000001111110100000000010011000111000000111111101010000000110101001111",
"111111101110001101000000010011110000000000000001001100000000001110101111",
"111111100100101011111111110011000110111111101100001001000000000011011010",
"111111100101010110000000010111111110111111101000010011000000010101001100",
"111111111001111010111111101011110101000000000101110001000000001001011010",
"111111101010111010000000001010110100000000101011101001111111110010100101",
"111111111101010000111111100000111000000000000100011010000000000000000000",
"000000101011010010111111110101011110000000101000000100000000100111000000",
"000000101011001000000000100001000000000000010000111010000000000010011010",
"111111111110101001000000010110111011111111100011111101111111110101000000",
"000000011101010101000000000011001101111111101100101111111111011100010101",
"111111110010101101111111110111000111000000000000010111111111101001111000",
"111111100001110011000000100011111001111111101110110100111111101111011001",
"111111110011100110111111111110101111000000011101000001000000011001111011",
"000000010000000000000000110000100111000000001110001001000000000000000111",
"000000011011100111111111111110101100111111010111011101000000011111011010",
"000000000010001111000000100010111111000000100001001001000000010101101011",
"000000000110110111000000000111100010111111011101011110000000001010101101",
"111111101110101110111111011110000111000000011011111000111111100011100101",
"111111110011010001000000001001001011111111101000110000000000001011001001",
"000000000111011110000000110110110100000000000011000000000000101001100000",
"111111011110110001111111011101000000000000010110010100111111100100100001",
"111111101110111101111111111011001110000000001010110011000000100001110010",
"111111110110100100000000000001101101000000000111001000000000011111110001",
"000000011110101111000000001100001010000000010111110010111111100000100111",
"000000101001110110000000100111111000000000101110001000111111110100001000",
"000000110011001100000000011111011010000000100111110100111111111011110101",
"000000000111100110111111111110101100000000000110001001000000011110010010",
"000000001100110011111111101101110011000000000011001111000000000011010110",
"111111100101100111111111110111011001111111011101011101000000001011110110",
"000000010000101001111111010110101010111111110101111011111111111000110011",
"111111111000000111111111111110000000111111100011110110000000001111010101",
"111111100010010011111111110001110011111111011011000100111111101110000011",
"000000011100101100000000001010010011111111100101000000111111100010011100",
"000000100101011010111111111100110011111111101001001000111111110000010111",
"000000001111011011111111010110001100111111100110100101111111101101001110",
"000000010110010000000000100011000100111111110101001001000000100100100010",
"111111110000110100111111111110001110000000001100011100111111110011110001",
"000000001011100011111111111011101011111111010111010110000000001100011000",
"111111011010010001111111101111101010111111101011111001111111101001110000",
"000000000111100110000000011001101000000000001111111101111111100001110010",
"000000011011011001000000000011101111000000001111001000000000000110110011",
"000000001001111001000000011011101100000000001111011110000000001011000011",
"111111100101000010000000000110100100000000000010111000000000000100011100",
"000000011101111111000000001110100011111111110101100101111111011000011110",
"111111111010110110000000000110011110000000000110110111111111010111111000",
"000000001111111111000000010100000111111111100011101001111111101001010010",
"111111010011000101000000011000001111000000100101001011000000111001000000",
"000000101100000111000000100010100011111111101000000000000000010110100110",
"111111111110001100111111101100110001000000011100000101111111011111000000",
"111111011000000101111111101010101110000000100100011101111111011111111110",
"000000011001101110000000000010011000000000000101010111111111011101001001",
"111111111010001101111111100100000000000000010001010100000000001011010101",
"000000000110000110000000001110101010111111011101111111000000011011001101",
"111111110110000010111111111000000000111111100111110001000000100100010010",
"111111001111010100111111101000001101000000010110110110000001000000100111",
"111111110101110111000000011000011111111111100110010011111111010100001101",
"000000011011110101111111111010000100111111101000110111111111111110100111",
"000000000010100110111111101100000110000000000111001101000000001000001101",
"000000001011110110000000001111110110111111110110111101111111110100110010",
"111111100100011101111111100100110011000000000011001001000000000100010011",
"000000000011110110000000011101000110111111101100000011111111101011100100",
"111111111011010101000000001111110001111111011110010100000000001101110001",
"000000000000101001000000000001111010111111110101101011000000011100111001",
"111111101001010010000000010111110110111111100101010101111111101100011101",
"000000010100000101111111100010101011111111100101011110000000011101101011",
"000000001101010100000000000110001110000000010001001110000000000100111101",
"000000100010101011000000000110001101111111111100011100111111011101010100",
"000000010010100111111111111101000100111111010111011010111111101010011001",
"111111101110010100000000001100111000000000101100001011000000110101011111",
"000000010110110100000000010001101010000000101011100111000000001100100001",
"000000010111001111000000011011001101000000100100111110111111101110011110",
"111111101111100101000000101100110011111111110111111100000000101010001011",
"000000000111010101000000011110111011000000100110010011000000000101110000",
"111111110101100100111111101010110111000000001000011011111111111100001011",
"111111100111100111000000000110110111111111110111001010111111110100011110",
"111111100100111011111111111011000010000000000101000010000000100110000001",
"111111110000100110111111010111100011000000000110011111111111111101001000",
"111111011111100010111111111100011010000000101000011110000000100011000010",
"000000000101110101111111001010110010111111101111110100111111101100001000",
"111111011100111011111111011011110011000000100010011100111111100110010100",
"111111010100110110111111010000011101000000001010100010111111110000110110",
"000000000001001100000000000100010011111111101011111110000000010100111111",
"111111001101110101000000000000011110111111111011110100111111100101100011",
"000000001111001110111111111011010000000000001001100001111111101001001000",
"111111110001000101111111101000010010000000000100101001111111101101101000",
"000000010110001111111111101100011011111111100101101101111111100011001010",
"000000100111111100000000100001110001000000100000110011000000110100110110",
"000000011010110111111111110110100000111111100110011111000000011010101110",
"000000011110101001000000000111110101000000001001011001000000001100110001",
"000000000100110010000000011101111010000000011010101100000000100100011101",
"111111110110011111000000000010111101111111010111110100000000001000001100",
"000000010101101010111111100100001101000000001111000100111111010010110100",
"000000000010010100000000001000010000000000001000100100000000000111111111",
"000000000011111011000000001101010101111111111011111110000000000000100000",
"111111111001010011111111101000111110111111100110010100000000000000000111",
"000000011100010101000000011011011011000000001111101010111111101101111001",
"111111100100100010111111100111110001000000011111110010000000010011111110",
"000000001110011100111111100010011100000000000110001010000000100010011100",
"111111110111000000000000000010011111111111010000011101111111001101010001",
"111111001011011111111111101011101100111111011011100111111111100000111010",
"000000110011100011000000110100001000000000011000110101000000000010111110",
"000000011010110101111111111001000011000000011110101111000000100110101010",
"000000000010000101000000100000100111111111110011010110000000001011101110",
"111111101100110001111111011000001001000000000010010001000000000001001010",
"111111011010000001111111111101100100111111100100010111111111100100100110",
"111111100110101001111111011000101000111111011101101011111111011100000101",
"111111100011100000111111100110001000111111011010000111111111011110001010",
"111111101101100101111111111110000100000000001001101000111111111101110010",
"111111111101011110111111111100110111111111111100000111111111110001000111",
"000000000011000111111111110101001010111111100011110011111111010100101111",
"111111111101110101111111010011000101111111011011011000111111011111011001",
"000000000000000100111111110100011111111111001100100100111111010001101011",
"000000000111000000000000000010001100000000100000010100111111110111101110",
"000000000101111111000000010100100101111111111001001110000000010110100010",
"000000011000100001111111111011000011000000001011001111000000001110110101",
"111111101100100110000000010101001001111111111011000010111111101110011100",
"111111110101111100111111101111000001111111000110110001111111010101100110",
"111111010101011101111111011000111011111111001010011100111111010100011101",
"000000010001011011000000010000111000000000100100110000000000010100111000",
"111111110111000100000000001001111101000000001111110111000000101100111000",
"000000010000000101000000001011101000111111011001010010000000000101010111",
"000000001100110101000000001000100011111111101111110010000000001001101110",
"000000001100011100000000001101000000111111101011011000111111111110001110",
"111111100000001000111111110100000110111111100000110000111111111111111001",
"111111010100110110000000000001000110000000010100011110111111111010111101",
"111111010110001100111111011000011110000000001000100011111111011110011100",
"000000001011100101111111100000100101111111110010011000111111111110111111",
"000000011011100010000000101101101100111111111010111011000000010000000110",
"000000100001101110000000000101011100111111111101010101111111011001011010",
"000000011010000101000000011000010100111111111100010111111111110011110101",
"000000011000101100000000000110110011000000010000000110111111100111111011",
"000000111110011011111111111011100011111111110101111111000000101101101001",
"000000000100101011111111011000100010000000001010011101111111010101100011",
"111111011011010001111111111011111000111111101101111011111111110011100110",
"111111110011111001000000011010101001111111111001100010000000001011100001",
"111111100001000010111111101100111111111111110111100001000000011100010001",
"000000010101111000111111011101011010111111011011101011000000100010001001",
"111111101110010111111111110111000010000000011001000101111111010100011101",
"000000000100000110111111111000101101111111110011000000000000011100100000",
"111111101100101011111111110010101010000000001101111110000000001000000111",
"000000010100011010000000010010111001111111011100001100111111110000000010",
"111111101001001010111111111000001000000000011101010110111111010110100110",
"000000001010010011000000011010111110111111011101110011111111110110001110",
"111111101011101111111111111100111010000000011010101011000000000100000100",
"111111100100011000000000001010111111000000011001001000000000010011111011",
"000000100001101110000000000000101101000000011101110011000000010110101010",
"111111111010101100000000100000010010111111100001100010111111101010101110",
"000000011011110000111111111011101100111111010111101010000000011000101001",
"111111101000001110000000001001110110000000010100010011111111100011000010",
"000000110100000101000000001111000000111111100011110110000000011100001000",
"111111110000001000111111011110001111000000010000010101000000011001110011",
"000000000010101011000000000111110100000000100001110001000000000011000111",
"111111011111101011111111101100100011111111110000011011111111110110011101",
"111111100000100001111111100111110001000000000100111111111111110101001010",
"111111101101011100000000000010111010111111010111100111000000100000011110",
"111111101010011111111111011010100101111111011101111100000000001001000000",
"111111111100101011111111011110001011000000001111010010000000010110110011",
"000000011000000011111111100100010111111111110100110110111111011001100001",
"111111101100100101000000001000111000111111100111011101111111100111111111",
"111111011110001011000000010001101100111111110010101111111111010111101000",
"111111101110111111111111100000001110111111100101010110111111100010010100",
"000000011001100010000000001011100011000000010000011110111111010110000000",
"000000010101101101000000010010100110111111010111000100111111101010001110",
"111111010011000010111111111001001111111111100111101010111111011100011100",
"111111100011010110000000011110111000111111101100111101000000001010111100",
"000000001000100011000000011000110111111111110011100100111111111101011111",
"111111111001110011111111011111110001111111101100100101111111110111111100",
"000000010011111101000000010101100001111111101100001100000000010001010000",
"000000001110110111000000000110001110111111100100111010000000100010110110",
"111111010011101001111111110100101111000000001100000001000000011100110101",
"000000001110001010111111110111001011000000010010110111000000011100010010",
"111111111001101100111111110010011000111111011000010011111111011110110101",
"111111111110011101111111101101110011111111111010110001111111010111111000",
"000000011001000101000000000110100011000000001000100110000000010101100001",
"111111100101100000000000001000010011111111111111010001111111100101101111",
"000000001101010011000000010110111010111111101001000000111111101101111101",
"000000101110111010000000010011100011111111110111001010000000011011110011",
"000000100010110011111111110000111011000000011010001100000000011000001011",
"111111100000011001000000001000100110000000001010011101111111110111111011",
"111111011011111001000000000101010010111111101111101110111111101001011110",
"111111111010010101111111110010110110000000100111001010000000001110011111",
"000000101010010111000000010110011011000000011000011110000000000011010111",
"000000010001111011000000000010100001111111111100111010000000000000010010",
"000000010110000111111111110101100101000000100111100011000000010100000110",
"111111100001001000111111111000001100111111011111101010111111010101011001",
"000000011011111010111111011001001111000000010111110011111111111001101011",
"000000000011000101111111010111011011111111110011110110111111100111010000",
"000000000010011001111111100010111111000000011110000101000000010110110101",
"111111101111111100000000110100010111000000011000011001000000011101001100",
"111111110000101100000000101101100101000000011100111101000000110000110011",
"000000010111100011000000100000001111000000000101110100000000001111101000",
"000000011111000001000000000101011001000000100100101101000000000001101111",
"111111100110100010111111110101000011000000001010000001111111111011001101",
"111111011100010000000000001100100101111111011010101000111111101111111111",
"111111100101010001111111111011001110000000100001011110000000011111100101",
"111111011111010001111111111000111000111111011011110010000000100110011111",
"000000000111110111111111111001010010111111010011010011000000000001010111",
"111111010111001000111111100001111010000000011110100100111111010111110110",
"111111111010000011111111110010100011111111111101110000111111101110010011",
"000000000001011110111111110000011011111111101111000100111111110111101110",
"000000000011010111000000101101010011111111110100000011000000110011010000",
"000000011100001010000000101101100010111111111111101100000000000101101100",
"000000011110111000000000010100110000000000101000001100000000011000001000",
"000000010001101011000000110011001001111111101101001110111111101100001111",
"000000010100000001000000001110011011111111100011111001111111111101000001",
"111111111100111011111111100111100000000000100100001000000000001111111001",
"111111101110100000000000001111111110111111011101000101111111100101001100",
"000000011101111001111111101011111000111111101010011101000000000110011001",
"000000001000111001000000000011100010111111011100100100000000000101001010",
"000000010101110100000000000110000011000000010010010011111111100000111100",
"111111100001000000000000010110000001000000000100011000111111110000001110",
"000000000001101010000000001010011011111111111000011101000000010101001100",
"111111101101101001111111011100110000000000010010010100000000011001110111",
"111111011111100110111111111001011001000000001001111001111111101011011001",
"111111100011111111000000010100010110111111100101000000000000010110011101",
"111111100101001010111111110100111101000000010000000011000000011001101001",
"000000010100000110111111111101000001111111110110001100111111010110000111",
"111111111001100011000000011001010001111111100100000001000000000111001010",
"000000001011100101000000011110001010111111111010010101111111111101101000",
"111111111101000011000000010011000000111111111010001011111111111000011011",
"000000001111110001000000001010000101111111101100110010111111011110100011",
"000000010101000000000000011011011000111111011101100101111111100100101001",
"000000100001101100111111111101111110111111011010111000000000000100010011",
"111111100000111111000000011100110001111111100101101100000000100111101010",
"000000101001000011111111100110011010000000101111010101000000100011001111",
"111111111101110101111111101010101111000000010001011010000000001110101010",
"000000111000010110000000101001111011000000010111101101000000001101010111",
"111111101111111101111111101000110110000000000011011010000001001011011011",
"111111111110011011111111011100110110111111111111100001000000010001001110",
"000000000111111000000000100100100110000000000111111010111111011010101000",
"000000001101011111000000011000000100111111110100110101000000000010001100",
"111111100010110110000000001000011010111111110100011110111111101001111110",
"000000000101100010111111011011101111111111111101010110111111100111001010",
"111111100100111000111111100110111001111111111101001110000000100000011011",
"111111101100010001111111111000101101111111001100001100111111011000100110",
"000000001000111010111111101001100100000000000101000000111111111100001111",
"000000000010001110111111001110100110111111010001110100111111110100001000",
"111111100101101011111111100000110110111111011001100010111111101010011110",
"111111011110010010111111011011001010111111110001110001111111110010001011",
"000000010111101100111111111111110000111111111100101010000000001111010000",
"000000100100011010000000011010110100000000001100101010111111011011001100",
"111111010111001100111111010101100010111111101001110100000000011000100000",
"111111111000110000111111111000001011111111111011010110111111101010101101",
"000000011001111010111111110001110000111111101100100000111111110101101101",
"000000010101001001111111100010011000000000000100111110111111010101011000",
"000000010110100000111111100001000110111111001111010001111111111100110111",
"000000000110001010111111110000110011111111111111010000111111101001110100",
"111111111001110011000000101101111010000000110001111111000000100010001000",
"111111100111010111111111110100010000000000001000101010000000000001100010",
"111111100000110011000000100001011010111111101101110111111111111111000111",
"000000100011000000111111110010000100111111110111101110000000100101010101",
"000000010101001001111111101000101111000000011011000000111111101100010110",
"111111100001001110000000010100001101111111110001011100000000100110001010",
"000000101110000000000000001000010111000000001001100010000000010101010101",
"000000000111110001111111110010001001000000100011111100111111111100101110",
"111111011100111011000000011100010010000000100000011110111111011100010111",
"111111111101100111111111110101110111111111111011111000000000000110100011",
"111111010001111110111111110001011001000000001000001010111111101000101110",
"111111101100010001000000000010010110000000011100011101000000001101001111",
"000000101100101110000000100110010100111111111111011100000000001000110001",
"000000000010110001000000111111011001000000010111010100111111111011000100",
"111111101011111101000000011101100010000000001011111101111111111010100010",
"000000100110111111111111111111011101000000011100111111111111100100111000",
"111111111111110111000000101011111001111111101011011101000000100001001111",
"000000001011001100111111100101111011111111110000011110000000001010001001",
"000000000100111100111111111101011011111111110000001011111111100100010100",
"000000000011101111000000010000110100000000000111111011000000001110000000",
"000000000001010001111111100111100111111111100100000011000000001110111100",
"000000001101100100000000011110101001111111110000111001000000000011010011",
"111110111100010100111111110101010110111111110010110000111111111101101001",
"000000000110011011111111101001101101000000010111110010111111111101010111",
"111111001111110001000000001111100010111111100011101011000000000101110110",others => (others=> '0'));

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