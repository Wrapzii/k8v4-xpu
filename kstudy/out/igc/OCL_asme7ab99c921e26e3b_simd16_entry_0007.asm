//.kernel _ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE
//.platform XE2
//.thread_config numGRF=128, numAcc=4, numSWSB=16
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 3886782921 568487483 -hashmovs1 0 7 "
//.full_options "-emitLocation -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemptionR0Only -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortOnSpill 4 -enableBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 100 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 3886782921 568487483 -hashmovs1 0 7 -GRFBumpUpNumber 2 "
//.instCount 528
//.RA type	LOCAL_FIRST_FIT_BC_RA
//.git-hash 3eef0f89d3a4fe2b443de595e23d7700a5d1491b

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r19.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare %null (10)  rf=r size=4 type=ud align=32 words
//.declare %local_id_x (13)  rf=r size=4 type=ud align=2 words (r4.1)
//.declare %local_id_y (14)  rf=r size=4 type=ud align=2 words (r4.2)
//.declare %local_size_x (15)  rf=r size=4 type=ud align=2 words (r3.13)
//.declare %local_size_y (16)  rf=r size=4 type=ud align=2 words (r3.14)
//.declare %group_id_x (17)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (18)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (19)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (20)  rf=r size=4 type=ud align=2 words (r3.15)
//.declare %group_count_y (21)  rf=r size=4 type=ud align=2 words (r4.0)
//.declare %tsc (22)  rf=r size=20 type=ud align=2 words
//.declare %arg (23)  rf=r size=0 type=ud align=32 words (r26.0)
//.declare %retval (24)  rf=r size=0 type=ud align=32 words (r26.0) Output
//.declare %sp (25)  rf=r size=8 type=uq align=32 words (r127.3)
//.declare %fp (26)  rf=r size=8 type=uq align=32 words (r127.2)
//.declare %sr0 (27)  rf=r size=16 type=ud align=2 words
//.declare %cr0 (28)  rf=r size=12 type=ud align=2 words
//.declare %ce0 (29)  rf=r size=4 type=ud align=2 words
//.declare %dbg0 (30)  rf=r size=8 type=ud align=2 words
//.declare implBufPtr (32)  rf=r size=8 type=uq align=32 words (r126.0)
//.declare localIdBufPtr (33)  rf=r size=8 type=uq align=32 words (r126.3)
//.declare %msg0 (34)  rf=r size=12 type=ud align=2 words
//.declare %scratchloc (35)  rf=r size=8 type=uq align=4 words (s0.7)
//.declare V0033 (43)  rf=r size=64 type=d alias=+0 align=32 words (r19.0)
//.declare V0034 (44)  rf=r size=8 type=uq align=4 words (r2.0)
//.declare V0035 (45)  rf=r size=8 type=q align=4 words (r3.1)
//.declare V0036 (46)  rf=r size=8 type=uq align=4 words (r2.1)
//.declare V0037 (47)  rf=r size=8 type=q align=4 words (r3.2)
//.declare V0038 (48)  rf=r size=8 type=uq align=4 words (r2.2)
//.declare V0039 (49)  rf=r size=8 type=uq align=4 words (r2.3)
//.declare V0040 (50)  rf=r size=8 type=uq align=4 words (r3.0)
//.declare V0041 (51)  rf=r size=8 type=q align=4 words (r3.3)
//.declare V0043 (53)  rf=r size=32 type=d alias=+0 align=32 words (r19.0)
//.declare V0045 (55)  rf=r size=12 type=d align=2 words (r3.10)
//.declare V0046 (56)  rf=r size=32 type=w align=16 words (r1.0)
//.declare V0049 (59)  rf=r size=8 type=uq align=4 words (r3.4)
//.declare V0062 (72)  rf=r size=4 type=d align=2 words (r126.0)
//.declare V0064 (74)  rf=r size=4 type=ud alias=V0062+0 align=2 words (r126.0)
//.declare V0065 (75)  rf=r size=8 type=q align=4 words (r20.0)
//.declare V0067 (77)  rf=r size=8 type=uq alias=V0065+0 align=4 words (r20.0)
//.declare V0070 (80)  rf=r size=8 type=q align=4 words (r126.1)
//.declare V0071 (81)  rf=r size=8 type=d alias=V0070+0 align=4 words (r126.2)
//.declare V0072 (82)  rf=r size=8 type=q alias=V0034+0 align=32 words (r2.0)
//.declare V0073 (83)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0074 (84)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0075 (85)  rf=r size=8 type=uq alias=V0074+0 align=32 words (r4.0)
//.declare V0076 (86)  rf=r size=8 type=q align=32 words (r21.0)
//.declare V0077 (87)  rf=r size=4 type=d align=2 words (r126.1)
//.declare V0078 (88)  rf=r size=8 type=d alias=V0076+0 align=32 words (r21.0)
//.declare V0079 (89)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0080 (90)  rf=r size=8 type=uq alias=V0076+0 align=32 words (r21.0)
//.declare V0081 (91)  rf=r size=8 type=uq alias=V0079+0 align=4 words (r2.4)
//.declare P01 (93)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0083 (94)  rf=r size=4 type=d align=2 words (r20.2)
//.declare P02 (95)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0084 (96)  rf=r size=4 type=d align=2 words (r126.4)
//.declare V0085 (97)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0086 (98)  rf=r size=8 type=d alias=V0035+0 align=32 words (r3.2)
//.declare P03 (99)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0087 (100)  rf=r size=4 type=ud alias=V0083+0 align=2 words (r20.2)
//.declare V0088 (101)  rf=r size=8 type=ud alias=V0085+0 align=2 words (r1.8)
//.declare P04 (102)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare P05 (103)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare P06 (104)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0089 (105)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0090 (106)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0091 (107)  rf=r size=8 type=q alias=V0036+0 align=32 words (r2.1)
//.declare V0092 (108)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0093 (109)  rf=r size=8 type=q align=4 words (r20.2)
//.declare V0094 (110)  rf=r size=64 type=d align=32 words (r125.0)
//.declare V0095 (111)  rf=r size=32 type=uw alias=V0046+0 align=32 words (r1.0)
//.declare P07 (112)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0096 (113)  rf=r size=64 type=f align=32 words (r22.0)
//.declare V0097 (114)  rf=r size=64 type=f align=32 words (r124.0)
//.declare V0098 (115)  rf=r size=64 type=d align=32 words (r23.0)
//.declare V0099 (116)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0101 (118)  rf=r size=64 type=ud alias=V0099+0 align=32 words (r4.0)
//.declare V0102 (119)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0103 (120)  rf=r size=128 type=uq alias=V0102+0 align=32 words (r8.0)
//.declare V0105 (122)  rf=r size=64 type=ud align=32 words (r7.0)
//.declare V0106 (123)  rf=r size=64 type=hf alias=V0105+0 align=32 words (r7.0)
//.declare V0107 (124)  rf=r size=64 type=f align=32 words (r11.0)
//.declare P08 (125)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0108 (126)  rf=r size=64 type=ud alias=V0098+0 align=32 words (r23.0)
//.declare V0110 (128)  rf=r size=4 type=f align=32 words (r123.0)
//.declare V0111 (129)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0112 (130)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0113 (131)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0114 (132)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (133)  rf=r size=64 type=ud align=32 words (r11.0)
//.declare  (134)  rf=r size=32 type=ud align=32 words (r12.0)
//.declare V0115 (135)  rf=r size=32 type=b alias=V0043+0 align=32 words (r19.0)
//.declare V0116 (136)  rf=r size=1 type=b align=1 words (r1.32)
//.declare V0117 (137)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0118 (138)  rf=r size=4 type=d align=32 words (r5.0)
//.declare V0119 (139)  rf=r size=4 type=d align=2 words (r20.3)
//.declare V0120 (140)  rf=r size=4 type=d align=2 words (r126.5)
//.declare V0121 (141)  rf=r size=4 type=ud alias=V0119+0 align=2 words (r20.3)
//.declare V0122 (142)  rf=r size=4 type=ud alias=V0120+0 align=2 words (r126.5)
//.declare V0123 (143)  rf=r size=32 type=w align=32 words (r24.0)
//.declare V0124 (144)  rf=r size=4 type=d align=2 words (r2.8)
//.declare V0125 (145)  rf=r size=4 type=d align=2 words (r2.9)
//.declare V0126 (146)  rf=r size=4 type=d align=2 words (r126.6)
//.declare V0127 (147)  rf=r size=1 type=ub alias=V0116+0 align=1 words (r1.32)
//.declare P09 (148)  rf=f1  size=2 type=uw align=1 words (f2.0)
//.declare V0128 (149)  rf=r size=4 type=ud alias=V0125+0 align=2 words (r2.9)
//.declare V0129 (150)  rf=r size=4 type=ud alias=V0126+0 align=2 words (r126.6)
//.declare P10 (151)  rf=f1  size=2 type=uw align=1 words (f1.0)
//.declare V0130 (152)  rf=r size=4 type=d align=2 words (r20.6)
//.declare P11 (153)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0131 (154)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0132 (155)  rf=r size=4 type=ud alias=V0131+0 align=32 words (r4.0)
//.declare  (156)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (157)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare V0133 (158)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0134 (159)  rf=r size=64 type=d align=32 words (r122.0)
//.declare V0135 (160)  rf=r size=32 type=uw alias=V0123+0 align=32 words (r24.0)
//.declare V0136 (161)  rf=r size=64 type=d align=32 words (r25.0)
//.declare P12 (162)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0137 (163)  rf=r size=4 type=d align=2 words (r126.7)
//.declare V0138 (164)  rf=r size=64 type=d align=32 words (r26.0)
//.declare V0139 (165)  rf=r size=64 type=ud alias=V0138+0 align=32 words (r26.0)
//.declare V0140 (166)  rf=r size=4 type=d align=32 words (r121.0)
//.declare V0141 (167)  rf=r size=4 type=ud alias=V0140+0 align=32 words (r121.0)
//.declare V0142 (168)  rf=r size=4 type=d align=2 words (r20.7)
//.declare V0143 (169)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0144 (170)  rf=r size=4 type=d align=2 words (r126.8)
//.declare V0145 (171)  rf=r size=4 type=ud alias=V0143+0 align=2 words (r1.8)
//.declare V0146 (172)  rf=r size=4 type=ud alias=V0144+0 align=2 words (r126.8)
//.declare V0147 (173)  rf=r size=4 type=d align=2 words (r20.8)
//.declare P13 (174)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0148 (175)  rf=r size=64 type=ud alias=V0136+0 align=32 words (r25.0)
//.declare V0149 (176)  rf=r size=4 type=ud alias=V0142+0 align=2 words (r20.7)
//.declare V0150 (177)  rf=r size=64 type=f align=32 words (r120.0)
//.declare  (178)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (179)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P14 (180)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0151 (181)  rf=r size=4 type=ud alias=V0147+0 align=2 words (r20.8)
//.declare V0152 (182)  rf=r size=4 type=f align=32 words (r27.0)
//.declare V0153 (183)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0154 (184)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0155 (185)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0156 (186)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (187)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (188)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P15 (189)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0157 (190)  rf=r size=4 type=d align=2 words (r126.9)
//.declare P16 (191)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0158 (192)  rf=r size=4 type=ud alias=V0137+0 align=2 words (r126.7)
//.declare V0159 (193)  rf=r size=4 type=ud alias=V0130+0 align=2 words (r20.6)
//.declare P17 (194)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0160 (195)  rf=r size=64 type=ud alias=V0134+0 align=32 words (r122.0)
//.declare V0161 (196)  rf=r size=64 type=f align=32 words (r28.0)
//.declare V0162 (197)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0163 (198)  rf=r size=64 type=ud alias=V0162+0 align=32 words (r4.0)
//.declare V0164 (199)  rf=r size=4 type=f align=2 words (r126.10)
//.declare V0165 (200)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0166 (201)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0167 (202)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0168 (203)  rf=r size=8 type=f align=32 words (r10.0)
//.declare V0169 (204)  rf=r size=4 type=f align=32 words (r29.0)
//.declare V0170 (205)  rf=r size=4 type=ud align=32 words (r4.0)
//.declare P18 (206)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0171 (207)  rf=r size=4 type=d align=2 words (r126.11)
//.declare V0172 (208)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0173 (209)  rf=r size=4 type=ud alias=V0172+0 align=32 words (r4.0)
//.declare V0174 (210)  rf=r size=4 type=f align=32 words (r5.0)
//.declare P19 (211)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0175 (212)  rf=r size=4 type=ud alias=V0171+0 align=2 words (r126.11)
//.declare V0176 (213)  rf=r size=4 type=f align=2 words (r20.9)
//.declare V0177 (214)  rf=r size=4 type=f align=32 words (r119.0)
//.declare V0178 (215)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0179 (216)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0180 (217)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0181 (218)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (219)  rf=r size=64 type=ud align=32 words (r11.0)
//.declare  (220)  rf=r size=32 type=ud align=32 words (r12.0)
//.declare V0182 (221)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0183 (222)  rf=r size=4 type=ud alias=V0182+0 align=32 words (r4.0)
//.declare  (223)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (224)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare V0184 (225)  rf=r size=4 type=d align=2 words (r20.10)
//.declare V0185 (226)  rf=r size=64 type=d align=32 words (r118.0)
//.declare V0186 (227)  rf=r size=64 type=ud alias=V0185+0 align=32 words (r118.0)
//.declare V0187 (228)  rf=r size=4 type=d align=32 words (r30.0)
//.declare V0188 (229)  rf=r size=4 type=ud alias=V0187+0 align=32 words (r30.0)
//.declare V0189 (230)  rf=r size=4 type=d align=2 words (r126.12)
//.declare V0190 (231)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0191 (232)  rf=r size=4 type=ud alias=V0190+0 align=2 words (r1.8)
//.declare V0192 (233)  rf=r size=4 type=d align=2 words (r20.11)
//.declare P20 (234)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0193 (235)  rf=r size=4 type=ud alias=V0189+0 align=2 words (r126.12)
//.declare V0194 (236)  rf=r size=64 type=f align=32 words (r117.0)
//.declare  (237)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (238)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P21 (239)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0195 (240)  rf=r size=4 type=ud alias=V0192+0 align=2 words (r20.11)
//.declare V0196 (241)  rf=r size=4 type=f align=32 words (r31.0)
//.declare V0197 (242)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0198 (243)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0199 (244)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0200 (245)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (246)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (247)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P22 (248)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare P23 (249)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0201 (250)  rf=r size=4 type=ud alias=V0184+0 align=2 words (r20.10)
//.declare P24 (251)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0202 (252)  rf=r size=64 type=f align=32 words (r116.0)
//.declare V0203 (253)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0204 (254)  rf=r size=64 type=ud alias=V0203+0 align=32 words (r4.0)
//.declare V0205 (255)  rf=r size=4 type=f align=2 words (r20.12)
//.declare V0206 (256)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0207 (257)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0208 (258)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0209 (259)  rf=r size=8 type=f align=32 words (r10.0)
//.declare V0210 (260)  rf=r size=4 type=f align=32 words (r115.0)
//.declare V0211 (261)  rf=r size=4 type=ud align=32 words (r4.0)
//.declare P25 (262)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0212 (263)  rf=r size=4 type=d align=2 words (r20.13)
//.declare V0213 (264)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0214 (265)  rf=r size=4 type=ud alias=V0213+0 align=32 words (r4.0)
//.declare V0215 (266)  rf=r size=4 type=f align=32 words (r5.0)
//.declare P26 (267)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0216 (268)  rf=r size=4 type=ud alias=V0212+0 align=2 words (r20.13)
//.declare V0217 (269)  rf=r size=4 type=f align=2 words (r126.13)
//.declare  (270)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (271)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare V0218 (272)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0219 (273)  rf=r size=4 type=f align=2 words (r2.10)
//.declare V0220 (274)  rf=r size=4 type=f align=32 words (r32.0)
//.declare V0221 (275)  rf=r size=4 type=f align=2 words (r123.1)
//.declare V0222 (276)  rf=r size=4 type=f align=2 words (r4.0)
//.declare V0223 (277)  rf=r size=4 type=f align=2 words (r2.8)
//.declare V0224 (278)  rf=r size=4 type=f align=2 words (r5.0)
//.declare V0225 (279)  rf=r size=4 type=f align=2 words (r6.0)
//.declare V0226 (280)  rf=r size=4 type=f align=32 words (r34.0)
//.declare V0227 (281)  rf=r size=4 type=d align=2 words (r126.14)
//.declare V0228 (282)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0229 (283)  rf=r size=4 type=d align=2 words (r2.11)
//.declare V0230 (284)  rf=r size=8 type=d alias=V0228+0 align=4 words (r1.10)
//.declare V0231 (285)  rf=r size=4 type=d align=2 words (r3.8)
//.declare V0234 (288)  rf=r size=4 type=d align=2 words (r2.9)
//.declare V0236 (290)  rf=r size=8 type=q align=4 words (r20.7)
//.declare V0237 (291)  rf=r size=8 type=d alias=V0236+0 align=4 words (r20.14)
//.declare P27 (292)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare P28 (293)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0238 (294)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0239 (295)  rf=r size=8 type=d alias=V0037+0 align=32 words (r3.4)
//.declare V0243 (299)  rf=r size=8 type=ud alias=V0238+0 align=2 words (r1.8)
//.declare V0244 (300)  rf=r size=4 type=d align=32 words (r5.0)
//.declare V0246 (302)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0248 (304)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0249 (305)  rf=r size=8 type=d alias=V0248+0 align=4 words (r4.0)
//.declare V0250 (306)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0251 (307)  rf=r size=8 type=q alias=V0038+0 align=32 words (r2.2)
//.declare V0252 (308)  rf=r size=8 type=q align=4 words (r3.4)
//.declare V0253 (309)  rf=r size=8 type=q align=32 words (r8.0)
//.declare V0254 (310)  rf=r size=8 type=uq alias=V0253+0 align=32 words (r8.0)
//.declare V0255 (311)  rf=r size=8 type=q alias=V0039+0 align=32 words (r2.3)
//.declare V0256 (312)  rf=r size=8 type=q align=32 words (r10.0)
//.declare V0257 (313)  rf=r size=8 type=uq alias=V0256+0 align=32 words (r10.0)
//.declare P29 (314)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0258 (315)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0259 (316)  rf=r size=8 type=d alias=V0041+0 align=32 words (r3.6)
//.declare V0260 (317)  rf=r size=4 type=d align=32 words (r114.0)
//.declare V0261 (318)  rf=r size=4 type=d align=2 words (r21.2)
//.declare V0262 (319)  rf=r size=4 type=ud alias=V0260+0 align=2 words (r114.0)
//.declare V0263 (320)  rf=r size=8 type=ud alias=V0258+0 align=2 words (r1.8)
//.declare V0264 (321)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0266 (323)  rf=r size=4 type=d align=32 words (r5.0)
//.declare P30 (324)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0268 (326)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0269 (327)  rf=r size=8 type=d alias=V0268+0 align=4 words (r1.8)
//.declare V0270 (328)  rf=r size=8 type=q alias=V0040+0 align=32 words (r3.0)
//.declare V0271 (329)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0272 (330)  rf=r size=8 type=q align=4 words (r2.5)
//.declare V0273 (331)  rf=r size=8 type=q align=4 words (r123.1)
//.declare V0274 (332)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0276 (334)  rf=r size=64 type=ud alias=V0274+0 align=32 words (r4.0)
//.declare V0277 (335)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0278 (336)  rf=r size=128 type=uq alias=V0277+0 align=32 words (r8.0)
//.declare V0279 (337)  rf=r size=64 type=d align=32 words (r7.0)
//.declare V0281 (339)  rf=r size=64 type=hf alias=V0279+0 align=32 words (r7.0)
//.declare V0284 (342)  rf=r size=64 type=f align=32 words (r12.0)
//.declare V0287 (345)  rf=r size=64 type=f align=32 words (r14.0)
//.declare V0291 (349)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0293 (351)  rf=r size=64 type=f align=32 words (r5.0)
//.declare V0294 (352)  rf=r size=16 type=b align=32 words (r8.0)
//.declare V0295 (353)  rf=r size=16 type=ub alias=V0294+0 align=32 words (r8.0)
//.declare V0296 (354)  rf=r size=32 type=w align=32 words (r9.0)
//.declare V0297 (355)  rf=r size=16 type=b align=32 words (r10.0)
//.declare V0298 (356)  rf=r size=16 type=ub alias=V0297+0 align=32 words (r10.0)
//.declare V0299 (357)  rf=r size=32 type=w align=32 words (r11.0)
//.declare V0301 (359)  rf=r size=128 type=q align=32 words (r14.0)
//.declare V0302 (360)  rf=r size=128 type=uq alias=V0301+0 align=32 words (r14.0)
//.declare V0303 (361)  rf=r size=32 type=b align=32 words (r16.0)
//.declare V0304 (362)  rf=r size=32 type=ub alias=V0303+0 align=32 words (r16.0)
//.declare V0305 (363)  rf=r size=64 type=ud align=32 words (r17.0)
//.declare P31 (364)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0306 (365)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0307 (366)  rf=r size=64 type=d align=32 words (r5.0)
//.declare V0309 (368)  rf=r size=64 type=ud alias=V0307+0 align=32 words (r5.0)
//.declare V0310 (369)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0311 (370)  rf=r size=128 type=uq alias=V0310+0 align=32 words (r8.0)
//.declare V0312 (371)  rf=r size=64 type=d align=32 words (r10.0)
//.declare V0314 (373)  rf=r size=64 type=hf alias=V0312+0 align=32 words (r10.0)
//.declare V0317 (376)  rf=r size=64 type=f align=32 words (r12.0)
//.declare V0320 (379)  rf=r size=64 type=f align=32 words (r14.0)
//.declare V0324 (383)  rf=r size=64 type=f align=32 words (r5.0)
//.declare V0326 (385)  rf=r size=64 type=f align=32 words (r6.0)
//.declare V0327 (386)  rf=r size=16 type=b align=32 words (r8.0)
//.declare V0328 (387)  rf=r size=16 type=ub alias=V0327+0 align=32 words (r8.0)
//.declare V0329 (388)  rf=r size=32 type=w align=32 words (r9.0)
//.declare V0330 (389)  rf=r size=16 type=b align=32 words (r11.0)
//.declare V0331 (390)  rf=r size=16 type=ub alias=V0330+0 align=32 words (r11.0)
//.declare V0332 (391)  rf=r size=32 type=w align=32 words (r12.0)
//.declare V0334 (393)  rf=r size=64 type=ud alias=V0306+0 align=32 words (r4.0)
//.declare V0335 (394)  rf=r size=128 type=q align=32 words (r16.0)
//.declare V0336 (395)  rf=r size=128 type=uq alias=V0335+0 align=32 words (r16.0)
//.declare V0337 (396)  rf=r size=32 type=b align=32 words (r15.0)
//.declare V0338 (397)  rf=r size=32 type=ub alias=V0337+0 align=32 words (r15.0)
//.declare V0339 (398)  rf=r size=64 type=ud align=32 words (r18.0)
//.declare P32 (399)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0340 (400)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0341 (401)  rf=r size=64 type=d align=32 words (r5.0)
//.declare V0343 (403)  rf=r size=64 type=ud alias=V0341+0 align=32 words (r5.0)
//.declare V0344 (404)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0345 (405)  rf=r size=128 type=uq alias=V0344+0 align=32 words (r8.0)
//.declare V0346 (406)  rf=r size=64 type=d align=32 words (r10.0)
//.declare V0348 (408)  rf=r size=64 type=hf alias=V0346+0 align=32 words (r10.0)
//.declare V0351 (411)  rf=r size=64 type=f align=32 words (r12.0)
//.declare V0354 (414)  rf=r size=64 type=f align=32 words (r14.0)
//.declare V0358 (418)  rf=r size=64 type=f align=32 words (r5.0)
//.declare V0360 (420)  rf=r size=64 type=f align=32 words (r6.0)
//.declare V0361 (421)  rf=r size=16 type=b align=32 words (r8.0)
//.declare V0362 (422)  rf=r size=16 type=ub alias=V0361+0 align=32 words (r8.0)
//.declare V0363 (423)  rf=r size=32 type=w align=32 words (r9.0)
//.declare V0364 (424)  rf=r size=16 type=b align=32 words (r11.0)
//.declare V0365 (425)  rf=r size=16 type=ub alias=V0364+0 align=32 words (r11.0)
//.declare V0366 (426)  rf=r size=32 type=w align=32 words (r12.0)
//.declare V0368 (428)  rf=r size=64 type=ud alias=V0340+0 align=32 words (r4.0)
//.declare V0369 (429)  rf=r size=128 type=q align=32 words (r16.0)
//.declare V0370 (430)  rf=r size=128 type=uq alias=V0369+0 align=32 words (r16.0)
//.declare V0371 (431)  rf=r size=32 type=b align=32 words (r15.0)
//.declare V0372 (432)  rf=r size=32 type=ub alias=V0371+0 align=32 words (r15.0)
//.declare V0373 (433)  rf=r size=64 type=ud align=32 words (r18.0)
//.declare P33 (434)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0374 (435)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0375 (436)  rf=r size=64 type=d align=32 words (r5.0)
//.declare V0377 (438)  rf=r size=64 type=ud alias=V0375+0 align=32 words (r5.0)
//.declare V0378 (439)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0379 (440)  rf=r size=128 type=uq alias=V0378+0 align=32 words (r8.0)
//.declare V0380 (441)  rf=r size=64 type=d align=32 words (r10.0)
//.declare V0382 (443)  rf=r size=64 type=hf alias=V0380+0 align=32 words (r10.0)
//.declare V0385 (446)  rf=r size=64 type=f align=32 words (r12.0)
//.declare V0388 (449)  rf=r size=64 type=f align=32 words (r14.0)
//.declare V0392 (453)  rf=r size=64 type=f align=32 words (r5.0)
//.declare V0394 (455)  rf=r size=64 type=f align=32 words (r6.0)
//.declare V0395 (456)  rf=r size=16 type=b align=32 words (r8.0)
//.declare V0396 (457)  rf=r size=16 type=ub alias=V0395+0 align=32 words (r8.0)
//.declare V0397 (458)  rf=r size=32 type=w align=32 words (r9.0)
//.declare V0398 (459)  rf=r size=16 type=b align=32 words (r11.0)
//.declare V0399 (460)  rf=r size=16 type=ub alias=V0398+0 align=32 words (r11.0)
//.declare V0400 (461)  rf=r size=32 type=w align=32 words (r12.0)
//.declare V0402 (463)  rf=r size=64 type=ud alias=V0374+0 align=32 words (r4.0)
//.declare V0403 (464)  rf=r size=128 type=q align=32 words (r16.0)
//.declare V0404 (465)  rf=r size=128 type=uq alias=V0403+0 align=32 words (r16.0)
//.declare V0405 (466)  rf=r size=32 type=b align=32 words (r15.0)
//.declare V0406 (467)  rf=r size=32 type=ub alias=V0405+0 align=32 words (r15.0)
//.declare V0407 (468)  rf=r size=64 type=ud align=32 words (r18.0)
//.declare  (469)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare  (470)  rf=r size=4 type=d alias=V0079+0 align=2 words (r2.8)
//.declare  (471)  rf=r size=2 type=w align=1 words (r1.20)
//.declare  (473)  rf=r size=2 type=w align=1 words (r2.16)
//.declare  (474)  rf=r size=128 type=ud align=32 words (r5.0)
//.declare  (475)  rf=r size=32 type=uw align=32 words (r10.0)
//.declare  (476)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (477)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (478)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (479)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (480)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (481)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (482)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (483)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (484)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (485)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (486)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (487)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (488)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (489)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (490)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (491)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (492)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (493)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (494)  rf=r size=2 type=w align=1 words (r1.18)
//.declare  (495)  rf=r size=64 type=ub align=32 words (r6.0)
//.declare  (496)  rf=r size=64 type=ub align=32 words (r7.0)
//.declare  (497)  rf=r size=128 type=ud align=32 words (r5.0)
//.declare  (498)  rf=r size=32 type=uw align=32 words (r10.0)
//.declare  (499)  rf=r size=32 type=uw align=32 words (r11.0)
//.declare  (500)  rf=r size=128 type=uw align=32 words (r12.0)
//.declare  (501)  rf=r size=64 type=ub align=32 words (r7.0)
//.declare  (502)  rf=r size=64 type=ub align=32 words (r10.0)
//.declare  (503)  rf=r size=128 type=ud align=32 words (r6.0)
//.declare  (504)  rf=r size=32 type=uw align=32 words (r11.0)
//.declare  (505)  rf=r size=32 type=uw align=32 words (r13.0)
//.declare  (506)  rf=r size=128 type=ud align=32 words (r13.0)
//.declare  (507)  rf=r size=64 type=ub align=32 words (r7.0)
//.declare  (508)  rf=r size=64 type=ub align=32 words (r10.0)
//.declare  (509)  rf=r size=128 type=ud align=32 words (r6.0)
//.declare  (510)  rf=r size=32 type=uw align=32 words (r11.0)
//.declare  (511)  rf=r size=32 type=uw align=32 words (r13.0)
//.declare  (512)  rf=r size=128 type=ud align=32 words (r13.0)
//.declare  (513)  rf=r size=64 type=ub align=32 words (r7.0)
//.declare  (514)  rf=r size=64 type=ub align=32 words (r10.0)
//.declare  (515)  rf=r size=128 type=ud align=32 words (r6.0)
//.declare  (516)  rf=r size=32 type=uw align=32 words (r11.0)
//.declare  (517)  rf=r size=32 type=uw align=32 words (r13.0)
//.declare  (518)  rf=r size=128 type=ud align=32 words (r13.0)
//.declare r0 (519)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (520)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare inlineRegFromTDL (521)  rf=r size=32 type=ud align=2 words (r1.0)
//.declare inlineRegExpectedLocation (522)  rf=r size=32 type=ud align=2 words (r2.0)
//.declare  (523)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (524)  rf=r size=64 type=ud align=32 words (r3.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0046    | :w x 16  |   0x20 | r1       | pti[tid]+0x0     |
// | V0034    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0036    | :uq      |    0x8 | r2+0x8   | inline+0x8       |
// | V0038    | :uq      |    0x8 | r2+0x10  | inline+0x10      |
// | V0039    | :uq      |    0x8 | r2+0x18  | inline+0x18      |
// | V0040    | :uq      |    0x8 | r3       | cti+0x20         |
// | V0035    | :q       |    0x8 | r3+0x8   | cti+0x28         |
// | V0037    | :q       |    0x8 | r3+0x10  | cti+0x30         |
// | V0041    | :q       |    0x8 | r3+0x18  | cti+0x38         |
// | V0049    | :uq      |    0x8 | r3+0x20  | cti+0x40         |
// | V0045    | :d x 3   |    0xC | r3+0x28  | cti+0x48         |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
per_thread_prolog:
(W)     mov (16|M0)              r127.0<1>:ud  0x0:ud                                                //  ALU pipe: int; 
(W)     and (1|M0)               r127.2<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud                       //  ALU pipe: int; 
(W)     and (1|M0)               r127.0<1>:uw  r0.4<0;1,0>:uw    0xFF:uw                             //  ALU pipe: int; 
(W)     add (1|M0)               r127.2<1>:ud  r127.2<0;1,0>:ud  0x40:ud              {I@2}          //  ALU pipe: int; 
(W)     add (1|M0)               r127.2<1>:ud  r127.2<0;1,0>:ud  0x0:ud              {I@1}           //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     mad (1|M0)               r127.0<1>:ud  r127.2<0;0>:ud    r127.0<0;0>:uw    0x40:uw              {I@1} //  ALU pipe: int; 
(W)     mov (8|M0)               r2.0<1>:ud    r1.0<1;1,0>:ud                                        //  ALU pipe: int; 
(W)     load.ugm.d32x16t.a32.ca.cc (1|M0)  r1:1 bti[255][r127:1]   {A@1,$0} // ex_desc:0xFF000000; desc:0x6219D500 // 
// B001: Preds:{B000},  Succs:{B002}
// cross_thread_prolog:
(W)     and (1|M0)               r127.0<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud              {$0.src} //  ALU pipe: int; 
(W)     add (1|M0)               r127.0<1>:ud  r127.0<0;1,0>:ud  0x0:ud              {I@1}           //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     load.ugm.d32x16t.a32.ca.cc (1|M0)  r3:1 bti[255][r127:1]   {I@1,$1} // ex_desc:0xFF000000; desc:0x6219D500 // 
// B002: Preds:{B001},  Succs:{B003, B004}
// _main:
(W)     mov (16|M0)              r19.0<1>:ud   r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     mov (1|M0)               r126.0<1>:d   r19.1<0;1,0>:d                   {Compacted,A@1}      //  ALU pipe: int; $2
(W)     mov (1|M0)               r126.3<1>:d   0:w                                                   //  ALU pipe: int; $7
(W)     shr (1|M0)               r20.0<1>:uq   r126.0<0;1,0>:ud  1:w               {I@2}             //  ALU pipe: int; $4
(W)     and (1|M0)               r126.2<1>:d   r126.0<0;1,0>:d   1:w               {Compacted}       //  ALU pipe: int; $5
(W)     shl (1|M0)               r1.4<1>:q     r20.0<0;1,0>:q    3:w               {@2,$0.dst}       //  ALU pipe: int; $10
(W)     add (1|M0)               r4.0<1>:q     r1.4<0;1,0>:q     r2.0<0;1,0>:q    {I@1}              //  ALU pipe: int; $11
(W)     load.ugm.d64x1t.a64 (1|M0)  r21:1       [r4:1]             {I@1,$2} // ex_desc:0x0; desc:0x2108780 // $12
(W)     mov (1|M0)               r126.1<1>:f   r21.1<0;1,0>:f                   {$2.dst}             //  ALU pipe: float; $13
(W)     shr (1|M0)               r2.4<1>:uq    r21.0<0;1,0>:uq   6:w                                 //  ALU pipe: int; $14
(W)     cmp (16|M0)   (gt)f0.0   null<1>:d     r126.1<0;1,0>:d   -1:w               {F@1}            //  ALU pipe: int; $16
(W&f0.0) sel (1|M0)              r20.2<1>:d    r2.8<0;1,0>:d     -1:w               {I@2}            //  ALU pipe: int; $17
(W)     cmp (16|M0)   (gt)f0.1   null<1>:d     r20.2<0;1,0>:d    -1:w               {I@1}            //  ALU pipe: int; $18
(W&f0.1) jmpi                                _0_080                                                  //  ALU pipe: int; $19
// B003: Preds:{B002},  Succs:{B005}
_0_081:
(W)     mov (1|M0)               r126.4<1>:d   0:w                                                   //  ALU pipe: int; $21
(W)     jmpi                                 _0_082                                                  // $22
// B004: Preds:{B002},  Succs:{B005}
_0_080:
(W)     mov (2|M0)               r1.8<1>:d     r3.2<1;1,0>:d                    {$1.dst}             //  ALU pipe: int; $24
(W)     mov (1|M0)               r1.20<1>:hf   0x0:hf                                                //  ALU pipe: float; $26
(W)     cmp (16|M0)   (lt)f2.0   null<1>:d     r20.2<0;1,0>:ud   r1.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $25
(W)     mov (1|M0)               r2.16<1>:hf   0xFFFF:hf                                             //  ALU pipe: float; $32
(W&f2.0) cmp (16|M0)  (eq)f2.0   null<1>:d     r1.20<0;1,0>:w    r1.9<0;1,0>:d    {F@2}              //  ALU pipe: int; $26
(W&~f2.0) cmp (16|M0) (lt)f2.0   null<1>:d     r1.20<0;1,0>:w    r1.9<0;1,0>:d                       //  ALU pipe: int; $28
(W&f2.0) cmp (16|M0)  (gt)f2.0   null<1>:d     r126.1<0;1,0>:d   -1:w                                //  ALU pipe: int; $30
(W&f2.0) sel (1|M0)              r126.4<1>:d   r2.16<0;1,0>:w    0:w               {F@1}             //  ALU pipe: int; $32
// B005: Preds:{B004, B003},  Succs:{B006, B007}
_0_082:
(W)     shl (1|M0)               r1.4<1>:q     r20.0<0;1,0>:q    10:w                                //  ALU pipe: int; $34
        cmp (16|M0)   (lt)f3.1   null<2>:w     r1.0<1;1,0>:uw    0x100:uw                            //  ALU pipe: int; $39
