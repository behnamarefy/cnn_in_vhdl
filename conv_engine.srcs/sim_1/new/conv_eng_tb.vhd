----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 07:05:30 AM
-- Design Name: 
-- Module Name: conv_eng_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conv_eng_tb is

end conv_eng_tb;

architecture Behavioral of conv_eng_tb is



COMPONENT conv_eng
    generic( n_f : integer := 32);
    PORT(
    
           clk    : in STD_LOGIC;
           a      : in unsigned (143 downto 0);
           b      : in unsigned (143 downto 0);
           filter : in unsigned (n_f*18*16-1 downto 0);
           en     : in STD_LOGIC;
           bias   : in unsigned (n_f*18-1 downto 0);
           valid  : out STD_LOGIC;
           o_o    : out unsigned (n_f*18-1 downto 0)
          
         
        );
    END COMPONENT;
    
    
signal clk      : std_logic := '0';
signal busy     : std_logic := '0';
signal en       : std_logic := '0'; 
signal valid    : std_logic := '0';
signal a        : unsigned   ( 143 downto 0)      := ( others => '0');
signal b        : unsigned   ( 143 downto 0)      := ( others => '0') ;
signal filter   : unsigned (9215 downto 0)     := ( others => '0') ;
signal out_conv : unsigned (575 downto 0)      := ( others => '0') ;
signal output1  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output2  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output3  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output4  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output5  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output6  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output7  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output8  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output9  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output10 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output11 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output12 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output13 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output14 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output15 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output16 : signed   ( 17 downto 0)      := ( others => '0') ;
--signal out_conv : unsigned (575 downto 0)      := ( others => '0') ;
signal output17  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output18  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output19 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output20  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output21  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output22  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output23  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output24  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output25  : signed   ( 17 downto 0)      := ( others => '0') ;
signal output26 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output27 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output28 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output29 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output30 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output31 : signed   ( 17 downto 0)      := ( others => '0') ;
signal output32 : signed   ( 17 downto 0)      := ( others => '0') ;
type inpute_t is array (0 to 1030 ) of integer ;
signal input_1 : inpute_t := (0,0,0,7509,12999,11069,13581,15136,17513,19339,16011,3187,-6102,-18234,-30085,-32537,-47234,-46145,-42333,-33342,-19813,-8412,917,12383,22547,29984,33736,29252,26198,18760,16487,10092,4763,5180,1210,3555,6268,13714,15937,11319,13654,13720,8962,6549,6364,4434,-76,2655,4520,1739,4245,282,-10800,-14302,-24914,-31786,-39972,-40201,-40668,-34004,-18497,-7059,9732,21309,33402,35910,34206,25088,17418,7664,-3165,-11686,-16953,-22922,-29191,-23659,-18289,-7453,-4560,-3137,-3397,1177,-2539,-5318,-6826,-10355,-12182,-15939,-16329,-8257,-13278,-6973,-10392,-14061,-12674,-16417,-25605,-27208,-23376,-30219,-32019,-32814,-26329,-26609,-24110,-19748,-10575,-14583,-9550,-6077,-2341,5511,10667,21878,20805,32586,37904,42628,50873,47429,41653,37831,29522,21828,12170,4055,-7251,-13740,-17269,-20572,-22320,-15936,-11954,-13026,-9991,-5514,-8519,-9475,-8089,-8987,-12377,-20606,-26421,-29291,-30895,-32004,-32187,-21506,-3039,18452,36592,53231,63630,64834,59475,43581,22723,6044,-12539,-32081,-47408,-51073,-60858,-57525,-51227,-46449,-39400,-36359,-31238,-22325,-17382,-16182,-11743,-13383,-8193,-3062,-3865,-1605,485,-2618,-2058,-3778,-2276,-4755,-191,-1571,2043,5142,11939,25792,33032,37618,42124,44064,43695,38891,21032,2172,-13827,-26293,-32637,-36021,-29074,-21717,-8434,7374,19619,30545,38684,44236,39421,36624,30247,23594,21122,17923,13424,10913,4342,2335,11,3488,4837,5446,6524,10852,7975,17435,21579,21834,20996,26314,24153,20412,18158,7065,-10352,-27550,-38785,-53707,-63164,-55920,-46666,-42627,-25367,-7605,11987,28779,44861,50294,57434,53890,49215,45485,39703,36367,28440,22212,13921,11806,11020,8517,4505,4835,2807,2674,3712,9522,715,-338,454,-6333,-3853,-97,4917,9206,18686,18963,28238,33680,32606,36694,32402,28930,26491,26229,19485,15956,11008,5858,3054,-3681,-6250,-12111,-13470,-15056,-13276,-14100,-11718,-12352,-4899,-4638,-499,-560,2626,3893,5906,4234,-950,-1040,-549,-402,806,-663,3035,4364,12830,17004,28089,33912,35061,37525,39119,31342,17655,5621,-8288,-20137,-30976,-34510,-35438,-23864,-13951,1315,11682,23630,28260,26584,25794,15459,2170,-10384,-18808,-26438,-28171,-29204,-26056,-20601,-17577,-11310,-7383,-8690,-3908,-3762,-3741,-1771,2002,1969,4509,8991,15368,14588,15179,9094,13492,12821,12157,15389,11416,7137,10647,4238,-760,-10687,-18691,-25133,-29384,-23096,-15442,-11972,-154,5539,14672,21494,31811,31308,31775,30809,31180,26409,25742,25076,16305,16782,11778,8959,9327,8598,9196,12893,13945,11378,6803,4055,-825,-12879,-22830,-34396,-38342,-44115,-49273,-37806,-27209,-17848,-6221,1469,6956,6698,1089,-6324,-12805,-19173,-29758,-35093,-38972,-43143,-39115,-31294,-26091,-22329,-20579,-16922,-11470,-12461,-5173,-3165,-357,2773,3087,-354,-478,-4407,-5533,-7547,-12030,-11797,-7473,-11548,-7890,-11716,-14305,-12279,-8677,-5390,-1665,2176,940,916,-4043,-3517,-10795,-20048,-29121,-40039,-42843,-41912,-41798,-34622,-30731,-24112,-17558,-13500,-7969,-3171,-1231,-161,2004,2401,-585,-146,-381,476,-2654,-2786,-1799,-2681,-4861,-3207,-8742,-9338,-9420,-17344,-27101,-26448,-32452,-35363,-32125,-28328,-24401,-10418,8223,24373,43809,53262,60380,61710,57689,45462,25426,1493,-22494,-37340,-54174,-54757,-52921,-41116,-33753,-17243,-7694,-2599,6048,10046,10130,8199,7382,4399,3304,4295,3825,3314,3033,5866,893,789,579,5329,10204,9962,7918,17829,27767,35517,42511,46015,47024,42610,31092,20782,6192,-6417,-25092,-39513,-44765,-52453,-52097,-50339,-42824,-36376,-30528,-21090,-11466,-9175,-2213,3695,2055,6142,9030,10401,8476,7171,5203,5383,5706,10130,13004,15474,20847,19461,14587,7794,-3210,-11519,-25250,-35579,-43469,-48514,-43186,-39756,-32669,-31657,-27085,-21718,-12305,-4177,-1027,9438,18223,30013,37363,42676,48466,43129,38852,27657,17806,7793,-3942,-9846,-17353,-19856,-19780,-16587,-12839,-10739,-9314,-7733,-8608,-5703,-8911,-10227,-4980,-6902,-6253,-4127,-7901,-9463,-8201,-15430,-18341,-18994,-15343,-16679,-14686,-9606,-8429,-3506,-487,7992,15514,16684,19293,18382,12382,15368,9433,5581,3453,-3908,-5640,-8830,-9324,-8948,-9867,-10383,-9563,-8192,-10320,-10503,-3374,-5624,-2728,-9289,-13182,-15482,-14282,-15688,-12079,-13823,-12063,-5472,-3565,7762,14205,19367,27778,26265,27177,25145,25220,30865,32922,32400,32617,35142,40981,41274,39918,38450,34824,32053,26737,19956,14003,8107,-2601,-2821,-6941,-6843,-4804,-4076,-5298,-8188,-8385,-9005,-9313,-8487,-9475,70,12786,18987,29025,35382,42523,43611,30587,23911,9764,-7359,-21338,-34696,-45464,-53407,-56992,-58483,-57542,-59735,-54120,-49764,-39953,-31415,-22984,-14792,-3419,4652,16318,23080,26631,26526,27825,25664,22081,16432,13934,10595,4914,3301,1941,-6040,-5377,-4147,-11163,-12484,-18353,-23255,-25192,-22504,-25261,-30428,-31813,-32142,-32333,-30131,-23135,-11986,-8510,1541,7915,14075,16724,23294,19342,25425,27968,28074,23157,19502,15738,11726,9406,5958,-2363,-9714,-15975,-17229,-20418,-17639,-11753,-13328,-13796,-15882,-14926,-18524,-21096,-22974,-20483,-13218,-4613,9446,22479,34767,44779,54086,58414,45963,34001,20966,10696,-1827,-6826,-8673,-2098,3706,12358,16744,21993,28761,35035,38328,41087,32177,33083,28682,22253,23855,16237,19359,14182,13082,8818,8620,8664,9245,6225,2744,3288,5646,1499,3277,4715,7651,11323,12972,15997,24589,30055,33383,35742,38118,37383,34229,29833,27346,19294,4338,-8385,-20401,-23593,-29948,-24936,-21537,-16327,-12350,-3895,8169,11946,15913,15303,13222,11330,12213,9877,9213,6762,8072,5877,1518,3954,4017,6078,9034,13811,18619,18298,20689,25041,32136,30346,30666,27355,25245,14998,7827,-3895,-10025,-23476,-33895,-40617,-48632,-49141,-60115,-56616,-55050,-55018,-46311,-39928,-33522,-26974,-15844,-5335,8998,14092,25530,30763,31024,24003,20254,14749,13375,9349,5791,3747,10565,12464,11672,3375,1108,-1059,-2818,-13749,-9622,-5128,6707,12705,20118,34685,41909,44955,43586,38371,26861,20750,11316,2313,-5044,-13894,-21064,-22470,-26188,-37679,-38814,-44769,-36697,-37577,-32455,-28705,-16275,-10629,-5686,1589,3454,8922,7806,7456,4401,4555,5812,6824,12506,14804,17704,15507,14464,14494,15878,10341,7952,6314,3817,2181,3785,527,-7269,-11471,-19790,-20201,-19234,-17375,-15098,-8368,-1914,4614,10680,10659,16807,17286,16387,15199,10839,8445,3987,5317,5886,1383,4512,1769,3178,1243,2294,-3717,861,3565,5329,8466,16504,19150,30311,32055,33390,31828,29764,15613,970,-14629,-27124,-32783,-34002,-32505,0,0,0,0);
signal input_2 : inpute_t := (0,0,0,50363,33890,15312,-8001,-23315,-34101,-36495,-34100,-19140,-9885,9687,17576,29704,33641,34488,30938,26298,21895,14341,6416,5510,2496,2836,4165,1886,981,2200,86,104,-5830,-1851,-2587,7452,8134,12750,14588,19175,17422,14558,11762,-931,-11960,-28734,-42066,-49697,-55266,-54232,-48646,-35048,-18871,1289,20217,34988,44739,47930,46561,38059,29379,16493,7391,6112,-5351,-6935,-6446,-8066,-6568,-5495,-5383,-5453,-7691,-7734,-13691,-6909,-3106,-3703,510,2687,277,-2071,-2209,-12787,-22272,-34704,-41298,-47815,-49542,-47275,-33925,-24110,-4751,3727,16209,29803,42688,47230,50518,48463,46120,41225,37894,34349,26104,20596,18761,10075,8215,6038,6270,9211,7103,5832,5148,7609,13130,13867,17329,18937,18294,17344,11673,7803,-678,-14314,-25816,-39992,-48806,-54293,-50483,-52486,-46532,-40940,-33072,-19579,-10350,-1468,1387,8124,18051,28249,33291,41461,40023,41826,38536,28049,18736,7401,-4945,-9854,-12894,-15107,-16514,-14554,-11004,-12425,-14601,-19739,-22132,-25983,-23637,-23946,-24274,-25566,-22919,-23849,-20056,-17930,-7621,-10082,-8408,-1245,6800,12258,17336,22129,20058,31296,28369,29727,28009,19255,17469,10144,6033,3514,-3711,-12105,-21905,-23108,-28170,-25511,-24768,-22300,-17650,-13412,-9944,-10994,-8122,-5759,-4459,1559,4171,10343,17427,21155,27628,33185,34058,25097,24958,23977,18418,10981,8142,42,-8411,-13482,-19625,-20700,-26595,-31148,-34556,-38059,-37727,-45528,-43987,-49741,-47916,-40404,-36782,-32522,-23250,-17067,-9265,-2536,7139,10718,13679,12026,15273,9944,9733,13324,16157,17993,23014,25979,31262,28260,28379,26113,26920,22939,23508,11794,12302,15097,9061,4606,-9988,-13967,-16050,-27077,-28581,-31608,-30809,-18792,-13593,-6591,-2147,494,-4566,-9503,-13844,-19841,-19099,-19724,-22353,-21364,-17819,-12227,-13370,-6854,-8299,-6979,-4226,-4910,-4921,-5817,-7654,-9618,-8235,-11330,-15716,-5531,-6383,-11676,-7075,322,5131,11062,20257,20498,20220,18996,18859,23110,24177,21304,20571,16468,9675,5369,-4207,-15735,-26398,-32592,-33046,-33874,-32771,-27918,-18534,-17199,-7603,-2118,-1742,1536,1370,2232,4502,6429,10289,12186,13348,10975,14543,2493,-6862,-19372,-31018,-37232,-44912,-46397,-42099,-36197,-23550,-8743,10405,20663,29390,31801,31133,24162,17184,7970,-159,-7186,-16031,-16795,-21910,-19369,-15777,-12965,-10136,-10890,-7980,-8793,-5851,-4411,-4206,-4367,-2145,-5174,-5205,-5420,1528,1987,2117,11600,13375,19253,29153,33101,35907,35870,36922,37361,35971,37874,33149,30784,24074,15658,9123,-7402,-16302,-21508,-27166,-29174,-19941,-17381,-7981,331,13706,25116,32495,29273,33697,26539,20669,15640,12644,5961,6576,10493,2535,2006,-3585,-6060,-10169,-16835,-18843,-20328,-16526,-17175,-15897,-13960,-13562,-13408,-11267,-4174,4630,13392,16609,19685,28697,31931,37970,41112,45189,45667,43337,42812,39715,34728,28098,25587,25184,21751,12268,15264,9834,6288,5159,2662,4071,2526,2496,-2808,-1859,-7112,-4084,-6681,-8617,-2889,-7233,-5714,-6270,-7397,-3158,-432,5807,9165,9000,6065,3515,4318,8190,9990,14379,23196,29989,29696,29372,32643,31599,27213,31768,31977,34904,36500,41352,35050,34094,28095,22375,16251,11009,3358,-461,-2495,-1342,-1825,-1744,2271,-5205,-17181,-19560,-31288,-36388,-36965,-35924,-27610,-15006,-7782,3994,17532,24047,31557,34333,28610,28506,26645,21300,15900,8860,8855,1853,-86,-48,2287,1263,-4379,-7026,-6803,-7690,-15328,-13320,-18228,-23513,-20093,-21028,-18667,-15754,-14471,-10529,-8579,-12387,-14188,-17754,-21347,-15741,-20471,-18895,-16956,-12759,-8703,-2396,4176,7461,9684,20350,32046,35298,42190,48130,48500,46485,40165,26524,9399,-8980,-22611,-30516,-28879,-26260,-20320,-7554,6540,12513,21746,22898,24889,27486,22220,18430,8626,10097,11671,8359,6089,5035,9260,12429,14989,23788,24197,29093,28059,22147,21106,3755,-9708,-24378,-38375,-48864,-57969,-57464,-56400,-45235,-33765,-24733,-13791,-8099,800,7480,6456,6704,7073,6748,6810,8403,6133,12151,9094,11515,11790,8790,10899,4780,4615,7648,205,4003,3289,5700,3894,7558,6490,3622,3728,3980,2398,-1397,-1629,-10451,-16508,-17372,-23019,-29594,-34315,-39468,-40127,-43870,-44921,-38227,-30532,-14420,-5925,5922,17799,23986,25134,20494,21400,14665,7346,2065,-824,-1870,-4940,-8307,-8844,-8651,-2348,-8010,-5181,934,-730,2668,6007,8985,12848,15625,18496,16919,18794,15697,6682,1760,-4567,-13578,-18912,-23336,-26735,-27238,-26783,-15309,1824,12674,22098,29688,28959,27654,15621,780,-18487,-31998,-36548,-38395,-41922,-34335,-27268,-16615,-9669,-2671,746,2723,7168,5250,5303,-1605,-4272,-6184,-6126,-4048,-4088,774,480,7004,15769,24785,34044,44664,43294,48651,47997,41619,27900,8425,-1916,-9087,-10407,-7254,3704,10992,17217,21493,28525,29577,34066,35082,31029,28736,29736,29969,25006,25672,20314,18285,12791,6847,6300,5174,5046,4415,5629,6065,7148,13562,12995,9790,10891,9635,2407,4877,-2984,-13122,-27970,-39897,-49813,-54860,-51320,-50454,-35923,-11824,8511,32927,51528,62367,66330,58193,44055,29601,8735,-11460,-23264,-30542,-37927,-37647,-33610,-31106,-16616,-14730,-7592,-3473,-891,1504,4805,5007,5554,6233,9802,14734,17533,22636,19868,18569,19756,18307,18009,19947,21302,26105,23796,30535,37924,38704,44556,41694,40195,27800,18491,14438,8004,4339,-3158,-7677,-14032,-17777,-21207,-23871,-25602,-26300,-19091,-20189,-15214,-17246,-14968,-9686,-10410,-9521,-10393,-7309,-9741,-10147,-6730,-2982,2010,7796,10377,13521,16797,18214,14109,18983,17568,19139,25091,20288,13080,4795,-3634,-10836,-17336,-22446,-31699,-36087,-38931,-40495,-46445,-42873,-43156,-42873,-35397,-34363,-30382,-18345,-15764,-8269,-1882,1208,-2297,1691,-1265,-765,-3059,-5317,-8383,-11378,-11974,-12565,-8226,-7883,-261,7669,21312,39507,47545,53857,52155,51353,38563,20726,3262,-20477,-42441,-54609,-63969,-68456,-54004,-45270,-32496,-13941,-6082,5446,2081,6472,-2095,-5141,-10781,-17922,-19488,-20352,-18505,-14601,-13907,-11337,-1685,-3309,-7927,-7029,-7147,-10511,-16579,-21106,-23388,-30738,-29263,-31494,-28158,-24678,-17628,-2237,18239,29543,45648,54009,63081,56626,50156,36380,21396,5443,-11710,-22156,-27528,-34153,-26601,-21821,-17289,-16372,-15069,-8220,-9095,-5130,-6192,-3908,-969,1817,-1417,616,1927,-2271,2200,-687,1886,4282,4482,8743,9157,14403,12822,13419,8321,9250,5851,7137,4584,4904,4853,13922,14812,22957,21814,23531,19550,13929,831,-8675,-18174,-28149,-36320,-36316,-40045,-36740,-30925,-21808,-11468,-2114,3848,5485,5073,6960,0,0,0,0);
signal cnt : integer := 0;
type filter_type is array (0 to 32 ) of signed ( 71 downto 0) ;
signal filter_1 : filter_type  := ("000001001101001001000000100110011100000010110110110101000001001010011110",
"000011000110010100000010110101110110000001101111100110000011001001101000",
"000000000111010000000000000001101011111111110010000100000000101011101100",
"000001101000110101111110001010110101111111100011101000000001011110010010",
"000000010111010110000000000101010101000010010110111101111111100111110001",
"111110111111000100000000010010011000000011110111010000000010101001001111",
"000001111000011101000001010110100001000010110000011100000001111110000011",
"111111000100010000111111100000000110111111001111100011111111100111001111",
"000001101100110111000011001001000000000011010000010110000000101011000110",
"111101000000101100111100110001010010111111101000010001000001001011000010",
"000001111111011111000000001010111010111111001101100001111111111000100110",
"000000000100110010000000111010010000111110011010000111111111011100010010",
"111111100100101001000001101101111110000001000001101110000000011100011100",
"000000001110101100000001011010010101111111111011011101111110000111110001",
"111110101101000001111110110100100010111101001010111111111100110111101101",
"000000001111001010000010011001110010000001001100101001111110000110001110",
"111101110001011011000001101110101011000000110001000111111110110010110111",
"111110111000001000000000110111000001111111010101100111111101000101011101",
"000001001101011001000010100101010011000001110000101100111111110010100011",
"000001011101001101000010000100011111000010000111000100000001100011011000",
"000001001101011010000000000000110011111110101000100011111011101000110001",
"000010101101110111000000111110101100000010010110110100000000110110010011",
"111100001011111100111111001110110010111101010111010110111110100101001111",
"111111111101011110111111011001110101111110010101011101111111110110100100",
"111100101110010011111111100100000010000011010010010111000010100001110111",
"111111000111011011111111011111001010000001000100101100111110001111010100",
"111110111101000000111100101110001011111101101011100111000000001110111110",
"000000011111000000111110111111101010111111101111100100000000000111011100",
"000000010111100000111111111100110111111101100000110001111111001010011111",
"111111100110011000111110101011111111111110011010100101111111010100101000",
"111111000100011111111101010100101110111110011001010011111111111110010110",
"111100000100101110111110000010001101000000100100010101000001000011111001",others => (others => '0'));


