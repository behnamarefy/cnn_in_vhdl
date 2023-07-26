library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity ram5_7_1 is

port(

clk  : in  std_logic;

we   : in  std_logic;

addr : in  unsigned(8 downto 0);

di   : in  unsigned(71 downto 0);

do   : out unsigned(71 downto 0)

);

end ram5_7_1;

architecture syn of ram5_7_1 is

type ram_type is array (511 downto 0) of unsigned(71 downto 0);

signal RAM : ram_type := ("111111101010011111111111110001010001111111100000110001111111111001000110",
"000000011110001000111111011010001100111111111001011011111111110000101010",
"111111101001100000111111101010111100111111110110111001111111111010111001",
"000000000101110000000000001100111110000000010111000110000000100110100000",
"000000000101111001000000010110110000111111011000100001111111110110111010",
"000000010111000000000000001111111101000000011110110001111111101101011110",
"000000000011010000000000100011010011000000010000010101000000001110101101",
"111111101101101110000000001011100100000000100001111011000000001001111011",
"000000011001111000111111111000001001111111011011001010000000100101111111",
"000000000111010100111111101101101100111111110111011110000000000101101001",
"000000001000111100111111111110110011111111111010011111000000000011011010",
"000000010110101110000000001100101110000000011100011010111111111011100001",
"111111110101011110111111100110010111000000010011010110111111110110001000",
"111111100110010101000000011101101100111111101010111001111111110010001111",
"000000010101101011000000001110110011111111101010001111000000100000111110",
"000000100001100011111111110011000010111111111000000001111111100011101111",
"000000011111000101111111101101100101111111111011000001000000000011010111",
"111111010110001001000000100101100101111111101001010110111111110000110010",
"111111011000010010111111010001010100000000000011111011111111101110001100",
"000000100000001001000000001011011101111111101011001001111111110001001111",
"111111011010110100111111110000000111111111100001110000111111100001010001",
"000000001110110111111111110010010011111111101100010000111111100011001100",
"000000100100101001000000011100011111000000010000010100000000010011110001",
"000000011110111000111111111110111110000000001100011001111111011110010101",
"111111111001101000111111111110011000111111111101110001000000010110000001",
"111111111011011011111111110111011010000000001101011101000000100010000101",
"111111111001001010000000001000000101111111101101110001000000101111001100",
"000000010100001001000000001001011110000000010010000000111111101001111010",
"111111100010101100000000000001011101111111110011100010000000010100001111",
"111111100111001110111111110101010111111111100011110111111111110010011111",
"000000100000001010111111100011010000000000010111100110111111111101111000",
"000000000100000101111111101110000010000000011110111110000000011101110001",
"111111110010001000111111010101110001000000010101010110111111101001110101",
"111111100011010100111111100110000000111111010010001010111111110111111101",
"000000001000001000000000000001010000111111101001010010000000011110001111",
"111111111110110000000000000110010011000000000111110010111111100110000000",
"111111011010111011111111101011001010000000011011101110000000010101010101",
"111111110110010111111111110011011100111111111001100011000000000101010101",
"111111011110110100111111101110001100111111101001100010000000001111001010",
"000000001111010000000000010101101111111111101011110100000000001010100111",
"000000001001011001000000010100000010000000010001011011111111110111010001",
"111111110010110110111111010101010101111111010011100001000000010011110011",
"111111101101010110111111100111010110000000100100011111000000101101001010",
"111111110011000100000000010101000010111111111010111101000000100101011011",
"000000010000110111111111010010100111111111111111011101000000000111000011",
"000001000001110010111111111110101111111111101010000111111111101001011111",
"000000001001110011000000101100110011111111110100101011000000100001000111",
"111111101001111110000000011111110100111111111011011101000000011100110011",
"000000001010110011000000001000000110111111100111000011111111011011100110",
"111111010100010000111111010110001010111111111100100110111111110100000001",
"000000000100001111000000000010000110111111011101001100000000010100101001",
"000000000001000110111111101101001110111111110011101100111111011010000000",
"111111010011001011111111111010110011111111101101010010000000000101101010",
"111111110010110000000000010011000001000000000101010001111111111001100100",
"000000011110111111111111110011010010111111101010011011000000001011100000",
"111111011110110101000000100001011101000000010100101101111111011111100010",
"000000001011111001111111011010010110000000010000100110111111101011111110",
"111111101011100010111111011101100100111111011001001110000000010111111111",
"000000100001001011000000011001111011000000010110101101000000000001010011",
"111111110000000010111111101011110010000000010110111010111111111100101001",
"000000001011000100111111101100110010111111010110010011000000000001100000",
"000000001000001111111111101000011110111111110101100000000000000010011001",
"000000010100100100000000101100010010000000010011111011000000011001011000",
"000000000111100011000000011001010101000000101000010010000000010101010001",
"000000010110100001111111101101100111111111011110111111000000011001101101",
"111111011010111001111111110101101110111111100111011011111111111001100001",
"111111100011101100000000000111101101111111011100010100111111100101101001",
"111111110010000101111111101010010111111111100101110111111111110000010011",
"000000011110011000000000000001110110000000001000001010000000100111100011",
"111111010100001111111111110011001110000000010101111000000000000011001101",
"000000011110110101000000011010101010000000100111001011111111111011010100",
"000000010010000010000000100110000111111111110101001010000000101011000100",
"000000100101110110000000001110100100111111110010000001000000011111010110",
"111111111111101100000000000011100011111111101110100001111111111001111000",
"000000011100000011111111111100101101111111111001110110111111100001100100",
"111111111111001111111111100111101111000000010111010010000000010100000000",
"111111110110001101111111100001010101000000000111001000000000011001110111",
"000000011001000011111111101010111000111111100010000100111111100101101111",
"000000001000010100000000100011000010000000001011010011000000010111010011",
"000000100011100011000000001101110000000000011111101100111111101100100111",
"111111110011100000000000010100100011000000001011001111000000010000111101",
"000000010101111011000000100010100010111111100011011111111111101010010010",
"000000010000110011000000100001010110000000010101001110111111111010010110",
"000000011001000011111111111111101100000000100000101010000000100001011001",
"000000010111110110111111100010000010111111010011101101111111101011000111",
"111111100111110011000000011110010100000000001111110010111111010001111101",
"000000001101001110000000000000101001111111111110010101111111011101001010",
"111111010010100001000000010000010111111111011100011100111111111100000011",
"111111101010000110000000011111001101111111110101100000111111111000101010",
"000000101110011111000000001100101100111111100100010001000000100011100010",
"111111110000010111111111111100110110000000011010100101111111011101010100",
"000000100100000100000000001100010111000000011111101111111111111011100010",
"111111101010110000111111010111101001000000010110101010111111011000110011",
"111111010110111101111111101010011000111111110111110100111111111100111110",
"000000001011010001111111100111111011000000010011101011111111100011111100",
"111111111101001001000000001011001010000000011010001111000000010110110101",
"000000100011011011000000011001000001111111101011111000111111110010101011",
"111111110100110001000000001001100100111111100110110111000000011010000110",
"000000100100011010111111111100000100000000101010111101111111111011110101",
"111111111111000010000000011010100010000000011000001111000000001000000000",
"000000001010000011000000100100101111111111111100000110000000011011111011",
"111111111100001001111111111010001101111111110010100000111111111111010001",
"000000011110101111000000010011001010111111100100001011000000010111011011",
"000000011110101011000000000000011100111111011100100010000000001011100100",
"111111100010001001111111011101011011000000000000101001111111101111010011",
"111111100011111000111111001111111010111111110111010101111111001011011000",
"111111110000100000111111010101111110111111000111001001000000001100111001",
"111111110110011101111111111001000111111111001010010000111111101000010011",
"111111100111110010000000010010101111000000000000010110111111101000000111",
"111111101010000001000000000100111111111111110010110001111111100001111001",
"111111100001100101111111111111011100000000010100011010000000001101100001",
"000000010010001110000000011110001000111111100100011110000000000010001100",
"111111011110111010111111100101000100000000000111111100111111011100000110",
"111111011000101011000000001010010001000000001100000010000000011001100111",
"000000001111101010000000011010111110111111010010001110111111110110110100",
"000000011100111011111111010111111100000000001011111111000000011010111010",
"111111011110101110111111110100001001000000010101001111111111101010000111",
"111111110001010010111111101010111100111111100000010010000000010110101011",
"111111101011100011111111110001001101000000000000000011111111100000100001",
"111111110001000101111111100110111011000000001101101110000000001001100001",
"000000010010110000000000000011110010111111110000011110111111101000001111",
"000000100010110001000000011001001101000000100100101001000000001101110110",
"000000010110011011000000011111010011111111011100010000000000011001010111",
"111111111101010100000000010000100011111111010101110000111111011111101011",
"111111010011111010111111111000101110111111110110011111000000011100100100",
"000000100011101100000000100010011110111111100001110111111111011100000010",
"000000011111101110000000000000100000000000010100110000111111110100111101",
"000000000001001011000000100010100110000000000011010001000000010010011000",
"111111100111010000000000100010100010111111100010111011000000010110101000",
"000000001000100110000000000011110010111111011001001010111111100100010110",
"000000010001100110000000101110011011000000000000101110000000010000101010",
"000000011010111001111111110100011001111111011101010111000000000110100011",
"000000011000000100111111111110000110000000001011110101111111111100011011",
"000000010100111011111111100111001000000000111001000011000000110011000010",
"111111110101100100111111111011011100000000110101010111000000001000111011",
"000000101011001100111111101110011100111111111001011100000000010011010101",
"111111001110001111111111011100111010111111011000100110111111110000110001",
"111111100000100011111111010100011110111111100100011101111111100010111001",
"000000011011101011111111111011100000000000001111110001000000010001001101",
"111111111011100101111111110011110100111111110110100100000000010010000101",
"000000000001111101000000100010011110111111011101100000111111110001011110",
"111111111011001010111111100000101011111111110111111001111111011001010111",
"111111100011011000111111101011001100000000001110111010000000001101011111",
"000000001011101101000000001110010111111111010111011101000000010001110100",
"111111100001100100000000100001011100000000000011011110111111101011010011",
"111111101001100010111111101011000010000000011001111011111111100101110111",
"000000110001011011000000011100000000111111101001001100000000100001101011",
"000000001111010000111111111111100000000000101111010100000000001111101001",
"111111010010101101111111011010101110111111110100001000111111110001110001",
"000000000111111000111111101001000001111111100101001011111111100100000001",
"111111110110010101111111110101111000111111101111111110111111011011110010",
"000000100011100001000000001011101011000000001000100100000000001100100010",
"111111100000000110000000001000010110000000011110011011111111101110100000",
"111111111111001011111111011101111110111111111110111110000000010011000111",
"111111110111110010111111011010000111111111101101101010111111110100000100",
"111111101000001000111111100001111111111111100001001011000000000011111110",
"111111011101010101111111010011100000111111010010100001111111100101011101",
"111111100100101001111111111101101111111111101001110001111111110100101111",
"000000000001110100111111111011011110111111010010111000111111010100000100",
"111111100100010001111111101000011110000000000011000110111111110011001111",
"111111101110011011000000001101111011111111101000010001000000001010101111",
"000000000110110101000000000001100010000000000001010111000000011001100101",
"000000001011010111000000001101001000111111110101001101000000001001000100",
"111111101100110111111111101000100001000000100000010001000000010111110110",
"000000001010000011111111111010011010111111101010001110111111100110101010",
"000000000000010010111111101101010111111111111010000110111111101010000001",
"111111100100110011111111010011100000111111011110110011111111101111010001",
"111111111100011100111111111011010101111111100011101100111111100011111110",
"111111101100100111000000000001110100000000010011110000000000011010101010",
"000000011100011000111111111101001001000000101010100000111111101111011001",
"111111111001101001111111110100000100000000100101011000111111101100011110",
"000000011001011010000000011101100110000000000011000110000000010010001110",
"111111101011011010111111110101000011111111010010000110111111101010110100",
"000000001011111100000000000110100101111111010001100010111111101101001111",
"111111100010011011111111101111001111000000001110000001111111011100101101",
"111111101111000011111111101110101111111111101100100110000000000011000010",
"111111011000010000111111111001111111000000010001101101000000011100010110",
"111111010100100110000000001111000110000000000100001011000000001011100010",
"111111110111100110000000001110000110111111010110011000111111011011000101",
"000000001001110001000000001010101001111111101111100110000000001000110011",
"111111111110110110000000010100011000111111110110011110000000001000101010",
"111111101100110100000000101000001100000000011010011100000000100001011011",
"111111011001110001111111111100001110000000000100100000111111101001011000",
"000000000110001000000000011011001111000000010010000101111111111111110101",
"111111010011010100111111101110111001000000011011011101111111110101110111",
"111111101100000100111111011000000100000000000101111111111111101001101101",
"000000011110001100111111111101001000111111100111111101111111100010101110",
"111111101010111001111111110110110001111111110010000110000000000010001111",
"111111110010111001000000011010010100111111111011011111111111110001010001",
"000000001000000110000000011100011110111111111011000001111111101011000000",
"000000011010010110111111110000000001111111100011010010000000001001111011",
"000000000000101010000000010111000001111111111010100100111111100110110110",
"111111100000110010111111010010100110111111010010000011111111110000101001",
"111111100101001111111111101101011000111111001010110010111111011111010110",
"111111100110101110111111100111010111111111110011011011111111111000110011",
"000000001101001010111111101010000111111111011000011011111111100111011000",
"000000011001001101000000001111111101111111110011010110111111111110000010",
"111111110010001011000000010100001110000000001000011000000000010110111101",
"000000010000000000111111101000001001111111110111000110111111111010001001",
"111111010000110010111111100001110100111111110001100100111111111001110010",
"000000000111100110111111111000110000111111010101001001111111010011110101",
"000000000011111011000000011011001000000000000101011111000000010111100111",
"111111111010001000111111101000011010000000000100010011111111110110000110",
"111111100011100010000000000111000000000000100000011000111111110100011011",
"000000001011100001111111111100110101111111101001110100111111100110001000",
"111111111101111110000000011101011110000000000101000000000000100101011100",
"111111101000001010111111100010000111111111001011111110000000001001111111",
"111111001010010011111111101000000010000000010010011101111111100011100101",
"000000001110111000000000001000010100000000101111111001000000001000010011",
"000000000110100111000000101001011111000000010110000100000000110001101110",
"111111101001011000000000010001000000111111111010000101000000010110000111",
"111111100110111111111111011100010111111111010011101110000000000010001010",
"111111111100110011111111010011100010000000010100010000000000000110110110",
"111111110111101011000000001001010011111111011001000101000000001101101010",
"111111011101110111111111110100010010000000010010101001111111101011100101",
"000000001000000111000000001101001001111111111110111111111111011101001111",
"000000000011110111111111011110101011111111111100110001111111111000101011",
"111111110110100011000000101001101011000000100111011010111111100010111100",
"111111111100111110111111100111011000000000000111001111111111011010010000",
"000000011010111110000000001100000001111111011001001001111111011110001000",
"000000000011111111111111110001001111000000000100100010000000010010000111",
"111111110011111111000000001001100111000000100000001110000000001001001000",
"000000000000011100000000000110000001111111110001101000000000001110110111",
"111111101100011111111111011111111111111111101100111001000000000011101010",
"111111100011100001111111011001011110111111110010000101000000011011111100",
"111111110000100100000000000010000101000000101001101001111111110010100101",
"111111110001011100000000010010001111000000101001100100111111111001100101",
"111111100110101100000000000111110010000000100101001111000000001101110000",
"111111100100100000111111100000011100111111100011011010111111100011110100",
"111111101111000101111111101011000011000000001000000110111111011110101111",
"111111101111101111111111011000000001000000000111101111111111110110110110",
"111111011000000000000000010011110111111111100100101111111111110100000001",
"000000011110011110111111111011100111000000000111011101000000010001110011",
"111111100000100110000000001111011111111111110100010010111111100000101100",
"000000010110100110111111101000001101000000001100001111000000001011001001",
"111111111001001011111111100100110101111111110000101111111111110011110011",
"111111110110100000111111110100101010111111110110100111000000010001100001",
"111111100101100001111111011101010010111111110110111000111111111101111011",
"111111110100000001000000011001110011111111101110100000111111110000001010",
"000000011001000110111111110101011101111111101010000000111111110111000010",
"111111101011001011111111101111100111000000000101001011000000000011001111",
"000000010011010000000000011110000000111111100001111100111111100110010110",
"000000000100010010000000000001001010111111010010010101111111100110011101",
"111111010001101011000000001101011010111111110111010011111111111010111110",
"111111101100001111000000001110011010000000100110111010000000010000101101",
"111111011101000111000000011101001001111111100011100111111111111110110101",
"111111010110000000000000001110111000000000001101110100000000011011100111",
"111111011101111111111111100011100110000000010101011001111111110011101011",
"111111111000001110000000000100110101000000001011010100000000001000100010",
"000000011100000101000000100101001101111111110110101001111111101111010011",
"000000000010000000000000010011100000000000000101000001111111100011011100",
"111111010100010000000000000010011101111111110110110001111111010010011001",
"000000000100100101000000000000100110111111101001000101000000001001111011",
"111111100001010000111111111010010000000000001000111001000000100000101110",
"111111101010010001111111011101000101111111101000001011111111101101000101",
"111111011011101011111111011111010100111111101000101001111111101100001110",
"000000011001001011000000001101011111000000001100110111111111011101010110",
"000000000001000100111111111010000101111111011101000100000000000000000000",
"111111010011111010000000001010111101111111111111101101000000011011111111",
"000000001101000111111111101010100110111111110110110001111111100101110010",
"000000000110100001000000111110010001000001001010100011000001000010100000",
"111111110011100101000000011000010000000000010010111011000000101011010101",
"000000001010111100111111100001010110111111011111111010111111100101011111",
"000000100001111010000000000100111111000000001111111110111111010100011000",
"111111011111011000111111111100100001111111110110001000111111010110111000",
"000000001010010111000000001001100010111111111111111001000000010010100011",
"111111101001011101111111111110110110000000001000101110000000001100001100",
"111111100000001111000000000001100110111111101111110001000000010100110100",
"000000010010011111000000100001000010000000100001110000111111111111000011",
"111111111110100110000000001100100101000000001110001001111111101110011000",
"000000011010010000000000011101101001000000011100001010000000011101110111",
"111111101100111010111111100110110000111111111110000111000000000110011100",
"000000100000000011000000110001000000000000110001100100111111100000110001",
"000000010000101011111111110010010001000000110000000101000000011010110100",
"111111101110100101111111110101000101000000010001110100111111110111000101",
"000000010111110001111111101100000000000000000011100111111111111010100111",
"000000010100001001000000001011011000111111100000111001000000011101000011",
"111111100111101001000000010100010101000000000101110000111111100111010010",
"000000001000001110000000000000101010000000010000100100111111010111010101",
"111111110011101101000000011100100111111111100010011000111111101010001110",
"111111100011111001111111111101100111000000011011000100000000010100001011",
"000000001100010111111111101000110100111111110110000100000000010010001010",
"111111111000011101111111110001111100000000011011001001111111110110001111",
"111111100101100110000000011011010000000000100010000111000000101011110001",
"000000000100011000111111111110000001111111010010001011111111001100100111",
"000000001001111001111111110101011101111111111101001010111111101010010100",
"111111101011000101111111110100011000000000001001001100000000000101000010",
"000000001010111111111111100110111100000000010011110101111111110011001101",
"111111011111011000111111101000101100111111001111101010111111011111101111",
"111111110111001010111111100110011011000000010100011001000000010111001111",
"000000001101111110000000010111100100111111101010010010000000001100111100",
"111111101011110111000000100010001100111111111111100000000000010011010010",
"000000000010001001111111101000100011000000001110010100111111100101001110",
"111111100010001011111111101000111001111111010110001010111111010101111101",
"111111010000111101000000000101100101111111010111000000111111100000101111",
"000000010111001101111111100101000001111111100001111100000000000011111001",
"000000101010010101111111110010011111111111110101110011111111111101111100",
"000000010011111101111111111100000011111111111001011011111111110000001100",
"111111011001011011111111110011111011111111101110001110111111110010000010",
"111111101111100001111111011101111010111111101100011001000000000111011110",
"111111101000001100000000011010111000111111011100011001111111110001111000",
"111111101101111111111111011111010010111111101010111001111111111010001110",
"111111111100111101000000001001000010111111110011000011111111001110101010",
"111111011011011000000000001110110000111111111100100001111111100101101110",
"111111111111001001000000010000100100000000100100110100000000010110111011",
"111111101110010010111111111111111100111111111011100110000000100000001110",
"111111110111111111000000010111101010000000011000000110000000010110101100",
"000000000110001001000000000000011101000000010110011010000000011111001001",
"000000000000100111111111110100010110111111010110010100111111111010111010",
"111111111000000000000000001001000111111111101011000111111111011011001001",
"000000010100010001000000001011111110000000011010001000000000010001101101",
"000000010000001001000000010101000010000000011011101010111111110010000000",
"111111100010110111111111110011111011000000001101011100000000001101111011",
"000000100000101000000000011011100001000000011111110001111111110011110000",
"000000001101111100111111011100100000111111100011100101111111101001010100",
"111111011111100010111111110000001010111111011011111011111111010100101101",
"111111100111010110000000011010111010111111110011100001111111100011010111",
"111111011001001011111111110000011110000000001100000011000000011011111000",
"111111111110010000000000001001001111111111010100011101000000001101111010",
"111111100001101000111111010101001110000000001011100100000000000001101101",
"111111101101000000111111011110110110111111101101001101111111011111011100",
"000000010100010011000000000011000011111111101010010110111111110010011101",
"000000001100001101111111100011100100111111111000000011000000100010000111",
"000000010110100101111111100010100111000000000101111010111111111100111000",
"000000000011100111000000001011011000000000010001000000111111011010100010",
"000000001010001011111111110000100000111111100011100001111111100001111000",
"111111100100110100111111000100001111111111001010100010000000000001110111",
"000000000011110101111111100011111000111111001011000110000000001000011001",
"000000011100001001000000010111111010111111101110010001000000000111011001",
"111111101101111101000000000001001000000000010000100100111111111011101101",
"111111110110101101111111110000100101000000001100110110000000010101100010",
"000000010001011100111111011001010010000000001111001110000000000000000111",
"000000010000101011111111101101110111000000000101111110000000001001001010",
"000000100110001101000000000111100011111111011001111010000000010011001000",
"000000010111011001111111100000110000111111110001001000111111110011000100",
"000000000100011111000000001111010111000000100001110101000000101110011000",
"000000100011100111000000001100001010000000101001011110000000011000000001",
"000000001110011111111111100010001001000000100010100010000000001101010011",
"111111110111010000000000100000110011111111110010110101111111101000101101",
"111111100110000001111111101010010010000000011100100001000000100100011110",
"111111110101111101000000011101100101000000011010100000000000001010010000",
"111111101001010001111111111100111111000000011111010010111111011000100111",
"000000101101110100000000010111101011000000001010011101000000010000011001",
"000000010100100000000000101000111110000000000001010101000000011111110010",
"111111110001011110000000011001111101000000010111010000111111101011111001",
"111111100011100110111111011110111000111111010110111111111111111011101110",
"111111111011000010000000010000110101000000010011000101111111111111010011",
"111111110101000101000000000001011011111111110001100001111111101111110010",
"111111110101000101000000001011100011000000010100001101000000001011110111",
"000000000101001111111111100011001010111111111000011101000000010011111001",
"111111100010010111000000010101001100000000001110001110111111111001111111",
"000000000100100010111111100000110110111111011111111000000000001000010101",
"111111100110000001000000010111011000111111110011100100000000001101000010",
"111111110001111111000000100010010000000000010010001000000000011001111111",
"111111111101101001000000100101101111111111110010111001111111111101101001",
"111111101001010000000000011101101011111111111000001001111111011111110000",
"111111011110001100111111110010101100111111100101000001111111100100110011",
"111111011000000100111111011000001010111111111101110100111111011111011101",
"111111101110110100000000011110000010000000010100001101111111111101110111",
"000000001111111110111111111100111100111111100111000110000000100001110011",
"000000010011011111111111101001001110000000001010100000000000010111010100",
"000000010110000100000000011011010010000000001011100110111111110011010011",
"111111101110100010111111110101011010111111011100101110111111101010101101",
"000000011111000101111111110001000011111111100111110110000000001001101111",
"000000100101001001111111111100010001111111100101001000111111110010100000",
"111111111100010011000000010001000011000000100101110001111111100001011000",
"000000100011110000111111110010111100000000000101001000111111011001110111",
"000000011001011100111111100110001010111111111010011011000000000100111100",
"111111101110100001111111111100110100000000001101111110000000011000001010",
"111111010101001001111111010110000010000000001100110011000000010100101110",
"111111101101111011111111110001001010111111110100101111111111111111100101",
"000000011100100001000000000000100011000000000100101001000000010111001110",
"111111110000010110111111101100011100111111111110010011000000011110100000",
"000000000101010100000000000011101001111111100010101111000000011100001110",
"000000100110011110111111100110011000111111110001110011111111011101111001",
"000000010101001101000000101011111001000000100110001011000000011110000011",
"000000011110101101111111011010001110000000001100011010111111110011011111",
"000000001001001000000000100001101000111111101011110110111111101111101011",
"000000010100101110111111110001111101000000011001000011111111111111101101",
"000000011111001111000000001110100100000000000000000100000000000001101000",
"000000010111110110111111101001110001000000011111001110111111101000010011",
"000000010001111010111111111010110111111111110000110100111111011110001111",
"000000100001010010111111110111011001111111101000111000111111111110101011",
"000000100010000100000000010111000111111111011110011011000000000111110100",others => (others=> '0'));

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