(W)     shl (1|M0)               r1.5<1>:q     r126.1<0;1,0>:q   9:w                                 //  ALU pipe: int; $35
(W)     add (1|M0)               r2.4<1>:q     r1.4<0;1,0>:q     r2.1<0;1,0>:q    {I@3}              //  ALU pipe: int; $36
        mov (16|M0)              r125.0<1>:d   r1.0<1;1,0>:uw                                        //  ALU pipe: int; $38
(W)     add (1|M0)               r20.2<1>:q    r2.4<0;1,0>:q     r1.5<0;1,0>:q    {I@2}              //  ALU pipe: int; $37
(f3.1)  goto (16|M0)                         _0_083            _0_083                                //  ALU pipe: int; $40
// B006: [inDivergent],  Preds:{B005},  Succs:{B010}
_0_084:
        mov (16|M0)              r22.0<1>:ud   0xFF800000:ud                                         //  ALU pipe: int; $42
        mov (16|M0)              r124.0<1>:f   0x7F800000:f                                          //  ALU pipe: float; $43
        goto (16|M0)                         _0_083            _0_085                                // $44
// B007: [inDivergent],  Preds:{B005},  Succs:{B008}
_0_083:
        join (16|M0)                         _0_085                                                  // 
L736:
        mov (16|M0)              r124.0<1>:f   0x7F800000:f                               {Compacted} //  ALU pipe: float; $46
        mov (16|M0)              r22.0<1>:f    0xFF800000:f                               {Compacted,I@3} //  ALU pipe: float; $47
        mov (16|M0)              r23.0<1>:d    r125.0<1;1,0>:d                  {Compacted}          //  ALU pipe: int; $48