signal filter_2 : filter_type  := ("111110101100111010111110000100010000000001001001101110000010100001010001",
"000010101101000110111111100001001100111101011100111000111110110011110001",
"111111010000101000111111011010010000111110000010101101000000000110110101",
"111101101100010111111110000101010111111101101011100100111101101110011011",
"000001111010001111000000100101010111000001010100110110000100000010111110",
"000000010101000111111101011110001010111111111111110010000010000010000011",
"111110110010000110000001010001111001000000100000111001111110010001001001",
"111111101101001000000010000100010000000011100001111001000010110001110010",
"111110001001000010111101101010110000111100110101000010111111101110001100",
"000011001010111101111110100011010001111111110100100100111101010111110001",
"000001001000011010111111101000011100111111010101110010111101111010001110",
"000010101100001111000010110011010110000011001010001011111111110111010001",
"111110100001010101000010001100010010000010101011001111111111010110011101",
"111101010001111111111100100101011001111111100000001100111111011101100001",
"111111111001010110111101110100011101111101011001001010111111100010111010",
"000000101111011011111111101110000101111110010111000000111100101100101101",
"111110011000011010111101111011110101000000111101010010000001100010001101",
"111100110110110011111100000111010110111111110001101001000000000111001001",
"000011100011000111000010101101101101000000000011011111111111101100100000",
"111101001110011010000000000101110000000001111100001100000000101001100000",
"111110001101111010111110100111101111111101111010111000111110011000110110",
"111101111010101001000001111001010101111111101011000011111110001000000011",
"000001011000100100111111101010011111111110110000011011000001110001000000",
"000010100001101101111110010111110001111111100101001100000010111111010110",
"000010101000100011000000001011110110111111100001110011111111011101101111",
"000000111100110110000001110000010000000001100000100010000010010001110011",
"111110100111111101000000111010010111111111000001100011111110111100011110",
"000100000000010001000010110100000101111110110111111010111101000011011101",
"000001001100000111111111110101110000111111101010110101000011100111010111",
"000001101010111001111110111001000010111110010011001001000000110100100110",
"000010000010101010111110110111010011111100101110101101000010111000100101",
"000001011010110010000001110000011101111100101011100100111110011110010010",others => (others=> '0'));

