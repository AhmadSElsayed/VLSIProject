//
// Verilog description for cell Synchronizer, 
// Mon May 14 09:21:18 2018
//
// LeonardoSpectrum Level 3, 2017a.2 
//


module Synchronizer ( Clock, Reset, Start, Operation, Filter, Stride, REnable, 
                      RWR, Done, RDataIn, RDataOut, RAddress ) ;

    input Clock ;
    input Reset ;
    input Start ;
    input Operation ;
    input Filter ;
    input Stride ;
    output REnable ;
    output RWR ;
    output Done ;
    input [39:0]RDataIn ;
    output [7:0]RDataOut ;
    output [17:0]RAddress ;

    wire DMAReadMode, DMAmode_1, DMAmode_0, state_0, state_3, nx1244, init, 
         row_row_count_2, row_count_1, nx1245, row_count_0, row_row_count_1, 
         row_row_count_0, nx48, row_count_5, row_count_4, nx1247, row_count_3, 
         row_count_2, nx78, nx90, nx102, nx130, CacheAddress_7, nx138, 
         CacheAddress_6, CacheAddress_5, CacheAddress_4, CacheAddress_3, 
         CacheAddress_2, CacheAddress_1, CacheAddress_0, nx1251, nx148, nx164, 
         nx1252, nx190, nx210, nx1254, nx226, nx246, nx1256, nx262, nx278, nx298, 
         nx302, nx366, nx374, nx1264, nx1274, nx1284, nx1294, nx1304, nx1314, 
         nx1324, nx1334, nx1344, nx1354, nx1364, nx1374, nx1384, nx1394, nx1404, 
         nx1414, nx1424, nx1434, nx1444, nx1454, nx1464, nx1474, nx1484, nx1494, 
         nx1507, nx1509, nx1513, nx1516, nx1518, nx1522, nx1527, nx1529, nx1533, 
         nx1536, nx1541, nx1546, nx1551, nx1555, nx1559, nx1560, nx1563, nx1564, 
         nx1568, nx1570, nx1575, nx1579, nx1583, nx1586, nx1590, nx1592, nx1594, 
         nx1600, nx1603, nx1607, nx1610, nx1615, nx1618, nx1621, nx1624, nx1627, 
         nx1632, nx1635, nx1638, nx1641, nx1644, nx1648, nx1650, nx1653, nx1657, 
         nx1659, nx1663, nx1665, nx1667, nx1668, nx1671, nx1675, nx1679, nx1682, 
         nx1684, nx1704, nx1706, nx1708, nx1710, nx1712, nx1714, nx1718, nx1724, 
         nx1726, nx1728;
    wire [11:0] \$dummy ;




    assign RWR = REnable ;
    assign Done = REnable ;
    assign RDataOut[7] = REnable ;
    assign RDataOut[6] = REnable ;
    assign RDataOut[5] = REnable ;
    assign RDataOut[4] = REnable ;
    assign RDataOut[3] = REnable ;
    assign RDataOut[2] = REnable ;
    assign RDataOut[1] = REnable ;
    assign RDataOut[0] = REnable ;
    DMA DMA (.clock (Clock), .reset (Reset), .filter (REnable), .readmode (
        DMAReadMode), .mode ({DMAmode_1,DMAmode_0}), .read_done (\$dummy [0]), .write_done (
        \$dummy [1]), .f_done (\$dummy [2]), .address ({RAddress[17],
        RAddress[16],RAddress[15],RAddress[14],RAddress[13],RAddress[12],
        RAddress[11],RAddress[10],RAddress[9],RAddress[8],RAddress[7],
        RAddress[6],RAddress[5],RAddress[4],RAddress[3],RAddress[2],RAddress[1],
        RAddress[0]})) ;
    fake_gnd ix1233 (.Y (REnable)) ;
    dff reg_DMAmode_0 (.Q (DMAmode_0), .QB (\$dummy [3]), .D (nx1484), .CLK (
        Clock)) ;
    mux21_ni ix1485 (.Y (nx1484), .A0 (DMAmode_0), .A1 (nx1710), .S0 (nx1714)) ;
    oai22 ix1465 (.Y (nx1464), .A0 (nx1507), .A1 (nx1675), .B0 (nx1518), .B1 (
          nx1527)) ;
    nor02ii ix1508 (.Y (nx1507), .A0 (nx1509), .A1 (nx1679)) ;
    oai22 ix1445 (.Y (nx1444), .A0 (nx1513), .A1 (nx1675), .B0 (nx1590), .B1 (
          nx1704)) ;
    aoi21 ix1514 (.Y (nx1513), .A0 (Start), .A1 (nx1509), .B0 (nx302)) ;
    dffs_ni reg_state_0 (.Q (state_0), .QB (nx1518), .D (nx1464), .CLK (Clock), 
            .S (Reset)) ;
    oai22 ix1455 (.Y (nx1454), .A0 (nx1522), .A1 (nx1675), .B0 (nx1527), .B1 (
          nx1710)) ;
    aoi32 ix1523 (.Y (nx1522), .A0 (nx1244), .A1 (init), .A2 (nx1592), .B0 (
          nx1708), .B1 (nx1594)) ;
    dffr reg_state_3 (.Q (state_3), .QB (nx1527), .D (nx1454), .CLK (Clock), .R (
         Reset)) ;
    nand04 ix1530 (.Y (nx1529), .A0 (row_count_5), .A1 (row_count_4), .A2 (
           nx1563), .A3 (row_count_2)) ;
    dffr reg_row_count_4 (.Q (row_count_4), .QB (nx1536), .D (nx1344), .CLK (
         Clock), .R (Reset)) ;
    nand04 ix1542 (.Y (nx1541), .A0 (row_count_3), .A1 (row_count_2), .A2 (
           row_count_1), .A3 (row_count_0)) ;
    dffr reg_row_count_3 (.Q (row_count_3), .QB (nx1563), .D (nx1334), .CLK (
         Clock), .R (Reset)) ;
    nand03 ix1547 (.Y (nx1546), .A0 (row_count_2), .A1 (row_count_1), .A2 (
           row_count_0)) ;
    dffr reg_row_count_2 (.Q (row_count_2), .QB (\$dummy [4]), .D (nx1324), .CLK (
         Clock), .R (Reset)) ;
    xnor2 ix79 (.Y (nx78), .A0 (row_count_2), .A1 (nx1551)) ;
    oai21 ix1556 (.Y (nx1555), .A0 (row_count_0), .A1 (row_count_1), .B0 (nx1551
          )) ;
    dffr reg_row_count_0 (.Q (row_count_0), .QB (nx1559), .D (nx1264), .CLK (
         Clock), .R (Reset)) ;
    dffr reg_row_count_1 (.Q (row_count_1), .QB (nx1560), .D (nx1274), .CLK (
         Clock), .R (Reset)) ;
    dffr reg_row_count_5 (.Q (row_count_5), .QB (nx1564), .D (nx1354), .CLK (
         Clock), .R (Reset)) ;
    nand02 ix1315 (.Y (nx1314), .A0 (nx1568), .A1 (nx1570)) ;
    dffr reg_init (.Q (init), .QB (nx1568), .D (nx1314), .CLK (Clock), .R (Reset
         )) ;
    nand04 ix1571 (.Y (nx1570), .A0 (row_row_count_2), .A1 (nx1586), .A2 (
           row_row_count_0), .A3 (nx1704)) ;
    dffr reg_row_row_count_2 (.Q (row_row_count_2), .QB (\$dummy [5]), .D (
         nx1304), .CLK (Clock), .R (Reset)) ;
    mux21_ni ix1305 (.Y (nx1304), .A0 (nx48), .A1 (row_row_count_2), .S0 (nx1583
             )) ;
    xnor2 ix49 (.Y (nx48), .A0 (row_row_count_2), .A1 (nx1575)) ;
    nand02 ix1576 (.Y (nx1575), .A0 (row_row_count_1), .A1 (row_row_count_0)) ;
    mux21 ix1295 (.Y (nx1294), .A0 (nx1579), .A1 (nx1586), .S0 (nx1583)) ;
    oai21 ix1580 (.Y (nx1579), .A0 (row_row_count_0), .A1 (row_row_count_1), .B0 (
          nx1575)) ;
    dffr reg_row_row_count_0 (.Q (row_row_count_0), .QB (\$dummy [6]), .D (
         nx1284), .CLK (Clock), .R (Reset)) ;
    xnor2 ix1285 (.Y (nx1284), .A0 (row_row_count_0), .A1 (nx1583)) ;
    nand04 ix1584 (.Y (nx1583), .A0 (nx1244), .A1 (nx1568), .A2 (row_count_0), .A3 (
           nx1560)) ;
    dffr reg_row_row_count_1 (.Q (row_row_count_1), .QB (nx1586), .D (nx1294), .CLK (
         Clock), .R (Reset)) ;
    dffr reg_state_1 (.Q (\$dummy [7]), .QB (nx1590), .D (nx1444), .CLK (Clock)
         , .R (Reset)) ;
    dff reg_CacheAddress_7 (.Q (CacheAddress_7), .QB (\$dummy [8]), .D (nx1434)
        , .CLK (Clock)) ;
    mux21_ni ix1435 (.Y (nx1434), .A0 (CacheAddress_7), .A1 (nx278), .S0 (nx1714
             )) ;
    oai21 ix279 (.Y (nx278), .A0 (nx1516), .A1 (nx1600), .B0 (nx1718)) ;
    xnor2 ix1601 (.Y (nx1600), .A0 (nx1256), .A1 (CacheAddress_7)) ;
    dff reg_CacheAddress_6 (.Q (CacheAddress_6), .QB (nx1603), .D (nx1424), .CLK (
        Clock)) ;
    oai21 ix1425 (.Y (nx1424), .A0 (nx1603), .A1 (nx1712), .B0 (nx1607)) ;
    aoi21 ix139 (.Y (nx138), .A0 (nx1516), .A1 (nx1718), .B0 (Reset)) ;
    oai21 ix1608 (.Y (nx1607), .A0 (nx262), .A1 (nx1704), .B0 (nx1714)) ;
    aoi21 ix263 (.Y (nx262), .A0 (nx1610), .A1 (nx1603), .B0 (nx1671)) ;
    nand02 ix1611 (.Y (nx1610), .A0 (CacheAddress_5), .A1 (nx1254)) ;
    dff reg_CacheAddress_5 (.Q (CacheAddress_5), .QB (\$dummy [9]), .D (nx1414)
        , .CLK (Clock)) ;
    mux21_ni ix1415 (.Y (nx1414), .A0 (CacheAddress_5), .A1 (nx246), .S0 (nx1714
             )) ;
    oai21 ix247 (.Y (nx246), .A0 (nx1615), .A1 (nx1668), .B0 (nx1718)) ;
    nor02_2x ix1616 (.Y (nx1615), .A0 (nx1254), .A1 (CacheAddress_5)) ;
    oai21 ix1405 (.Y (nx1404), .A0 (nx1618), .A1 (nx1712), .B0 (nx1621)) ;
    oai21 ix1622 (.Y (nx1621), .A0 (nx226), .A1 (nx1704), .B0 (nx1714)) ;
    nor03_2x ix227 (.Y (nx226), .A0 (nx1624), .A1 (nx1516), .A2 (nx1254)) ;
    dff reg_CacheAddress_4 (.Q (CacheAddress_4), .QB (nx1618), .D (nx1404), .CLK (
        Clock)) ;
    nand02 ix1628 (.Y (nx1627), .A0 (CacheAddress_3), .A1 (nx1252)) ;
    dff reg_CacheAddress_3 (.Q (CacheAddress_3), .QB (nx1667), .D (nx1394), .CLK (
        Clock)) ;
    mux21_ni ix1395 (.Y (nx1394), .A0 (CacheAddress_3), .A1 (nx210), .S0 (nx1714
             )) ;
    oai21 ix211 (.Y (nx210), .A0 (nx1632), .A1 (nx1665), .B0 (nx1718)) ;
    oai21 ix1385 (.Y (nx1384), .A0 (nx1635), .A1 (nx1712), .B0 (nx1638)) ;
    oai21 ix1639 (.Y (nx1638), .A0 (nx190), .A1 (nx1704), .B0 (nx1712)) ;
    nor03_2x ix191 (.Y (nx190), .A0 (nx1641), .A1 (nx1516), .A2 (nx1252)) ;
    dff reg_CacheAddress_2 (.Q (CacheAddress_2), .QB (nx1635), .D (nx1384), .CLK (
        Clock)) ;
    oai21 ix1645 (.Y (nx1644), .A0 (Stride), .A1 (CacheAddress_0), .B0 (
          CacheAddress_1)) ;
    oai21 ix1365 (.Y (nx1364), .A0 (nx1648), .A1 (nx1712), .B0 (nx1650)) ;
    dff reg_CacheAddress_0 (.Q (CacheAddress_0), .QB (nx1648), .D (nx1364), .CLK (
        Clock)) ;
    oai21 ix1651 (.Y (nx1650), .A0 (nx148), .A1 (nx1704), .B0 (nx1712)) ;
    aoi21 ix149 (.Y (nx148), .A0 (nx1648), .A1 (Stride), .B0 (nx1653)) ;
    oai21 ix1654 (.Y (nx1653), .A0 (Stride), .A1 (nx1648), .B0 (nx1708)) ;
    mux21 ix1375 (.Y (nx1374), .A0 (nx1657), .A1 (nx1659), .S0 (nx1712)) ;
    dff reg_CacheAddress_1 (.Q (CacheAddress_1), .QB (nx1657), .D (nx1374), .CLK (
        Clock)) ;
    aoi21 ix1660 (.Y (nx1659), .A0 (nx1708), .A1 (nx164), .B0 (nx1704)) ;
    xnor2 ix165 (.Y (nx164), .A0 (nx1251), .A1 (nx1663)) ;
    nand02 ix1666 (.Y (nx1665), .A0 (nx1708), .A1 (nx1627)) ;
    nand02 ix1669 (.Y (nx1668), .A0 (nx1708), .A1 (nx1610)) ;
    oai21 ix1672 (.Y (nx1671), .A0 (nx1603), .A1 (nx1610), .B0 (nx1708)) ;
    aoi21 ix1676 (.Y (nx1675), .A0 (state_0), .A1 (nx1527), .B0 (nx1708)) ;
    aoi22 ix1680 (.Y (nx1679), .A0 (nx1710), .A1 (nx298), .B0 (nx1706), .B1 (
          nx130)) ;
    nor04 ix299 (.Y (nx298), .A0 (nx1682), .A1 (nx1684), .A2 (nx1667), .A3 (
          nx1635)) ;
    nand04 ix1683 (.Y (nx1682), .A0 (CacheAddress_7), .A1 (CacheAddress_6), .A2 (
           CacheAddress_5), .A3 (CacheAddress_4)) ;
    dff reg_DMAmode_1 (.Q (DMAmode_1), .QB (\$dummy [10]), .D (nx1494), .CLK (
        Clock)) ;
    or02 ix1495 (.Y (nx1494), .A0 (DMAmode_1), .A1 (nx1714)) ;
    dff reg_DMAReadMode (.Q (DMAReadMode), .QB (\$dummy [11]), .D (nx1474), .CLK (
        Clock)) ;
    mux21_ni ix1475 (.Y (nx1474), .A0 (DMAReadMode), .A1 (nx374), .S0 (nx366)) ;
    nor03_2x ix375 (.Y (nx374), .A0 (nx1529), .A1 (row_count_1), .A2 (
             row_count_0)) ;
    inv01 ix303 (.Y (nx302), .A (nx1679)) ;
    inv01 ix1595 (.Y (nx1594), .A (nx298)) ;
    inv02 ix1703 (.Y (nx1704), .A (nx1718)) ;
    inv02 ix1705 (.Y (nx1706), .A (nx1718)) ;
    inv01 ix1707 (.Y (nx1708), .A (nx1516)) ;
    inv01 ix1709 (.Y (nx1710), .A (nx1516)) ;
    buf02 ix1711 (.Y (nx1712), .A (nx138)) ;
    buf02 ix1713 (.Y (nx1714), .A (nx138)) ;
    inv02 ix1717 (.Y (nx1718), .A (nx1245)) ;
    nand03 ix321 (.Y (nx1516), .A0 (nx1518), .A1 (state_3), .A2 (nx1590)) ;
    and03 ix1510 (.Y (nx1509), .A0 (nx1590), .A1 (nx1527), .A2 (state_0)) ;
    nor02ii ix359 (.Y (nx1244), .A0 (nx1529), .A1 (nx1728)) ;
    nor03_2x ix1526 (.Y (nx1245), .A0 (nx1518), .A1 (state_3), .A2 (nx1590)) ;
    mux21 ix1355 (.Y (nx1354), .A0 (nx1564), .A1 (nx1533), .S0 (nx1728)) ;
    xor2 ix1534 (.Y (nx1533), .A0 (nx1564), .A1 (nx1247)) ;
    nor02ii ix109 (.Y (nx1247), .A0 (nx1541), .A1 (row_count_4)) ;
    mux21_ni ix1345 (.Y (nx1344), .A0 (row_count_4), .A1 (nx102), .S0 (nx1728)
             ) ;
    xor2 ix103 (.Y (nx102), .A0 (nx1536), .A1 (nx1541)) ;
    mux21_ni ix1335 (.Y (nx1334), .A0 (row_count_3), .A1 (nx90), .S0 (nx1728)) ;
    xor2 ix91 (.Y (nx90), .A0 (nx1563), .A1 (nx1546)) ;
    mux21_ni ix1325 (.Y (nx1324), .A0 (row_count_2), .A1 (nx78), .S0 (nx1728)) ;
    or02 ix1552 (.Y (nx1551), .A0 (nx1560), .A1 (nx1559)) ;
    mux21 ix1275 (.Y (nx1274), .A0 (nx1560), .A1 (nx1555), .S0 (nx1728)) ;
    xnor2 ix1265 (.Y (nx1264), .A0 (nx1559), .A1 (nx1728)) ;
    and02 ix1593 (.Y (nx1592), .A0 (row_count_0), .A1 (nx1560)) ;
    nor02ii ix273 (.Y (nx1256), .A0 (nx1610), .A1 (CacheAddress_6)) ;
    nor02ii ix237 (.Y (nx1254), .A0 (nx1627), .A1 (CacheAddress_4)) ;
    and02 ix1625 (.Y (nx1624), .A0 (nx1618), .A1 (nx1627)) ;
    nor02ii ix1633 (.Y (nx1632), .A0 (nx1252), .A1 (nx1667)) ;
    nor02ii ix201 (.Y (nx1252), .A0 (nx1644), .A1 (CacheAddress_2)) ;
    and02 ix1642 (.Y (nx1641), .A0 (nx1635), .A1 (nx1644)) ;
    nor02ii ix161 (.Y (nx1251), .A0 (Stride), .A1 (CacheAddress_0)) ;
    xor2 ix1664 (.Y (nx1663), .A0 (Stride), .A1 (nx1657)) ;
    nand04 ix1678 (.Y (nx130), .A0 (row_count_0), .A1 (nx1560), .A2 (init), .A3 (
           nx1724)) ;
    inv01 ix1723 (.Y (nx1724), .A (nx1529)) ;
    nor02ii ix1685 (.Y (nx1684), .A0 (Filter), .A1 (nx1657)) ;
    and03 ix367 (.Y (nx366), .A0 (nx1244), .A1 (nx1726), .A2 (nx1560)) ;
    inv01 ix1725 (.Y (nx1726), .A (Reset)) ;
    inv02 ix1727 (.Y (nx1728), .A (nx1718)) ;