// B008: [inDivergent],  Preds:{B009, B007},  Succs:{B009, B010}
_0_086:
        shl (16|M0)              r4.0<1>:d     r23.0<1;1,0>:d    1:w               {Compacted,I@1}   //  ALU pipe: int; $50
        mov (16|M0)              r5.0<2>:ud    r4.0<1;1,0>:ud                   {I@1}                //  ALU pipe: int; $52
        add (16|M0)              r8.0<1>:q     r20.2<0;1,0>:q    r5.0<2;1,0>:ud   {I@1}              //  ALU pipe: int; $52
        load.ugm.d16u32.a64 (16|M0)  r7:1       [r8:2]             {I@1,$3} // ex_desc:0x0; desc:0x4100B80 // $53
        cmp (16|M0)   (lt)f1.1   null<1>:d     r23.0<1;1,0>:ud   0xE0:uw                             //  ALU pipe: int; $58
        mov (16|M0)              r10.0<1>:uw   r7.0<2;1,0>:uw                   {$3.dst}             //  ALU pipe: int; $55
        mov (16|M0)              r11.0<1>:f    r10.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $55
        sel (16|M0)   (lt)f0.0   r124.0<1>:f   r124.0<1;1,0>:f   r11.0<1;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $56
        sel (16|M0)   (ge)f0.0   r22.0<1>:f    r22.0<1;1,0>:f    r11.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $57