type bias is array (0 to 31 ) of integer ;
signal b1 : bias := (0,0,0,0,0,-1,-1,-1,-1,0,-1,0,0,0,0,-1, others =>  0);
signal bias1 : unsigned (575 downto 0) := (others => '0');
-- Clock period definitions
   constant clk_period : time := 10 ns;

begin


	-- Instantiate the Unit Under Test (UUT)
   uut: conv_eng 
   generic map ( n_f => 32)
   PORT MAP (
          clk       => clk,
          a         => a,
          b         => b,
          valid     => valid,
          filter    => filter,
          en        => en,
          bias      => bias1,
          o_o       => out_conv      
          
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

 output1  <= signed(out_conv((18 * 1)-1 downto 18*(1-1) ));
 output2  <= signed(out_conv((18 * 2)-1 downto 18*(2-1) ));
 output3  <= signed(out_conv((18 * 3)-1 downto 18*(3-1) ));
 output4  <= signed(out_conv((18 * 4)-1 downto 18*(4-1)) );
 output5  <= signed(out_conv((18 * 5)-1 downto 18*(5-1)) );
 output6  <= signed(out_conv((18 * 6)-1 downto 18*(6-1)) );
 output7  <= signed(out_conv((18 * 7)-1 downto 18*(7-1)) );
 output8  <= signed(out_conv((18 * 8)-1 downto 18*(8-1)) );
 output9  <= signed(out_conv((18 * 9)-1 downto 18*(9-1)) );
 output10 <= signed(out_conv((18 * 10)-1 downto 18*(10-1)) );
 output11 <= signed(out_conv((18 * 11)-1 downto 18*(11-1)) );
 output12 <= signed(out_conv((18 * 12)-1 downto 18*(12-1)) );
 output13 <= signed(out_conv((18 * 13)-1 downto 18*(13-1)) );
 output14 <= signed(out_conv((18 * 14)-1 downto 18*(14-1)) );
 output15 <= signed(out_conv((18 * 15)-1 downto 18*(15-1)) );
 output16 <= signed(out_conv((18 * 16)-1 downto 18*(16-1)) );

 output17 <= signed(out_conv((18 * 17)-1 downto 18*(17-1) ));
 output18 <= signed(out_conv((18 * 18)-1 downto 18*(18-1) ));
 output19 <= signed(out_conv((18 * 19)-1 downto 18*(19-1) ));
 output20 <= signed(out_conv((18 * 20)-1 downto 18*(20-1)) );
 output21 <= signed(out_conv((18 * 21)-1 downto 18*(21-1)) );
 output22 <= signed(out_conv((18 * 22)-1 downto 18*(22-1)) );
 output23 <= signed(out_conv((18 * 23)-1 downto 18*(23-1)) );
 output24 <= signed(out_conv((18 * 24)-1 downto 18*(24-1)) );
 output25 <= signed(out_conv((18 * 25)-1 downto 18*(25-1)) );
 output25 <= signed(out_conv((18 * 26)-1 downto 18*(26-1)) );
 output26 <= signed(out_conv((18 * 27)-1 downto 18*(27-1)) );
 output27 <= signed(out_conv((18 * 28)-1 downto 18*(28-1)) );
 output28 <= signed(out_conv((18 * 29)-1 downto 18*(29-1)) );
 output29 <= signed(out_conv((18 * 30)-1 downto 18*(30-1)) );
 output30 <= signed(out_conv((18 * 31)-1 downto 18*(31-1)) );
 output31 <= signed(out_conv((18 * 32)-1 downto 18*(32-1)) );
 
 process (clk)
   
 begin 
   
 if rising_edge(clk) then 
   
  cnt <= cnt + 1 ;
  a <= unsigned(to_signed(input_1(cnt+7),18))& unsigned(to_signed(input_1(cnt+6),18))& unsigned(to_signed(input_1(cnt+5),18))& unsigned(to_signed(input_1(cnt+4),18))& unsigned(to_signed(input_1(cnt+3),18))& unsigned(to_signed(input_1(cnt+2),18))& unsigned(to_signed(input_1(cnt+1),18))& unsigned(to_signed(input_1(cnt+0),18)) ;
  b <= unsigned(to_signed(input_2(cnt+7),18))& unsigned(to_signed(input_2(cnt+6),18))& unsigned(to_signed(input_2(cnt+5),18))& unsigned(to_signed(input_2(cnt+4),18))& unsigned(to_signed(input_2(cnt+3),18))& unsigned(to_signed(input_2(cnt+2),18))& unsigned(to_signed(input_2(cnt+1),18))& unsigned(to_signed(input_2(cnt+0),18)) ;
  en <= '1';
  for i in 1 to 32 loop
        filter((i*72-1)downto i*72-72) <= unsigned((filter_1(i-1)));               
        end loop;   
        
        for i in 1 to 32 loop
        filter((32*72+i*72-1)downto 32*72+i*72-72) <= unsigned((filter_2(i-1)));               
        end loop;   
        
--  for i in 257 to 512 loop
--        filter((i*18-1)downto i*18-18) <= unsigned((filter_2(i-1)));               
--        end loop;     
 for i in 0 to 31 loop
        bias1((i+1)*18-1 downto 18*i) <= unsigned(to_signed(b1(i),18));               
        end loop;                  
              
  if cnt >= 1023 then 
  cnt <= 1023;
  en <= '0';
  
  end if;
  end if;
  end process;


  



end;


