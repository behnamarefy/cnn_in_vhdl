library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_7_2 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_7_2;

architecture syn of ram5_7_2 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("000000011010110110000000100111101110000000000100101111000000100110001000",
"000000000101011110111111110010111101000000001110111101111111110011100110",
"000000100001110110111111111010010110111111011101101000111111101010110011",
"111111011010110100111111101000101111000000011101110010111111100101011001",
"111111101110001110000000011000011010000000001000101000000000011111011011",
"000000011100000100000000100111111110000000100111111111000000001110011001",
"000000001000110100111111111011001001111111111100110001000000001011100110",
"000000011000010100000000011010000100111111100101000110000000011000110101",
"111111101110010100111111111001111101111111111101000101000000010010111010",
"000000011011100111000000011001001101111111101110010010000000100110101101",
"111111101001011001000000011100000111111111101110101011000000100011001111",
"000000011011101111111111101010101110000000011110100010111111110010011111",
"000000000101100101111111110000100100000000001101110111111111110000101100",
"000000000110101111111111011111010111000000000111001000111111110111000111",
"000000010111000011111111110010010100111111110010101000000000011101000011",
"000000000010011000000000110011110001111111111010001100111111011010010101",
"111111011101010111111111111110111011111111011011110001000000000101110010",
"000000011000001000000000100100000000000000000111010100111111011000100001",
"000000001010111011000000010100001101111111100101011110111111111100010101",
"000000001011010011111111101001100010111111011110000101111111111011010111",
"111111111011110010000000000000010001111111010110110111111111011000111111",
"111111101110111010000000000011001101111111101110001110111111110111110100",
"111111111000001000000000100001111011000000010011100001000000100000010010",
"111111101011011000000000010001110100111111110001010101000000100100001110",
"111111110111100111000000101000110101111111110110000110111111110011111101",
"000000000010011110000000001011001011000000000011111000111111101100110000",
"111111111110110101111111110110011111000000001100011000000000010000000010",
"000000000001000101111111111011001011000000100110001011111111111001001001",
"111111101100111111000000010001001100111111100110111011000000100111011010",
"111111101110101111000000010100011010111111111010110100111111110011101011",
"111111111100101000000000010011101011000000100011100111000000001000010101",
"000000000110000000111111111101111111000000100011111001111111101111111100",
"000000001111110001000000010101110011111111110001100000111111101000000101",
"111111111000011011000000100101110000111111110000001001111111101110000101",
"111111100111101010111111000110001000111110111111110111111111011010111000",
"000000001000100101111111110000110111000000000001010001000000000010111111",
"111111011010010011111111101011000101111111100000000000111111110101011101",
"000000011010100000111111111001111100000000010010001010111111101110011001",
"000000001010110001000000011010001001111111001101011011000000011110010100",
"111111011101110101111111110101000111111111110100010111000000000001111110",
"111111111111110100000000000010101110000000011011010110000000100100110111",
"111111110110000100111111100010010111111111110100001001000000011101100011",
"000000000011010000000000010101000101000000011111110010000000100000101000",
"111111110001111000000000011110100110000000000100000110000000010100001111",
"000000000010001010111111100001110000111111101100101000000000100000001000",
"000000100001010101000000010110000111000000010011100111111111100001110010",
"111111100111010000000000010000000101111111101111110110111111101111011101",
"111111010011111011111111100110000110111111101111001011000000001001000111",
"111111101110110011111111111011101010000000010011000011000000010111111010",
"111111111101100111000000010001011001000000100011101000000000011000101110",
"000000001100110000000000010110010111111111101001100011111111011000101001",
"111111110000000101111111110101110111000000011101100101111111100110010010",
"000000001010100111111111101111110001111111111000011111000000011001110001",
"111111110010110100111111100110110110000000010101100110111111101101010111",
"000001000010111000000000100010100111000000000111011110000000010100010101",
"111111101101010010000000101011110111000000110010101000000000001001111110",
"000000100010100110111111110111011011111111110010111110000000000110000110",
"000000100000011001111111111011010111000000011011011101000000001011111100",
"000000000100010100000000100111101111000000011100010010000000000101100010",
"000000100101000101000000001001000111111111111000011001000000001001110110",
"000000110100100111111111111101101110111111111010000111000000000011100110",
"000000100100111101000000010111000010000000000010100111000000101010000101",
"000000011011110111000000110101101000111111110000011100000000001000011111",
"111111101010111110000000011111100011000000010111010111000000100010111000",
"111111110011110110111111011011010101000000101100010100111111111111010100",
"111111101110001100000000110011000110000000100010011101000000011100100110",
"111111010001100010111111010111100001111111110101011111111111011010011010",
"000000000001001111111111101111001010111111100100000100111111110001100011",
"111111110010110010000000000010010010111111110001001110111111011011110100",
"000000001111101111000000010100100000111111001111100100000000001101011111",
"000000010101010111111111110101010100111111101000101101000000001110100111",
"111111101110111011000000011111111111111111111010010110000000010010010000",
"000000000101011110111111111100110000111111101111010101000000101011010000",
"111111110111101000111111100010100101000000010000100111111111111111111000",
"000000001010001001000000100010001100000000000010111100000000001010000000",
"111111101101111001000000001001000001000000001111111001111111100101000111",
"000000100010101010000000100100110110111111101110111110111111101111011100",
"000000000001011111000000000010001001000000010011001000111111111010010001",
"000000101010111100111111100011111010000000000001111110000000001011011100",
"111111101110010011111111100011100101111111110101000011000000011110010010",
"000000100000111001111111100010010000111111111101011110111111110110010000",
"111111001011001110111111101100010011000000000011111100000000011000011001",
"000000010000001100111111010011101010111111001010011011000000000110011011",
"111111011011101111000000010010001111111111011101111111111111001100000000",
"111111111010011000111111100100000100000000000100010100000000010111000111",
"111111101101111011111111011000110111111111111001100000000000010100111111",
"111111101111100001111111010010111111111111101000111111111111100000001011",
"111111011111101011111111001100000100111111111000100001000000001100100110",
"000000101100000000111111110001110000000000000101001010111111111100000001",
"000000011110111010000000001100110101000000110000100010000000010001000100",
"111111011010111100000000001110110011000000011011011011000000001111110001",
"111111011111110010000000000101001010111111110000001110111111010010110001",
"111111101100110111111111101011110010111111110010101000111111111110011100",
"000000001001010111111111101100111011111111010111010100000000000111111100",
"111111110001110010000000011101110000111111100000000110111111100100100111",
"000000001011011111111111011011011010111111101010111000000000010011100001",
"111111010000110000111111010111001011000000010001100000111111101001001111",
"111111110001101111000000000000010010000000001000101101000000010101011100",
"000000001001100101000000000101101010000000000010001001000000000010100000",
"111111100000111110000000000110011011111111101000110001000000000111011011",
"111111111000101000111111101111111110111111101010111011111111111010011111",
"111111110100011100000000000000000010000000001011101100111111011010011000",
"000000001001000111111111100101101000111111101011000000000000010011001010",
"111111111101100000111111110101110110000000100111101000000000011011100110",
"000000011100110110000000000101001101000000011011001101000000111011101010",
"000000000111010111111111011011110101000000000110110100000000100001111010",
"111111001011101100000000100001001001111111011110110111000000010010111001",
"111111110111110001111111100000110011111111100000000001111111101011111111",
"111111110101011010111111101000010111000000000111000011111111101101001110",
"111111110110000101111111101100010101111111001100111001000000001111101100",
"000000000000100010111111010011110111111111110000000111111111101000100101",
"000000100001111001111111110000001000111111110101010011000000001101100001",
"000000100000011001000000011001111000111111100000010110111111100110100000",
"111111010111011000000000011001110110111111111000110111111111101001001100",
"000000001100010000000000011100011000111111101000111111111111010101100110",
"000000000011110001111111011110110000000000000000001101111111011000011011",
"111111101101110001000000011010111111111111101001010001111111110011000101",
"111111101110001010000000000000101010000000011111001010111111110110011011",
"000000010000000011000000100000111010000000000000001001111111110011000010",
"111111101100011111111111101001001110000000011011011100000000100110000000",
"111111101101111010000000011001000111000000000100101101111111110111100011",
"000000010000010101000000100101010000000000001010110001000000001000001000",
"111111111110001001000000001101000010000000000000010111000000011110000000",
"111111111010101101000000100001100011000000010011110000111111110111000000",
"111111111001101001111111010010010010111111110010011010000000001010011011",
"111111110100010010000000011001110101111111010100100110111111001010010100",
"111111111111011111111111111010011010111111110011010111111111011011111101",
"111111111110011100000000001110001111111111010101110101111111110101001101",
"111111100101000000000000100110010000111111110100000110111111100111001000",
"000000011000101100000000010000111110111111111010001101111111011011011100",
"111111100011101100000000010010100011111111101011100100000000001100110010",
"000000011101000011111111110101010101000000001010010100111111100011000100",
"111111101100001110111111100100100101000000011011100011111111110010001101",
"111111111101101111000000000001100011000000010100010000000000011000000111",
"000000010110010001111111110011001100111111101110110000000000001010110100",
"111111110010011101000000011101010111000000010010001011111111111010011000",
"000000001011001000111111010011111111111111101101010001111111111111110100",
"111111100100110100000000010001101000000000001100110100111111101110001000",
"111111011100100111111111011001000001111111100011011101111111010010001011",
"111111101011011000000000011010101000000000001101001001111111011101010010",
"111111110110011001000000000010001111000000000010111110111111101100011001",
"111111101100110101111111100010000011111111010001101100111111111111110101",
"111111011111101001000000000011101001000000001011001100111111100001101110",
"111111011100010111111111100111010001000000010000100010111111011000100101",
"111111010100111110000000001110101100000000010010000001111111100001010001",
"000000001110000001111111010010001100000000000100010101111111111100101010",
"000000001110000100000000100101001001000000010011000111111111100101100011",
"000000100000001001111111010110010001111111011111000111111111110100010100",
"111111110011001100000000000101011100111111110001000011111111110101111000",
"111111011000000010111111011110011111000000000100101011111111110100001011",
"000000110100100101000000001001101011111111100100011110000000000110011111",
"000000000111011101000000001000100101000000000110100011000000100101110011",
"111111110101001110111111111111110111111111111010010100000000010011100011",
"000000010000101010000000001110010110111111101101110001111111110010011000",
"111111011010110110111111001101101011111111001011100101111111111101011011",
"111111110001101011111111011001011101000000001101010111111111111101110011",
"111111110011000010000000000011100100111111011101011110111111011101000110",
"000000100001011101000000001010001110111111100110010011111111110010100001",
"000000010000001110111111110000010100111111100110000010000000011110011101",
"000000000100000111000000100111101010111111111010001010111111111110011111",
"111111011111100110111111111000100001000000100011110001000000010101011101",
"111111111010111011000000000000101011111111110111110000111111101110101001",
"000000011101010100000000001011100110000000101110000010111111101010111011",
"111111111110011000111111110000001011000000000111001100111111111101111111",
"000000001011010110000000000001001100000000011010000010000000010100100100",
"000000000000000010111111111100110100000000001001010100000000011101111001",
"000000011010011010000000000101011101000000010100000011000000000001011111",
"000000000111010111111111110000000011111111100011100001000000011100010011",
"111111110001111011111111011111110100111111111110111110000000011100110110",
"111111111100110110111111101001011110000000010000100001111111100001110101",
"111111101111000111111111101011011100111111110111010110000000011010000010",
"111111100010111100111111110101010011111111110101010010111111110000111111",
"111111001111101001111111011110010000111111100001110001111111000010110100",
"111111011000110010000000001011101101111111010111110100111111100100110011",
"111111111100111111111111111010011111000000001110110010000000100010110010",
"000000001100010010000000101010001100111111110110000101000000001001110011",
"111111110111001001111111101101000100111111111110001110111111100100001000",
"000000010111100010111111101100100100000000010111000010111111110011001000",
"000000000011011110111111100110101001111111111101101110111111100000101111",
"111111111000011000111111101110010101111111111110110110111111001100011100",
"111111110000011110111111111101011010111111101110110100111111011011111011",
"000000001000110110111111101010011001111111010110001011111111011001101110",
"000000011101101011000000011001101111111111111000010111111111101110000110",
"000000100100000000000000011010000010000000010111001110000000001110000100",
"111110111011001100111110110000011000111111000110011110111111011000111100",
"111111111001001010000000000011111110111111010101011101111111000000001000",
"000000000101001111111111100000110000000000000001000110111111111110010110",
"111111011110001011000000000100001110000000000010111011111111110010100110",
"111111110001010011000000010111101110111111110101101110111111100101001000",
"111111111111000100000000000111001111000000010100011000111111110000011101",
"000000001101110011111111110010000111000000001010110000111111110110110011",
"000000000001111001111111100010000101000000001000001101111111110000000011",
"111111111001111101111111101110011101000000000011111111000000010011010011",
"111111010101000010111111010111110111111111010110110011000000011001011000",
"111111100010010010000000000110000100111111111101011010000000001010001011",
"000000011001101111000000001100101010111111011111001010000000010110101001",
"111111101101111011111111100011100101111111100110010110111111110110011000",
"111111010001001101000000000110111011000000000100001101000000010011000011",
"111111011110010001000000001011111001000000010101100100111111101100101001",
"111111101100101000111111111001101111111111110101001111111111101101010011",
"111111110100110011111111101111001010000000000111001100111111111000101110",
"111111100001011111000000000100001110111111100110000000000000010110100101",
"111111101011101110000000010011011010000000010001011011111111100011000100",
"000000000100001101000000011001111010111111111101010001111111111011100100",
"000000000101111011111111111111111101111111111011100011111111100010010110",
"000000010001110111111111111011100111000000011101011111000000001100001100",
"000000001100110100111111111110000111111111001100010100111111011010001110",
"000000000001010100111111100111110111000000100010011000111111010011011010",
"111111010101110100111111011011010110111111110100110100111111100110101011",
"000000001101111110111111110011100101000000000000101011111111111001011110",
"000000001011000000000000010100000000000000110010011001000000010000001011",
"000000100010000011000000100111001000000000010111010100000000110111101010",
"111111111011111000111111101101100000111111010111000001000000100000001000",
"000000001001001001000000011010101111111111110011101001000000010010011011",
"111111101001011000000000100010111010111111110010001110000000001000111010",
"111111101001100110000000000111000011000000000111101010000000010000101011",
"111111100010111111111111110000000011000000010001111011000000000010100100",
"111111111101100101000000011010011111000000001011101111111111101111011101",
"111111010101110000111111010111001110111111110101000110111111011000000010",
"111111010111000111111111111110101011111111101011110110111111010111010101",
"111111011111100100111111100100100000111111110010000101111111111100010011",
"111111100100011111111111010000001110111111001111001001000000001101100110",
"000000011101001101000000000101101001111111111101110111000000010110000101",
"000000101001100000000000011010111011111111101000110101000000010101011001",
"000000010010111110000000001010100010111111011110001101111111001110100001",
"111111001011011011000000000100001101111111101100101000111111110000100110",
"000000000011011010111111111110010010111111110101110110111111111001011011",
"000000011100001101000000101110010011000000001100000000000000101010001001",
"111111010101001001111111011010010111111111011110011110111111001101000000",
"111111110011101011111111010000100111111111011001010111111111001110001000",
"000000100010010001111111100011110011000000101000100100111111101011001011",
"111111101101010001000000010011110000000000010001101101000000100001100111",
"111111010101100000111111101100010101000000000111111010111111111101001010",
"111111111011100001111111111000111110111111001101001011111111010000010000",
"111111100001101000111111001110101110111111101001001000111111111001000101",
"111111100011000111000000000111111111000000001011110100111111111000000011",
"111111101010100110000000011110101111000000001100101000111111110101100000",
"111111110000101111000000011001110000000000010101100010111111110110101011",
"000000100001100100111111101111111110111111111101011110000000100011101101",
"000000110001010001111111101001111111111111011111010000111111110111101110",
"000000110111101001111111100010000000111111110111100101000000001110010001",
"000000010100001110000000000001010000000000000101001001111111101111100110",
"111111111100101111111111110001010001111111100111110000000000000100010010",
"111111111100000011111111110100100111000000000010111000000000000011011100",
"000000100001011100000000010101001001111111100110111100111111101111001110",
"111111111110111110111111110010111101000000100100101000000000010000100000",
"000000110110110100000001011011000000000001001001010101000000100111011000",
"000000100110000001000000100001101101000000001100100000000000101100010011",
"000000101011010001111111101101101001111111011010110111000000011100010011",
"111111111011100111000000000001011010000000000001001010000000001101010111",
"000000001110110110111111110000000100000000011101100111000000100001001010",
"111111100101010110000000000000011101000000010001100111000000010111001100",
"000000111001011101000000011111000111111111110110010011111111100011001001",
"111111111001100001000000011011111000000000000111100111000000000111011010",
"111111100001000001000000000101011110111111110111101000000000001000000001",
"000000010010110101000000001111001100000000011101000101000000000101111111",
"000000001000000001111111111011100000000000000101011010111111100010100101",
"111111011001011110000000000011000111000000011011011011111111111101111111",
"000000100000000000000000011111010110000000011011010001000000101000000111",
"111111100001001001111111111101101010111111101000011101000000100001111000",
"000000011110000010111111111111101101000000100011010001000000010100011111",
"000000010100110100000000010010010101000000000100010000000000000101100101",
"000000000111001001000000001101001101111111101010011100111111110001101000",
"111111010110111110000000000100010011111111011101111100111111101111101101",
"000000001100010011111111110101011011000000010011110111111111110110100111",
"111111101000111111000000101100100100000000010110000110000000010000010001",
"000000010000000110000000010110010011000000011001101100111111100010001011",
"000000001001011100000000010100111110000000001011101010000000010111101111",
"000000000010010110111111110000011011111111101011010000000000000001101011",
"000000010010100001000000010101010001111111110011000100000000100111110100",
"000000000100010010111111101101100101111111100111100111111111010010100111",
"000000100100001111000000010001000100111111111101000101111111110010101010",
"000000001100011100000000011010100001000000100011100011000000000010111100",
"111111101100111100111111011100101010111111110111111000000000000110100011",
"111111011010110010111111100110010001111111110001011001000000001100101110",
"000000000001111001111111010101101111111111101001111000111111001011011001",
"111111011100110000111111100001001010111111100001000111111111101100001111",
"000000011000000101111111011011111101000000001100001111000000100000011100",
"000000000101001110000000011100111010000000011100000100000000001011001000",
"111111100101001010000000000011100110111111010101011111111111111110100001",
"000000000100111010111111100111100010000000101110100001000000011100110110",
"111111100111000110111111111101101011000000010000110001111111101001010110",
"111111101111001100000000011001001101111111110110101010111111101011000011",
"000000001011101011111111011110101101000000010101000110000000001001010000",
"111111100000100010000000010010011010000000100011000010111111111000010100",
"111111101111110101000000000100101101111111011100001100111111011101010100",
"000000100010000000111111110001000100111111101111010010111111100010111011",
"111111110001100001111111111111011011000000011100111001111111100110010101",
"111111111111001000111111100111001010000000011001001100000000011000100011",
"111111111010111001111111111110100110000000011011101100111111100011101101",
"111111100001011000111111110000000001000000011110100110000000100101011110",
"000000000000001111000000011000001001111111101100001100111111110001110011",
"000000001110010110000000001100101111111111110101000000111111111000001011",
"111111101100011010111111111101100101000000001101001101111111110010010111",
"111111110111100001000000011110001101000000110101101001000000111001101010",
"000000110001101101000000110111001111000000100111100010111111111100111100",
"111111111100000110000000010011001010111111111010010000111111110111000011",
"111111101110111001000000010100101101111111011100011110111111100101101111",
"000000100111111011000000001000000111000000100101010100000000001111001010",
"111111110100000100111111110001101000000000000100011101111111111011110110",
"111111100011101001111111111001110010111111110110000000111111100010001000",
"111111100011100110000000010011010111000000010111001101111111100001110111",
"111111101001011011111111110100011100000000101001111101111111111110110000",
"000000100101011000111111100000101001000000100011011100111111110100110000",
"000000001011110001000000000011011011000000010101001100000000010111110011",
"111111110100101000000000001110000011000000100000110000111111011101011011",
"000000101101011101000000010100011000000000010110001111111111111000011001",
"111111111011110110000000000111110000000000000010010100000000010110110100",
"111111100011110111000000011001100101000000000100111111111111111101110011",
"000000100000000010111111111001011011000000001111011100111111111010110100",
"111111011000000010111111011100001110111111010100100101111111101001001011",
"111111111100000010111111011011011111000000100000010010111111100111000101",
"000000011101110001111111101111001000000000100101110011000000011101111000",
"000000011011000000111111100010110011111111110101111101000000011110100011",
"111111011010110010000000000110000111111111100100100010000000000111110011",
"111111011101110001111111110000000010000000000010100010111111101101011110",
"111111100110001100111111111100000001111111110111100000111111011011010001",
"111111110101001001111111111011010001111111010100110110111111011000011011",
"000000101110011110000000001111001111000000100000101000111111101111101011",
"111111110011001100111111101001100100000000001100001101000000100111111010",
"111111101101010001111111001110010001111111111001000010111111010100011001",
"111111011010100001111111001100110101111111101101011110000000000110111111",
"111111110101000001111111101110100001111111101010110011111111111011001100",
"111111011001010100111111100111110110111111011001010000111111111001011110",
"111111111100101000111111100000111000000000001111110001111111011001100001",
"111111101101111000111111101001001001111111101111101001111111011000111101",
"111111100000111001111111100110101110111111100110100110111111010111000010",
"000000001101100001000000000111110010111111011110001001111111100110010000",
"111111010100011101111111011010101000111111111011100001111111111101101110",
"111111010010111000111111101010000010111111110100110100111111011011000111",
"000000011101101110111111010101010111111111110001001101111111111100001010",
"000000010001001111000000010011100011000000001101111101000000011010010111",
"111111011011110111000000100011011111111111101101010100111111111001011000",
"111111111001101100000000100000110111000000011010111000111111011110111110",
"000000100000101000111111111111101011000000011011110010000000001101011010",
"000000010001000011000000001101011110111111100000111011111111011100110010",
"111111010010100001111111100000110010111111100111100001111111100011001000",
"111111011101000110000000000000011000000000011001011111111111101001011101",
"000000100100010010111111110101001010000000000000111010111111111010000010",
"000000010001111000000000100100001111000000001111101010000000001111100100",
"000000010001101110000000010100110011000000010111011011111111111000010011",
"111111101101111010000000010010011110111111010110110110000000010001010011",
"000000001110001000111111111000111010111111100100101011111111100110111110",
"000000100001101011111111100111001110111111101111100000111111101100001100",
"000000011001101001000000000101010110000000011011011011111111100000000011",
"000000001010100011000000000010111111111111111010010001111111100010110101",
"000000100000111110000000001000010111111111111110011101000000000000111100",
"000000011000101011000000011110101110000000001001100110000000010110101110",
"000000001011101111000000011011011111111111101010110001000000010101101101",
"111111101000111011000000000010011001000000010101100111111111100001100000",
"111111111001010001000000000101011100000000011101100100000000100100100100",
"000000100001110100000000010110001010111111101111000011111111110100111111",
"000000010101011111111111111110001000111111010110110100111111100011010000",
"000000000111101010111111100100001001000000010001101101111111111010001011",
"111111010000001101111111110010010100111111011000001110000000011000110111",
"111111111010001010111111011100011110000000011100000000111111101011110110",
"000000010010010100000000100111001010111111100111010100111111111000111010",
"111111100100110011111111110000101000000000011000001011000000010100110011",
"000000000011010110000000000001001110111111110011101011000000000010010001",
"000000000110000001000000000100111101000000000001111111111111111100001011",
"000000010111111010000000010011001010000000100100110110000000010010110111",
"111111101111101111000000001011001000000000011011001010000000101001000010",
"111111100110110100000000001111000001111111110001001000000000001111101010",
"000000100110000000000000001101011100000000010010010001000000101001001010",
"000000010110110011111111101100111111000000100011101110000000101100111101",
"111111111011010011000000010111000110000000100110000110111111110100101010",
"000000011010110001111111011101001001000000000101110111111111110111100000",
"000000001100100010111111011101101110111111010101100001000000100010001111",
"000000011111011100000000100010100000000000000111001001111111100000110101",
"000000001100011001111111100000110010111111101111010101111111100010101001",
"111111111111001101111111110110111011111111011111001000111111100101001100",
"111111010001101000111111110001010000111111101011101011000000001000110000",
"111111101001011011000000101110000111111111111000101001000000000011100100",
"000000010001101101000000010100110011000000000110001100000000011001001111",
"000000010111111100111111110100010010111111101110010110111111100101100100",
"111111110010001010000000001100100001111111110110011100000000001101100000",
"000000010000001110111111101101110010111111111111111011000000011111011100",
"111111100110010010111111111001101010000000011101000001000000000100111101",
"000000010000110100000000100110010000111111100011110111111111111011001101",
"000000011010001101111111101011010110111111101001111000000000011101000000",
"111111101010001111111111101110000100111111100100001110111111101110001110",
"111111011001011110000000011000110110000000011011011001111111111000000011",
"111111010110011000000000001110100000111111101100010010111111100001110011",
"111111100100011001000000011000100000000000011001010100111111101110010100",others => (others=> '0'));

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