(~f1.1) goto (16|M0)                         _0_085            _0_085                                //  ALU pipe: int; $59
// B009: [inDivergent],  Preds:{B008},  Succs:{B008}
_0_087:
        add (16|M0)              r23.0<1>:d    r23.0<1;1,0>:d    32:w               {Compacted}      //  ALU pipe: int; $61
(W)     jmpi                                 _0_086                                                  // $63
// B010: Preds:{B008, B006},  Succs:{B011, B012}
_0_085:
        join (16|M0)                         L936                                                    // 
L936:
(W)     mov (16|M0)              r4.0<1>:f     0x7F800000:f                               {Compacted} //  ALU pipe: float; $65
        mov (16|M0)              r4.0<1>:f     r124.0<1;1,0>:f                  {Compacted,F@3}      //  ALU pipe: float; $66
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $67
(W)     sel (8|M0)    (lt)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $67
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $68
(W)     sel (4|M0)    (lt)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $68
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $69
(W)     sel (2|M0)    (lt)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $69
(W)     sel (1|M0)    (lt)f0.0   r123.0<1>:f   r10.0<0;1,0>:f    r10.1<0;1,0>:f   {F@1}              //  ALU pipe: float; $70
(W)     send.slm (1|M0)          r11      r19  null:0  0x0            0x0210001F           {$4} // wr:1+0, rd:1; fence.slm.none.group // $71
(W)     mov (1|M0)               r12.2<1>:f    0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $72
(W)     mov (2|M0)               r12.10<1>:ub  r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $72
(W)     mov (8|M0)               null<1>:ud    r11.0<1;1,0>:ud                  {$4.dst}             //  memory fence commit; ALU pipe: int; $72
(W)     send.gtwy (1|M0)         null     r12  null:0  0x0            0x02000004           {I@2,$5} // wr:1+0, rd:0; signal barrier // $72
(W)     sync.bar                             0x0                                                     // $72
(W)     mul (1|M0)               acc0.0<1>:d   r3.11<0;1,0>:d    r3.20<0;1,0>:uw  {$1.dst}           //  ALU pipe: int; $74
(W)     macl (1|M0)              r4.0<1>:d     r3.11<0;1,0>:d    r3.10<0;1,0>:d                      //  ALU pipe: int; $75
(W)     mov (1|M0)               r1.32<2>:b    r19.8<0;1,0>:b                                        //  ALU pipe: int; $73
(W)     mul (1|M0)               acc0.0<1>:d   r4.0<0;1,0>:d     r3.24<0;1,0>:uw  {I@2}              //  ALU pipe: int; $75
(W)     macl (1|M0)              r5.0<1>:d     r4.0<0;1,0>:d     r3.12<0;1,0>:d                      //  ALU pipe: int; $76
(W)     mov (1|M0)               r126.6<1>:d   r1.32<0;1,0>:ub                  {I@3}                //  ALU pipe: int; $82
(W)     add (1|M0)               r20.3<1>:d    r5.0<0;1,0>:d     15:w               {I@2}            //  ALU pipe: int; $76
(W)     mov (8|M0)               r24.0<1>:w    0x76543210:v                                          //  ALU pipe: int; $78
(W)     shr (1|M0)               r126.5<1>:ud  r20.3<0;1,0>:ud   4:w               {I@2}             //  ALU pipe: int; $77
(W)     and (1|M0)               r2.8<1>:d     r5.0<0;1,0>:d     15:w                                //  ALU pipe: int; $80
(W)     add (1|M0)               r2.9<1>:d     r126.5<0;1,0>:d   -1:w               {I@2}            //  ALU pipe: int; $81
(W)     add (8|M0)               r24.8<1>:w    r24.0<1;1,0>:w    8:w                                 //  ALU pipe: int; $79
(W)     cmp (1|M0)    (gt)f1.0   null<1>:ud    r2.9<0;1,0>:ud    r126.6<0;1,0>:ud {I@2}              //  ALU pipe: int; $83
        cmp (16|M0)   (eq)f0.1   null<2>:w     r24.0<1;1,0>:w    0:w               {I@2}             //  ALU pipe: int; $87
(W&~f1.0) cmp (1|M0)  (eq)f1.0   null<1>:d     r2.8<0;1,0>:d     0:w                                 //  ALU pipe: int; $84
(W&~f1.0) sel (1|M0)             r20.6<1>:d    r2.8<0;1,0>:d     16:w                                //  ALU pipe: int; $86
(~f0.1) goto (16|M0)                         _0_088            _0_088                                //  ALU pipe: int; $88
// B011: [inDivergent],  Preds:{B010},  Succs:{B012}
_0_089:
(W)     shl (1|M0)               r4.0<1>:d     r126.6<0;1,0>:d   2:w                                 //  ALU pipe: int; $90
(W)     store.slm.d32x1t.a32 (1|M0)  [r4:1]     r123:1             {I@1,$6} // ex_desc:0x0; desc:0x2008504 // $91
// B012: Preds:{B011, B010},  Succs:{B013, B014}
_0_088:
        join (16|M0)                         L1440                                                   // 
L1440:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$7} // wr:1+0, rd:1; fence.slm.none.group // $93
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $94
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $94
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$7.dst}             //  memory fence commit; ALU pipe: int; $94
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$8} // wr:1+0, rd:0; signal barrier // $94
(W)     sync.bar                             0x0                                                     // $94
(W)     cmp (16|M0)   (gt)f1.0   null<1>:d     r20.3<0;1,0>:ud   0x10F:uw                            //  ALU pipe: int; $98
(W)     shl (1|M0)               r1.8<1>:d     r126.6<0;1,0>:d   4:w                                 //  ALU pipe: int; $95
        mov (16|M0)              r122.0<1>:d   r24.0<1;1,0>:uw                                       //  ALU pipe: int; $96
        add (16|M0)              r25.0<1>:d    r1.8<0;1,0>:d     r122.0<1;1,0>:d  {I@1}              //  ALU pipe: int; $97
(W&f1.0) jmpi                                _0_090                                                  //  ALU pipe: int; $99
// B013: Preds:{B012},  Succs:{B024}
_0_091:
(W)     mov (1|M0)               r126.7<1>:d   r126.5<0;1,0>:d                                       //  ALU pipe: int; $101
(W)     jmpi                                 _0_092                                                  // $102
// B014: Preds:{B012},  Succs:{B015}
_0_090:
        shl (16|M0)              r26.0<1>:d    r25.0<1;1,0>:d    2:w               {Compacted,I@4}   //  ALU pipe: int; $104
(W)     shl (1|M0)               r121.0<1>:d   r126.6<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $105
(W)     mov (1|M0)               r20.7<1>:d    r126.5<0;1,0>:d                                       //  ALU pipe: int; $106
// B015: Preds:{B023, B014},  Succs:{B016, B017}
_0_093:
        cmp (16|M0)   (lt)f3.0   null<1>:d     r25.0<1;1,0>:ud   r20.7<0;1,0>:ud  {I@1}              //  ALU pipe: int; $111
(W)     add (1|M0)               r1.8<1>:d     r20.7<0;1,0>:d    15:w                                //  ALU pipe: int; $108
(W)     shr (1|M0)               r126.8<1>:ud  r1.8<0;1,0>:ud    4:w               {I@1}             //  ALU pipe: int; $109
(W)     and (1|M0)               r20.8<1>:d    r1.8<0;1,0>:d     536870896:d                         //  ALU pipe: int; $110
(f3.0)  goto (16|M0)                         _0_094            _0_094                                //  ALU pipe: int; $112
// B016: [inDivergent],  Preds:{B015},  Succs:{B018}
_0_095:
        mov (16|M0)              r120.0<1>:f   0x7F800000:f                               {$9.dst}   //  ALU pipe: float; $114
        goto (16|M0)                         _0_094            _0_096                                // $115
// B017: [inDivergent],  Preds:{B015},  Succs:{B018}
_0_094:
        join (16|M0)                         _0_096                                                  // 
L1808:
        load.slm.d32.a32 (16|M0)  r120:1        [r26:1]            {F@1,$9} // ex_desc:0x0; desc:0x2100500 // $117
// B018: Preds:{B017, B016},  Succs:{B019, B021}
_0_096:
        join (16|M0)                         L1840                                                   // 
L1840:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$12} // wr:1+0, rd:1; fence.slm.none.group // $119
        sync.nop                             null                             {Compacted,$11.src}    // $120
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$8.src}        //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $120
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $120
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {Compacted,$12.dst}  //  memory fence commit; ALU pipe: int; $120
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$13} // wr:1+0, rd:0; signal barrier // $120
(W)     sync.bar                             0x0                                                     // $120
        cmp (16|M0)   (lt)f2.1   null<1>:d     r25.0<1;1,0>:ud   r20.8<0;1,0>:ud                     //  ALU pipe: int; $121
