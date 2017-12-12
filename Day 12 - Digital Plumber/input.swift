import Foundation

// Example input.
let testInputLines: [String] = """
0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5
""".components(separatedBy: .newlines)

// Real input.
let inputLines: [String] = """
0 <-> 659, 737
1 <-> 1, 1433
2 <-> 982, 1869
3 <-> 306, 380, 1462, 1827
4 <-> 1076
5 <-> 794, 1451
6 <-> 146, 1055
7 <-> 834, 1557
8 <-> 1333
9 <-> 849, 906, 1863
10 <-> 362, 505
11 <-> 33, 938, 1896
12 <-> 490, 913
13 <-> 189, 690
14 <-> 796
15 <-> 56, 280, 1288, 1721
16 <-> 16
17 <-> 904
18 <-> 150, 1394, 1458
19 <-> 1773
20 <-> 70
21 <-> 993
22 <-> 22
23 <-> 285, 1004
24 <-> 209, 727
25 <-> 614, 1590
26 <-> 113
27 <-> 1321, 1341
28 <-> 351, 730, 1037
29 <-> 29, 1828
30 <-> 1378, 1983
31 <-> 705, 1035
32 <-> 1042, 1519
33 <-> 11, 886
34 <-> 360, 1101, 1531, 1877
35 <-> 971, 1652
36 <-> 188
37 <-> 1935
38 <-> 38
39 <-> 39, 1472
40 <-> 84, 1110
41 <-> 483, 895, 1035, 1864, 1919
42 <-> 624, 813, 1484, 1517
43 <-> 492
44 <-> 947, 1572
45 <-> 45, 1589, 1748, 1836
46 <-> 1821
47 <-> 123, 206, 239
48 <-> 146
49 <-> 235, 871
50 <-> 172, 1672
51 <-> 504
52 <-> 585, 678, 878
53 <-> 484, 543, 1282
54 <-> 374, 723
55 <-> 1956
56 <-> 15
57 <-> 583, 1159, 1596
58 <-> 313, 580, 1101
59 <-> 1529, 1788
60 <-> 60
61 <-> 1033, 1857
62 <-> 874
63 <-> 63, 1007, 1316, 1673
64 <-> 1140
65 <-> 1136
66 <-> 1337, 1546
67 <-> 67, 1468
68 <-> 298, 951
69 <-> 906
70 <-> 20, 1977
71 <-> 1956
72 <-> 146, 1465
73 <-> 911
74 <-> 1345
75 <-> 711
76 <-> 732, 789, 1499, 1637
77 <-> 1897
78 <-> 78, 379
79 <-> 96, 462, 847
80 <-> 886, 907
81 <-> 1564
82 <-> 1362, 1680
83 <-> 225, 916
84 <-> 40, 1460
85 <-> 330
86 <-> 1370
87 <-> 87, 640
88 <-> 806, 1411
89 <-> 1732
90 <-> 603
91 <-> 547, 904
92 <-> 1106
93 <-> 782
94 <-> 401, 1039, 1148, 1356
95 <-> 95, 344, 1092
96 <-> 79
97 <-> 1555, 1649
98 <-> 133
99 <-> 866
100 <-> 116, 1183, 1450
101 <-> 964
102 <-> 521, 843
103 <-> 1002
104 <-> 675, 1752, 1760
105 <-> 447
106 <-> 625
107 <-> 200, 923, 1573
108 <-> 108, 1535
109 <-> 1938, 1984
110 <-> 992
111 <-> 410, 436, 1789, 1985
112 <-> 730, 1742
113 <-> 26, 774, 1620
114 <-> 891
115 <-> 556, 980, 1502
116 <-> 100, 405, 438
117 <-> 1220, 1747
118 <-> 417
119 <-> 1671
120 <-> 225
121 <-> 215, 1414
122 <-> 1421
123 <-> 47, 488, 1390
124 <-> 1750
125 <-> 1020, 1456, 1645, 1811
126 <-> 945, 988, 1558
127 <-> 1562
128 <-> 246, 419, 878, 1057
129 <-> 198, 214, 526
130 <-> 1572
131 <-> 624
132 <-> 1086
133 <-> 98, 430, 1950
134 <-> 1179
135 <-> 1603
136 <-> 136
137 <-> 137, 248
138 <-> 604
139 <-> 1080, 1744, 1829
140 <-> 786, 890, 1336
141 <-> 819, 835
142 <-> 142, 1657
143 <-> 590, 670
144 <-> 622
145 <-> 182, 930, 1164, 1741
146 <-> 6, 48, 72, 152
147 <-> 1880
148 <-> 1486
149 <-> 1595
150 <-> 18, 653
151 <-> 1834
152 <-> 146, 289, 1949
153 <-> 1379
154 <-> 694, 1025
155 <-> 1143, 1469
156 <-> 437, 1492, 1616
157 <-> 1044
158 <-> 410, 1391
159 <-> 1327
160 <-> 387, 892, 963, 1287
161 <-> 964, 1017
162 <-> 786, 1098, 1351, 1445, 1508
163 <-> 415
164 <-> 255, 790, 1410
165 <-> 252, 425, 1186, 1662, 1838
166 <-> 791, 1012
167 <-> 167, 836, 1922
168 <-> 1586, 1998
169 <-> 679, 914
170 <-> 1975
171 <-> 672
172 <-> 50
173 <-> 614
174 <-> 723
175 <-> 246, 747
176 <-> 400, 1338
177 <-> 573, 1617, 1724
178 <-> 473, 1572
179 <-> 183
180 <-> 200, 1380
181 <-> 1394, 1657
182 <-> 145, 1825
183 <-> 179, 399, 955, 1236, 1295, 1840
184 <-> 712
185 <-> 185
186 <-> 551, 1627
187 <-> 1195
188 <-> 36, 440, 1277, 1362
189 <-> 13
190 <-> 1111
191 <-> 985, 1372
192 <-> 496, 1137, 1283
193 <-> 827, 1053
194 <-> 610
195 <-> 1231, 1497
196 <-> 1960
197 <-> 584, 1359
198 <-> 129, 651, 714, 1663
199 <-> 1047, 1805
200 <-> 107, 180, 658, 1397
201 <-> 1590
202 <-> 1268, 1768
203 <-> 1683
204 <-> 567, 1848
205 <-> 276
206 <-> 47, 461, 1794
207 <-> 207
208 <-> 1248
209 <-> 24, 1589
210 <-> 1063, 1504
211 <-> 907, 1815
212 <-> 1948
213 <-> 388
214 <-> 129, 561, 793, 1569
215 <-> 121, 252
216 <-> 216, 1728
217 <-> 761
218 <-> 631, 816
219 <-> 459, 807, 1008
220 <-> 1231, 1447
221 <-> 713, 1541
222 <-> 856, 924, 1924
223 <-> 1103
224 <-> 1426, 1761
225 <-> 83, 120, 242, 784
226 <-> 311, 560
227 <-> 587, 667, 984, 1091
228 <-> 1852
229 <-> 229, 1198, 1204
230 <-> 1505, 1944
231 <-> 1158, 1594, 1925
232 <-> 232, 345, 1417
233 <-> 828, 1677
234 <-> 982
235 <-> 49, 1012, 1254, 1956
236 <-> 489, 893, 1545
237 <-> 988, 1450
238 <-> 1719, 1791
239 <-> 47, 736, 1027
240 <-> 1167, 1457
241 <-> 270
242 <-> 225, 814, 1873
243 <-> 243, 282, 914
244 <-> 302, 328, 559
245 <-> 1753
246 <-> 128, 175
247 <-> 1230, 1660, 1824
248 <-> 137, 537, 1423
249 <-> 1209, 1391, 1749
250 <-> 298
251 <-> 799
252 <-> 165, 215
253 <-> 1437, 1741
254 <-> 1356
255 <-> 164
256 <-> 310
257 <-> 1267, 1821
258 <-> 1177, 1876
259 <-> 1257, 1432
260 <-> 311, 1115
261 <-> 1504
262 <-> 1268
263 <-> 565, 1023
264 <-> 408, 1806
265 <-> 1009, 1144
266 <-> 599, 616
267 <-> 1182
268 <-> 1026, 1456, 1470, 1854
269 <-> 269, 686
270 <-> 241, 1445
271 <-> 1232
272 <-> 487, 863, 1286
273 <-> 1614, 1748
274 <-> 1332
275 <-> 1010, 1334
276 <-> 205, 478, 888, 1049
277 <-> 277, 1330
278 <-> 734, 1561
279 <-> 535, 1190, 1913
280 <-> 15
281 <-> 1206
282 <-> 243, 475, 1571
283 <-> 283, 1936
284 <-> 324, 702, 844, 1601
285 <-> 23
286 <-> 286, 1080, 1127
287 <-> 295
288 <-> 805
289 <-> 152, 656, 691, 993
290 <-> 595, 616, 1199
291 <-> 1028, 1218, 1844
292 <-> 1447
293 <-> 378, 1771
294 <-> 811, 1790
295 <-> 287, 367, 693
296 <-> 861, 1948, 1950
297 <-> 1631
298 <-> 68, 250, 641, 745
299 <-> 299, 898, 1152, 1574
300 <-> 353
301 <-> 990, 1340, 1960
302 <-> 244
303 <-> 1645
304 <-> 445, 448, 557, 1611
305 <-> 1350, 1442
306 <-> 3, 445
307 <-> 567
308 <-> 1799
309 <-> 864
310 <-> 256, 853, 1911
311 <-> 226, 260, 970
312 <-> 1308
313 <-> 58
314 <-> 1795
315 <-> 1225, 1627, 1903
316 <-> 1065, 1991
317 <-> 317
318 <-> 546, 1415
319 <-> 1883
320 <-> 417, 1040
321 <-> 1927
322 <-> 686
323 <-> 1018, 1619
324 <-> 284
325 <-> 1114
326 <-> 474, 872
327 <-> 439
328 <-> 244
329 <-> 329
330 <-> 85, 1868
331 <-> 331, 680, 1224, 1243, 1291
332 <-> 1748
333 <-> 1673
334 <-> 676, 1306
335 <-> 809
336 <-> 797, 1559, 1858
337 <-> 978, 1874
338 <-> 538, 1077
339 <-> 432, 1033
340 <-> 340
341 <-> 1267, 1683
342 <-> 587, 726
343 <-> 1560, 1705
344 <-> 95
345 <-> 232, 1032
346 <-> 581, 1992
347 <-> 530
348 <-> 667, 1479
349 <-> 1620
350 <-> 861, 998, 1069
351 <-> 28
352 <-> 352
353 <-> 300, 1513
354 <-> 1109, 1747
355 <-> 950, 965, 1394, 1616
356 <-> 1136
357 <-> 1443, 1698
358 <-> 973, 1814
359 <-> 1662
360 <-> 34, 921
361 <-> 1418
362 <-> 10, 668, 1656
363 <-> 450, 766
364 <-> 615, 1941
365 <-> 1071
366 <-> 749, 1375
367 <-> 295, 1708, 1925
368 <-> 383, 928
369 <-> 369
370 <-> 651, 1048
371 <-> 665, 1460, 1686
372 <-> 390, 958, 1682
373 <-> 1559
374 <-> 54, 1395, 1847
375 <-> 799, 1061, 1383, 1773
376 <-> 376
377 <-> 1463
378 <-> 293, 872, 917
379 <-> 78, 449
380 <-> 3, 1117
381 <-> 1995
382 <-> 846, 896, 1506, 1918
383 <-> 368, 477
384 <-> 1009, 1788
385 <-> 1926
386 <-> 1602
387 <-> 160, 667
388 <-> 213, 713
389 <-> 586
390 <-> 372, 1140
391 <-> 863
392 <-> 590, 1259, 1384
393 <-> 645
394 <-> 423, 1537
395 <-> 782, 1496, 1893
396 <-> 1497
397 <-> 397
398 <-> 847, 1265
399 <-> 183, 743, 1564
400 <-> 176
401 <-> 94
402 <-> 402
403 <-> 558
404 <-> 572
405 <-> 116
406 <-> 769, 1563
407 <-> 1790
408 <-> 264
409 <-> 847
410 <-> 111, 158, 1467, 1880, 1902
411 <-> 1221
412 <-> 858, 1088, 1848
413 <-> 1589
414 <-> 468, 637
415 <-> 163, 415
416 <-> 416, 817
417 <-> 118, 320, 1671
418 <-> 1029, 1987
419 <-> 128, 765
420 <-> 420, 1180
421 <-> 1170, 1766
422 <-> 563, 1400, 1904, 1926
423 <-> 394
424 <-> 730
425 <-> 165, 478, 957
426 <-> 1505
427 <-> 1478, 1780
428 <-> 1658
429 <-> 650
430 <-> 133
431 <-> 469, 1491
432 <-> 339
433 <-> 667, 1549
434 <-> 852
435 <-> 435
436 <-> 111
437 <-> 156
438 <-> 116, 874
439 <-> 327, 1387
440 <-> 188, 540
441 <-> 441
442 <-> 692
443 <-> 1037, 1153
444 <-> 758, 1064
445 <-> 304, 306
446 <-> 1072, 1495, 1890
447 <-> 105, 1665
448 <-> 304, 591
449 <-> 379
450 <-> 363, 450, 466
451 <-> 1135
452 <-> 990, 1344, 1604
453 <-> 1390, 1755
454 <-> 1853
455 <-> 1199, 1735, 1852
456 <-> 484
457 <-> 457, 1973
458 <-> 786
459 <-> 219
460 <-> 1655, 1777
461 <-> 206, 753
462 <-> 79, 668
463 <-> 699
464 <-> 1843
465 <-> 829, 978, 1820
466 <-> 450
467 <-> 770, 1475
468 <-> 414, 613, 1230
469 <-> 431, 1470
470 <-> 1292, 1659
471 <-> 603
472 <-> 719, 1398
473 <-> 178, 1419
474 <-> 326, 866
475 <-> 282
476 <-> 1512, 1669
477 <-> 383
478 <-> 276, 425
479 <-> 1029
480 <-> 603
481 <-> 991, 1878
482 <-> 1726, 1783
483 <-> 41, 855
484 <-> 53, 456
485 <-> 1814
486 <-> 1470
487 <-> 272, 1693
488 <-> 123
489 <-> 236, 1155, 1793
490 <-> 12, 1349, 1498
491 <-> 913
492 <-> 43, 1121, 1822
493 <-> 1148
494 <-> 619, 1528
495 <-> 1960
496 <-> 192
497 <-> 497
498 <-> 1185
499 <-> 1933
500 <-> 1948
501 <-> 1364, 1433, 1826
502 <-> 893, 933
503 <-> 514
504 <-> 51, 821, 1116
505 <-> 10, 905
506 <-> 506
507 <-> 892
508 <-> 508
509 <-> 1078
510 <-> 1716
511 <-> 1197, 1900
512 <-> 568, 1284, 1422
513 <-> 1604, 1817, 1927
514 <-> 503, 773, 1725, 1883
515 <-> 1396
516 <-> 542
517 <-> 1299
518 <-> 1562
519 <-> 1622
520 <-> 1254, 1868, 1881
521 <-> 102, 1765
522 <-> 1438, 1980
523 <-> 1779
524 <-> 1235, 1968
525 <-> 1267, 1484
526 <-> 129
527 <-> 1211
528 <-> 597, 1017
529 <-> 529, 609
530 <-> 347, 1737, 1890
531 <-> 851, 1320
532 <-> 709
533 <-> 819, 1091
534 <-> 856
535 <-> 279, 535
536 <-> 536
537 <-> 248, 1317, 1763
538 <-> 338, 1793
539 <-> 539, 1485
540 <-> 440, 1216
541 <-> 541
542 <-> 516, 1232, 1831
543 <-> 53, 1234
544 <-> 639, 1090
545 <-> 1898
546 <-> 318, 1208
547 <-> 91
548 <-> 569, 750, 1090
549 <-> 1720
550 <-> 660
551 <-> 186
552 <-> 642, 672, 723
553 <-> 1927
554 <-> 717, 1841, 1997
555 <-> 1938
556 <-> 115, 1453
557 <-> 304, 904
558 <-> 403, 1438
559 <-> 244, 1046
560 <-> 226
561 <-> 214, 793, 1570
562 <-> 1992
563 <-> 422
564 <-> 860
565 <-> 263, 804
566 <-> 566
567 <-> 204, 307
568 <-> 512, 1084
569 <-> 548, 985, 1910
570 <-> 665, 1844
571 <-> 735
572 <-> 404, 1026, 1111
573 <-> 177, 1994
574 <-> 846
575 <-> 723, 738, 795, 802, 926, 1215
576 <-> 1650, 1962, 1996
577 <-> 1501, 1670
578 <-> 1504
579 <-> 1016, 1729
580 <-> 58
581 <-> 346, 581
582 <-> 749
583 <-> 57, 613, 1219, 1941
584 <-> 197, 1366
585 <-> 52, 1518
586 <-> 389, 1597
587 <-> 227, 342
588 <-> 1408
589 <-> 1229
590 <-> 143, 392, 1044, 1078
591 <-> 448, 1289
592 <-> 592
593 <-> 711
594 <-> 770
595 <-> 290, 1169
596 <-> 1854
597 <-> 528, 755, 1241, 1982
598 <-> 663, 806
599 <-> 266
600 <-> 1065, 1694
601 <-> 746
602 <-> 827
603 <-> 90, 471, 480, 1083
604 <-> 138, 1003
605 <-> 1703
606 <-> 1289
607 <-> 1309
608 <-> 808, 1100
609 <-> 529, 1621, 1943
610 <-> 194, 610
611 <-> 1337, 1609
612 <-> 980, 1350
613 <-> 468, 583
614 <-> 25, 173, 1623, 1914
615 <-> 364, 775
616 <-> 266, 290
617 <-> 1514
618 <-> 1031
619 <-> 494, 1761
620 <-> 1126, 1150, 1221, 1513, 1712
621 <-> 1770
622 <-> 144, 1761
623 <-> 1367
624 <-> 42, 131
625 <-> 106, 914
626 <-> 1849
627 <-> 1477
628 <-> 1379
629 <-> 969
630 <-> 1114
631 <-> 218, 1935, 1979
632 <-> 1015, 1665, 1816, 1819
633 <-> 1326, 1628
634 <-> 1347, 1720
635 <-> 816
636 <-> 636
637 <-> 414, 1566
638 <-> 1668
639 <-> 544, 824, 1542
640 <-> 87
641 <-> 298, 1196
642 <-> 552, 1619
643 <-> 972
644 <-> 814
645 <-> 393, 1148, 1205, 1302
646 <-> 969
647 <-> 935, 1575
648 <-> 648, 1424
649 <-> 1794
650 <-> 429, 854, 1586, 1711
651 <-> 198, 370
652 <-> 996, 1996
653 <-> 150, 1919
654 <-> 654
655 <-> 658
656 <-> 289
657 <-> 978, 1954
658 <-> 200, 655
659 <-> 0, 825, 1258, 1792
660 <-> 550, 1232
661 <-> 661, 1405
662 <-> 662
663 <-> 598
664 <-> 1014
665 <-> 371, 570, 1247
666 <-> 989, 1778
667 <-> 227, 348, 387, 433
668 <-> 362, 462, 703, 1091
669 <-> 1184
670 <-> 143
671 <-> 671, 901
672 <-> 171, 552
673 <-> 1865
674 <-> 972, 1961
675 <-> 104, 1581, 1800
676 <-> 334, 1995
677 <-> 1836
678 <-> 52
679 <-> 169
680 <-> 331
681 <-> 823
682 <-> 921
683 <-> 1800
684 <-> 750, 1505
685 <-> 722, 1338, 1993
686 <-> 269, 322
687 <-> 989, 1178
688 <-> 1338
689 <-> 1535
690 <-> 13, 690
691 <-> 289, 721
692 <-> 442, 1014
693 <-> 295
694 <-> 154, 862
695 <-> 1552, 1735
696 <-> 1044
697 <-> 993, 1793, 1801
698 <-> 698
699 <-> 463, 1022, 1399
700 <-> 897, 1085
701 <-> 1782, 1987
702 <-> 284
703 <-> 668, 1031
704 <-> 704, 849
705 <-> 31
706 <-> 1909
707 <-> 1276
708 <-> 1301
709 <-> 532, 1607
710 <-> 1094
711 <-> 75, 593, 1251, 1297
712 <-> 184, 712
713 <-> 221, 388, 713
714 <-> 198
715 <-> 1607
716 <-> 1110
717 <-> 554, 1819
718 <-> 1755
719 <-> 472, 1942
720 <-> 1043, 1984
721 <-> 691, 1641
722 <-> 685, 1360, 1679
723 <-> 54, 174, 552, 575
724 <-> 1466
725 <-> 1231
726 <-> 342, 1023
727 <-> 24
728 <-> 1928
729 <-> 975, 1759
730 <-> 28, 112, 424, 1324
731 <-> 731
732 <-> 76, 1698
733 <-> 1895
734 <-> 278
735 <-> 571, 1440
736 <-> 239
737 <-> 0, 1214, 1949
738 <-> 575, 985
739 <-> 1467
740 <-> 740, 1449, 1885
741 <-> 1243
742 <-> 845, 1588, 1676, 1956, 1980
743 <-> 399
744 <-> 744, 1990
745 <-> 298, 1966
746 <-> 601, 1294, 1601
747 <-> 175, 1106
748 <-> 1433, 1565, 1795
749 <-> 366, 582
750 <-> 548, 684, 1210
751 <-> 751, 1967
752 <-> 765, 1297
753 <-> 461
754 <-> 754
755 <-> 597, 1089
756 <-> 756
757 <-> 1350, 1936
758 <-> 444, 1044, 1279
759 <-> 996, 1310
760 <-> 1943
761 <-> 217, 1333
762 <-> 1671
763 <-> 1761
764 <-> 1881
765 <-> 419, 752
766 <-> 363, 928, 1100
767 <-> 1220, 1986
768 <-> 1337
769 <-> 406, 1307
770 <-> 467, 594, 1707
771 <-> 1624, 1782
772 <-> 1230
773 <-> 514, 1266, 1305
774 <-> 113, 1198
775 <-> 615, 1753
776 <-> 1307
777 <-> 1785
778 <-> 778, 1776
779 <-> 992
780 <-> 1406
781 <-> 781, 1272
782 <-> 93, 395, 1207
783 <-> 1544, 1729
784 <-> 225, 1168, 1587
785 <-> 1050
786 <-> 140, 162, 458, 786, 1060
787 <-> 1210
788 <-> 1431
789 <-> 76
790 <-> 164, 882
791 <-> 166, 1688
792 <-> 792, 946
793 <-> 214, 561
794 <-> 5, 1561
795 <-> 575, 1208, 1875
796 <-> 14, 1205, 1427
797 <-> 336, 1006, 1352
798 <-> 1176, 1754
799 <-> 251, 375
800 <-> 840, 1471
801 <-> 801, 1246, 1897
802 <-> 575
803 <-> 1692
804 <-> 565, 859, 1978
805 <-> 288, 1447
806 <-> 88, 598
807 <-> 219, 1579
808 <-> 608
809 <-> 335, 867, 1734, 1843
810 <-> 1279
811 <-> 294, 1043, 1560, 1583, 1600
812 <-> 1487, 1527
813 <-> 42, 1405
814 <-> 242, 644, 1175, 1638
815 <-> 1050, 1177
816 <-> 218, 635, 1427
817 <-> 416
818 <-> 1765, 1999
819 <-> 141, 533
820 <-> 1238, 1393
821 <-> 504, 1755
822 <-> 1320, 1397
823 <-> 681, 1120, 1798
824 <-> 639
825 <-> 659
826 <-> 1722, 1834
827 <-> 193, 602, 968
828 <-> 233, 1835
829 <-> 465
830 <-> 951
831 <-> 1606
832 <-> 1619, 1964
833 <-> 1109
834 <-> 7, 962, 1869
835 <-> 141
836 <-> 167, 875, 1145
837 <-> 1752
838 <-> 838, 1146
839 <-> 1247
840 <-> 800
841 <-> 1337
842 <-> 1438, 1466
843 <-> 102
844 <-> 284
845 <-> 742
846 <-> 382, 574
847 <-> 79, 398, 409
848 <-> 959
849 <-> 9, 704
850 <-> 915, 1455, 1911, 1987
851 <-> 531, 1001
852 <-> 434, 1172
853 <-> 310, 1533
854 <-> 650
855 <-> 483, 868, 1598
856 <-> 222, 534, 1133
857 <-> 857, 1249, 1923
858 <-> 412, 1540, 1575, 1607
859 <-> 804, 1655
860 <-> 564, 1243
861 <-> 296, 350, 1130, 1521
862 <-> 694
863 <-> 272, 391, 1558
864 <-> 309, 1071, 1227
865 <-> 1537, 1669, 1825
866 <-> 99, 474
867 <-> 809, 867, 1004
868 <-> 855, 1539
869 <-> 1550
870 <-> 1885
871 <-> 49
872 <-> 326, 378, 1552
873 <-> 1307
874 <-> 62, 438
875 <-> 836, 1056, 1326
876 <-> 876
877 <-> 1933
878 <-> 52, 128, 1527
879 <-> 879
880 <-> 1292, 1561, 1770
881 <-> 881, 981
882 <-> 790, 882, 932
883 <-> 1322, 1963
884 <-> 1842
885 <-> 885
886 <-> 33, 80, 1765, 1959
887 <-> 1012
888 <-> 276
889 <-> 1391
890 <-> 140
891 <-> 114, 891
892 <-> 160, 507
893 <-> 236, 502, 1602
894 <-> 1525
895 <-> 41
896 <-> 382
897 <-> 700
898 <-> 299
899 <-> 1797
900 <-> 1736
901 <-> 671, 944, 1147
902 <-> 1597, 1940
903 <-> 1283
904 <-> 17, 91, 557, 1169, 1764
905 <-> 505
906 <-> 9, 69, 942
907 <-> 80, 211, 1348
908 <-> 1398
909 <-> 909
910 <-> 1683
911 <-> 73, 911
912 <-> 1929
913 <-> 12, 491, 1591
914 <-> 169, 243, 625, 1867
915 <-> 850, 1538
916 <-> 83
917 <-> 378
918 <-> 1438
919 <-> 1951
920 <-> 1814
921 <-> 360, 682, 1952
922 <-> 922
923 <-> 107, 1161, 1254
924 <-> 222
925 <-> 1691
926 <-> 575
927 <-> 1165, 1270
928 <-> 368, 766
929 <-> 1707, 1914
930 <-> 145, 1096, 1434, 1791
931 <-> 931, 1983
932 <-> 882
933 <-> 502, 1921
934 <-> 1297
935 <-> 647, 1319
936 <-> 1255
937 <-> 1210
938 <-> 11
939 <-> 1348, 1666
940 <-> 1408
941 <-> 1440
942 <-> 906
943 <-> 1977
944 <-> 901
945 <-> 126
946 <-> 792
947 <-> 44, 1400
948 <-> 948, 1045
949 <-> 967
950 <-> 355
951 <-> 68, 830, 969
952 <-> 1225, 1757, 1929
953 <-> 1534, 1726
954 <-> 1511, 1888
955 <-> 183, 1418
956 <-> 1702
957 <-> 425
958 <-> 372
959 <-> 848, 1512
960 <-> 1868
961 <-> 1509
962 <-> 834, 1678
963 <-> 160
964 <-> 101, 161
965 <-> 355
966 <-> 1740, 1866
967 <-> 949, 1802
968 <-> 827, 1534
969 <-> 629, 646, 951
970 <-> 311
971 <-> 35, 1670
972 <-> 643, 674, 1449
973 <-> 358
974 <-> 974
975 <-> 729, 1955
976 <-> 1495
977 <-> 1603, 1889
978 <-> 337, 465, 657, 1615, 1953
979 <-> 1801
980 <-> 115, 612, 1239
981 <-> 881
982 <-> 2, 234, 1411, 1511
983 <-> 1970
984 <-> 227, 984
985 <-> 191, 569, 738
986 <-> 1926
987 <-> 987
988 <-> 126, 237, 1894
989 <-> 666, 687, 1079
990 <-> 301, 452, 1903
991 <-> 481, 1435
992 <-> 110, 779, 1637
993 <-> 21, 289, 697, 1675
994 <-> 1151, 1639
995 <-> 1090, 1798
996 <-> 652, 759, 1229
997 <-> 1253, 1380, 1553
998 <-> 350, 1812
999 <-> 1128
1000 <-> 1566
1001 <-> 851
1002 <-> 103, 1229
1003 <-> 604, 1156, 1232, 1420
1004 <-> 23, 867
1005 <-> 1085, 1174, 1899
1006 <-> 797
1007 <-> 63, 1282
1008 <-> 219, 1008, 1977
1009 <-> 265, 384, 1731
1010 <-> 275, 1438, 1474
1011 <-> 1289
1012 <-> 166, 235, 887, 1342, 1471
1013 <-> 1013, 1886
1014 <-> 664, 692, 1229
1015 <-> 632, 1015
1016 <-> 579
1017 <-> 161, 528
1018 <-> 323
1019 <-> 1684
1020 <-> 125
1021 <-> 1036, 1450
1022 <-> 699, 1600, 1962
1023 <-> 263, 726
1024 <-> 1295
1025 <-> 154, 1025
1026 <-> 268, 572, 1610
1027 <-> 239, 1269
1028 <-> 291, 1275
1029 <-> 418, 479, 1957
1030 <-> 1184
1031 <-> 618, 703
1032 <-> 345
1033 <-> 61, 339, 1033
1034 <-> 1166, 1291
1035 <-> 31, 41
1036 <-> 1021, 1228
1037 <-> 28, 443, 1227
1038 <-> 1178
1039 <-> 94, 1578
1040 <-> 320, 1992
1041 <-> 1041
1042 <-> 32, 1486
1043 <-> 720, 811
1044 <-> 157, 590, 696, 758, 1433, 1739
1045 <-> 948
1046 <-> 559, 1241
1047 <-> 199, 1962
1048 <-> 370
1049 <-> 276, 1885
1050 <-> 785, 815
1051 <-> 1051, 1290
1052 <-> 1165
1053 <-> 193, 1446, 1488
1054 <-> 1081
1055 <-> 6
1056 <-> 875
1057 <-> 128, 1137
1058 <-> 1112, 1173
1059 <-> 1226, 1538
1060 <-> 786
1061 <-> 375, 1639, 1988
1062 <-> 1748
1063 <-> 210, 1692
1064 <-> 444
1065 <-> 316, 600, 1689
1066 <-> 1709
1067 <-> 1067
1068 <-> 1068
1069 <-> 350
1070 <-> 1196
1071 <-> 365, 864, 1827
1072 <-> 446, 1142
1073 <-> 1931
1074 <-> 1529
1075 <-> 1075
1076 <-> 4, 1717, 1879, 1969
1077 <-> 338
1078 <-> 509, 590
1079 <-> 989, 1282
1080 <-> 139, 286
1081 <-> 1054, 1992
1082 <-> 1115, 1451, 1704
1083 <-> 603, 1271
1084 <-> 568, 1233
1085 <-> 700, 1005, 1939
1086 <-> 132, 1745, 1901
1087 <-> 1519
1088 <-> 412
1089 <-> 755
1090 <-> 544, 548, 995, 1768
1091 <-> 227, 533, 668, 1141
1092 <-> 95
1093 <-> 1271, 1946
1094 <-> 710, 1102
1095 <-> 1546
1096 <-> 930
1097 <-> 1288
1098 <-> 162, 1933
1099 <-> 1456
1100 <-> 608, 766
1101 <-> 34, 58, 1108
1102 <-> 1094, 1938
1103 <-> 223, 1117
1104 <-> 1457, 1605, 1654
1105 <-> 1105
1106 <-> 92, 747
1107 <-> 1699
1108 <-> 1101, 1201
1109 <-> 354, 833, 1285, 1874
1110 <-> 40, 716
1111 <-> 190, 572, 1440
1112 <-> 1058, 1193
1113 <-> 1113
1114 <-> 325, 630, 1853
1115 <-> 260, 1082
1116 <-> 504
1117 <-> 380, 1103
1118 <-> 1118
1119 <-> 1353, 1871
1120 <-> 823
1121 <-> 492, 1196
1122 <-> 1122
1123 <-> 1725
1124 <-> 1892
1125 <-> 1344
1126 <-> 620
1127 <-> 286, 1138
1128 <-> 999, 1268
1129 <-> 1129
1130 <-> 861
1131 <-> 1874
1132 <-> 1913
1133 <-> 856
1134 <-> 1185, 1767
1135 <-> 451, 1975
1136 <-> 65, 356, 1487
1137 <-> 192, 1057
1138 <-> 1127, 1782
1139 <-> 1240
1140 <-> 64, 390, 1385
1141 <-> 1091
1142 <-> 1072, 1587
1143 <-> 155, 1143
1144 <-> 265
1145 <-> 836, 1401
1146 <-> 838
1147 <-> 901, 1483
1148 <-> 94, 493, 645, 1167
1149 <-> 1818
1150 <-> 620, 1237, 1264
1151 <-> 994, 1844
1152 <-> 299, 1167
1153 <-> 443, 1947
1154 <-> 1803
1155 <-> 489, 1163
1156 <-> 1003, 1635, 1668
1157 <-> 1340, 1809
1158 <-> 231
1159 <-> 57
1160 <-> 1558
1161 <-> 923
1162 <-> 1590
1163 <-> 1155
1164 <-> 145, 1164, 1283
1165 <-> 927, 1052, 1678, 1934
1166 <-> 1034
1167 <-> 240, 1148, 1152, 1462
1168 <-> 784
1169 <-> 595, 904
1170 <-> 421
1171 <-> 1667
1172 <-> 852, 1195, 1323, 1444
1173 <-> 1058, 1389
1174 <-> 1005
1175 <-> 814
1176 <-> 798
1177 <-> 258, 815, 1401
1178 <-> 687, 1038, 1331
1179 <-> 134, 1179
1180 <-> 420
1181 <-> 1181
1182 <-> 267, 1677
1183 <-> 100
1184 <-> 669, 1030, 1969
1185 <-> 498, 1134, 1673, 1750
1186 <-> 165
1187 <-> 1893
1188 <-> 1236, 1365
1189 <-> 1334, 1732
1190 <-> 279
1191 <-> 1620
1192 <-> 1257
1193 <-> 1112
1194 <-> 1770
1195 <-> 187, 1172, 1964
1196 <-> 641, 1070, 1121, 1729
1197 <-> 511, 1273, 1607
1198 <-> 229, 774
1199 <-> 290, 455, 1860
1200 <-> 1901
1201 <-> 1108
1202 <-> 1378
1203 <-> 1591
1204 <-> 229
1205 <-> 645, 796, 1250
1206 <-> 281, 1824
1207 <-> 782
1208 <-> 546, 795, 1700
1209 <-> 249
1210 <-> 750, 787, 937
1211 <-> 527, 1981
1212 <-> 1212, 1369
1213 <-> 1512
1214 <-> 737
1215 <-> 575
1216 <-> 540, 1216
1217 <-> 1312, 1340
1218 <-> 291, 1586
1219 <-> 583, 1554
1220 <-> 117, 767
1221 <-> 411, 620, 1221
1222 <-> 1612, 1710
1223 <-> 1223, 1374
1224 <-> 331
1225 <-> 315, 952, 1263
1226 <-> 1059, 1928
1227 <-> 864, 1037, 1823
1228 <-> 1036, 1613
1229 <-> 589, 996, 1002, 1014, 1906
1230 <-> 247, 468, 772, 1821, 1837
1231 <-> 195, 220, 725
1232 <-> 271, 542, 660, 1003, 1232, 1606
1233 <-> 1084, 1366, 1738
1234 <-> 543, 1408
1235 <-> 524
1236 <-> 183, 1188
1237 <-> 1150
1238 <-> 820, 1521
1239 <-> 980
1240 <-> 1139, 1240
1241 <-> 597, 1046
1242 <-> 1646
1243 <-> 331, 741, 860
1244 <-> 1522, 1870
1245 <-> 1245
1246 <-> 801
1247 <-> 665, 839
1248 <-> 208, 1932
1249 <-> 857
1250 <-> 1205
1251 <-> 711
1252 <-> 1888
1253 <-> 997, 1593
1254 <-> 235, 520, 923, 1382
1255 <-> 936
1256 <-> 1718
1257 <-> 259, 1192
1258 <-> 659, 1917
1259 <-> 392
1260 <-> 1260
1261 <-> 1261, 1376
1262 <-> 1936
1263 <-> 1225
1264 <-> 1150, 1567
1265 <-> 398
1266 <-> 773, 1373
1267 <-> 257, 341, 525
1268 <-> 202, 262, 1128
1269 <-> 1027
1270 <-> 927
1271 <-> 1083, 1093
1272 <-> 781
1273 <-> 1197
1274 <-> 1760
1275 <-> 1028, 1827
1276 <-> 707, 1900
1277 <-> 188
1278 <-> 1463
1279 <-> 758, 810
1280 <-> 1920
1281 <-> 1942
1282 <-> 53, 1007, 1079
1283 <-> 192, 903, 1164, 1690
1284 <-> 512, 1584
1285 <-> 1109, 1285
1286 <-> 272
1287 <-> 160
1288 <-> 15, 1097, 1905
1289 <-> 591, 606, 1011
1290 <-> 1051
1291 <-> 331, 1034
1292 <-> 470, 880
1293 <-> 1501, 1899
1294 <-> 746, 1294
1295 <-> 183, 1024
1296 <-> 1580
1297 <-> 711, 752, 934
1298 <-> 1298
1299 <-> 517, 1299
1300 <-> 1300
1301 <-> 708, 1301
1302 <-> 645
1303 <-> 1355, 1492
1304 <-> 1361, 1746
1305 <-> 773
1306 <-> 334, 1325
1307 <-> 769, 776, 873, 1333
1308 <-> 312, 1851, 1966
1309 <-> 607, 1459, 1496
1310 <-> 759
1311 <-> 1381, 1520
1312 <-> 1217
1313 <-> 1983
1314 <-> 1314
1315 <-> 1315, 1647
1316 <-> 63
1317 <-> 537
1318 <-> 1973
1319 <-> 935, 1517
1320 <-> 531, 822
1321 <-> 27, 1837
1322 <-> 883, 1664
1323 <-> 1172
1324 <-> 730
1325 <-> 1306
1326 <-> 633, 875
1327 <-> 159, 1553
1328 <-> 1974
1329 <-> 1939
1330 <-> 277, 1515
1331 <-> 1178, 1590
1332 <-> 274, 1332
1333 <-> 8, 761, 1307, 1333
1334 <-> 275, 1189, 1482
1335 <-> 1478
1336 <-> 140
1337 <-> 66, 611, 768, 841
1338 <-> 176, 685, 688, 1449
1339 <-> 1339
1340 <-> 301, 1157, 1217, 1630
1341 <-> 27
1342 <-> 1012
1343 <-> 1408
1344 <-> 452, 1125, 1622
1345 <-> 74, 1835
1346 <-> 1860
1347 <-> 634, 1428
1348 <-> 907, 939
1349 <-> 490, 1349
1350 <-> 305, 612, 757
1351 <-> 162
1352 <-> 797, 1818
1353 <-> 1119, 1353
1354 <-> 1436
1355 <-> 1303
1356 <-> 94, 254
1357 <-> 1419, 1664, 1680
1358 <-> 1358
1359 <-> 197
1360 <-> 722, 1909
1361 <-> 1304
1362 <-> 82, 188, 1448
1363 <-> 1752
1364 <-> 501
1365 <-> 1188, 1661
1366 <-> 584, 1233
1367 <-> 623, 1394, 1781
1368 <-> 1886
1369 <-> 1212
1370 <-> 86, 1370
1371 <-> 1772
1372 <-> 191, 1473
1373 <-> 1266
1374 <-> 1223, 1981
1375 <-> 366, 1375
1376 <-> 1261, 1599
1377 <-> 1675
1378 <-> 30, 1202, 1406, 1845
1379 <-> 153, 628, 1557
1380 <-> 180, 997
1381 <-> 1311, 1407, 1666
1382 <-> 1254
1383 <-> 375, 1714
1384 <-> 392
1385 <-> 1140, 1933
1386 <-> 1949
1387 <-> 439, 1387
1388 <-> 1770
1389 <-> 1173, 1679
1390 <-> 123, 453, 1733
1391 <-> 158, 249, 889, 1945
1392 <-> 1881
1393 <-> 820
1394 <-> 18, 181, 355, 1367
1395 <-> 374, 1404
1396 <-> 515, 1860
1397 <-> 200, 822
1398 <-> 472, 908, 1622, 1701
1399 <-> 699
1400 <-> 422, 947, 1551
1401 <-> 1145, 1177
1402 <-> 1764
1403 <-> 1875
1404 <-> 1395
1405 <-> 661, 813
1406 <-> 780, 1378
1407 <-> 1381
1408 <-> 588, 940, 1234, 1343, 1603, 1865
1409 <-> 1427
1410 <-> 164
1411 <-> 88, 982
1412 <-> 1452
1413 <-> 1707, 1766
1414 <-> 121
1415 <-> 318, 1415, 1612
1416 <-> 1416
1417 <-> 232
1418 <-> 361, 955, 1418, 1737
1419 <-> 473, 1357
1420 <-> 1003
1421 <-> 122, 1973
1422 <-> 512, 1870
1423 <-> 248
1424 <-> 648
1425 <-> 1425
1426 <-> 224, 1946
1427 <-> 796, 816, 1409
1428 <-> 1347
1429 <-> 1810, 1862
1430 <-> 1430
1431 <-> 788, 1488
1432 <-> 259, 1432
1433 <-> 1, 501, 748, 1044
1434 <-> 930
1435 <-> 991
1436 <-> 1354, 1436
1437 <-> 253
1438 <-> 522, 558, 842, 918, 1010
1439 <-> 1649
1440 <-> 735, 941, 1111
1441 <-> 1707
1442 <-> 305, 1930
1443 <-> 357
1444 <-> 1172
1445 <-> 162, 270, 1636
1446 <-> 1053
1447 <-> 220, 292, 805
1448 <-> 1362
1449 <-> 740, 972, 1338
1450 <-> 100, 237, 1021
1451 <-> 5, 1082
1452 <-> 1412, 1572
1453 <-> 556
1454 <-> 1454
1455 <-> 850
1456 <-> 125, 268, 1099
1457 <-> 240, 1104
1458 <-> 18, 1576
1459 <-> 1309, 1503
1460 <-> 84, 371
1461 <-> 1747, 1879
1462 <-> 3, 1167, 1807
1463 <-> 377, 1278, 1499, 1971
1464 <-> 1908
1465 <-> 72
1466 <-> 724, 842
1467 <-> 410, 739
1468 <-> 67
1469 <-> 155, 1652
1470 <-> 268, 469, 486
1471 <-> 800, 1012, 1471, 1510
1472 <-> 39
1473 <-> 1372
1474 <-> 1010, 1915
1475 <-> 467, 1658
1476 <-> 1476
1477 <-> 627, 1477
1478 <-> 427, 1335, 1907
1479 <-> 348
1480 <-> 1480
1481 <-> 1802
1482 <-> 1334
1483 <-> 1147, 1524
1484 <-> 42, 525
1485 <-> 539
1486 <-> 148, 1042, 1549
1487 <-> 812, 1136
1488 <-> 1053, 1431
1489 <-> 1708, 1931
1490 <-> 1807
1491 <-> 431
1492 <-> 156, 1303
1493 <-> 1493
1494 <-> 1853
1495 <-> 446, 976
1496 <-> 395, 1309
1497 <-> 195, 396, 1974
1498 <-> 490, 1626
1499 <-> 76, 1463
1500 <-> 1722
1501 <-> 577, 1293
1502 <-> 115
1503 <-> 1459, 1507
1504 <-> 210, 261, 578, 1521, 1718
1505 <-> 230, 426, 684, 1634
1506 <-> 382, 1921
1507 <-> 1503
1508 <-> 162, 1667
1509 <-> 961, 1509
1510 <-> 1471
1511 <-> 954, 982, 1582
1512 <-> 476, 959, 1213, 1703
1513 <-> 353, 620
1514 <-> 617, 1546
1515 <-> 1330, 1595
1516 <-> 1946
1517 <-> 42, 1319
1518 <-> 585
1519 <-> 32, 1087
1520 <-> 1311
1521 <-> 861, 1238, 1504
1522 <-> 1244, 1653
1523 <-> 1523
1524 <-> 1483
1525 <-> 894, 1525
1526 <-> 1924
1527 <-> 812, 878
1528 <-> 494
1529 <-> 59, 1074
1530 <-> 1530
1531 <-> 34, 1531
1532 <-> 1638
1533 <-> 853
1534 <-> 953, 968
1535 <-> 108, 689
1536 <-> 1589
1537 <-> 394, 865
1538 <-> 915, 1059
1539 <-> 868
1540 <-> 858, 1745
1541 <-> 221
1542 <-> 639
1543 <-> 1746
1544 <-> 783, 1544
1545 <-> 236
1546 <-> 66, 1095, 1514
1547 <-> 1628
1548 <-> 1548
1549 <-> 433, 1486
1550 <-> 869, 1550
1551 <-> 1400, 1787
1552 <-> 695, 872
1553 <-> 997, 1327
1554 <-> 1219
1555 <-> 97
1556 <-> 1840
1557 <-> 7, 1379
1558 <-> 126, 863, 1160
1559 <-> 336, 373
1560 <-> 343, 811
1561 <-> 278, 794, 880, 1561
1562 <-> 127, 518, 1562
1563 <-> 406
1564 <-> 81, 399
1565 <-> 748
1566 <-> 637, 1000
1567 <-> 1264
1568 <-> 1568
1569 <-> 214
1570 <-> 561, 1849
1571 <-> 282
1572 <-> 44, 130, 178, 1452
1573 <-> 107
1574 <-> 299
1575 <-> 647, 858
1576 <-> 1458, 1633
1577 <-> 1833, 1939
1578 <-> 1039, 1802
1579 <-> 807, 1853
1580 <-> 1296, 1580, 1907
1581 <-> 675
1582 <-> 1511, 1605, 1756
1583 <-> 811
1584 <-> 1284
1585 <-> 1817
1586 <-> 168, 650, 1218
1587 <-> 784, 1142
1588 <-> 742
1589 <-> 45, 209, 413, 1536
1590 <-> 25, 201, 1162, 1331
1591 <-> 913, 1203
1592 <-> 1820
1593 <-> 1253
1594 <-> 231
1595 <-> 149, 1515
1596 <-> 57, 1976
1597 <-> 586, 902
1598 <-> 855
1599 <-> 1376
1600 <-> 811, 1022
1601 <-> 284, 746
1602 <-> 386, 893
1603 <-> 135, 977, 1408
1604 <-> 452, 513
1605 <-> 1104, 1582
1606 <-> 831, 1232
1607 <-> 709, 715, 858, 1197
1608 <-> 1793
1609 <-> 611, 1808
1610 <-> 1026, 1964
1611 <-> 304
1612 <-> 1222, 1415, 1769
1613 <-> 1228, 1847
1614 <-> 273
1615 <-> 978
1616 <-> 156, 355
1617 <-> 177
1618 <-> 1618
1619 <-> 323, 642, 832
1620 <-> 113, 349, 1191, 1746
1621 <-> 609
1622 <-> 519, 1344, 1398
1623 <-> 614
1624 <-> 771, 1989
1625 <-> 1625
1626 <-> 1498
1627 <-> 186, 315
1628 <-> 633, 1547
1629 <-> 1706
1630 <-> 1340
1631 <-> 297, 1800
1632 <-> 1806
1633 <-> 1576
1634 <-> 1505
1635 <-> 1156
1636 <-> 1445
1637 <-> 76, 992, 1920, 1995
1638 <-> 814, 1532
1639 <-> 994, 1061
1640 <-> 1640
1641 <-> 721
1642 <-> 1739, 1945
1643 <-> 1643
1644 <-> 1644, 1908
1645 <-> 125, 303
1646 <-> 1242, 1646
1647 <-> 1315
1648 <-> 1957
1649 <-> 97, 1439, 1783
1650 <-> 576
1651 <-> 1651
1652 <-> 35, 1469
1653 <-> 1522
1654 <-> 1104
1655 <-> 460, 859
1656 <-> 362
1657 <-> 142, 181
1658 <-> 428, 1475
1659 <-> 470
1660 <-> 247
1661 <-> 1365
1662 <-> 165, 359
1663 <-> 198
1664 <-> 1322, 1357
1665 <-> 447, 632
1666 <-> 939, 1381
1667 <-> 1171, 1508
1668 <-> 638, 1156
1669 <-> 476, 865, 1699
1670 <-> 577, 971
1671 <-> 119, 417, 762, 1804
1672 <-> 50, 1672, 1687
1673 <-> 63, 333, 1185
1674 <-> 1674
1675 <-> 993, 1377
1676 <-> 742, 1813
1677 <-> 233, 1182, 1846
1678 <-> 962, 1165
1679 <-> 722, 1389
1680 <-> 82, 1357
1681 <-> 1681, 1702, 1895
1682 <-> 372
1683 <-> 203, 341, 910
1684 <-> 1019, 1948
1685 <-> 1982
1686 <-> 371
1687 <-> 1672
1688 <-> 791
1689 <-> 1065, 1689
1690 <-> 1283
1691 <-> 925, 1878
1692 <-> 803, 1063, 1732
1693 <-> 487
1694 <-> 600
1695 <-> 1695, 1794
1696 <-> 1696
1697 <-> 1802
1698 <-> 357, 732
1699 <-> 1107, 1669
1700 <-> 1208
1701 <-> 1398
1702 <-> 956, 1681
1703 <-> 605, 1512
1704 <-> 1082
1705 <-> 343
1706 <-> 1629, 1775
1707 <-> 770, 929, 1413, 1441
1708 <-> 367, 1489
1709 <-> 1066, 1862
1710 <-> 1222
1711 <-> 650
1712 <-> 620
1713 <-> 1713
1714 <-> 1383
1715 <-> 1911
1716 <-> 510, 1716
1717 <-> 1076
1718 <-> 1256, 1504
1719 <-> 238
1720 <-> 549, 634, 1720
1721 <-> 15
1722 <-> 826, 1500
1723 <-> 1880
1724 <-> 177, 1724
1725 <-> 514, 1123, 1797
1726 <-> 482, 953
1727 <-> 1914
1728 <-> 216, 1982
1729 <-> 579, 783, 1196, 1800
1730 <-> 1730, 1972
1731 <-> 1009
1732 <-> 89, 1189, 1692
1733 <-> 1390
1734 <-> 809
1735 <-> 455, 695
1736 <-> 900, 1736
1737 <-> 530, 1418
1738 <-> 1233, 1888
1739 <-> 1044, 1642, 1834
1740 <-> 966
1741 <-> 145, 253
1742 <-> 112
1743 <-> 1980
1744 <-> 139
1745 <-> 1086, 1540
1746 <-> 1304, 1543, 1620
1747 <-> 117, 354, 1461
1748 <-> 45, 273, 332, 1062
1749 <-> 249
1750 <-> 124, 1185
1751 <-> 1835
1752 <-> 104, 837, 1363
1753 <-> 245, 775
1754 <-> 798, 1876
1755 <-> 453, 718, 821
1756 <-> 1582
1757 <-> 952, 1772, 1841
1758 <-> 1758, 1830, 1878
1759 <-> 729
1760 <-> 104, 1274
1761 <-> 224, 619, 622, 763, 1868
1762 <-> 1762
1763 <-> 537
1764 <-> 904, 1402
1765 <-> 521, 818, 886, 1782
1766 <-> 421, 1413
1767 <-> 1134
1768 <-> 202, 1090
1769 <-> 1612
1770 <-> 621, 880, 1194, 1388
1771 <-> 293
1772 <-> 1371, 1757
1773 <-> 19, 375
1774 <-> 1774
1775 <-> 1706, 1915
1776 <-> 778
1777 <-> 460, 1918
1778 <-> 666
1779 <-> 523, 1846
1780 <-> 427
1781 <-> 1367
1782 <-> 701, 771, 1138, 1765
1783 <-> 482, 1649, 1783
1784 <-> 1784, 1872
1785 <-> 777, 1785
1786 <-> 1858
1787 <-> 1551
1788 <-> 59, 384, 1865
1789 <-> 111
1790 <-> 294, 407, 1969
1791 <-> 238, 930
1792 <-> 659
1793 <-> 489, 538, 697, 1608
1794 <-> 206, 649, 1695
1795 <-> 314, 748
1796 <-> 1796
1797 <-> 899, 1725, 1797
1798 <-> 823, 995
1799 <-> 308, 1799
1800 <-> 675, 683, 1631, 1729
1801 <-> 697, 979, 1858
1802 <-> 967, 1481, 1578, 1697
1803 <-> 1154, 1803
1804 <-> 1671
1805 <-> 199
1806 <-> 264, 1632, 1806
1807 <-> 1462, 1490
1808 <-> 1609, 1808
1809 <-> 1157
1810 <-> 1429
1811 <-> 125
1812 <-> 998
1813 <-> 1676
1814 <-> 358, 485, 920, 1814
1815 <-> 211
1816 <-> 632
1817 <-> 513, 1585
1818 <-> 1149, 1352
1819 <-> 632, 717
1820 <-> 465, 1592
1821 <-> 46, 257, 1230
1822 <-> 492
1823 <-> 1227, 1891
1824 <-> 247, 1206
1825 <-> 182, 865
1826 <-> 501
1827 <-> 3, 1071, 1275
1828 <-> 29
1829 <-> 139
1830 <-> 1758
1831 <-> 542
1832 <-> 1862
1833 <-> 1577
1834 <-> 151, 826, 1739, 1882
1835 <-> 828, 1345, 1751, 1835
1836 <-> 45, 677
1837 <-> 1230, 1321
1838 <-> 165, 1856
1839 <-> 1842, 1953
1840 <-> 183, 1556
1841 <-> 554, 1757
1842 <-> 884, 1839
1843 <-> 464, 809
1844 <-> 291, 570, 1151
1845 <-> 1378
1846 <-> 1677, 1779
1847 <-> 374, 1613
1848 <-> 204, 412
1849 <-> 626, 1570
1850 <-> 1850
1851 <-> 1308
1852 <-> 228, 455
1853 <-> 454, 1114, 1494, 1579
1854 <-> 268, 596
1855 <-> 1855
1856 <-> 1838
1857 <-> 61
1858 <-> 336, 1786, 1801, 1937
1859 <-> 1908
1860 <-> 1199, 1346, 1396
1861 <-> 1861
1862 <-> 1429, 1709, 1832, 1900
1863 <-> 9
1864 <-> 41, 1975
1865 <-> 673, 1408, 1788
1866 <-> 966, 1873
1867 <-> 914
1868 <-> 330, 520, 960, 1761
1869 <-> 2, 834
1870 <-> 1244, 1422
1871 <-> 1119
1872 <-> 1784
1873 <-> 242, 1866
1874 <-> 337, 1109, 1131
1875 <-> 795, 1403
1876 <-> 258, 1754
1877 <-> 34
1878 <-> 481, 1691, 1758
1879 <-> 1076, 1461
1880 <-> 147, 410, 1723
1881 <-> 520, 764, 1392, 1955
1882 <-> 1834
1883 <-> 319, 514
1884 <-> 1969
1885 <-> 740, 870, 1049
1886 <-> 1013, 1368
1887 <-> 1887
1888 <-> 954, 1252, 1738
1889 <-> 977
1890 <-> 446, 530
1891 <-> 1823
1892 <-> 1124, 1892
1893 <-> 395, 1187, 1893
1894 <-> 988
1895 <-> 733, 1681
1896 <-> 11
1897 <-> 77, 801
1898 <-> 545, 1898
1899 <-> 1005, 1293
1900 <-> 511, 1276, 1862
1901 <-> 1086, 1200
1902 <-> 410
1903 <-> 315, 990
1904 <-> 422
1905 <-> 1288, 1905
1906 <-> 1229
1907 <-> 1478, 1580
1908 <-> 1464, 1644, 1859
1909 <-> 706, 1360
1910 <-> 569
1911 <-> 310, 850, 1715
1912 <-> 1912
1913 <-> 279, 1132
1914 <-> 614, 929, 1727
1915 <-> 1474, 1775
1916 <-> 1916
1917 <-> 1258
1918 <-> 382, 1777
1919 <-> 41, 653
1920 <-> 1280, 1637
1921 <-> 933, 1506
1922 <-> 167
1923 <-> 857
1924 <-> 222, 1526, 1924
1925 <-> 231, 367, 1925
1926 <-> 385, 422, 986
1927 <-> 321, 513, 553
1928 <-> 728, 1226
1929 <-> 912, 952, 1965
1930 <-> 1442
1931 <-> 1073, 1489
1932 <-> 1248, 1932
1933 <-> 499, 877, 1098, 1385
1934 <-> 1165
1935 <-> 37, 631
1936 <-> 283, 757, 1262
1937 <-> 1858
1938 <-> 109, 555, 1102
1939 <-> 1085, 1329, 1577
1940 <-> 902, 1940
1941 <-> 364, 583
1942 <-> 719, 1281
1943 <-> 609, 760
1944 <-> 230
1945 <-> 1391, 1642
1946 <-> 1093, 1426, 1516
1947 <-> 1153
1948 <-> 212, 296, 500, 1684
1949 <-> 152, 737, 1386
1950 <-> 133, 296
1951 <-> 919, 1951
1952 <-> 921
1953 <-> 978, 1839
1954 <-> 657
1955 <-> 975, 1881
1956 <-> 55, 71, 235, 742
1957 <-> 1029, 1648
1958 <-> 1958
1959 <-> 886
1960 <-> 196, 301, 495
1961 <-> 674
1962 <-> 576, 1022, 1047
1963 <-> 883
1964 <-> 832, 1195, 1610
1965 <-> 1929
1966 <-> 745, 1308
1967 <-> 751
1968 <-> 524, 1968
1969 <-> 1076, 1184, 1790, 1884
1970 <-> 983, 1970
1971 <-> 1463
1972 <-> 1730
1973 <-> 457, 1318, 1421
1974 <-> 1328, 1497, 1974
1975 <-> 170, 1135, 1864
1976 <-> 1596
1977 <-> 70, 943, 1008
1978 <-> 804
1979 <-> 631
1980 <-> 522, 742, 1743
1981 <-> 1211, 1374
1982 <-> 597, 1685, 1728
1983 <-> 30, 931, 1313
1984 <-> 109, 720
1985 <-> 111
1986 <-> 767
1987 <-> 418, 701, 850
1988 <-> 1061
1989 <-> 1624
1990 <-> 744
1991 <-> 316
1992 <-> 346, 562, 1040, 1081
1993 <-> 685
1994 <-> 573
1995 <-> 381, 676, 1637, 1995
1996 <-> 576, 652
1997 <-> 554
1998 <-> 168
1999 <-> 818
""".components(separatedBy: .newlines)

