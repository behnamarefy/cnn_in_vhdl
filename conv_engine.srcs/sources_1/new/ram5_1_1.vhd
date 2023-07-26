library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_1_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_1_1;

architecture syn of ram5_1_1 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("000000010011000111111111101110001000111111100111100110111111100010010000",
"000000010111110000000000010101101101111111011110000100111111010111011010",
"000000010000100001111111111111001011111111011111000010000000010100000101",
"000000001010100010111111001111101101111111100011000001111111100001111000",
"111111100101110001111111111010100101000000001000101100111111110010000101",
"000000001101111100000000010001001000111111111110000000111111110100111001",
"111111110011111110000000100001000111000000011110010100111111100101111100",
"000000011100011100111111011010110011111111110101101000111111111000011001",
"111111110101111100000000001010101100000000000001110001111111110111110000",
"111111011110110010111111101101000010000000010000001110000000110001000111",
"000000001000001001111111110111101111111111100100100110111111100101000100",
"000000000111101101111111110000000101000000010001111001111111111011101001",
"111111010111001110111111101101001010111111100101101010111111011111101001",
"000000011000110001000000011100000001111111101011011101111111100101001110",
"111111111100010000000000001000001100111111101011001110000000001011000111",
"000000000001100010000000001011001000111111111001110101000000000010010100",
"111111011010000110111111100010000100000000000001101000111111110010011011",
"000000001000000101000000010011111010111111111110001010000000011111110000",
"111111111011011101000000011000110011111111110110100100000000001010111111",
"000000010110010010000000010111011100111111110110110011111111111111000001",
"111111101011111101111111101001011110111111011100000001111111110011010100",
"111111111110010010111111110110110011111111011001000100000000010100000110",
"111111011011000000000000001010100100000000000000100010111111111010100000",
"000000011111100100000000011010100001000000011010110010000000000111111010",
"000000011001010011111111110011010011111111101111101010000000010010001001",
"000000100001111001111111110000010101111111101011110110111111011011000110",
"000000100010111011000000011011110000111111110111011011000000101100000010",
"111111110001110000000000101001010010000000100000100110000000001001000000",
"000000001010100101000000001101000011000000011000011011000000010001101000",
"000000001101100000000000000001010010000000000101000110000000011111010001",
"000000000100111010111111011111011000000000000001011011000000000001010011",
"111111011001001111111111100001010001111111110011001100111111111110000011",
"000000010000011101000000011101110001111111100000011100000000011001111110",
"000000010000101101000000010000011010111111111000011111000000000001000100",
"111111011110101001111111100011010000111111011110001001111111010000110000",
"111111010111110010111111101100100011111111011100010010000000001110110110",
"000000000001110010000000011100111001111111110101000010111111110101100011",
"000000010010011101000000000010110101000000100010010001000000001110111011",
"111111110111011100000000000010110001111111110010110100111111100111011100",
"111111110011111000111111010101100000111111011101110000000000010100100011",
"000000101010101011111111111011010001000000001101010011000000110111111000",
"000000000000010001000000101001101011000000100001010111000000101010001011",
"111111111011100001000000000111011101000000011000110101111111110101010111",
"000000011010100010111111010110011111111111100001011100111111011011110100",
"000000000100011011111111010111010101111111011100000111111111011010110110",
"000000000001010000000000001010100101000000000010000100000000010000101000",
"111111011011110100000000011001111100111111100000010010111111100111011000",
"111111011110100011000000000011110100000000001011011010111111101001100111",
"000000011001000110111111101000010000000000100100011001111111100000000000",
"111111110001001110111111100001001001111111100011011000111111110110111000",
"000000011011001010111111111111010110111111110000011101111111110010010010",
"111111101101100101111111100010111100000000001011010001000000011101100000",
"000000010101011000000000101100010101000000010100111111000000000000000111",
"000000100011100011000000001111100011000000011110100101000000000001011011",
"000000010010001000111111010101110100000000001101110100000000010000011011",
"111111111000000101111111101111000111111111111100101000000000001101010110",
"111111110101011010000000011100001101000000010011111010111111110001011010",
"111111110110010110111111011100011000111111110100110001000000011011100110",
"000000000001111000000000110010100100000000100111010000000000100111110010",
"000000111000101010000000100001101000111111101111011100000000100001110110",
"000000000100010101111111111111011100000000001101001100111111010011100001",
"111111101110010100111111100011101011111111111101101100111111101001101000",
"111111100110010111000000001100111100111111011110101010000000000100000100",
"111111110001110100000000011110100010111111100111011101000000011101111111",
"111111011001111011000000001001000100111111110011000101111111011100101000",
"111111011000011111111111110010011111000000011001100001111111110111100111",
"111111101000001000111111111010100100111111111011100011000000010111110111",
"111111111001011110111111110100001100111111111000011000111111100111110110",
"111111011111101101111111011010100000111111100100000101111111110001100001",
"111111110101100111111111011101100011111111101111000011000000001110100111",
"000000100010010010000000011011110010111111101010111100111111110011000010",
"111111111110001100000000011011111010111111111101111110111111110101110010",
"000000100011101011111111100000100000111111011110111011000000011001101010",
"111111101100110000111111100001101000000000010111111010111111101110010000",
"111111110100100110000000010001110011000000010100100010000000101001100101",
"000000100110011111111111100100000110000000000111110010000000100011010010",
"111111100101011110111111111101101101111111110000101111000000011000110100",
"111111110101101100111111010111000111000000011011001110000000011000100011",
"000000101010001010000000000000000000000000110000000000000000100000010011",
"000000001101110101000000010011100110111111100110100100000000101101111000",
"000000010001101110111111110000000010111111110010001100000000010100111101",
"000000100010010010000000000000011010000000000001000001000000000100001011",
"000000000110101101111111110101111010111111100000100010111111011000001101",
"111111111100100111000000001010001001000000001111111000111111011010000000",
"000000100000111011000000100111111001111111111000100001111111100010111111",
"000000010010011001111111111100110010000000100001111100000000000100101010",
"000000011001001010000000000011010000000000100010110010000000010011100111",
"111111100011011101000000000101000000111111100000111010111111110001100011",
"000000000010001100000000010111101101000000000010011111000000101000001100",
"000000011001101110111111100111000000111111101011101001111111111000010111",
"000000010111001010000000001111111011000000010011011111111111110101000100",
"111111110000100000000000001001010001111111101011110010111111011000100110",
"111111110110101011000000101010101100000000010001010101000000001011101100",
"111111111010111110111111100010000010111111101110001010000000100101001001",
"111111110101000101111111100101011100111111101110001010111111110010100111",
"000000001111011010000000010110001110111111100111111110000000000101010110",
"111111011010100111000000011100110101111111100111001110111111100101101001",
"111111011000001110111111111010111011000000010101001011000000010001011101",
"000000000110000010000000000011100101111111111010011010000000001001010100",
"000000110100010100111111111111001011000000011011011111000000000011001110",
"000000011111111110000000011100001001111111111100001111000000100011111001",
"111111101010011100111111100010010110111111111100110111000000001001100011",
"111111110011010010000000010000011011111111100001000111111111110011010000",
"111111110110010100111111010001100000000000010110011001111111011111001101",
"000000000000100111111111011101001110000000010101001011000000101001000100",
"111111111011010111111111011010011000111111111000001101000000101000000000",
"000000100000011110000000011001010001000001000101110011111111111000100001",
"000000011100100001000000100101110100000000001001011010000000010101101001",
"111111101011010000111111100110110111000000011111010010111111101110011101",
"111111101100001000000000000101001101000000010010000100000000000111111111",
"111111101111000001000000100010001001111111101110100011000000000110010011",
"000000011110000010111111111111111100111111011111010011111111110001111011",
"111111101111010010111111100101111001111111010001001000111111011001110101",
"111111100100100111111111100011001000000000001101111110000000000011111111",
"111111011001101000111111101100101110000000100100101101000000010110010111",
"000000000111101011000000001010111001000000100000100111000000100101110110",
"111111011110101110000000000010111001111111100100000111111111110011010100",
"111111101100001100111111111000011110111111110100100100111111111111111101",
"111111101000011100111111110101101000111111101010010111000000001010000110",
"111111101011000000000000100000000111111111011100000000000000001011000010",
"000000100111010111111111100110011111111111100001100010000000011110110010",
"000000001100110100111111111000010110000000101110001011000000001101000111",
"000000000111011000111111100101000110111111111001011011111111101110000010",
"111111011111010100111111100100000110111111111101000001000000011010010011",
"000000001011111111000000100100010010111111100110101101111111101010000000",
"000000011011111111000000011111110010000000010010101010111111101001001110",
"111111110011001101111111101011101001111111101100011000111111111000100010",
"111111110111100010000000101110101000000000101110001111111111110110000110",
"000000100110100111111111110111101111000000010100101110000000011000001010",
"111111101000011110111111101001011011111111101110110010111111111001111011",
"111111100100011001000000011101011001000000001010110100111111010110110010",
"111111100100110110111111111101010111000000011101010101000000001110111010",
"000000000110100010000000011010100110111111110111110010000000100111101011",
"000000011001100001000000101111010000000000000110111110000000100011000100",
"000000011010101000111111100100110000000000100101001011111111101100111010",
"000000010010011000111111010001110110111111100110111110000000000001101000",
"000000010101011110111111111111110000000000011000010100111111100100100000",
"000000001111100100111111111111011001111111110101011000111111110100111001",
"111111111110111000111111110000101101000000000001101101111111111001111101",
"111111101111110001000000010001100111111111110011000001000000000000011000",
"111111101101000100000000101100000001111111110010000010000000010000000011",
"111111110101111101111111111110110000111111110011101010000000010010000100",
"111111100000111010000000100101000111111111110000100010000000100111100011",
"000000010010110111111111100010010001000000001111110001111111101000111111",
"000000001001100010000000010110101011000000100011001100111111011110011100",
"000000000101010110111111101001100111000000000011011000111111101011110010",
"111111111001101001111111010100010010111111010000000001111111001010011110",
"000000001100110100000000001111001000111111100011101110111111100000010000",
"000000100010011001111111100110011101111111101110111110000000010101110011",
"000000010011000110111111111110100010000000100100100000111111101010011010",
"111111100100101010000000000110011100111111011010000010000000100110110110",
"000000010000000001000000001100110110000000000111110011111111101101111101",
"000000011011011001000000000101101011111111110110001101000000010101001010",
"111111011011110011000000100001110011000000000100100010111111111100101001",
"000000011110110000111111110010001110000000100100100100111111110010011011",
"111111111010000010000000001110011001000000011111101100000000100100011000",
"000000000001101011111111111001101000000000000010000010111111111011101101",
"111111111101000101000000010010000001111111011010101011111111100111001111",
"000000100001001110111111111101000100000000010010001100000000001110100101",
"000000101100000000000000010010011010000000001111000111000000000001110100",
"111111101011110000000000001101000110000000011110110010111111101101101100",
"000000100010100001111111100010110100111111100000111011111111101001001101",
"111110111111110100000000000001100001111111111010111111111111011001011110",
"111111100000000111111111001110010001111111011101001110111110111100011100",
"000000101000001101111111111100100101000000001000101100000000000001100100",
"000000010011100110000000001111111110000000100011001110000000110110011001",
"000000000101110000111111101100110100000000010010110110111111011010110010",
"111111101110100101000000010100101100111111110110001000111111111001010001",
"111111010111110110111111001000100010111111011001111111111111010001001000",
"111111101000111101111111111100111110111111011001010011111111001000110111",
"111111100000101011111111111100001010000000001101101110111111101101110110",
"111111101101010100000000001110011110111111101000100011000000000011100101",
"000000000001111111111111110010001100111111111110101010111111011001101100",
"111111100110101001111111101111000110000000000111111111111111110101010001",
"111111101100001111111111010110011110111111101000001111111111100000100010",
"111111010110000001000000001111010000111111110001011010111111100111011100",
"111111111000000101000000000000100100111111101111000001111111101100000111",
"000000001111111001111111010100001100111111110010100110111111110010001000",
"000000010011100110111111010111111010111111000111001111111111100110010001",
"111111111011111001111111001000001001111111101000100100111111010101010000",
"000000000111000111111111011100010111000000001111110111000000001111010100",
"111111110000001010111111110000101000000000010111010010111111110010100001",
"000000011110000011000000001111010100000000010101010011111111100010101011",
"000000000101010100000000000110101000000000000100111100111111100011010110",
"111111111101111011111111111110100010000000011101001001000000010011011111",
"000000000100111111000000001111110101000000010000001101111111111111100101",
"000000010100110001111111101010111111111111010110110000000000100100111001",
"000000010111100101111111110100111101000000001010111100000000001000011100",
"000000011011000010000000010111100111000000100110010110000000100000100111",
"111111111111111010000000000110100011111111110001111000111111110101110100",
"111111011111001111111111100011110011111111010011011010000000010100110111",
"111111100011011010111111011001110011111111001110011101000000011000101001",
"111111100111001011111111110100010010000000100000100011000000010111100111",
"000000100000001000000000010001101100111111100111110110000000000010011111",
"111111010000000101000000000000000100111111110011110111000000011011000011",
"000000001000010101111111110000101001000000010111001101111111111001010001",
"000000000100110000111111110000000001111111110110010000111111010011000001",
"000000010100110111111111111010111001111111110011101101111111101100001100",
"000000000101010010000000011001111011000000100100110010111111110011100011",
"111111111101010110000000010110100100111111101010110111000000001001000101",
"000000000110010010111111111001001001000000011100011000000000000011001101",
"111111100100000101000000010011011101111111011000111110111111111001011100",
"111111111000011011111111111111011100111111011101000101000000011000011010",
"111111111010011000000000001011101101111111110110101110000000100000100110",
"000000010111110101000000000100000100111111101100011011000000010011011111",
"000000100001110000111111100100001000111111111110111101000000100010110101",
"111111110111111111111111110000001010111111100110111101000000010010101111",
"111111101101010011111111110001110001000000011110110100000000011011000110",
"000000010001010111111111011011000001111111111111010111000000000101011110",
"111111101110110001111111110000000101111111100100111101000000001101010001",
"111111011101101101111111011101011101111111010101000001111111100100001110",
"111111010010110011111111010101111110111111011110001011000000001101001110",
"000000011100000101000000000110010011000001000011110101000000100011110100",
"000000100101111101000000111010001001000000000100011110000000100011011000",
"000000011001010001000000010111001100000000011110010100111111111010101001",
"111111110010011000111111111010101001000000001011110110111111110100101100",
"111111010011000100000000000001000000111111101111011010111110101101100100",
"111111110001101110111111110100000101111111000011001100111111010111001000",
"111111100110010101000000001110110100000000010000101111111111111000011100",
"111111110100001110111111101010111100111111100111001111000000001110100101",
"111111110000110100111111111000001010000000010000111101000000000111110111",
"111111011110001010000000010110001111111111110010111010111111100011011111",
"111111010011010011111111101101100101111111010101101100000000010010101010",
"111111101011011011111111100100110110111111010101010110111111001011000111",
"000000010000100000000000000101010001000000011000101011111111101010111010",
"000000001111000101000000101001110011111111111000111111000000100010000011",
"000000011100100000111111110101010111000000011110101100111111101000001111",
"000000001011110101000000000101111000000000000011111010000000010010101011",
"000000000010000000111111111111111001111111111100011010111111101100110010",
"000000000110011001111111101000001000000000010010010110111111100101000100",
"000000101110101000000000010110000101000000010010100111111111101010101010",
"111111111010001000111111111111010010000000100011010001000000011111111111",
"111111111101011011111111011110101001000000011011100010000000011000001111",
"111111110111110101000000001110101010000000001110010101000000101000001111",
"000000000001011011000000001011111100000000000110011101000000011010000010",
"111111101100010000000000010100000001111111111001001111000000011000011011",
"000000001011111110111111110111101010111111000011011010111111010100111101",
"111111111111110010111111110000101000111110111101100111111111100010010110",
"000000011000110111111111111000110011000000001011100101111111100111110001",
"000000001000101010000000001010100110000000011000010000111111101110110010",
"000000000100110110000000000101110110000000010110111011000000000011001010",
"111111100010101101111111011000011110111111110010100001000000011011110111",
"111111110110110010111111100100000010000000001111111111111111100100010011",
"111111101001100110111111101100110000111111010010001001111111011000010011",
"000000100011011100111111011001110100000000100010010001000000010101000001",
"111111101011011100111111111000111000111111011110001110000000001111011101",
"111111100010001011111111011010001100000000010100101001111111011110111101",
"111111100111011111000000011010100011111111110110001010000000011111011111",
"111111010000111101111111111101111011111111100101011010111111010001010110",
"111111110011011111111111111010110101111111101000110111111111010111001101",
"000000100110010111111111111000010011000000001011000010111111111010101010",
"111111100101011101000000010010010001000000010100010001111111111110001100",
"000000000110001101000000011100100100111111101111001100000000001010010000",
"000000101010110010000000001110010001000000101001110100000000001001000011",
"000000010110100001000000011101101111111111101101110011000000001110001101",
"000000000110100100000000011001110000000000001111101001000000010000001100",
"000000001100111110111111101001100110111111111110011011000000000101101001",
"111111110111111101000000001010110001111111110000100110111111101101100011",
"111111011000110000111111101110010010111111101001111000111111101001111011",
"000000001011001100111111100101101100111111100101110000000000001100101111",
"111111011011011110000000000101101011111111111001101100000000010101001001",
"111111101001111001000000001011000011111111110010011101111111110011001010",
"111111011110001001111111101110000100000000001101001101000000000000001001",
"000000100010000101111111011110111101000000001010101000000000011011111111",
"000000001010001111111111100110000001111111110110111001111111011000001011",
"000000100011100000111111110110000011000000010011101010111111100000110100",
"111111001100000100000000000010011010111111110011010101111111110001010110",
"000000011000111110000000001010100101111111100111010011111111101010101100",
"000000010010001101000000001101100000111111110111001100111111010000111000",
"111111100010100011000000010110000100000000001000101011111111101111001000",
"111111101111100010000000100101110010000000010000011000111111110100000100",
"000000001001010110000000010100100101111111101100101000000000010010001011",
"000000001100110000111111101000001100111111111001100010111111010010100111",
"111111011110100101111111010110011010111111110010011111000000000111110000",
"000000000001000111000000000011100011000000000100010000000000011111100001",
"000000011000100001111111110001111001000000100110100100111111100101001110",
"000000011011101110000000100011011001111111101000011010000000000100000100",
"000000010001100000000000010101100011111111100110111010111111101011000011",
"111111101011110000000000000110101110111111110001110101111111100001100101",
"000000010100100101111111101111000010111111110011111001000000000001110100",
"111111010011001010000000010111000000111111111000001101111111111110101000",
"000000001010101000111111110100100100000000010000111101000000011010001010",
"000000100001111110111111011101100000000000001001101000111111011111101011",
"111111110100010100000000000101101100111111011101111011111111111011110101",
"000000000011001101111111110110001110111111101111100001000000011011100101",
"000000000111001110000000001110000101111111110101111101111111110100110000",
"111111110110110110111111100100101001000000011111101000111111101101001110",
"111111111111001100111111100011111111111111100011011011000000010100110101",
"111111111010010110111111110000110010000000101011000000000000000110011111",
"000000010110010010111111100000010011000000000100010111111111100111110101",
"111111110100111010111111111001101000000000000000010111000000010010011101",
"111111111011001001111111010111100001000000010100001011000000010001110000",
"111111111101011001111111110101000001111111111000100101111111101100001111",
"000000010110000110111111110011010011000000010110100011111111111101000011",
"000000000101111111000000011010001010111111101010110000000000001111010110",
"000000010001011000111111100011111110000000100110000000000000010111011001",
"111111110011010010111111110111100100000000001101110011111111100100110101",
"111111010110000001111111011101111011111111111111110000000000001111100110",
"111111110000001011000000010010101010111111101110011001111111001111010011",
"111111111010111001111111000100101101111111011110101110000000001111111000",
"111111110110010001000000001011110011111111110011000101000000011001110110",
"000000011011101010111111101110011010000000011011101110000000001110010010",
"111111101011111101111111111011101100000000001001001001000000011110000011",
"000000011001000010000000011010101011000000011000000001111111111010000010",
"000000100001001110111111101101111110000000100110100101111111100101110100",
"000000010011001000000000010100110001000000001011100011111111101001101010",
"111111111101010001000000010001001000000000011000100110000000001100000000",
"111111110001011110111111110010011111111111100110001110000000000010111100",
"000000100011001101000000010001010100111111011101110001000000000101101001",
"000000011011110110000000000001100101111111100010011001000000101101111010",
"000000001100101101111111111111111001000000010100101100111111100101011011",
"111111110101100101111111011001100011111111101100001001111111111011001000",
"111111110111101011000000011000000011000000011011010001000000100010101110",
"111111100110000000000000001010000010000000100110110111000000001101000110",
"000000000100100011000000000100101001111111100100001000000000000110100100",
"000000001011000110000000100010101010000000001011101110000000001100010110",
"111111111000101100111111110010001001000000000100001011111111011011000011",
"111111110101001101000000000110110001111111100101001000111111100011111001",
"111111111011010100111111010110001011000000010110000001111111101001101101",
"111111111010010100111111101101100111000000010100001000111111011111001001",
"000000100000001101000000011011110010000000001100001001000000001100011100",
"111111110001001101000000010100001010111111100001100010111111010011000000",
"111111111000111101000000001001110110111111001101101111111111011011001011",
"111111100001010001111111011110001101111111100011000110111111001101110000",
"000000001001111101111111110011010000111111100000011010000000010101100100",
"000000010011000011111111101101011000111111111101111010111111101110110011",
"111111011110011101111111101001001011000000001100111011000000001101111101",
"000000011000010101111111110101011000111111110001101101000000001110010111",
"000000001110111001111111101100011001000000001000011101000000001010110010",
"111111110000000100111111010001001001111111011111001010111111010111011001",
"111111111100100001111111011100111001000000000010000111111111110001011010",
"111111011110011011000000001110001111111111111011101101111111111011001110",
"000000010111110100000000001000001010111111110000011000111111111010101110",
"111111011011110010111111100001011101111111111000010101000000101011011000",
"111111110010111011111111100011110110111111110011100001111111101101001010",
"000000010111001011000000000010100100111111111001111001111111110000010001",
"111111111100000000111111101100111111000000001100101011000000011010111110",
"000000011010011011111111100110001000000000011000000111000000010000101101",
"000000001110110001111111110111011111000000001100100011000000000100010011",
"000000000011101011111111110111101010111111111010000101111111110111001011",
"111111010100000110111111100110000100111111111111000000111111101111101111",
"000000001001110001000000011001011111000000000101100100111111010010100000",
"000000001011101111000000000001001000000000001001100110000000001100100111",
"000000110000101101000000001100110100000000100000010011000000001110000010",
"111111101110110101000000010011111011111111010011100000111111100000100110",
"111111100001010010111111101011011110111111100011000001111111011010100101",
"000000100101100110111111101011001001000000000001001110111111111001111001",
"000000010110001011111111111000010110000000001001010110000000001011110110",
"000000001010001110111111111000101110111111111101010010000000011100100010",
"111111110001010111111111111100111110111111011001000001000000100100101001",
"111111100100100010000000000011111001111111111010100110111111101001010111",
"111111111011001100111111110011110101000000000101111000111111100101000110",
"111111110000110101111111111010110010000000000111000000000000000001100001",
"000000010101101011000000010100110110000000001101101000000000001100000110",
"111111011101001110111111111010010111111110111111111010111111100101000000",
"111111110000000001111111101111010001111111101110100101111111101101000101",
"000000000110011011000000001110101101111111100011000001111111100101001110",
"111111101000101100000000000011010000111111100111101100000000001101000001",
"111111111111111111111111111001010001111111111011010011111111111100110110",
"000000010111101000111111110110001101000000101101000111000000101000010011",
"111111101000000101000000100100010011111111110100011011000000001011011010",
"000000000010110100000000001110101111111111110100011110000000000010001000",
"000000000101001101000000110001010100000000000000010100000000010111100110",
"000000010000111111111111110100010100111111111000100000000000101001000000",
"111111011111000111000000001010101010000000010101110011000000100100010011",
"111111101011001010111111101111011100000000001110111100111111100011100000",
"111111101010000000111111110101001100000000100011000111000000011101100101",
"000000010000010110000000001111100010111111111100001101111111101111100100",
"000000100110011000111111110000000110000000001100110101000000000000011010",
"111111110110111000000000011101100100000000010111000111000000100100101010",
"000000000000101100111111101011001101000000101011100001111111111101111011",
"000000000101111100000000000100011101000000011111101011000000010110101010",
"111111111111000101000000010011101000000000001000011110111111011111110010",
"111111111110001101000000001110111000000000101011001101000000000011011101",
"111111011110010111111111111001001110000000011100000111111111111110101001",
"000000000110011101111111100100000001111111111011000111111111011110011111",
"000000010001000000111111101100100101000000001100011000000000011011101110",
"111111011001010101111111010111011100111111110001110000000000100010010011",
"000000101100101110111111100101011111111111111100101110111111010101110001",
"111111111001011011111111010100110011000000000011111101111111100100100111",
"000000001111100011000000000011001111111111110100010110000000000001110100",
"000000000001000001000000001010011110000000010111110010000000000101011111",
"000000000101000011111111111111011001000000101101110000000000000011000100",
"111111101011110111000000011011011110000000011100001011000000001010100110",others => (others=> '0'));

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