(~f2.1) goto (16|M0)                         _0_097            _0_097                                //  ALU pipe: int; $122
// B019: [inDivergent],  Preds:{B018},  Succs:{B020, B021}
_0_098:
(W)     mov (16|M0)              r4.0<1>:ud    0x7F800000:ud                              {$6.src}   //  ALU pipe: int; $124
        sync.nop                             null                             {Compacted,I@1}        // $125
        mov (16|M0)              r4.0<1>:f     r120.0<1;1,0>:f                  {Compacted,$9.dst}   //  ALU pipe: float; $125
        sync.nop                             null                             {Compacted,F@1}        // $126
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$13.src}  //  ALU pipe: int; $126
(W)     sel (8|M0)    (lt)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $126
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $127
(W)     sel (4|M0)    (lt)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $127
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $128
(W)     sel (2|M0)    (lt)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $128
(W)     sel (1|M0)    (lt)f0.0   r27.0<1>:f    r10.0<0;1,0>:f    r10.1<0;1,0>:f   {@1,$10.src}       //  ALU pipe: float; $129
(~f0.1) goto (16|M0)                         _0_097            _0_097                                //  ALU pipe: int; $130
// B020: [inDivergent],  Preds:{B019},  Succs:{B021}
_0_099:
(W)     store.slm.d32x1t.a32 (1|M0)  [r121:1]   r27:1              {F@1,$10} // ex_desc:0x0; desc:0x2008504 // $132
// B021: Preds:{B020, B019, B018},  Succs:{B022, B023}
_0_097:
        join (16|M0)                         L2128                                                   // 
L2128:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$14} // wr:1+0, rd:1; fence.slm.none.group // $134
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$13.src}       //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $135
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $135
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$14.dst}            //  memory fence commit; ALU pipe: int; $135
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$11} // wr:1+0, rd:0; signal barrier // $135
(W)     sync.bar                             0x0                                                     // $135
(W)     cmp (16|M0)   (gt)f2.0   null<1>:d     r20.7<0;1,0>:ud   0x100:uw                            //  ALU pipe: int; $136
(W)     mov (1|M0)               r126.9<1>:d   r126.8<0;1,0>:d                                       //  ALU pipe: int; $137
(W&f2.0) jmpi                                _0_100                                                  //  ALU pipe: int; $138
// B022: Preds:{B021},  Succs:{B024}
_0_101:
(W)     mov (1|M0)               r126.7<1>:d   r126.9<0;1,0>:d                  {I@2}                //  ALU pipe: int; $140
(W)     jmpi                                 _0_092                                                  // $141
// B023: Preds:{B021},  Succs:{B015}
_0_100:
(W)     mov (1|M0)               r20.7<1>:d    r126.8<0;1,0>:d                                       //  ALU pipe: int; $143
(W)     jmpi                                 _0_093                                                  // $144
// B024: Preds:{B022, B013},  Succs:{B025, B029}
_0_092:
(W)     cmp (16|M0)   (gt)f3.0   null<1>:d     r126.7<0;1,0>:ud  r20.6<0;1,0>:ud  {I@4}              //  ALU pipe: int; $146
(W&f3.0) jmpi                                _0_102                                                  //  ALU pipe: int; $147
// B025: Preds:{B024},  Succs:{B026, B027}
_0_103:
        cmp (16|M0)   (gt)f2.1   null<1>:d     r126.7<0;1,0>:ud  r122.0<1;1,0>:ud                    //  ALU pipe: int; $149
(f2.1)  goto (16|M0)                         _0_104            _0_104                                //  ALU pipe: int; $150
// B026: [inDivergent],  Preds:{B025},  Succs:{B028}
_0_105:
        mov (16|M0)              r28.0<1>:f    0x7F800000:f                                          //  ALU pipe: float; $152
        goto (16|M0)                         _0_104            _0_106                                // $153
// B027: [inDivergent],  Preds:{B025},  Succs:{B028}
_0_104:
        join (16|M0)                         _0_106                                                  // 
L2448:
        shl (16|M0)              r4.0<1>:d     r122.0<1;1,0>:d   2:w               {Compacted,$6.src} //  ALU pipe: int; $155
        load.slm.d32.a32 (16|M0)  r28:1         [r4:1]             {A@1,$15} // ex_desc:0x0; desc:0x2100500 // $156
// B028: Preds:{B027, B026},  Succs:{B034}
_0_106:
        join (16|M0)                         L2488                                                   // 
L2488:
        sync.nop                             null                             {Compacted,$15.src}    // $158
(W)     mov (16|M0)              r4.0<1>:ud    0x7F800000:ud                              {$6.src}   //  ALU pipe: int; $158
        sync.nop                             null                             {Compacted,I@1}        // $159
        mov (16|M0)              r4.0<1>:f     r28.0<1;1,0>:f                   {Compacted,$15.dst}  //  ALU pipe: float; $159
        sync.nop                             null                             {Compacted,F@1}        // $160
        sync.nop                             null                             {Compacted,$11.src}    // $160
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$8.src}   //  ALU pipe: int; $160
(W)     sel (8|M0)    (lt)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $160
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $161
(W)     sel (4|M0)    (lt)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $161
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {F@1}                //  ALU pipe: int; $162
(W)     sel (2|M0)    (lt)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $162
(W)     sel (1|M0)    (lt)f0.0   r126.10<1>:f  r10.0<0;1,0>:f    r10.1<0;1,0>:f   {F@1}              //  ALU pipe: float; $163
(W)     jmpi                                 _0_107                                                  // $164
// B029: Preds:{B024},  Succs:{B030, B031}
_0_102:
(W)     mov (1|M0)               r4.0<1>:ud    0x0:uw                              {$6.src}          //  ALU pipe: int; $166
(W)     cmp (16|M0)   (gt)f2.0   null<1>:d     r126.7<0;1,0>:ud  0x1:uw                              //  ALU pipe: int; $168
(W)     load.slm.d32x1t.a32 (1|M0)  r29:1       [r4:1]             {I@2,$0} // ex_desc:0x0; desc:0x2108500 // $167
(W&f2.0) jmpi                                _0_108                                                  //  ALU pipe: int; $169
// B030: Preds:{B029},  Succs:{B034}
_0_109:
(W)     mov (1|M0)               r126.10<1>:f  r29.0<0;1,0>:f                   {$0.dst}             //  ALU pipe: float; $171
(W)     jmpi                                 _0_107                                                  // $172
// B031: Preds:{B029},  Succs:{B032}
_0_108:
(W)     mov (1|M0)               r126.11<1>:d  1:w                                                   //  ALU pipe: int; $174
// B032: Preds:{B032, B031},  Succs:{B033, B032}
_0_110:
(W)     shl (1|M0)               r4.0<1>:d     r126.11<0;1,0>:d  2:w               {@1,$0.src}       //  ALU pipe: int; $176
(W)     add (1|M0)               r126.11<1>:d  r126.11<0;1,0>:d  1:w                                 //  ALU pipe: int; $179
        sync.allrd                           ($8,$11)                                                // $177
(W)     load.slm.d32x1t.a32 (1|M0)  r5:1        [r4:1]             {I@2,$1} // ex_desc:0x0; desc:0x2108500 // $177
(W)     cmp (16|M0)   (lt)f1.1   null<1>:d     r126.11<0;1,0>:ud  r126.7<0;1,0>:ud {I@1}             //  ALU pipe: int; $180
        sync.nop                             null                             {Compacted,$1.dst}     // $178
(W)     sel (1|M0)    (lt)f0.0   r29.0<1>:f    r29.0<0;1,0>:f    r5.0<0;1,0>:f    {Compacted,$0.dst} //  ALU pipe: float; $178
(W)     mov (1|M0)               r20.9<1>:f    r29.0<0;1,0>:f                   {F@1}                //  ALU pipe: float; $181
(W&f1.1) jmpi                                _0_110                                                  //  ALU pipe: int; $182
// B033: Preds:{B032},  Succs:{B034}
_0_111:
(W)     mov (1|M0)               r126.10<1>:f  r20.9<0;1,0>:f                   {F@1}                //  ALU pipe: float; $184
// B034: Preds:{B033, B030, B028},  Succs:{B035, B036}
_0_107:
(W)     mov (16|M0)              r4.0<1>:f     0xFF800000:f                               {Compacted} //  ALU pipe: float; $186
        mov (16|M0)              r4.0<1>:f     r22.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $187
        sync.nop                             null                             {Compacted,F@1}        // $188
        sync.nop                             null                             {Compacted,$11.src}    // $188
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$8.src}   //  ALU pipe: int; $188
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $188
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $189
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $189
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $190
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $190
(W)     sel (1|M0)    (ge)f0.0   r119.0<1>:f   r10.0<0;1,0>:f    r10.1<0;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $191
(W)     send.slm (1|M0)          r11      r19  null:0  0x0            0x0210001F           {$2} // wr:1+0, rd:1; fence.slm.none.group // $192
(W)     mov (1|M0)               r12.2<1>:ud   0x100:ud                              {Compacted,$5.src} //  signal barrier payload init (active only); ALU pipe: int; $193
(W)     mov (2|M0)               r12.10<1>:ub  r19.11<0;1,0>:ub                 {I@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $193
(W)     mov (8|M0)               null<1>:ud    r11.0<1;1,0>:ud                  {Compacted,$2.dst}   //  memory fence commit; ALU pipe: int; $193
(W)     send.gtwy (1|M0)         null     r12  null:0  0x0            0x02000004           {I@2,$3} // wr:1+0, rd:0; signal barrier // $193
(W)     sync.bar                             0x0                                                     // $193
(~f0.1) goto (16|M0)                         _0_112            _0_112                                //  ALU pipe: int; $194
// B035: [inDivergent],  Preds:{B034},  Succs:{B036}
_0_113:
(W)     shl (1|M0)               r4.0<1>:d     r126.6<0;1,0>:d   2:w                                 //  ALU pipe: int; $196
(W)     store.slm.d32x1t.a32 (1|M0)  [r4:1]     r119:1             {A@1,$4} // ex_desc:0x0; desc:0x2008504 // $197
// B036: Preds:{B035, B034},  Succs:{B037, B038}
_0_112:
        join (16|M0)                         L3136                                                   // 
L3136:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$5} // wr:1+0, rd:1; fence.slm.none.group // $199
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $200
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $200
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$5.dst}             //  memory fence commit; ALU pipe: int; $200
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$6} // wr:1+0, rd:0; signal barrier // $200
(W)     sync.bar                             0x0                                                     // $200
(W&f1.0) jmpi                                _0_114                                                  //  ALU pipe: int; $201
// B037: Preds:{B036},  Succs:{B048}
_0_115:
(W)     mov (1|M0)               r20.10<1>:d   r126.5<0;1,0>:d                                       //  ALU pipe: int; $203
(W)     jmpi                                 _0_116                                                  // $204
// B038: Preds:{B036},  Succs:{B039}
_0_114:
        shl (16|M0)              r118.0<1>:d   r25.0<1;1,0>:d    2:w               {Compacted}       //  ALU pipe: int; $206
(W)     shl (1|M0)               r30.0<1>:d    r126.6<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $207
(W)     mov (1|M0)               r126.12<1>:d  r126.5<0;1,0>:d                                       //  ALU pipe: int; $208
// B039: Preds:{B047, B038},  Succs:{B040, B041}
_0_117:
        cmp (16|M0)   (lt)f3.1   null<1>:d     r25.0<1;1,0>:ud   r126.12<0;1,0>:ud {I@1}             //  ALU pipe: int; $213