endmodule


module DMA ( clock, reset, filter, readmode, mode, read_done, write_done, f_done, 
             address ) ;

    input clock ;
    input reset ;
    input filter ;
    input readmode ;
    input [1:0]mode ;
    output read_done ;
    output write_done ;
    output f_done ;
    output [17:0]address ;

    wire temp_address_0, nx2, nx6, read_pointer_0, write_pointer_0, f_pointer_0, 
         temp_address_1, read_pointer_1, write_pointer_1, f_pointer_1, 
         temp_address_2, read_pointer_2, nx132, nx134, write_pointer_2, nx148, 
         f_pointer_2, nx156, nx162, nx182, read_pointer_3, nx206, nx212, 
         write_pointer_3, nx226, f_pointer_3, nx234, nx240, nx262, 
         temp_address_4, read_pointer_4, write_pointer_4, nx288, nx294, 
         f_pointer_4, read_pointer_5, nx342, nx348, write_pointer_5, f_pointer_5, 
         nx370, nx376, nx398, temp_address_6, read_pointer_6, write_pointer_6, 
         nx424, nx430, f_pointer_6, read_pointer_7, nx478, nx484, 
         write_pointer_7, f_pointer_7, nx506, nx512, nx534, temp_address_8, 
         read_pointer_8, write_pointer_8, nx560, nx566, f_pointer_8, 
         read_pointer_9, nx614, nx620, write_pointer_9, f_pointer_9, nx642, 
         nx648, nx670, temp_address_10, read_pointer_10, write_pointer_10, nx696, 
         nx702, f_pointer_10, read_pointer_11, nx750, nx756, write_pointer_11, 
         f_pointer_11, nx778, nx784, nx806, temp_address_12, read_pointer_12, 
         write_pointer_12, nx832, nx838, f_pointer_12, read_pointer_13, nx886, 
         nx892, write_pointer_13, f_pointer_13, nx914, nx920, nx942, 
         temp_address_14, read_pointer_14, write_pointer_14, nx968, nx974, 
         f_pointer_14, read_pointer_15, nx1022, nx1028, write_pointer_15, 
         f_pointer_15, nx1050, nx1056, nx1078, read_pointer_16, write_pointer_16, 
         nx1104, nx1110, f_pointer_16, nx1152, read_pointer_17, nx1164, 
         write_pointer_17, f_pointer_17, nx1180, nx1204, nx635, nx645, nx655, 
         nx665, nx675, nx685, nx695, nx705, nx715, nx725, nx735, nx745, nx755, 
         nx765, nx775, nx785, nx795, nx805, nx815, nx825, nx835, nx845, nx855, 
         nx865, nx875, nx885, nx895, nx905, nx915, nx925, nx935, nx945, nx955, 
         nx965, nx975, nx985, nx995, nx1005, nx1015, nx1025, nx1035, nx1045, 
         nx1055, nx1065, nx1075, nx1085, nx1095, nx1105, nx1115, nx1125, nx1135, 
         nx1145, nx1155, nx1165, nx1175, nx1185, nx1195, nx1205, nx1215, nx1225, 
         nx1235, nx1245, nx1255, nx1265, nx1275, nx1285, nx1295, nx1305, nx1315, 
         nx1325, nx1335, nx1345, nx1359, nx1372, nx1384, nx1386, nx1388, nx1395, 
         nx1399, nx1401, nx1403, nx1407, nx1409, nx1411, nx1415, nx1417, nx1419, 
         nx1421, nx1428, nx1433, nx1445, nx1448, nx1450, nx1453, nx1457, nx1462, 
         nx1464, nx1470, nx1476, nx1478, nx1480, nx1481, nx1489, nx1493, nx1495, 
         nx1497, nx1502, nx1504, nx1509, nx1511, nx1514, nx1516, nx1520, nx1524, 
         nx1529, nx1534, nx1536, nx1538, nx1543, nx1544, nx1546, nx1554, nx1558, 
         nx1560, nx1562, nx1567, nx1570, nx1572, nx1575, nx1577, nx1581, nx1585, 
         nx1590, nx1593, nx1596, nx1598, nx1603, nx1604, nx1606, nx1614, nx1618, 
         nx1620, nx1623, nx1628, nx1631, nx1633, nx1636, nx1638, nx1642, nx1646, 
         nx1651, nx1654, nx1657, nx1659, nx1664, nx1665, nx1667, nx1675, nx1679, 
         nx1681, nx1684, nx1689, nx1692, nx1694, nx1697, nx1699, nx1703, nx1707, 
         nx1712, nx1715, nx1718, nx1720, nx1725, nx1726, nx1728, nx1736, nx1740, 
         nx1742, nx1745, nx1750, nx1753, nx1755, nx1758, nx1760, nx1764, nx1768, 
         nx1773, nx1776, nx1779, nx1781, nx1786, nx1787, nx1789, nx1797, nx1801, 
         nx1803, nx1806, nx1811, nx1814, nx1816, nx1819, nx1821, nx1825, nx1829, 
         nx1834, nx1837, nx1840, nx1842, nx1847, nx1848, nx1850, nx1854, nx1856, 
         nx1860, nx1864, nx1866, nx1872, nx1875, nx1877, nx1880, nx1884, nx1887, 
         nx1890, nx1895, nx1900, nx1903, nx1908, nx1911, nx1918, nx1920, nx1922, 
         nx1924, nx1926, nx1928, nx1930, nx1932, nx1934, nx1936, nx1938, nx1940, 
         nx1942, nx1944, nx1946, nx1948, nx1950, nx1952, nx1954, nx1956, nx1958, 
         nx1960, nx1962, nx1964, nx1966, nx1968, nx1970, nx1972, nx1974, nx1976, 
         nx1978, nx1980, nx1982, nx1988, nx1990, nx1992, nx1994, nx2004, nx2010, 
         nx2012, nx2014, nx2016, nx2018, nx2020, nx2022, nx2024, nx2026, nx2028, 
         nx2030, nx2032, nx2034, nx2036, nx2038, nx2040, nx2042, nx2044, nx2046, 
         nx2048, nx2050, nx2052, nx2054, nx2056, nx2058, nx2060, nx2062, nx2064;
    wire [16:0] \$dummy ;




    assign write_done = read_done ;
    assign f_done = read_done ;
    fake_gnd ix619 (.Y (read_done)) ;
    nor02ii ix3 (.Y (nx2), .A0 (nx2024), .A1 (mode[0])) ;
    aoi222 ix1360 (.Y (nx1359), .A0 (f_pointer_0), .A1 (nx1918), .B0 (
           write_pointer_0), .B1 (nx1940), .C0 (read_pointer_0), .C1 (nx1930)) ;
    dffr reg_f_pointer_0 (.Q (f_pointer_0), .QB (\$dummy [0]), .D (nx655), .CLK (
         nx1946), .R (reset)) ;
    dffr reg_write_pointer_0 (.Q (write_pointer_0), .QB (\$dummy [1]), .D (nx645
         ), .CLK (nx1946), .R (reset)) ;
    nand02 ix1373 (.Y (nx1372), .A0 (nx2024), .A1 (mode[0])) ;
    dffr reg_read_pointer_0 (.Q (read_pointer_0), .QB (\$dummy [2]), .D (nx635)
         , .CLK (nx1946), .R (reset)) ;
    nor02ii ix7 (.Y (nx6), .A0 (mode[0]), .A1 (nx2024)) ;
    dff reg_temp_address_0 (.Q (temp_address_0), .QB (nx1384), .D (nx665), .CLK (
        nx1946)) ;
    oai21 ix1387 (.Y (nx1386), .A0 (nx2024), .A1 (mode[0]), .B0 (nx1388)) ;
    inv01 ix1389 (.Y (nx1388), .A (reset)) ;
    aoi222 ix1396 (.Y (nx1395), .A0 (f_pointer_1), .A1 (nx1918), .B0 (
           write_pointer_1), .B1 (nx1940), .C0 (read_pointer_1), .C1 (nx1930)) ;
    dffr reg_f_pointer_1 (.Q (f_pointer_1), .QB (nx1399), .D (nx695), .CLK (
         nx1946), .R (reset)) ;
    oai21 ix1402 (.Y (nx1401), .A0 (f_pointer_0), .A1 (f_pointer_1), .B0 (nx1403
          )) ;
    nand02 ix1404 (.Y (nx1403), .A0 (f_pointer_1), .A1 (f_pointer_0)) ;
    oai21 ix1408 (.Y (nx1407), .A0 (write_pointer_0), .A1 (write_pointer_1), .B0 (
          nx1409)) ;
    nand02 ix1410 (.Y (nx1409), .A0 (write_pointer_1), .A1 (write_pointer_0)) ;
    dffr reg_write_pointer_1 (.Q (write_pointer_1), .QB (nx1411), .D (nx685), .CLK (
         nx1946), .R (reset)) ;
    dffr reg_read_pointer_1 (.Q (read_pointer_1), .QB (nx1415), .D (nx675), .CLK (
         nx1946), .R (reset)) ;
    oai21 ix1418 (.Y (nx1417), .A0 (read_pointer_0), .A1 (read_pointer_1), .B0 (
          nx1419)) ;
    nand02 ix1420 (.Y (nx1419), .A0 (read_pointer_1), .A1 (read_pointer_0)) ;
    dff reg_temp_address_1 (.Q (temp_address_1), .QB (nx1421), .D (nx705), .CLK (
        nx1948)) ;
    ao22 ix195 (.Y (address[2]), .A0 (temp_address_2), .A1 (nx182), .B0 (nx2044)
         , .B1 (nx2026)) ;
    aoi222 ix1429 (.Y (nx1428), .A0 (f_pointer_2), .A1 (nx1918), .B0 (
           write_pointer_2), .B1 (nx1940), .C0 (read_pointer_2), .C1 (nx1930)) ;
    oai21 ix163 (.Y (nx162), .A0 (nx1433), .A1 (nx1403), .B0 (nx156)) ;
    dffr reg_f_pointer_2 (.Q (f_pointer_2), .QB (nx1433), .D (nx735), .CLK (
         nx1948), .R (reset)) ;
    dffr reg_write_pointer_2 (.Q (write_pointer_2), .QB (\$dummy [3]), .D (nx725
         ), .CLK (nx1948), .R (reset)) ;
    xnor2 ix149 (.Y (nx148), .A0 (write_pointer_2), .A1 (nx1409)) ;
    dffr reg_read_pointer_2 (.Q (read_pointer_2), .QB (\$dummy [4]), .D (nx715)
         , .CLK (nx1948), .R (reset)) ;
    xnor2 ix135 (.Y (nx134), .A0 (nx1419), .A1 (nx132)) ;
    xnor2 ix133 (.Y (nx132), .A0 (readmode), .A1 (read_pointer_2)) ;
    dff reg_temp_address_2 (.Q (temp_address_2), .QB (nx1445), .D (nx745), .CLK (
        nx1948)) ;
    oai21 ix183 (.Y (nx182), .A0 (nx1448), .A1 (nx2052), .B0 (nx1968)) ;
    nand03 ix1449 (.Y (nx1448), .A0 (nx2024), .A1 (temp_address_1), .A2 (
           temp_address_0)) ;
    aoi32 ix1451 (.Y (nx1450), .A0 (nx2024), .A1 (temp_address_1), .A2 (
          temp_address_0), .B0 (temp_address_2), .B1 (nx2024)) ;
    oai32 ix273 (.Y (address[3]), .A0 (nx1453), .A1 (nx262), .A2 (nx2052), .B0 (
          nx1481), .B1 (nx1968)) ;
    aoi222 ix1458 (.Y (nx1457), .A0 (f_pointer_3), .A1 (nx1920), .B0 (
           write_pointer_3), .B1 (nx1940), .C0 (read_pointer_3), .C1 (nx1930)) ;
    aoi21 ix241 (.Y (nx240), .A0 (nx1462), .A1 (nx1464), .B0 (nx234)) ;
    aoi21 ix1463 (.Y (nx1462), .A0 (f_pointer_1), .A1 (f_pointer_0), .B0 (
          f_pointer_2)) ;
    dffr reg_f_pointer_3 (.Q (f_pointer_3), .QB (nx1464), .D (nx775), .CLK (
         nx1948), .R (reset)) ;
    dffr reg_write_pointer_3 (.Q (write_pointer_3), .QB (\$dummy [5]), .D (nx765
         ), .CLK (nx1948), .R (reset)) ;
    xnor2 ix227 (.Y (nx226), .A0 (write_pointer_3), .A1 (nx1470)) ;
    nand03 ix1471 (.Y (nx1470), .A0 (write_pointer_2), .A1 (write_pointer_1), .A2 (
           write_pointer_0)) ;
    dffr reg_read_pointer_3 (.Q (read_pointer_3), .QB (nx1480), .D (nx755), .CLK (
         nx1950), .R (reset)) ;
    aoi32 ix1477 (.Y (nx1476), .A0 (read_pointer_1), .A1 (read_pointer_0), .A2 (
          nx132), .B0 (nx1478), .B1 (read_pointer_2)) ;
    inv01 ix1479 (.Y (nx1478), .A (readmode)) ;
    dff reg_temp_address_3 (.Q (\$dummy [6]), .QB (nx1481), .D (nx785), .CLK (
        nx1950)) ;
    nor03_2x ix263 (.Y (nx262), .A0 (nx2052), .A1 (nx1481), .A2 (nx2044)) ;
    aoi222 ix1490 (.Y (nx1489), .A0 (f_pointer_4), .A1 (nx1920), .B0 (
           write_pointer_4), .B1 (nx1940), .C0 (read_pointer_4), .C1 (nx1932)) ;
    dffr reg_f_pointer_4 (.Q (f_pointer_4), .QB (nx1493), .D (nx815), .CLK (
         nx1950), .R (reset)) ;
    oai21 ix1496 (.Y (nx1495), .A0 (nx234), .A1 (f_pointer_4), .B0 (nx1497)) ;
    nand02 ix1498 (.Y (nx1497), .A0 (f_pointer_4), .A1 (nx234)) ;
    aoi21 ix295 (.Y (nx294), .A0 (nx1502), .A1 (nx1504), .B0 (nx288)) ;
    nand04 ix1503 (.Y (nx1502), .A0 (write_pointer_3), .A1 (write_pointer_2), .A2 (
           write_pointer_1), .A3 (write_pointer_0)) ;
    dffr reg_write_pointer_4 (.Q (write_pointer_4), .QB (nx1504), .D (nx805), .CLK (
         nx1950), .R (reset)) ;
    dffr reg_read_pointer_4 (.Q (read_pointer_4), .QB (nx1509), .D (nx795), .CLK (
         nx1950), .R (reset)) ;
    oai21 ix1512 (.Y (nx1511), .A0 (nx206), .A1 (read_pointer_4), .B0 (nx1514)
          ) ;
    nand02 ix1515 (.Y (nx1514), .A0 (read_pointer_4), .A1 (nx206)) ;
    dff reg_temp_address_4 (.Q (temp_address_4), .QB (nx1516), .D (nx825), .CLK (
        nx1950)) ;
    oai32 ix409 (.Y (address[5]), .A0 (nx1520), .A1 (nx398), .A2 (nx2052), .B0 (
          nx1544), .B1 (nx1968)) ;
    aoi222 ix1525 (.Y (nx1524), .A0 (f_pointer_5), .A1 (nx1920), .B0 (
           write_pointer_5), .B1 (nx1940), .C0 (read_pointer_5), .C1 (nx1932)) ;
    aoi21 ix377 (.Y (nx376), .A0 (nx1497), .A1 (nx1529), .B0 (nx370)) ;
    dffr reg_f_pointer_5 (.Q (f_pointer_5), .QB (nx1529), .D (nx855), .CLK (
         nx1950), .R (reset)) ;
    oai21 ix1535 (.Y (nx1534), .A0 (nx288), .A1 (write_pointer_5), .B0 (nx1536)
          ) ;
    nand02 ix1537 (.Y (nx1536), .A0 (write_pointer_5), .A1 (nx288)) ;
    dffr reg_write_pointer_5 (.Q (write_pointer_5), .QB (nx1538), .D (nx845), .CLK (
         nx1952), .R (reset)) ;
    dffr reg_read_pointer_5 (.Q (read_pointer_5), .QB (nx1543), .D (nx835), .CLK (
         nx1952), .R (reset)) ;
    dff reg_temp_address_5 (.Q (\$dummy [7]), .QB (nx1544), .D (nx865), .CLK (
        nx1952)) ;
    nand03 ix1547 (.Y (nx1546), .A0 (nx2026), .A1 (temp_address_4), .A2 (nx262)
           ) ;
    nor03_2x ix399 (.Y (nx398), .A0 (nx2052), .A1 (nx1544), .A2 (nx1546)) ;
    aoi222 ix1555 (.Y (nx1554), .A0 (f_pointer_6), .A1 (nx1920), .B0 (
           write_pointer_6), .B1 (nx1940), .C0 (read_pointer_6), .C1 (nx1932)) ;
    dffr reg_f_pointer_6 (.Q (f_pointer_6), .QB (nx1558), .D (nx895), .CLK (
         nx1952), .R (reset)) ;
    oai21 ix1561 (.Y (nx1560), .A0 (nx370), .A1 (f_pointer_6), .B0 (nx1562)) ;
    nand02 ix1563 (.Y (nx1562), .A0 (f_pointer_6), .A1 (nx370)) ;
    dffr reg_write_pointer_6 (.Q (write_pointer_6), .QB (nx1567), .D (nx885), .CLK (
         nx1952), .R (reset)) ;
    dffr reg_read_pointer_6 (.Q (read_pointer_6), .QB (nx1570), .D (nx875), .CLK (
         nx1952), .R (reset)) ;
    oai21 ix1573 (.Y (nx1572), .A0 (nx342), .A1 (read_pointer_6), .B0 (nx1575)
          ) ;
    nand02 ix1576 (.Y (nx1575), .A0 (read_pointer_6), .A1 (nx342)) ;
    dff reg_temp_address_6 (.Q (temp_address_6), .QB (nx1577), .D (nx905), .CLK (
        nx1952)) ;
    oai32 ix545 (.Y (address[7]), .A0 (nx1581), .A1 (nx534), .A2 (nx1978), .B0 (
          nx1604), .B1 (nx1970)) ;
    aoi222 ix1586 (.Y (nx1585), .A0 (f_pointer_7), .A1 (nx1922), .B0 (
           write_pointer_7), .B1 (nx1942), .C0 (read_pointer_7), .C1 (nx1934)) ;
    dffr reg_f_pointer_7 (.Q (f_pointer_7), .QB (nx1590), .D (nx935), .CLK (
         nx1954), .R (reset)) ;
    oai21 ix1594 (.Y (nx1593), .A0 (nx424), .A1 (write_pointer_7), .B0 (nx1596)
          ) ;
    nand02 ix1597 (.Y (nx1596), .A0 (write_pointer_7), .A1 (nx424)) ;
    dffr reg_write_pointer_7 (.Q (write_pointer_7), .QB (nx1598), .D (nx925), .CLK (
         nx1954), .R (reset)) ;
    dffr reg_read_pointer_7 (.Q (read_pointer_7), .QB (nx1603), .D (nx915), .CLK (
         nx1954), .R (reset)) ;
    dff reg_temp_address_7 (.Q (\$dummy [8]), .QB (nx1604), .D (nx945), .CLK (
        nx1954)) ;
    nand03 ix1607 (.Y (nx1606), .A0 (nx2026), .A1 (temp_address_6), .A2 (nx398)
           ) ;
    nor03_2x ix535 (.Y (nx534), .A0 (nx1978), .A1 (nx1604), .A2 (nx1606)) ;
    aoi222 ix1615 (.Y (nx1614), .A0 (f_pointer_8), .A1 (nx1922), .B0 (
           write_pointer_8), .B1 (nx1942), .C0 (read_pointer_8), .C1 (nx1934)) ;
    dffr reg_f_pointer_8 (.Q (f_pointer_8), .QB (nx1618), .D (nx975), .CLK (
         nx1954), .R (reset)) ;
    oai21 ix1621 (.Y (nx1620), .A0 (nx506), .A1 (f_pointer_8), .B0 (nx1623)) ;
    nand02 ix1624 (.Y (nx1623), .A0 (f_pointer_8), .A1 (nx506)) ;
    dffr reg_write_pointer_8 (.Q (write_pointer_8), .QB (nx1628), .D (nx965), .CLK (
         nx1954), .R (reset)) ;
    dffr reg_read_pointer_8 (.Q (read_pointer_8), .QB (nx1631), .D (nx955), .CLK (
         nx1954), .R (reset)) ;
    oai21 ix1634 (.Y (nx1633), .A0 (nx478), .A1 (read_pointer_8), .B0 (nx1636)
          ) ;
    nand02 ix1637 (.Y (nx1636), .A0 (read_pointer_8), .A1 (nx478)) ;
    dff reg_temp_address_8 (.Q (temp_address_8), .QB (nx1638), .D (nx985), .CLK (
        nx1956)) ;
    oai32 ix681 (.Y (address[9]), .A0 (nx1642), .A1 (nx670), .A2 (nx1978), .B0 (
          nx1665), .B1 (nx1970)) ;
    aoi222 ix1647 (.Y (nx1646), .A0 (f_pointer_9), .A1 (nx1922), .B0 (
           write_pointer_9), .B1 (nx1942), .C0 (read_pointer_9), .C1 (nx1934)) ;
    dffr reg_f_pointer_9 (.Q (f_pointer_9), .QB (nx1651), .D (nx1015), .CLK (
         nx1956), .R (reset)) ;
    oai21 ix1655 (.Y (nx1654), .A0 (nx560), .A1 (write_pointer_9), .B0 (nx1657)
          ) ;
    nand02 ix1658 (.Y (nx1657), .A0 (write_pointer_9), .A1 (nx560)) ;
    dffr reg_write_pointer_9 (.Q (write_pointer_9), .QB (nx1659), .D (nx1005), .CLK (
         nx1956), .R (reset)) ;
    dffr reg_read_pointer_9 (.Q (read_pointer_9), .QB (nx1664), .D (nx995), .CLK (
         nx1956), .R (reset)) ;
    dff reg_temp_address_9 (.Q (\$dummy [9]), .QB (nx1665), .D (nx1025), .CLK (
        nx1956)) ;
    nand03 ix1668 (.Y (nx1667), .A0 (nx2026), .A1 (temp_address_8), .A2 (nx534)
           ) ;
    nor03_2x ix671 (.Y (nx670), .A0 (nx1978), .A1 (nx1665), .A2 (nx1667)) ;
    aoi222 ix1676 (.Y (nx1675), .A0 (f_pointer_10), .A1 (nx1924), .B0 (
           write_pointer_10), .B1 (nx1942), .C0 (read_pointer_10), .C1 (nx1934)
           ) ;
    dffr reg_f_pointer_10 (.Q (f_pointer_10), .QB (nx1679), .D (nx1055), .CLK (
         nx1956), .R (reset)) ;
    oai21 ix1682 (.Y (nx1681), .A0 (nx642), .A1 (f_pointer_10), .B0 (nx1684)) ;
    nand02 ix1685 (.Y (nx1684), .A0 (f_pointer_10), .A1 (nx642)) ;
    dffr reg_write_pointer_10 (.Q (write_pointer_10), .QB (nx1689), .D (nx1045)
         , .CLK (nx1956), .R (reset)) ;
    dffr reg_read_pointer_10 (.Q (read_pointer_10), .QB (nx1692), .D (nx1035), .CLK (
         nx1958), .R (reset)) ;
    oai21 ix1695 (.Y (nx1694), .A0 (nx614), .A1 (read_pointer_10), .B0 (nx1697)
          ) ;
    nand02 ix1698 (.Y (nx1697), .A0 (read_pointer_10), .A1 (nx614)) ;
    dff reg_temp_address_10 (.Q (temp_address_10), .QB (nx1699), .D (nx1065), .CLK (
        nx1958)) ;
    oai32 ix817 (.Y (address[11]), .A0 (nx1703), .A1 (nx806), .A2 (nx1980), .B0 (
          nx1726), .B1 (nx1970)) ;
    aoi222 ix1708 (.Y (nx1707), .A0 (f_pointer_11), .A1 (nx1924), .B0 (
           write_pointer_11), .B1 (nx1942), .C0 (read_pointer_11), .C1 (nx1936)
           ) ;
    dffr reg_f_pointer_11 (.Q (f_pointer_11), .QB (nx1712), .D (nx1095), .CLK (
         nx1958), .R (reset)) ;
    oai21 ix1716 (.Y (nx1715), .A0 (nx696), .A1 (write_pointer_11), .B0 (nx1718)
          ) ;
    nand02 ix1719 (.Y (nx1718), .A0 (write_pointer_11), .A1 (nx696)) ;
    dffr reg_write_pointer_11 (.Q (write_pointer_11), .QB (nx1720), .D (nx1085)
         , .CLK (nx1958), .R (reset)) ;
    dffr reg_read_pointer_11 (.Q (read_pointer_11), .QB (nx1725), .D (nx1075), .CLK (
         nx1958), .R (reset)) ;
    dff reg_temp_address_11 (.Q (\$dummy [10]), .QB (nx1726), .D (nx1105), .CLK (
        nx1958)) ;
    nand03 ix1729 (.Y (nx1728), .A0 (nx2026), .A1 (temp_address_10), .A2 (nx670)
           ) ;
    nor03_2x ix807 (.Y (nx806), .A0 (nx1980), .A1 (nx1726), .A2 (nx1728)) ;
    aoi222 ix1737 (.Y (nx1736), .A0 (f_pointer_12), .A1 (nx1924), .B0 (
           write_pointer_12), .B1 (nx1942), .C0 (read_pointer_12), .C1 (nx1936)
           ) ;
    dffr reg_f_pointer_12 (.Q (f_pointer_12), .QB (nx1740), .D (nx1135), .CLK (
         nx1958), .R (reset)) ;
    oai21 ix1743 (.Y (nx1742), .A0 (nx778), .A1 (f_pointer_12), .B0 (nx1745)) ;
    nand02 ix1746 (.Y (nx1745), .A0 (f_pointer_12), .A1 (nx778)) ;
    dffr reg_write_pointer_12 (.Q (write_pointer_12), .QB (nx1750), .D (nx1125)
         , .CLK (nx1960), .R (reset)) ;
    dffr reg_read_pointer_12 (.Q (read_pointer_12), .QB (nx1753), .D (nx1115), .CLK (
         nx1960), .R (reset)) ;
    oai21 ix1756 (.Y (nx1755), .A0 (nx750), .A1 (read_pointer_12), .B0 (nx1758)
          ) ;
    nand02 ix1759 (.Y (nx1758), .A0 (read_pointer_12), .A1 (nx750)) ;
    dff reg_temp_address_12 (.Q (temp_address_12), .QB (nx1760), .D (nx1145), .CLK (
        nx1960)) ;
    oai32 ix953 (.Y (address[13]), .A0 (nx1764), .A1 (nx942), .A2 (nx1980), .B0 (
          nx1787), .B1 (nx1970)) ;
    aoi222 ix1769 (.Y (nx1768), .A0 (f_pointer_13), .A1 (nx1924), .B0 (
           write_pointer_13), .B1 (nx1942), .C0 (read_pointer_13), .C1 (nx1936)
           ) ;
    dffr reg_f_pointer_13 (.Q (f_pointer_13), .QB (nx1773), .D (nx1175), .CLK (
         nx1960), .R (reset)) ;
    oai21 ix1777 (.Y (nx1776), .A0 (nx832), .A1 (write_pointer_13), .B0 (nx1779)
          ) ;
    nand02 ix1780 (.Y (nx1779), .A0 (write_pointer_13), .A1 (nx832)) ;
    dffr reg_write_pointer_13 (.Q (write_pointer_13), .QB (nx1781), .D (nx1165)
         , .CLK (nx1960), .R (reset)) ;
    dffr reg_read_pointer_13 (.Q (read_pointer_13), .QB (nx1786), .D (nx1155), .CLK (
         nx1960), .R (reset)) ;
    dff reg_temp_address_13 (.Q (\$dummy [11]), .QB (nx1787), .D (nx1185), .CLK (
        nx1960)) ;
    nand03 ix1790 (.Y (nx1789), .A0 (nx2026), .A1 (temp_address_12), .A2 (nx806)
           ) ;
    nor03_2x ix943 (.Y (nx942), .A0 (nx1980), .A1 (nx1787), .A2 (nx1789)) ;
    aoi222 ix1798 (.Y (nx1797), .A0 (f_pointer_14), .A1 (nx1926), .B0 (
           write_pointer_14), .B1 (nx1944), .C0 (read_pointer_14), .C1 (nx1938)
           ) ;
    dffr reg_f_pointer_14 (.Q (f_pointer_14), .QB (nx1801), .D (nx1215), .CLK (
         nx1962), .R (reset)) ;
    oai21 ix1804 (.Y (nx1803), .A0 (nx914), .A1 (f_pointer_14), .B0 (nx1806)) ;
    nand02 ix1807 (.Y (nx1806), .A0 (f_pointer_14), .A1 (nx914)) ;
    dffr reg_write_pointer_14 (.Q (write_pointer_14), .QB (nx1811), .D (nx1205)
         , .CLK (nx1962), .R (reset)) ;
    dffr reg_read_pointer_14 (.Q (read_pointer_14), .QB (nx1814), .D (nx1195), .CLK (
         nx1962), .R (reset)) ;
    oai21 ix1817 (.Y (nx1816), .A0 (nx886), .A1 (read_pointer_14), .B0 (nx1819)
          ) ;
    nand02 ix1820 (.Y (nx1819), .A0 (read_pointer_14), .A1 (nx886)) ;
    dff reg_temp_address_14 (.Q (temp_address_14), .QB (nx1821), .D (nx1225), .CLK (
        nx1962)) ;
    oai32 ix1089 (.Y (address[15]), .A0 (nx1825), .A1 (nx1078), .A2 (nx1982), .B0 (
          nx1848), .B1 (nx2046)) ;
    aoi222 ix1830 (.Y (nx1829), .A0 (f_pointer_15), .A1 (nx1926), .B0 (
           write_pointer_15), .B1 (nx1944), .C0 (read_pointer_15), .C1 (nx1938)
           ) ;
    dffr reg_f_pointer_15 (.Q (f_pointer_15), .QB (nx1834), .D (nx1255), .CLK (
         nx1962), .R (reset)) ;
    oai21 ix1838 (.Y (nx1837), .A0 (nx968), .A1 (write_pointer_15), .B0 (nx1840)
          ) ;
    nand02 ix1841 (.Y (nx1840), .A0 (write_pointer_15), .A1 (nx968)) ;
    dffr reg_write_pointer_15 (.Q (write_pointer_15), .QB (nx1842), .D (nx1245)
         , .CLK (nx1962), .R (reset)) ;
    dffr reg_read_pointer_15 (.Q (read_pointer_15), .QB (nx1847), .D (nx1235), .CLK (
         nx1962), .R (reset)) ;
    dff reg_temp_address_15 (.Q (\$dummy [12]), .QB (nx1848), .D (nx1265), .CLK (
        nx1964)) ;
    nand03 ix1851 (.Y (nx1850), .A0 (nx2026), .A1 (temp_address_14), .A2 (nx942)
           ) ;
    nor03_2x ix1079 (.Y (nx1078), .A0 (nx1980), .A1 (nx1848), .A2 (nx1850)) ;
    oai32 ix1163 (.Y (address[16]), .A0 (nx1854), .A1 (nx1152), .A2 (nx1982), .B0 (
          nx1880), .B1 (nx2046)) ;
    nor02ii ix1855 (.Y (nx1854), .A0 (nx1078), .A1 (nx1856)) ;
    aoi222 ix1861 (.Y (nx1860), .A0 (f_pointer_16), .A1 (nx1926), .B0 (
           write_pointer_16), .B1 (nx1944), .C0 (read_pointer_16), .C1 (nx1938)
           ) ;
    dffr reg_f_pointer_16 (.Q (f_pointer_16), .QB (nx1864), .D (nx1295), .CLK (
         nx1964), .R (reset)) ;
    dffr reg_write_pointer_16 (.Q (write_pointer_16), .QB (nx1872), .D (nx1285)
         , .CLK (nx1964), .R (reset)) ;
    dffr reg_read_pointer_16 (.Q (read_pointer_16), .QB (nx1875), .D (nx1275), .CLK (
         nx1964), .R (reset)) ;
    dff reg_temp_address_16 (.Q (\$dummy [13]), .QB (nx1880), .D (nx1305), .CLK (
        nx1964)) ;
    nor02ii ix1153 (.Y (nx1152), .A0 (nx1856), .A1 (nx1078)) ;
    oai22 ix1213 (.Y (address[17]), .A0 (nx1884), .A1 (nx1982), .B0 (nx1887), .B1 (
          nx2046)) ;
    xnor2 ix1885 (.Y (nx1884), .A0 (nx1152), .A1 (nx1204)) ;
    oai22 ix1205 (.Y (nx1204), .A0 (nx1887), .A1 (nx2054), .B0 (nx1988), .B1 (
          nx1911)) ;
    dff reg_temp_address_17 (.Q (\$dummy [14]), .QB (nx1887), .D (nx1345), .CLK (
        nx1966)) ;
    aoi222 ix1891 (.Y (nx1890), .A0 (f_pointer_17), .A1 (nx1928), .B0 (
           write_pointer_17), .B1 (nx1944), .C0 (read_pointer_17), .C1 (nx1938)
           ) ;
    dffr reg_f_pointer_17 (.Q (f_pointer_17), .QB (\$dummy [15]), .D (nx1335), .CLK (
         nx1964), .R (reset)) ;
    xnor2 ix1181 (.Y (nx1180), .A0 (nx1895), .A1 (f_pointer_17)) ;
    nand02 ix1896 (.Y (nx1895), .A0 (f_pointer_16), .A1 (nx1050)) ;
    dffr reg_write_pointer_17 (.Q (write_pointer_17), .QB (nx1903), .D (nx1325)
         , .CLK (nx1964), .R (reset)) ;
    dffr reg_read_pointer_17 (.Q (read_pointer_17), .QB (\$dummy [16]), .D (
         nx1315), .CLK (nx1966), .R (reset)) ;
    xnor2 ix1165 (.Y (nx1164), .A0 (nx1908), .A1 (read_pointer_17)) ;
    nand02 ix1909 (.Y (nx1908), .A0 (read_pointer_16), .A1 (nx1022)) ;
    inv01 ix157 (.Y (nx156), .A (nx1462)) ;
    inv02 ix1917 (.Y (nx1918), .A (nx2046)) ;
    inv02 ix1919 (.Y (nx1920), .A (nx2046)) ;
    inv02 ix1921 (.Y (nx1922), .A (nx2046)) ;
    inv02 ix1923 (.Y (nx1924), .A (nx2050)) ;
    inv02 ix1925 (.Y (nx1926), .A (nx2050)) ;
    inv02 ix1927 (.Y (nx1928), .A (nx2050)) ;
    inv02 ix1929 (.Y (nx1930), .A (nx2054)) ;
    inv02 ix1931 (.Y (nx1932), .A (nx2054)) ;
    inv02 ix1933 (.Y (nx1934), .A (nx2054)) ;
    inv02 ix1935 (.Y (nx1936), .A (nx2054)) ;
    inv02 ix1937 (.Y (nx1938), .A (nx1994)) ;
    inv02 ix1939 (.Y (nx1940), .A (nx1988)) ;
    inv02 ix1941 (.Y (nx1942), .A (nx1990)) ;
    inv02 ix1943 (.Y (nx1944), .A (nx1990)) ;
    inv02 ix1945 (.Y (nx1946), .A (clock)) ;
    inv02 ix1947 (.Y (nx1948), .A (clock)) ;
    inv02 ix1949 (.Y (nx1950), .A (clock)) ;
    inv02 ix1951 (.Y (nx1952), .A (clock)) ;
    inv02 ix1953 (.Y (nx1954), .A (clock)) ;
    inv02 ix1955 (.Y (nx1956), .A (clock)) ;
    inv02 ix1957 (.Y (nx1958), .A (clock)) ;
    inv02 ix1959 (.Y (nx1960), .A (clock)) ;
    inv02 ix1961 (.Y (nx1962), .A (clock)) ;
    inv02 ix1963 (.Y (nx1964), .A (clock)) ;
    inv02 ix1965 (.Y (nx1966), .A (clock)) ;
    inv02 ix1967 (.Y (nx1968), .A (nx2)) ;
    inv02 ix1969 (.Y (nx1970), .A (nx2064)) ;
    inv02 ix1971 (.Y (nx1972), .A (nx2064)) ;
    inv02 ix1973 (.Y (nx1974), .A (nx2064)) ;
    inv02 ix1975 (.Y (nx1976), .A (mode[1])) ;
    inv02 ix1977 (.Y (nx1978), .A (nx2028)) ;
    inv02 ix1979 (.Y (nx1980), .A (nx2028)) ;
    inv02 ix1981 (.Y (nx1982), .A (nx2028)) ;
    inv02 ix1987 (.Y (nx1988), .A (nx2038)) ;
    inv02 ix1989 (.Y (nx1990), .A (nx2038)) ;
    inv02 ix1991 (.Y (nx1992), .A (nx6)) ;
    inv02 ix1993 (.Y (nx1994), .A (nx2036)) ;
    buf02 ix2003 (.Y (nx2004), .A (nx1476)) ;
    mux21_ni ix63 (.Y (address[0]), .A0 (nx1918), .A1 (nx2028), .S0 (nx1384)) ;
    mux21 ix666 (.Y (nx665), .A0 (nx1384), .A1 (nx1359), .S0 (nx2058)) ;
    xor2 ix656 (.Y (nx655), .A0 (f_pointer_0), .A1 (nx2064)) ;
    xor2 ix646 (.Y (nx645), .A0 (write_pointer_0), .A1 (nx2038)) ;
    xor2 ix636 (.Y (nx635), .A0 (read_pointer_0), .A1 (nx2036)) ;
    ao32 ix131 (.Y (address[1]), .A0 (nx2010), .A1 (nx1448), .A2 (nx2028), .B0 (
         temp_address_1), .B1 (nx2064)) ;
    oai21 ix1392 (.Y (nx2010), .A0 (nx1384), .A1 (nx2052), .B0 (nx1421)) ;
    mux21 ix706 (.Y (nx705), .A0 (nx1421), .A1 (nx1395), .S0 (nx2058)) ;
    mux21 ix696 (.Y (nx695), .A0 (nx1401), .A1 (nx1399), .S0 (nx2046)) ;
    mux21 ix686 (.Y (nx685), .A0 (nx1411), .A1 (nx1407), .S0 (nx2038)) ;
    mux21 ix676 (.Y (nx675), .A0 (nx1417), .A1 (nx1415), .S0 (nx2054)) ;
    mux21 ix746 (.Y (nx745), .A0 (nx1445), .A1 (nx1428), .S0 (nx2058)) ;
    mux21_ni ix736 (.Y (nx735), .A0 (nx162), .A1 (f_pointer_2), .S0 (nx2048)) ;
    mux21_ni ix726 (.Y (nx725), .A0 (write_pointer_2), .A1 (nx148), .S0 (nx2038)
             ) ;
    mux21_ni ix716 (.Y (nx715), .A0 (nx134), .A1 (read_pointer_2), .S0 (nx2054)
             ) ;
    and02 ix1454 (.Y (nx1453), .A0 (nx1481), .A1 (nx2044)) ;
    mux21 ix786 (.Y (nx785), .A0 (nx1481), .A1 (nx1457), .S0 (nx2058)) ;
    mux21_ni ix776 (.Y (nx775), .A0 (nx240), .A1 (f_pointer_3), .S0 (nx2048)) ;
    nor02ii ix235 (.Y (nx234), .A0 (nx1462), .A1 (f_pointer_3)) ;
    mux21_ni ix766 (.Y (nx765), .A0 (write_pointer_3), .A1 (nx226), .S0 (nx2038)
             ) ;
    mux21_ni ix756 (.Y (nx755), .A0 (nx212), .A1 (read_pointer_3), .S0 (nx2056)
             ) ;
    xor2 ix213 (.Y (nx212), .A0 (nx1480), .A1 (nx2004)) ;
    ao32 ix341 (.Y (address[4]), .A0 (nx2012), .A1 (nx1546), .A2 (nx2028), .B0 (
         temp_address_4), .B1 (nx2064)) ;
    or02 ix1486 (.Y (nx2012), .A0 (nx262), .A1 (temp_address_4)) ;
    mux21 ix826 (.Y (nx825), .A0 (nx1516), .A1 (nx1489), .S0 (nx2058)) ;
    mux21 ix816 (.Y (nx815), .A0 (nx1495), .A1 (nx1493), .S0 (nx2048)) ;
    mux21_ni ix806 (.Y (nx805), .A0 (write_pointer_4), .A1 (nx294), .S0 (nx2038)
             ) ;
    nor02ii ix289 (.Y (nx288), .A0 (nx1502), .A1 (write_pointer_4)) ;
    mux21 ix796 (.Y (nx795), .A0 (nx1511), .A1 (nx1509), .S0 (nx2056)) ;
    nor02ii ix207 (.Y (nx206), .A0 (nx2004), .A1 (read_pointer_3)) ;
    and02 ix1521 (.Y (nx1520), .A0 (nx1544), .A1 (nx1546)) ;
    mux21 ix866 (.Y (nx865), .A0 (nx1544), .A1 (nx1524), .S0 (nx2058)) ;
    mux21_ni ix856 (.Y (nx855), .A0 (nx376), .A1 (f_pointer_5), .S0 (nx2048)) ;
    nor02ii ix371 (.Y (nx370), .A0 (nx1497), .A1 (f_pointer_5)) ;
    mux21 ix846 (.Y (nx845), .A0 (nx1538), .A1 (nx1534), .S0 (nx2040)) ;
    mux21_ni ix836 (.Y (nx835), .A0 (nx348), .A1 (read_pointer_5), .S0 (nx2056)
             ) ;
    xor2 ix349 (.Y (nx348), .A0 (nx1543), .A1 (nx1514)) ;
    ao32 ix477 (.Y (address[6]), .A0 (nx2014), .A1 (nx1606), .A2 (nx2028), .B0 (
         temp_address_6), .B1 (nx2064)) ;
    or02 ix1551 (.Y (nx2014), .A0 (nx398), .A1 (temp_address_6)) ;
    mux21 ix906 (.Y (nx905), .A0 (nx1577), .A1 (nx1554), .S0 (nx2058)) ;
    mux21 ix896 (.Y (nx895), .A0 (nx1560), .A1 (nx1558), .S0 (nx2048)) ;
    mux21_ni ix886 (.Y (nx885), .A0 (write_pointer_6), .A1 (nx430), .S0 (nx2040)
             ) ;
    xor2 ix431 (.Y (nx430), .A0 (nx1567), .A1 (nx1536)) ;
    mux21 ix876 (.Y (nx875), .A0 (nx1572), .A1 (nx1570), .S0 (nx2056)) ;
    nor02ii ix343 (.Y (nx342), .A0 (nx1514), .A1 (read_pointer_5)) ;
    and02 ix1582 (.Y (nx1581), .A0 (nx1604), .A1 (nx1606)) ;
    mux21 ix946 (.Y (nx945), .A0 (nx1604), .A1 (nx1585), .S0 (nx2060)) ;
    mux21_ni ix936 (.Y (nx935), .A0 (nx512), .A1 (f_pointer_7), .S0 (nx2048)) ;
    xor2 ix513 (.Y (nx512), .A0 (nx1590), .A1 (nx1562)) ;
    mux21 ix926 (.Y (nx925), .A0 (nx1598), .A1 (nx1593), .S0 (nx2040)) ;
    nor02ii ix425 (.Y (nx424), .A0 (nx1536), .A1 (write_pointer_6)) ;
    mux21_ni ix916 (.Y (nx915), .A0 (nx484), .A1 (read_pointer_7), .S0 (nx2056)
             ) ;
    xor2 ix485 (.Y (nx484), .A0 (nx1603), .A1 (nx1575)) ;
    ao32 ix613 (.Y (address[8]), .A0 (nx2016), .A1 (nx1667), .A2 (nx2030), .B0 (
         temp_address_8), .B1 (nx2034)) ;
    or02 ix1611 (.Y (nx2016), .A0 (nx534), .A1 (temp_address_8)) ;
    mux21 ix986 (.Y (nx985), .A0 (nx1638), .A1 (nx1614), .S0 (nx2060)) ;
    mux21 ix976 (.Y (nx975), .A0 (nx1620), .A1 (nx1618), .S0 (nx2048)) ;
    nor02ii ix507 (.Y (nx506), .A0 (nx1562), .A1 (f_pointer_7)) ;
    mux21_ni ix966 (.Y (nx965), .A0 (write_pointer_8), .A1 (nx566), .S0 (nx2040)
             ) ;
    xor2 ix567 (.Y (nx566), .A0 (nx1628), .A1 (nx1596)) ;
    mux21 ix956 (.Y (nx955), .A0 (nx1633), .A1 (nx1631), .S0 (nx2056)) ;
    nor02ii ix479 (.Y (nx478), .A0 (nx1575), .A1 (read_pointer_7)) ;
    and02 ix1643 (.Y (nx1642), .A0 (nx1665), .A1 (nx1667)) ;
    mux21 ix1026 (.Y (nx1025), .A0 (nx1665), .A1 (nx1646), .S0 (nx2060)) ;
    mux21_ni ix1016 (.Y (nx1015), .A0 (nx648), .A1 (f_pointer_9), .S0 (nx1972)
             ) ;
    xor2 ix649 (.Y (nx648), .A0 (nx1651), .A1 (nx1623)) ;
    mux21 ix1006 (.Y (nx1005), .A0 (nx1659), .A1 (nx1654), .S0 (nx2040)) ;
    nor02ii ix561 (.Y (nx560), .A0 (nx1596), .A1 (write_pointer_8)) ;
    mux21_ni ix996 (.Y (nx995), .A0 (nx620), .A1 (read_pointer_9), .S0 (nx2056)
             ) ;
    xor2 ix622 (.Y (nx620), .A0 (nx1664), .A1 (nx1636)) ;
    ao32 ix749 (.Y (address[10]), .A0 (nx2018), .A1 (nx1728), .A2 (nx2030), .B0 (
         temp_address_10), .B1 (nx2034)) ;
    or02 ix1672 (.Y (nx2018), .A0 (nx670), .A1 (temp_address_10)) ;
    mux21 ix1066 (.Y (nx1065), .A0 (nx1699), .A1 (nx1675), .S0 (nx2060)) ;
    mux21 ix1056 (.Y (nx1055), .A0 (nx1681), .A1 (nx1679), .S0 (nx1972)) ;
    nor02ii ix643 (.Y (nx642), .A0 (nx1623), .A1 (f_pointer_9)) ;
    mux21_ni ix1046 (.Y (nx1045), .A0 (write_pointer_10), .A1 (nx702), .S0 (
             nx2040)) ;
    xor2 ix703 (.Y (nx702), .A0 (nx1689), .A1 (nx1657)) ;
    mux21 ix1036 (.Y (nx1035), .A0 (nx1694), .A1 (nx1692), .S0 (nx1992)) ;
    nor02ii ix615 (.Y (nx614), .A0 (nx1636), .A1 (read_pointer_9)) ;
    and02 ix1704 (.Y (nx1703), .A0 (nx1726), .A1 (nx1728)) ;
    mux21 ix1106 (.Y (nx1105), .A0 (nx1726), .A1 (nx1707), .S0 (nx2060)) ;
    mux21_ni ix1096 (.Y (nx1095), .A0 (nx784), .A1 (f_pointer_11), .S0 (nx2050)
             ) ;
    xor2 ix785 (.Y (nx784), .A0 (nx1712), .A1 (nx1684)) ;
    mux21 ix1086 (.Y (nx1085), .A0 (nx1720), .A1 (nx1715), .S0 (nx2040)) ;
    nor02ii ix697 (.Y (nx696), .A0 (nx1657), .A1 (write_pointer_10)) ;
    mux21_ni ix1076 (.Y (nx1075), .A0 (nx756), .A1 (read_pointer_11), .S0 (
             nx1992)) ;
    xor2 ix757 (.Y (nx756), .A0 (nx1725), .A1 (nx1697)) ;
    ao32 ix885 (.Y (address[12]), .A0 (nx2020), .A1 (nx1789), .A2 (nx2030), .B0 (
         temp_address_12), .B1 (nx2034)) ;
    or02 ix1733 (.Y (nx2020), .A0 (nx806), .A1 (temp_address_12)) ;
    mux21 ix1146 (.Y (nx1145), .A0 (nx1760), .A1 (nx1736), .S0 (nx2060)) ;
    mux21 ix1136 (.Y (nx1135), .A0 (nx1742), .A1 (nx1740), .S0 (nx2050)) ;
    nor02ii ix779 (.Y (nx778), .A0 (nx1684), .A1 (f_pointer_11)) ;
    mux21_ni ix1126 (.Y (nx1125), .A0 (write_pointer_12), .A1 (nx838), .S0 (
             nx2042)) ;
    xor2 ix839 (.Y (nx838), .A0 (nx1750), .A1 (nx1718)) ;
    mux21 ix1116 (.Y (nx1115), .A0 (nx1755), .A1 (nx1753), .S0 (nx1992)) ;
    nor02ii ix751 (.Y (nx750), .A0 (nx1697), .A1 (read_pointer_11)) ;
    and02 ix1765 (.Y (nx1764), .A0 (nx1787), .A1 (nx1789)) ;
    mux21 ix1186 (.Y (nx1185), .A0 (nx1787), .A1 (nx1768), .S0 (nx2060)) ;
    mux21_ni ix1176 (.Y (nx1175), .A0 (nx920), .A1 (f_pointer_13), .S0 (nx2050)
             ) ;
    xor2 ix921 (.Y (nx920), .A0 (nx1773), .A1 (nx1745)) ;
    mux21 ix1166 (.Y (nx1165), .A0 (nx1781), .A1 (nx1776), .S0 (nx2042)) ;
    nor02ii ix833 (.Y (nx832), .A0 (nx1718), .A1 (write_pointer_12)) ;
    mux21_ni ix1156 (.Y (nx1155), .A0 (nx892), .A1 (read_pointer_13), .S0 (
             nx1992)) ;
    xor2 ix893 (.Y (nx892), .A0 (nx1786), .A1 (nx1758)) ;
    ao32 ix1021 (.Y (address[14]), .A0 (nx2022), .A1 (nx1850), .A2 (nx2030), .B0 (
         temp_address_14), .B1 (nx2034)) ;
    or02 ix1794 (.Y (nx2022), .A0 (nx942), .A1 (temp_address_14)) ;
    mux21 ix1226 (.Y (nx1225), .A0 (nx1821), .A1 (nx1797), .S0 (nx2062)) ;
    mux21 ix1216 (.Y (nx1215), .A0 (nx1803), .A1 (nx1801), .S0 (nx2050)) ;
    nor02ii ix915 (.Y (nx914), .A0 (nx1745), .A1 (f_pointer_13)) ;
    mux21_ni ix1206 (.Y (nx1205), .A0 (write_pointer_14), .A1 (nx974), .S0 (
             nx2042)) ;
    xor2 ix975 (.Y (nx974), .A0 (nx1811), .A1 (nx1779)) ;
    mux21 ix1196 (.Y (nx1195), .A0 (nx1816), .A1 (nx1814), .S0 (nx1992)) ;
    nor02ii ix887 (.Y (nx886), .A0 (nx1758), .A1 (read_pointer_13)) ;
    and02 ix1826 (.Y (nx1825), .A0 (nx1848), .A1 (nx1850)) ;
    mux21 ix1266 (.Y (nx1265), .A0 (nx1848), .A1 (nx1829), .S0 (nx2062)) ;
    mux21_ni ix1256 (.Y (nx1255), .A0 (nx1056), .A1 (f_pointer_15), .S0 (nx1974)
             ) ;
    xor2 ix1057 (.Y (nx1056), .A0 (nx1834), .A1 (nx1806)) ;
    mux21 ix1246 (.Y (nx1245), .A0 (nx1842), .A1 (nx1837), .S0 (nx2042)) ;
    nor02ii ix969 (.Y (nx968), .A0 (nx1779), .A1 (write_pointer_14)) ;
    mux21_ni ix1236 (.Y (nx1235), .A0 (nx1028), .A1 (read_pointer_15), .S0 (
             nx1994)) ;
    xor2 ix1029 (.Y (nx1028), .A0 (nx1847), .A1 (nx1819)) ;
    mux21 ix1857 (.Y (nx1856), .A0 (nx2036), .A1 (nx2042), .S0 (nx1880)) ;
    mux21 ix1306 (.Y (nx1305), .A0 (nx1880), .A1 (nx1860), .S0 (nx2062)) ;
    mux21 ix1296 (.Y (nx1295), .A0 (nx1866), .A1 (nx1864), .S0 (nx1974)) ;
    xor2 ix1867 (.Y (nx1866), .A0 (nx1864), .A1 (nx1050)) ;
    nor02ii ix1051 (.Y (nx1050), .A0 (nx1806), .A1 (f_pointer_15)) ;
    mux21_ni ix1286 (.Y (nx1285), .A0 (write_pointer_16), .A1 (nx1110), .S0 (
             nx2042)) ;
    xor2 ix1111 (.Y (nx1110), .A0 (nx1872), .A1 (nx1840)) ;
    mux21 ix1276 (.Y (nx1275), .A0 (nx1877), .A1 (nx1875), .S0 (nx1994)) ;
    xor2 ix1878 (.Y (nx1877), .A0 (nx1875), .A1 (nx1022)) ;
    nor02ii ix1023 (.Y (nx1022), .A0 (nx1819), .A1 (read_pointer_15)) ;
    mux21 ix1346 (.Y (nx1345), .A0 (nx1887), .A1 (nx1890), .S0 (nx2062)) ;
    mux21_ni ix1336 (.Y (nx1335), .A0 (nx1180), .A1 (f_pointer_17), .S0 (nx1974)
             ) ;
    mux21 ix1326 (.Y (nx1325), .A0 (nx1903), .A1 (nx1900), .S0 (nx2042)) ;
    xor2 ix1901 (.Y (nx1900), .A0 (nx1903), .A1 (nx1104)) ;
    nor02ii ix1105 (.Y (nx1104), .A0 (nx1840), .A1 (write_pointer_16)) ;
    mux21_ni ix1316 (.Y (nx1315), .A0 (nx1164), .A1 (read_pointer_17), .S0 (
             nx1994)) ;
    xnor2 ix1912 (.Y (nx1911), .A0 (nx1880), .A1 (nx1887)) ;
    inv02 ix2023 (.Y (nx2024), .A (nx2052)) ;
    inv02 ix2025 (.Y (nx2026), .A (nx1976)) ;
    inv02 ix2027 (.Y (nx2028), .A (nx1976)) ;
    inv02 ix2029 (.Y (nx2030), .A (nx1976)) ;
    inv02 ix2031 (.Y (nx2032), .A (nx1968)) ;
    inv02 ix2033 (.Y (nx2034), .A (nx1968)) ;
    inv01 ix2035 (.Y (nx2036), .A (nx1992)) ;
    inv02 ix2037 (.Y (nx2038), .A (nx1372)) ;
    inv02 ix2039 (.Y (nx2040), .A (nx1372)) ;
    inv02 ix2041 (.Y (nx2042), .A (nx1372)) ;
    buf02 ix2043 (.Y (nx2044), .A (nx1450)) ;
    inv02 ix2045 (.Y (nx2046), .A (nx2032)) ;
    inv02 ix2047 (.Y (nx2048), .A (nx2032)) ;
    inv02 ix2049 (.Y (nx2050), .A (nx2032)) ;
    inv02 ix2051 (.Y (nx2052), .A (mode[1])) ;
    inv02 ix2053 (.Y (nx2054), .A (nx6)) ;
    inv02 ix2055 (.Y (nx2056), .A (nx6)) ;
    inv02 ix2057 (.Y (nx2058), .A (nx1386)) ;
    inv02 ix2059 (.Y (nx2060), .A (nx1386)) ;
    inv02 ix2061 (.Y (nx2062), .A (nx1386)) ;
    inv02 ix2063 (.Y (nx2064), .A (nx1968)) ;
endmodule