(W)     add (1|M0)               r1.8<1>:d     r126.12<0;1,0>:d  15:w                                //  ALU pipe: int; $210
(W)     shr (1|M0)               r126.7<1>:ud  r1.8<0;1,0>:ud    4:w               {I@1}             //  ALU pipe: int; $211
(W)     and (1|M0)               r20.11<1>:d   r1.8<0;1,0>:d     536870896:d                         //  ALU pipe: int; $212
(f3.1)  goto (16|M0)                         _0_118            _0_118                                //  ALU pipe: int; $214
// B040: [inDivergent],  Preds:{B039},  Succs:{B042}
_0_119:
        mov (16|M0)              r117.0<1>:f   0xFF800000:f                               {$7.dst}   //  ALU pipe: float; $216
        goto (16|M0)                         _0_118            _0_120                                // $217
// B041: [inDivergent],  Preds:{B039},  Succs:{B042}
_0_118:
        join (16|M0)                         _0_120                                                  // 
L3440:
        load.slm.d32.a32 (16|M0)  r117:1        [r118:1]           {F@1,$7} // ex_desc:0x0; desc:0x2100500 // $219
// B042: Preds:{B041, B040},  Succs:{B043, B045}
_0_120:
        join (16|M0)                         L3472                                                   // 
L3472:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$12} // wr:1+0, rd:1; fence.slm.none.group // $221
        sync.nop                             null                             {$11.src}              // $222
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$6.src}        //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $222
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $222
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$12.dst}            //  memory fence commit; ALU pipe: int; $222
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$13} // wr:1+0, rd:0; signal barrier // $222
(W)     sync.bar                             0x0                                                     // $222
        cmp (16|M0)   (lt)f3.0   null<1>:d     r25.0<1;1,0>:ud   r20.11<0;1,0>:ud                    //  ALU pipe: int; $223
(~f3.0) goto (16|M0)                         _0_121            _0_121                                //  ALU pipe: int; $224
// B043: [inDivergent],  Preds:{B042},  Succs:{B044, B045}
_0_122:
(W)     mov (16|M0)              r4.0<1>:ud    0xFF800000:ud                              {$4.src}   //  ALU pipe: int; $226
        sync.nop                             null                             {Compacted,I@1}        // $227
        mov (16|M0)              r4.0<1>:f     r117.0<1;1,0>:f                  {Compacted,$7.dst}   //  ALU pipe: float; $227
        sync.nop                             null                             {Compacted,F@1}        // $228
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$13.src}  //  ALU pipe: int; $228
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $228
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $229
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $229
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $230
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $230
(W)     sel (1|M0)    (ge)f0.0   r31.0<1>:f    r10.0<0;1,0>:f    r10.1<0;1,0>:f   {@1,$8.src}        //  ALU pipe: float; $231
(~f0.1) goto (16|M0)                         _0_121            _0_121                                //  ALU pipe: int; $232
// B044: [inDivergent],  Preds:{B043},  Succs:{B045}
_0_123:
(W)     store.slm.d32x1t.a32 (1|M0)  [r30:1]    r31:1              {F@1,$8} // ex_desc:0x0; desc:0x2008504 // $234
// B045: Preds:{B044, B043, B042},  Succs:{B046, B047}
_0_121:
        join (16|M0)                         L3776                                                   // 
L3776:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$14} // wr:1+0, rd:1; fence.slm.none.group // $236
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$13.src}       //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $237
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $237
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$14.dst}            //  memory fence commit; ALU pipe: int; $237
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$11} // wr:1+0, rd:0; signal barrier // $237
(W)     sync.bar                             0x0                                                     // $237
(W)     cmp (16|M0)   (gt)f2.1   null<1>:d     r126.12<0;1,0>:ud  0x100:uw                           //  ALU pipe: int; $238
(W&f2.1) jmpi                                _0_124                                                  //  ALU pipe: int; $239
// B046: Preds:{B045},  Succs:{B048}
_0_125:
(W)     mov (1|M0)               r20.10<1>:d   r126.7<0;1,0>:d                                       //  ALU pipe: int; $241
(W)     jmpi                                 _0_116                                                  // $242
// B047: Preds:{B045},  Succs:{B039}
_0_124:
(W)     mov (1|M0)               r126.12<1>:d  r126.7<0;1,0>:d                                       //  ALU pipe: int; $244
(W)     jmpi                                 _0_117                                                  // $245
// B048: Preds:{B046, B037},  Succs:{B049, B053}
_0_116:
(W)     cmp (16|M0)   (gt)f1.1   null<1>:d     r20.10<0;1,0>:ud  r20.6<0;1,0>:ud  {I@4}              //  ALU pipe: int; $247
(W&f1.1) jmpi                                _0_126                                                  //  ALU pipe: int; $248
// B049: Preds:{B048},  Succs:{B050, B051}
_0_127:
        cmp (16|M0)   (gt)f1.0   null<1>:d     r20.10<0;1,0>:ud  r122.0<1;1,0>:ud                    //  ALU pipe: int; $250
(f1.0)  goto (16|M0)                         _0_128            _0_128                                //  ALU pipe: int; $251
// B050: [inDivergent],  Preds:{B049},  Succs:{B052}
_0_129:
        mov (16|M0)              r116.0<1>:f   0xFF800000:f                               {Compacted} //  ALU pipe: float; $253
        goto (16|M0)                         _0_128            _0_130                                // $254
// B051: [inDivergent],  Preds:{B049},  Succs:{B052}
_0_128:
        join (16|M0)                         _0_130                                                  // 
L4072:
        shl (16|M0)              r4.0<1>:d     r122.0<1;1,0>:d   2:w               {Compacted,$4.src} //  ALU pipe: int; $256
        load.slm.d32.a32 (16|M0)  r116:1        [r4:1]             {A@1,$15} // ex_desc:0x0; desc:0x2100500 // $257
// B052: Preds:{B051, B050},  Succs:{B058}
_0_130:
        join (16|M0)                         L4112                                                   // 
L4112:
        sync.nop                             null                             {Compacted,$15.src}    // $259
(W)     mov (16|M0)              r4.0<1>:ud    0xFF800000:ud                              {$4.src}   //  ALU pipe: int; $259
        sync.nop                             null                             {Compacted,I@1}        // $260
        mov (16|M0)              r4.0<1>:f     r116.0<1;1,0>:f                  {Compacted,$15.dst}  //  ALU pipe: float; $260
        sync.nop                             null                             {Compacted,F@1}        // $261
        sync.nop                             null                             {Compacted,$11.src}    // $261
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$6.src}   //  ALU pipe: int; $261
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $261
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $262
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $262
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $263
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $263
(W)     sel (1|M0)    (ge)f0.0   r20.12<1>:f   r10.0<0;1,0>:f    r10.1<0;1,0>:f   {F@1}              //  ALU pipe: float; $264
(W)     jmpi                                 _0_131                                                  // $265
// B053: Preds:{B048},  Succs:{B054, B055}
_0_126:
(W)     mov (1|M0)               r4.0<1>:ud    0x0:uw                              {$4.src}          //  ALU pipe: int; $267
(W)     cmp (16|M0)   (gt)f0.1   null<1>:d     r20.10<0;1,0>:ud  0x1:uw                              //  ALU pipe: int; $269
(W)     load.slm.d32x1t.a32 (1|M0)  r115:1      [r4:1]             {I@2,$0} // ex_desc:0x0; desc:0x2108500 // $268
(W&f0.1) jmpi                                _0_132                                                  //  ALU pipe: int; $270
// B054: Preds:{B053},  Succs:{B058}
_0_133:
(W)     mov (1|M0)               r20.12<1>:f   r115.0<0;1,0>:f                  {$0.dst}             //  ALU pipe: float; $272
(W)     jmpi                                 _0_131                                                  // $273
// B055: Preds:{B053},  Succs:{B056}
_0_132:
(W)     mov (1|M0)               r20.13<1>:d   1:w                                                   //  ALU pipe: int; $275
// B056: Preds:{B056, B055},  Succs:{B057, B056}
_0_134:
(W)     shl (1|M0)               r4.0<1>:d     r20.13<0;1,0>:d   2:w               {@1,$0.src}       //  ALU pipe: int; $277
(W)     add (1|M0)               r20.13<1>:d   r20.13<0;1,0>:d   1:w                                 //  ALU pipe: int; $280
        sync.allrd                           ($6,$11)                                                // $278
(W)     load.slm.d32x1t.a32 (1|M0)  r5:1        [r4:1]             {I@2,$1} // ex_desc:0x0; desc:0x2108500 // $278
(W)     cmp (16|M0)   (lt)f1.0   null<1>:d     r20.13<0;1,0>:ud  r20.10<0;1,0>:ud {I@1}              //  ALU pipe: int; $281
        sync.nop                             null                             {Compacted,$1.dst}     // $279
(W)     sel (1|M0)    (ge)f0.0   r115.0<1>:f   r115.0<0;1,0>:f   r5.0<0;1,0>:f    {Compacted,$0.dst} //  ALU pipe: float; $279
(W)     mov (1|M0)               r126.13<1>:f  r115.0<0;1,0>:f                  {F@1}                //  ALU pipe: float; $282
(W&f1.0) jmpi                                _0_134                                                  //  ALU pipe: int; $283
// B057: Preds:{B056},  Succs:{B058}
_0_135:
(W)     mov (1|M0)               r20.12<1>:f   r126.13<0;1,0>:f                 {F@1}                //  ALU pipe: float; $285
// B058: Preds:{B057, B054, B052},  Succs:{B059, B060}
_0_131:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$2} // wr:1+0, rd:1; fence.slm.none.group // $287
        sync.nop                             null                             {$11.src}              // $288
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$6.src}        //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $288
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $288
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$2.dst}             //  memory fence commit; ALU pipe: int; $288
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$4} // wr:1+0, rd:0; signal barrier // $288
(W)     sync.bar                             0x0                                                     // $288
(W)     add (1|M0)               r1.8<1>:f     r20.12<0;1,0>:f   -r126.10<0;1,0>:f                   //  ALU pipe: float; $289
(W)     mov (1|M0)               r2.8<1>:f     0x3F000000:f                                          //  ALU pipe: float; $293
(W)     mul (1|M0)               r2.10<1>:f    r1.8<0;1,0>:f     0x3D888889:f               {F@2}    //  ALU pipe: float; $290
(W)     cmp (16|M0)   (ne)f3.1   null<1>:d     r126.4<0;1,0>:d   0:w                                 //  ALU pipe: int; $309
(W)     sel (1|M0)    (ge)f0.0   r32.0<1>:f    r2.10<0;1,0>:f    0x322BCC77:f               {F@1}    //  ALU pipe: float; $291
(W)     shl (1|M0)               r1.5<1>:q     r21.0<0;1,0>:q    1:w                                 //  ALU pipe: int; $299
(W)     math.inv (1|M0)          r123.1<1>:f   r32.0<0;1,0>:f                   {F@1}                //  ALU pipe: math; $292
(W)     mad (1|M0)               r4.0<1>:f     r2.8<0;0>:f       r126.10<0;0>:f    -r123.1<0>:f     {A@1} //  ALU pipe: float; $294
(f3.1)  cmp (16|M0)   (eq)f3.1   null<2>:w     r1.0<1;1,0>:w     0:w                                 //  ALU pipe: int; $310
(W)     and (1|M0)               r2.11<1>:d    r1.10<0;1,0>:d    126:w               {I@2}           //  ALU pipe: int; $300
(W)     rndd (1|M0)              r5.0<1>:f     r4.0<0;1,0>:f                    {@1,$4.src}          //  ALU pipe: float; $295
(W)     mov (1|M0)               r1.18<1>:hf   0x0:hf                                                //  ALU pipe: float; $302
(W)     mov (1|M0)               r2.9<1>:d     1:w                                                   //  ALU pipe: int; $303
(W&f0.0) sel (1|M0)              r3.8<1>:d     r2.11<0;1,0>:d    -2:w               {I@2}            //  ALU pipe: int; $301
(W)     sel (1|M0)    (lt)f0.0   r6.0<1>:f     r5.0<0;1,0>:f     0x41700000:f               {F@2}    //  ALU pipe: float; $296
(W)     asr (1|M0)               r126.14<1>:d  r20.2<0;1,0>:d    31:w                                //  ALU pipe: int; $298
(W&f0.0) sel (1|M0)              r20.15<1>:d   r1.18<0;1,0>:w    -1:w               {F@2}            //  ALU pipe: int; $302
(W)     bfn.(s0|s1&s2) (1|M0)    r20.14<1>:ud  r3.8<0;0>:ud      r126.0<0;0>:ud    r2.9<0>:ud       {I@3} //  ALU pipe: int; $304
(W)     sel (1|M0)    (ge)f0.0   r34.0<1>:f    r6.0<0;1,0>:f     0x0:f               {F@1}           //  ALU pipe: float; $297
(~f3.1) goto (16|M0)                         _0_136            _0_136                                //  ALU pipe: int; $312
// B059: [inDivergent],  Preds:{B058},  Succs:{B060}
_0_137:
(W)     mov (2|M0)               r1.8<1>:d     r3.4<1;1,0>:d                                         //  ALU pipe: int; $314
(W)     mul (1|M0)               acc0.0<1>:ud  r20.2<0;1,0>:ud   r1.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $315
(W)     macl (1|M0)              r4.0<1>:ud    r20.2<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; $316
(W)     mul (1|M0)               acc0.0<1>:ud  r20.2<0;1,0>:ud   r1.16<0;1,0>:uw                     //  ALU pipe: int; $316
(W)     mach (1|M0)              r5.0<1>:d     r20.2<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r20.2<0;1,0>:ud   r1.18<0;1,0>:uw                     //  ALU pipe: int; $317
(W)     macl (1|M0)              r6.0<1>:d     r20.2<0;1,0>:ud   r1.9<0;1,0>:d    {F@1}              //  ALU pipe: int; $318
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:ud    r126.28<0;1,0>:uw                   //  ALU pipe: int; $319
(W)     add (1|M0)               r5.0<1>:d     r5.0<0;1,0>:d     r6.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $318
(W)     macl (1|M0)              r6.0<1>:d     r1.8<0;1,0>:ud    r126.14<0;1,0>:d                    //  ALU pipe: int; $321
(W)     add (1|M0)               r4.1<1>:d     r5.0<0;1,0>:d     r6.0<0;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $321
(W)     add (1|M0)               r2.4<1>:q     r4.0<0;1,0>:q     r20.7<0;1,0>:q   {I@1}              //  ALU pipe: int; $326 R{} IR{}{E:2,E:2,},  {BC=1}
(W)     shl (1|M0)               r3.4<1>:q     r2.4<0;1,0>:q     2:w               {I@1}             //  ALU pipe: int; $327
(W)     add (1|M0)               r8.0<1>:q     r3.4<0;1,0>:q     r2.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $328
(W)     add (1|M0)               r10.0<1>:q    r3.4<0;1,0>:q     r2.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $330
(W)     store.ugm.d32x1t.a64 (1|M0)  [r8:1]     r32:1              {I@2,$5} // ex_desc:0x0; desc:0x2008584 // $329
(W)     store.ugm.d32x1t.a64 (1|M0)  [r10:1]    r34:1              {I@1,$6} // ex_desc:0x0; desc:0x2008584 // $331
// B060: Preds:{B059, B058},  Succs:{B061, B066}
_0_136:
        join (16|M0)                         L5200                                                   // 
L5200:
(W)     cmp (16|M0)   (ne)f3.1   null<1>:d     r126.4<0;1,0>:d   0:w                                 //  ALU pipe: int; $333
(W&~f3.1) jmpi                               _0_138                                                  //  ALU pipe: int; $334
// B061: Preds:{B060},  Succs:{B062, B066}
_0_139:
(W)     mov (2|M0)               r1.8<1>:d     r3.6<1;1,0>:d                                         //  ALU pipe: int; $336
        cmp (16|M0)   (lt)f3.0   null<2>:w     r1.0<1;1,0>:uw    0x80:uw                             //  ALU pipe: int; $344
(W)     mul (1|M0)               acc0.0<1>:ud  r20.2<0;1,0>:ud   r1.16<0;1,0>:uw  {I@2}              //  ALU pipe: int; $337
(W)     macl (1|M0)              r114.0<1>:ud  r20.2<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; $338
(W)     mul (1|M0)               acc0.0<1>:ud  r20.2<0;1,0>:ud   r1.16<0;1,0>:uw                     //  ALU pipe: int; $338
(W)     mach (1|M0)              r4.0<1>:d     r20.2<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r20.2<0;1,0>:ud   r1.18<0;1,0>:uw                     //  ALU pipe: int; $339
(W)     macl (1|M0)              r5.0<1>:d     r20.2<0;1,0>:ud   r1.9<0;1,0>:d                       //  ALU pipe: int; $340
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:ud    r126.28<0;1,0>:uw                   //  ALU pipe: int; $341
(W)     add (1|M0)               r4.0<1>:d     r4.0<0;1,0>:d     r5.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $340
(W)     macl (1|M0)              r5.0<1>:d     r1.8<0;1,0>:ud    r126.14<0;1,0>:d                    //  ALU pipe: int; $343
(W)     add (1|M0)               r21.2<1>:d    r4.0<0;1,0>:d     r5.0<0;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $343
(~f3.0) goto (16|M0)                         _0_138            _0_138                                //  ALU pipe: int; $345
// B062: [inDivergent],  Preds:{B061},  Succs:{B063, B066}
_0_140:
        shl (16|M0)              r4.0<1>:d     r125.0<1;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $354
        mov (16|M0)              r5.0<2>:ud    r4.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $356
        add (16|M0)              r8.0<1>:q     r20.2<0;1,0>:q    r5.0<2;1,0>:ud   {@1,$5.src}        //  ALU pipe: int; $356
        load.ugm.d32.a64 (16|M0)  r7:1          [r8:2]             {I@1,$11} // ex_desc:0x0; desc:0x4100580 // $357
(W)     mov (1|M0)               r1.8<1>:d     r114.0<0;1,0>:d                                       //  ALU pipe: int; $347
(W)     mov (1|M0)               r1.9<1>:d     r21.2<0;1,0>:d                                        //  ALU pipe: int; $348
(W)     shl (1|M0)               r2.5<1>:q     r20.7<0;1,0>:q    7:w                                 //  ALU pipe: int; $352
(W)     add (1|M0)               r2.4<1>:q     r1.4<0;1,0>:q     r3.0<0;1,0>:q    {I@2}              //  ALU pipe: int; $351
        cmp (16|M0)   (lt)f2.1   null<2>:w     r1.0<1;1,0>:uw    0x60:uw                             //  ALU pipe: int; $383
(W)     add (1|M0)               r123.1<1>:q   r2.4<0;1,0>:q     r2.5<0;1,0>:q    {I@2}              //  ALU pipe: int; $353
        sync.nop                             null                             {Compacted,$6.src}     // $360
        mov (16|M0)              r10.0<1>:uw   r7.0<2;1,0>:uw                   {$11.dst}            //  ALU pipe: int; $360
        sync.nop                             null                             {Compacted,I@1}        // $360
        mov (16|M0)              r12.0<1>:f    r10.0<1;1,0>:hf                  {$3.src}             //  ALU pipe: float; $360
        mov (16|M0)              r11.0<1>:uw   r7.1<2;1,0>:uw                                        //  ALU pipe: int; $364
        mad (16|M0)              acc0.0<1>:f   r34.0<0;0>:f      r12.0<1;0>:f      r123.1<0>:f      {Compacted,F@1} //  ALU pipe: float; $361
        mov (16|M0)              r14.0<1>:f    r11.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $364
        add (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $362
        rndd (16|M0)             acc0.0<1>:f   acc0.0<1;1,0>:f                                       //  ALU pipe: float; $363
        mad (16|M0)              acc1.0<1>:f   r34.0<0;0>:f      r14.0<1;0>:f      r123.1<0>:f      {Compacted,F@3} //  ALU pipe: float; $365
        add (16|M0)              acc1.0<1>:f   acc1.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $366
        rndd (16|M0)             acc1.0<1>:f   acc1.0<1;1,0>:f                                       //  ALU pipe: float; $367
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc0.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $368
        sel (16|M0)   (ge)f0.0   r4.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $369
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc1.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $370
        sel (16|M0)   (ge)f0.0   r5.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $371
        mov (16|M0)              r7.0<4>:ub    r5.0<1;1,0>:f                    {F@1}                //  ALU pipe: int; $374
        mov (16|M0)              r6.0<4>:ub    r4.0<1;1,0>:f                                         //  ALU pipe: int; $372
        mov (16|M0)              r10.0<1>:ub   r7.0<4;1,0>:ub                   {I@2}                //  ALU pipe: int; $374
        mov (16|M0)              r8.0<1>:ub    r6.0<4;1,0>:ub                   {I@2}                //  ALU pipe: int; $372
        mov (16|M0)              r11.0<1>:w    r10.0<1;1,0>:b                   {I@2}                //  ALU pipe: int; $375
        mov (16|M0)              r9.0<1>:w     r8.0<1;1,0>:b                    {I@2}                //  ALU pipe: int; $373
        shl (16|M0)              r11.0<1>:w    r11.0<1;1,0>:w    4:w               {I@2}             //  ALU pipe: int; $376
        or (16|M0)               r11.0<1>:w    r11.0<1;1,0>:w    r9.0<1;1,0>:w    {I@1}              //  ALU pipe: int; $377
        mov (16|M0)              r12.0<4>:uw   r1.0<1;1,0>:uw                                        //  ALU pipe: int; $379
        mov (16|M0)              r16.0<2>:b    r11.0<1;1,0>:w                   {I@2}                //  ALU pipe: int; $380
        add (16|M0)              r14.0<1>:q    r123.1<0;1,0>:q   r12.0<4;1,0>:uw  {I@2}              //  ALU pipe: int; $379
        mov (16|M0)              r17.0<1>:ud   r16.0<2;1,0>:ub                  {I@2}                //  ALU pipe: int; $381
        store.ugm.d8u32.a64 (16|M0)  [r14:2]    r17:1              {I@1,$12} // ex_desc:0x0; desc:0x4000984 // $382
(~f2.1) goto (16|M0)                         _0_138            _0_138                                //  ALU pipe: int; $384
// B063: [inDivergent],  Preds:{B062},  Succs:{B064, B066}
_0_141:
        add (16|M0)              r4.0<1>:d     r125.0<1;1,0>:d   32:w               {Compacted}      //  ALU pipe: int; $386
        shl (16|M0)              r5.0<1>:d     r4.0<1;1,0>:d     2:w               {Compacted,I@1}   //  ALU pipe: int; $387
        mov (16|M0)              r6.0<2>:ud    r5.0<1;1,0>:ud                   {I@1}                //  ALU pipe: int; $389
        add (16|M0)              r8.0<1>:q     r20.2<0;1,0>:q    r6.0<2;1,0>:ud   {I@1}              //  ALU pipe: int; $389
        load.ugm.d32.a64 (16|M0)  r10:1         [r8:2]             {I@1,$13} // ex_desc:0x0; desc:0x4100580 // $390
        cmp (16|M0)   (lt)f2.0   null<2>:w     r1.0<1;1,0>:uw    0x40:uw                             //  ALU pipe: int; $416
        mov (16|M0)              r11.0<1>:uw   r10.0<2;1,0>:uw                  {$13.dst}            //  ALU pipe: int; $393
        mov (16|M0)              r12.0<1>:f    r11.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $393
        mov (16|M0)              r13.0<1>:uw   r10.1<2;1,0>:uw                                       //  ALU pipe: int; $397
        mad (16|M0)              acc0.0<1>:f   r34.0<0;0>:f      r12.0<1;0>:f      r123.1<0>:f      {Compacted,F@1} //  ALU pipe: float; $394
        sync.nop                             null                             {Compacted,I@1}        // $397
        mov (16|M0)              r14.0<1>:f    r13.0<1;1,0>:hf                  {$12.src}            //  ALU pipe: float; $397
        add (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F000000:f                        //  ALU pipe: float; $395
        rndd (16|M0)             acc0.0<1>:f   acc0.0<1;1,0>:f                                       //  ALU pipe: float; $396
        mad (16|M0)              acc1.0<1>:f   r34.0<0;0>:f      r14.0<1;0>:f      r123.1<0>:f      {Compacted,F@3} //  ALU pipe: float; $398
        add (16|M0)              acc1.0<1>:f   acc1.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $399
        rndd (16|M0)             acc1.0<1>:f   acc1.0<1;1,0>:f                                       //  ALU pipe: float; $400
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc0.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $401
        sel (16|M0)   (ge)f0.0   r5.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $402
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc1.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $403
        sel (16|M0)   (ge)f0.0   r6.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $404
        mov (16|M0)              r10.0<4>:ub   r6.0<1;1,0>:f                    {F@1}                //  ALU pipe: int; $407
        mov (16|M0)              r7.0<4>:ub    r5.0<1;1,0>:f                                         //  ALU pipe: int; $405
        mov (16|M0)              r11.0<1>:ub   r10.0<4;1,0>:ub                  {I@2}                //  ALU pipe: int; $407
        mov (16|M0)              r8.0<1>:ub    r7.0<4;1,0>:ub                   {I@2}                //  ALU pipe: int; $405
        mov (16|M0)              r12.0<1>:w    r11.0<1;1,0>:b                   {I@2}                //  ALU pipe: int; $408
        mov (16|M0)              r9.0<1>:w     r8.0<1;1,0>:b                    {I@2}                //  ALU pipe: int; $406
        shl (16|M0)              r12.0<1>:w    r12.0<1;1,0>:w    4:w               {I@2}             //  ALU pipe: int; $409
        or (16|M0)               r12.0<1>:w    r12.0<1;1,0>:w    r9.0<1;1,0>:w    {I@1}              //  ALU pipe: int; $410
        mov (16|M0)              r13.0<2>:ud   r4.0<1;1,0>:ud                                        //  ALU pipe: int; $412
        mov (16|M0)              r15.0<2>:b    r12.0<1;1,0>:w                   {I@2}                //  ALU pipe: int; $413
        add (16|M0)              r16.0<1>:q    r123.1<0;1,0>:q   r13.0<2;1,0>:ud  {I@2}              //  ALU pipe: int; $412
        mov (16|M0)              r18.0<1>:ud   r15.0<2;1,0>:ub                  {I@2}                //  ALU pipe: int; $414
        store.ugm.d8u32.a64 (16|M0)  [r16:2]    r18:1              {I@1,$14} // ex_desc:0x0; desc:0x4000984 // $415
(~f2.0) goto (16|M0)                         _0_138            _0_138                                //  ALU pipe: int; $417
// B064: [inDivergent],  Preds:{B063},  Succs:{B065, B066}
_0_142:
        add (16|M0)              r4.0<1>:d     r125.0<1;1,0>:d   64:w               {Compacted}      //  ALU pipe: int; $419
        shl (16|M0)              r5.0<1>:d     r4.0<1;1,0>:d     2:w               {Compacted,I@1}   //  ALU pipe: int; $420
        mov (16|M0)              r6.0<2>:ud    r5.0<1;1,0>:ud                   {I@1}                //  ALU pipe: int; $422
        add (16|M0)              r8.0<1>:q     r20.2<0;1,0>:q    r6.0<2;1,0>:ud   {I@1}              //  ALU pipe: int; $422
        load.ugm.d32.a64 (16|M0)  r10:1         [r8:2]             {I@1,$15} // ex_desc:0x0; desc:0x4100580 // $423
        cmp (16|M0)   (lt)f1.1   null<2>:w     r1.0<1;1,0>:uw    0x20:uw                             //  ALU pipe: int; $449
        mov (16|M0)              r11.0<1>:uw   r10.0<2;1,0>:uw                  {$15.dst}            //  ALU pipe: int; $426
        mov (16|M0)              r12.0<1>:f    r11.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $426
        mov (16|M0)              r13.0<1>:uw   r10.1<2;1,0>:uw                                       //  ALU pipe: int; $430
        mad (16|M0)              acc0.0<1>:f   r34.0<0;0>:f      r12.0<1;0>:f      r123.1<0>:f      {F@1} //  ALU pipe: float; $427
        mov (16|M0)              r14.0<1>:f    r13.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $430
        add (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $428
        rndd (16|M0)             acc0.0<1>:f   acc0.0<1;1,0>:f                                       //  ALU pipe: float; $429
        mad (16|M0)              acc1.0<1>:f   r34.0<0;0>:f      r14.0<1;0>:f      r123.1<0>:f      {Compacted,F@3} //  ALU pipe: float; $431
        add (16|M0)              acc1.0<1>:f   acc1.0<1;1,0>:f   0x3F000000:f                        //  ALU pipe: float; $432
        rndd (16|M0)             acc1.0<1>:f   acc1.0<1;1,0>:f                                       //  ALU pipe: float; $433
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc0.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $434
        sel (16|M0)   (ge)f0.0   r5.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $435
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc1.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $436
        sel (16|M0)   (ge)f0.0   r6.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $437
        mov (16|M0)              r10.0<4>:ub   r6.0<1;1,0>:f                    {F@1}                //  ALU pipe: int; $440
        mov (16|M0)              r7.0<4>:ub    r5.0<1;1,0>:f                                         //  ALU pipe: int; $438
        mov (16|M0)              r11.0<1>:ub   r10.0<4;1,0>:ub                  {I@2}                //  ALU pipe: int; $440
        mov (16|M0)              r8.0<1>:ub    r7.0<4;1,0>:ub                   {I@2}                //  ALU pipe: int; $438
        mov (16|M0)              r12.0<1>:w    r11.0<1;1,0>:b                   {I@2}                //  ALU pipe: int; $441
        mov (16|M0)              r9.0<1>:w     r8.0<1;1,0>:b                    {I@2}                //  ALU pipe: int; $439
        shl (16|M0)              r12.0<1>:w    r12.0<1;1,0>:w    4:w               {I@2}             //  ALU pipe: int; $442
        or (16|M0)               r12.0<1>:w    r12.0<1;1,0>:w    r9.0<1;1,0>:w    {I@1}              //  ALU pipe: int; $443
        mov (16|M0)              r13.0<2>:ud   r4.0<1;1,0>:ud                                        //  ALU pipe: int; $445
        mov (16|M0)              r15.0<2>:b    r12.0<1;1,0>:w                   {I@2}                //  ALU pipe: int; $446
        add (16|M0)              r16.0<1>:q    r123.1<0;1,0>:q   r13.0<2;1,0>:ud  {@2,$14.src}       //  ALU pipe: int; $445
        mov (16|M0)              r18.0<1>:ud   r15.0<2;1,0>:ub                  {I@2}                //  ALU pipe: int; $447
        store.ugm.d8u32.a64 (16|M0)  [r16:2]    r18:1              {I@1,$0} // ex_desc:0x0; desc:0x4000984 // $448
(~f1.1) goto (16|M0)                         _0_138            _0_138                                //  ALU pipe: int; $450
// B065: [inDivergent],  Preds:{B064},  Succs:{B066}
_0_143:
        add (16|M0)              r4.0<1>:d     r125.0<1;1,0>:d   96:w               {Compacted}      //  ALU pipe: int; $452
        shl (16|M0)              r5.0<1>:d     r4.0<1;1,0>:d     2:w               {Compacted,I@1}   //  ALU pipe: int; $453
        mov (16|M0)              r6.0<2>:ud    r5.0<1;1,0>:ud                   {I@1}                //  ALU pipe: int; $455
        add (16|M0)              r8.0<1>:q     r20.2<0;1,0>:q    r6.0<2;1,0>:ud   {I@1}              //  ALU pipe: int; $455
        load.ugm.d32.a64 (16|M0)  r10:1         [r8:2]             {I@1,$1} // ex_desc:0x0; desc:0x4100580 // $456
        mov (16|M0)              r11.0<1>:uw   r10.0<2;1,0>:uw                  {$1.dst}             //  ALU pipe: int; $459
        mov (16|M0)              r12.0<1>:f    r11.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $459
        mov (16|M0)              r13.0<1>:uw   r10.1<2;1,0>:uw                                       //  ALU pipe: int; $463
        mad (16|M0)              acc0.0<1>:f   r34.0<0;0>:f      r12.0<1;0>:f      r123.1<0>:f      {Compacted,F@1} //  ALU pipe: float; $460
        mov (16|M0)              r14.0<1>:f    r13.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $463
        add (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $461
        rndd (16|M0)             acc0.0<1>:f   acc0.0<1;1,0>:f                                       //  ALU pipe: float; $462
        mad (16|M0)              acc1.0<1>:f   r34.0<0;0>:f      r14.0<1;0>:f      r123.1<0>:f      {Compacted,F@3} //  ALU pipe: float; $464
        add (16|M0)              acc1.0<1>:f   acc1.0<1;1,0>:f   0x3F000000:f               {Compacted} //  ALU pipe: float; $465
        rndd (16|M0)             acc1.0<1>:f   acc1.0<1;1,0>:f                                       //  ALU pipe: float; $466
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc0.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $467
        sel (16|M0)   (ge)f0.0   r5.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $468
        sel (16|M0)   (lt)f0.0   acc0.0<1>:f   acc1.0<1;1,0>:f   0x41700000:f               {Compacted} //  ALU pipe: float; $469
        sel (16|M0)   (ge)f0.0   r6.0<1>:f     acc0.0<1;1,0>:f   0x0:f               {Compacted}     //  ALU pipe: float; $470
        mov (16|M0)              r10.0<4>:ub   r6.0<1;1,0>:f                    {F@1}                //  ALU pipe: int; $473
        mov (16|M0)              r7.0<4>:ub    r5.0<1;1,0>:f                                         //  ALU pipe: int; $471
        mov (16|M0)              r11.0<1>:ub   r10.0<4;1,0>:ub                  {I@2}                //  ALU pipe: int; $473
        mov (16|M0)              r8.0<1>:ub    r7.0<4;1,0>:ub                   {I@2}                //  ALU pipe: int; $471
        mov (16|M0)              r12.0<1>:w    r11.0<1;1,0>:b                   {I@2}                //  ALU pipe: int; $474
        mov (16|M0)              r9.0<1>:w     r8.0<1;1,0>:b                    {I@2}                //  ALU pipe: int; $472
        shl (16|M0)              r12.0<1>:w    r12.0<1;1,0>:w    4:w               {I@2}             //  ALU pipe: int; $475
        or (16|M0)               r12.0<1>:w    r12.0<1;1,0>:w    r9.0<1;1,0>:w    {I@1}              //  ALU pipe: int; $476
        mov (16|M0)              r13.0<2>:ud   r4.0<1;1,0>:ud                                        //  ALU pipe: int; $478
        mov (16|M0)              r15.0<2>:b    r12.0<1;1,0>:w                   {I@2}                //  ALU pipe: int; $479
        add (16|M0)              r16.0<1>:q    r123.1<0;1,0>:q   r13.0<2;1,0>:ud  {@2,$0.src}        //  ALU pipe: int; $478
        mov (16|M0)              r18.0<1>:ud   r15.0<2;1,0>:ub                  {I@2}                //  ALU pipe: int; $480
        store.ugm.d8u32.a64 (16|M0)  [r16:2]    r18:1              {I@1,$2} // ex_desc:0x0; desc:0x4000984 // $481
// B066: Preds:{B065, B064, B063, B062, B061, B060},  Succs:{}
_0_138:
        join (16|M0)                         L7376                                                   // 
L7376:
(W)     mov (16|M0)              r127.0<1>:f   r19.0<1;1,0>:f                                        //  ALU pipe: float; $483
(W)     send.gtwy (1|M0)         null     r127  null:0  0x0            0x02000010           {EOT,F@1,$3} // wr:1+0, rd:0; end of thread // $483
L7408:
(W)     mov (16|M0)              null<1>:ud    0xE7AB99C9:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x21E26E3B:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x7:ud                                                // 


//.BankConflicts: 1
//.ByteRMWs: 13
//


//.numALUInst: 421
//.accSubDef: 32
//.accSubUse: 32
//.accSubCandidateDef: 32
//.accSubCandidateUse: 32
//
//
//.singlePipeAtOneDistNum: 141
//.allAtOneDistNum: 7
//.syncInstCount: 22
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 30
//.AfterReadTokenDepCount: 43
