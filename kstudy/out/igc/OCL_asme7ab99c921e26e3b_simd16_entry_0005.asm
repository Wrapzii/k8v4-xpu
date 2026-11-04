//.kernel _ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE
//.platform XE2
//.thread_config numGRF=128, numAcc=4, numSWSB=16
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 3886782921 568487483 -hashmovs1 0 5 "
//.full_options "-emitLocation -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemptionR0Only -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortOnSpill 4 -enableBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 100 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 3886782921 568487483 -hashmovs1 0 5 -GRFBumpUpNumber 2 "
//.instCount 286
//.RA type	LOCAL_ROUND_ROBIN_RA
//.git-hash 3eef0f89d3a4fe2b443de595e23d7700a5d1491b

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r19.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare %null (10)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (13)  rf=r size=4 type=ud align=2 words (r3.15)
//.declare %local_id_y (14)  rf=r size=4 type=ud align=2 words (r4.0)
//.declare %local_size_x (15)  rf=r size=4 type=ud align=2 words (r3.11)
//.declare %local_size_y (16)  rf=r size=4 type=ud align=2 words (r3.12)
//.declare %group_id_x (17)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (18)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (19)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (20)  rf=r size=4 type=ud align=2 words (r3.13)
//.declare %group_count_y (21)  rf=r size=4 type=ud align=2 words (r3.14)
//.declare %tsc (22)  rf=r size=20 type=ud align=2 words
//.declare %arg (23)  rf=r size=0 type=ud align=32 words (r26.0)
//.declare %retval (24)  rf=r size=0 type=ud align=32 words (r26.0) Output
//.declare %sp (25)  rf=r size=8 type=uq align=4 words (r127.3)
//.declare %fp (26)  rf=r size=8 type=uq align=4 words (r127.2)
//.declare %sr0 (27)  rf=r size=16 type=ud align=2 words
//.declare %cr0 (28)  rf=r size=12 type=ud align=2 words
//.declare %ce0 (29)  rf=r size=4 type=ud align=2 words
//.declare %dbg0 (30)  rf=r size=8 type=ud align=2 words
//.declare implBufPtr (32)  rf=r size=8 type=uq align=4 words (r126.0)
//.declare localIdBufPtr (33)  rf=r size=8 type=uq align=4 words (r126.3)
//.declare %msg0 (34)  rf=r size=12 type=ud align=2 words
//.declare %scratchloc (35)  rf=r size=8 type=uq align=4 words (s0.7)
//.declare V0033 (43)  rf=r size=64 type=d alias=+0 align=32 words (r19.0)
//.declare V0034 (44)  rf=r size=8 type=uq align=4 words (r2.0)
//.declare V0035 (45)  rf=r size=8 type=q align=4 words (r3.0)
//.declare V0036 (46)  rf=r size=8 type=uq align=4 words (r2.1)
//.declare V0037 (47)  rf=r size=8 type=uq align=4 words (r2.2)
//.declare V0038 (48)  rf=r size=8 type=q align=4 words (r3.1)
//.declare V0039 (49)  rf=r size=8 type=uq align=4 words (r2.3)
//.declare V0040 (50)  rf=r size=8 type=q align=4 words (r3.2)
//.declare V0042 (52)  rf=r size=32 type=d alias=+0 align=32 words (r19.0)
//.declare V0044 (54)  rf=r size=12 type=d align=2 words (r3.8)
//.declare V0045 (55)  rf=r size=32 type=w align=16 words (r1.0)
//.declare V0048 (58)  rf=r size=8 type=uq align=4 words (r3.3)
//.declare V0062 (72)  rf=r size=8 type=q align=4 words (r20.0)
//.declare V0064 (74)  rf=r size=8 type=uq alias=V0062+0 align=4 words (r20.0)
//.declare V0067 (77)  rf=r size=8 type=q align=4 words (r20.1)
//.declare V0068 (78)  rf=r size=8 type=d alias=V0067+0 align=4 words (r20.2)
//.declare V0069 (79)  rf=r size=8 type=q alias=V0034+0 align=4 words (r2.0)
//.declare V0070 (80)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0071 (81)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0072 (82)  rf=r size=8 type=uq alias=V0071+0 align=32 words (r4.0)
//.declare V0073 (83)  rf=r size=8 type=q align=32 words (r5.0)
//.declare V0074 (84)  rf=r size=4 type=d align=2 words (r20.4)
//.declare V0075 (85)  rf=r size=8 type=d alias=V0073+0 align=32 words (r5.0)
//.declare V0076 (86)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0077 (87)  rf=r size=8 type=uq alias=V0073+0 align=32 words (r5.0)
//.declare V0078 (88)  rf=r size=8 type=uq alias=V0076+0 align=4 words (r6.0)
//.declare P01 (90)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0080 (91)  rf=r size=4 type=d align=2 words (r20.5)
//.declare V0082 (93)  rf=r size=4 type=d align=2 words (r7.0)
//.declare V0083 (94)  rf=r size=4 type=d align=2 words (r20.6)
//.declare P02 (95)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0084 (96)  rf=r size=4 type=d align=2 words (r20.7)
//.declare V0085 (97)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0086 (98)  rf=r size=8 type=d alias=V0035+0 align=4 words (r3.0)
//.declare P03 (99)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0087 (100)  rf=r size=4 type=ud alias=V0080+0 align=2 words (r20.5)
//.declare V0088 (101)  rf=r size=8 type=ud alias=V0085+0 align=2 words (r1.8)
//.declare P04 (102)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare P05 (103)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare P06 (104)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0089 (105)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0090 (106)  rf=r size=8 type=q alias=V0036+0 align=4 words (r2.1)
//.declare V0091 (107)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0092 (108)  rf=r size=8 type=q align=4 words (r3.3)
//.declare V0093 (109)  rf=r size=8 type=q align=4 words (r20.4)
//.declare V0094 (110)  rf=r size=64 type=d align=32 words (r21.0)
//.declare V0095 (111)  rf=r size=32 type=uw alias=V0045+0 align=16 words (r1.0)
//.declare P07 (112)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0096 (113)  rf=r size=64 type=f align=32 words (r22.0)
//.declare V0097 (114)  rf=r size=64 type=d align=32 words (r23.0)
//.declare V0098 (115)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0100 (117)  rf=r size=64 type=ud alias=V0098+0 align=32 words (r4.0)
//.declare V0101 (118)  rf=r size=128 type=q align=32 words (r7.0)
//.declare V0102 (119)  rf=r size=128 type=uq alias=V0101+0 align=32 words (r7.0)
//.declare V0104 (121)  rf=r size=64 type=ud align=32 words (r9.0)
//.declare V0105 (122)  rf=r size=64 type=hf alias=V0104+0 align=32 words (r9.0)
//.declare V0106 (123)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0107 (124)  rf=r size=64 type=d align=32 words (r12.0)
//.declare V0108 (125)  rf=r size=64 type=d alias=V0106+0 align=32 words (r11.0)
//.declare V0109 (126)  rf=r size=64 type=f alias=V0107+0 align=32 words (r12.0)
//.declare P08 (127)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0110 (128)  rf=r size=64 type=ud alias=V0097+0 align=32 words (r23.0)
//.declare V0112 (130)  rf=r size=4 type=f align=32 words (r24.0)
//.declare V0113 (131)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0114 (132)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0115 (133)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0116 (134)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (135)  rf=r size=64 type=ud align=32 words (r11.0)
//.declare  (136)  rf=r size=32 type=ud align=32 words (r12.0)
//.declare V0117 (137)  rf=r size=32 type=b alias=V0042+0 align=16 words (r19.0)
//.declare V0118 (138)  rf=r size=1 type=b align=1 words (r13.0)
//.declare V0119 (139)  rf=r size=4 type=d align=32 words (r14.0)
//.declare V0120 (140)  rf=r size=4 type=d align=32 words (r15.0)
//.declare V0121 (141)  rf=r size=4 type=d align=2 words (r20.10)
//.declare V0122 (142)  rf=r size=4 type=d align=2 words (r20.11)
//.declare V0123 (143)  rf=r size=4 type=ud alias=V0121+0 align=2 words (r20.10)
//.declare V0124 (144)  rf=r size=4 type=ud alias=V0122+0 align=2 words (r20.11)
//.declare V0125 (145)  rf=r size=32 type=w align=32 words (r25.0)
//.declare V0126 (146)  rf=r size=4 type=d align=2 words (r16.0)
//.declare V0127 (147)  rf=r size=4 type=d align=2 words (r17.0)
//.declare V0128 (148)  rf=r size=4 type=d align=2 words (r20.12)
//.declare V0129 (149)  rf=r size=1 type=ub alias=V0118+0 align=1 words (r13.0)
//.declare P09 (150)  rf=f1  size=2 type=uw align=1 words (f3.0)
//.declare V0130 (151)  rf=r size=4 type=ud alias=V0127+0 align=2 words (r17.0)
//.declare V0131 (152)  rf=r size=4 type=ud alias=V0128+0 align=2 words (r20.12)
//.declare P10 (153)  rf=f1  size=2 type=uw align=1 words (f0.1)
//.declare V0132 (154)  rf=r size=4 type=d align=2 words (r20.13)
//.declare P11 (155)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare V0133 (156)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0134 (157)  rf=r size=4 type=ud alias=V0133+0 align=32 words (r4.0)
//.declare  (158)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (159)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare V0135 (160)  rf=r size=64 type=d align=32 words (r26.0)
//.declare V0136 (161)  rf=r size=32 type=uw alias=V0125+0 align=32 words (r25.0)
//.declare P12 (162)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0137 (163)  rf=r size=4 type=d align=2 words (r20.14)
//.declare V0138 (164)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0139 (165)  rf=r size=64 type=d align=32 words (r27.0)
//.declare V0140 (166)  rf=r size=64 type=d align=32 words (r28.0)
//.declare V0141 (167)  rf=r size=64 type=ud alias=V0140+0 align=32 words (r28.0)
//.declare V0142 (168)  rf=r size=4 type=d align=32 words (r29.0)
//.declare V0143 (169)  rf=r size=4 type=ud alias=V0142+0 align=32 words (r29.0)
//.declare V0144 (170)  rf=r size=4 type=d align=2 words (r20.15)
//.declare V0145 (171)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0146 (172)  rf=r size=4 type=d align=2 words (r24.1)
//.declare V0147 (173)  rf=r size=4 type=ud alias=V0145+0 align=2 words (r1.8)
//.declare V0148 (174)  rf=r size=4 type=ud alias=V0146+0 align=2 words (r24.1)
//.declare V0149 (175)  rf=r size=4 type=d align=2 words (r24.2)
//.declare P13 (176)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0150 (177)  rf=r size=64 type=ud alias=V0139+0 align=32 words (r27.0)
//.declare V0151 (178)  rf=r size=4 type=ud alias=V0144+0 align=2 words (r20.15)
//.declare V0152 (179)  rf=r size=64 type=f align=32 words (r30.0)
//.declare  (180)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (181)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P14 (182)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0153 (183)  rf=r size=4 type=ud alias=V0149+0 align=2 words (r24.2)
//.declare V0154 (184)  rf=r size=4 type=f align=32 words (r31.0)
//.declare V0155 (185)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0156 (186)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0157 (187)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0158 (188)  rf=r size=8 type=f align=32 words (r10.0)
//.declare  (189)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (190)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare P15 (191)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0159 (192)  rf=r size=4 type=d align=2 words (r24.3)
//.declare P16 (193)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0160 (194)  rf=r size=4 type=ud alias=V0137+0 align=2 words (r20.14)
//.declare V0161 (195)  rf=r size=4 type=ud alias=V0132+0 align=2 words (r20.13)
//.declare P17 (196)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0162 (197)  rf=r size=64 type=ud alias=V0135+0 align=32 words (r26.0)
//.declare V0163 (198)  rf=r size=64 type=f align=32 words (r32.0)
//.declare V0164 (199)  rf=r size=64 type=d align=32 words (r4.0)
//.declare V0165 (200)  rf=r size=64 type=ud alias=V0164+0 align=32 words (r4.0)
//.declare V0166 (201)  rf=r size=4 type=f align=2 words (r24.4)
//.declare V0167 (202)  rf=r size=64 type=f align=32 words (r4.0)
//.declare V0168 (203)  rf=r size=32 type=f align=32 words (r6.0)
//.declare V0169 (204)  rf=r size=16 type=f align=32 words (r8.0)
//.declare V0170 (205)  rf=r size=8 type=f align=32 words (r10.0)
//.declare V0171 (206)  rf=r size=4 type=f align=32 words (r33.0)
//.declare V0172 (207)  rf=r size=4 type=ud align=32 words (r4.0)
//.declare P18 (208)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0173 (209)  rf=r size=4 type=d align=2 words (r24.5)
//.declare V0174 (210)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0175 (211)  rf=r size=4 type=ud alias=V0174+0 align=32 words (r4.0)
//.declare V0176 (212)  rf=r size=4 type=f align=32 words (r5.0)
//.declare P19 (213)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0177 (214)  rf=r size=4 type=ud alias=V0173+0 align=2 words (r24.5)
//.declare V0178 (215)  rf=r size=4 type=f align=2 words (r24.6)
//.declare  (216)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (217)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare V0179 (218)  rf=r size=4 type=f align=2 words (r6.0)
//.declare P20 (219)  rf=f1  size=2 type=uw align=1 words (f1.1)
//.declare V0180 (220)  rf=r size=4 type=f align=32 words (r34.0)
//.declare P21 (221)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare P22 (222)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0181 (223)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0182 (224)  rf=r size=8 type=d alias=V0038+0 align=4 words (r3.2)
//.declare V0183 (225)  rf=r size=4 type=d align=2 words (r2.8)
//.declare V0187 (229)  rf=r size=8 type=ud alias=V0181+0 align=2 words (r1.8)
//.declare V0188 (230)  rf=r size=4 type=d align=32 words (r5.0)
//.declare V0190 (232)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0192 (234)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0193 (235)  rf=r size=8 type=d alias=V0192+0 align=4 words (r4.0)
//.declare V0195 (237)  rf=r size=8 type=q align=4 words (r7.0)
//.declare V0196 (238)  rf=r size=8 type=q alias=V0037+0 align=4 words (r2.2)
//.declare V0197 (239)  rf=r size=8 type=q align=4 words (r8.0)
//.declare V0198 (240)  rf=r size=8 type=q align=4 words (r9.0)
//.declare V0199 (241)  rf=r size=8 type=q align=4 words (r10.0)
//.declare V0200 (242)  rf=r size=8 type=q align=4 words (r11.0)
//.declare V0201 (243)  rf=r size=8 type=q align=32 words (r12.0)
//.declare V0202 (244)  rf=r size=8 type=uq alias=V0201+0 align=32 words (r12.0)
//.declare P23 (245)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0203 (246)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0204 (247)  rf=r size=8 type=d alias=V0040+0 align=4 words (r3.4)
//.declare V0205 (248)  rf=r size=4 type=d align=2 words (r2.8)
//.declare V0206 (249)  rf=r size=4 type=d align=32 words (r35.0)
//.declare V0207 (250)  rf=r size=4 type=d align=2 words (r24.7)
//.declare V0208 (251)  rf=r size=4 type=ud alias=V0206+0 align=2 words (r35.0)
//.declare V0209 (252)  rf=r size=8 type=ud alias=V0203+0 align=2 words (r1.8)
//.declare V0210 (253)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0212 (255)  rf=r size=4 type=d align=32 words (r5.0)
//.declare V0213 (256)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0214 (257)  rf=r size=4 type=f align=2 words (r2.8)
//.declare P24 (258)  rf=f1  size=2 type=uw align=1 words (f0.1)
//.declare V0215 (259)  rf=r size=4 type=f align=2 words (r24.8)
//.declare V0217 (261)  rf=r size=8 type=q align=4 words (r3.3)
//.declare V0218 (262)  rf=r size=8 type=d alias=V0217+0 align=4 words (r3.6)
//.declare V0219 (263)  rf=r size=8 type=q alias=V0039+0 align=4 words (r2.3)
//.declare V0220 (264)  rf=r size=8 type=q align=4 words (r4.0)
//.declare V0222 (266)  rf=r size=8 type=q align=4 words (r5.0)
//.declare V0223 (267)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0224 (268)  rf=r size=8 type=q align=4 words (r24.5)
//.declare V0226 (270)  rf=r size=64 type=ud alias=V0094+0 align=32 words (r21.0)
//.declare V0227 (271)  rf=r size=128 type=q align=32 words (r6.0)
//.declare V0228 (272)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0229 (273)  rf=r size=128 type=uq alias=V0228+0 align=32 words (r8.0)
//.declare V0231 (275)  rf=r size=64 type=ud align=32 words (r10.0)
//.declare V0232 (276)  rf=r size=64 type=hf alias=V0231+0 align=32 words (r10.0)
//.declare V0233 (277)  rf=r size=64 type=f align=32 words (r12.0)
//.declare V0236 (280)  rf=r size=64 type=f align=32 words (r13.0)
//.declare V0237 (281)  rf=r size=16 type=b align=32 words (r15.0)
//.declare V0238 (282)  rf=r size=128 type=q align=32 words (r16.0)
//.declare V0239 (283)  rf=r size=128 type=uq alias=V0238+0 align=32 words (r16.0)
//.declare V0240 (284)  rf=r size=16 type=ub alias=V0237+0 align=32 words (r15.0)
//.declare V0241 (285)  rf=r size=64 type=ud align=32 words (r18.0)
//.declare P25 (286)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (287)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare  (288)  rf=r size=4 type=d alias=V0076+0 align=2 words (r6.0)
//.declare  (289)  rf=r size=4 type=d alias=V0073+0 align=2 words (r5.0)
//.declare  (290)  rf=r size=2 type=w align=1 words (r2.16)
//.declare  (292)  rf=r size=2 type=w align=1 words (r3.12)
//.declare  (293)  rf=r size=128 type=ud align=32 words (r5.0)
//.declare  (294)  rf=r size=32 type=uw align=32 words (r10.0)
//.declare  (295)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (296)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (297)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (298)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (299)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (300)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (301)  rf=r size=32 type=ud align=32 words (r5.0)
//.declare  (302)  rf=r size=16 type=ud align=32 words (r7.0)
//.declare  (303)  rf=r size=8 type=ud align=32 words (r9.0)
//.declare  (304)  rf=r size=64 type=b align=32 words (r14.0)
//.declare  (305)  rf=r size=128 type=ud align=32 words (r4.0)
//.declare  (306)  rf=r size=32 type=uw align=32 words (r11.0)
//.declare r0 (308)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (309)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare inlineRegFromTDL (310)  rf=r size=32 type=ud align=2 words (r1.0)
//.declare inlineRegExpectedLocation (311)  rf=r size=32 type=ud align=2 words (r2.0)
//.declare  (312)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (313)  rf=r size=64 type=ud align=32 words (r3.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0045    | :w x 16  |   0x20 | r1       | pti[tid]+0x0     |
// | V0034    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0036    | :uq      |    0x8 | r2+0x8   | inline+0x8       |
// | V0037    | :uq      |    0x8 | r2+0x10  | inline+0x10      |
// | V0039    | :uq      |    0x8 | r2+0x18  | inline+0x18      |
// | V0035    | :q       |    0x8 | r3       | cti+0x20         |
// | V0038    | :q       |    0x8 | r3+0x8   | cti+0x28         |
// | V0040    | :q       |    0x8 | r3+0x10  | cti+0x30         |
// | V0048    | :uq      |    0x8 | r3+0x18  | cti+0x38         |
// | V0044    | :d x 3   |    0xC | r3+0x20  | cti+0x40         |
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
(W)     shr (1|M0)               r20.0<1>:uq   r19.1<0;1,0>:ud   1:w               {A@1}             //  ALU pipe: int; $4
(W)     and (1|M0)               r20.2<1>:d    r19.1<0;1,0>:d    1:w                                 //  ALU pipe: int; $5
(W)     shl (1|M0)               r1.4<1>:q     r20.0<0;1,0>:q    3:w               {@2,$0.dst}       //  ALU pipe: int; $10
(W)     mov (1|M0)               r20.3<1>:d    0:w                                                   //  ALU pipe: int; $7
(W)     add (1|M0)               r4.0<1>:q     r1.4<0;1,0>:q     r2.0<0;1,0>:q    {I@2}              //  ALU pipe: int; $11
(W)     load.ugm.d64x1t.a64 (1|M0)  r5:1        [r4:1]             {I@1,$2} // ex_desc:0x0; desc:0x2108780 // $12
(W)     mov (1|M0)               r20.4<1>:d    r5.1<0;1,0>:d                    {$2.dst}             //  ALU pipe: int; $13
(W)     shr (1|M0)               r6.0<1>:uq    r5.0<0;1,0>:uq    6:w                                 //  ALU pipe: int; $14
(W)     cmp (16|M0)   (gt)f1.0   null<1>:d     r20.4<0;1,0>:d    -1:w               {I@2}            //  ALU pipe: int; $16
(W)     and (1|M0)               r7.0<1>:d     r5.0<0;1,0>:d     63:w                                //  ALU pipe: int; $19
(W&f1.0) sel (1|M0)              r20.5<1>:d    r6.0<0;1,0>:d     -1:w               {I@3}            //  ALU pipe: int; $17
(W&f1.0) sel (1|M0)              r20.6<1>:d    r7.0<0;1,0>:d     -1:w               {I@2}            //  ALU pipe: int; $20
(W)     cmp (16|M0)   (gt)f3.0   null<1>:d     r20.5<0;1,0>:d    -1:w               {I@2}            //  ALU pipe: int; $21
(W&f3.0) jmpi                                _0_049                                                  //  ALU pipe: int; $22
// B003: Preds:{B002},  Succs:{B005}
_0_050:
(W)     mov (1|M0)               r20.7<1>:d    0:w                                                   //  ALU pipe: int; $24
(W)     jmpi                                 _0_051                                                  // $25
// B004: Preds:{B002},  Succs:{B005}
_0_049:
(W)     mov (2|M0)               r1.8<1>:d     r3.0<1;1,0>:d                    {$1.dst}             //  ALU pipe: int; $27
(W)     mov (1|M0)               r2.16<1>:hf   0x0:hf                                                //  ALU pipe: float; $29
(W)     cmp (16|M0)   (lt)f0.0   null<1>:d     r20.5<0;1,0>:ud   r1.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $28
(W)     mov (1|M0)               r3.12<1>:hf   0xFFFF:hf                                             //  ALU pipe: float; $35
(W&f0.0) cmp (16|M0)  (eq)f0.0   null<1>:d     r2.16<0;1,0>:w    r1.9<0;1,0>:d    {F@2}              //  ALU pipe: int; $29
(W&~f0.0) cmp (16|M0) (lt)f0.0   null<1>:d     r2.16<0;1,0>:w    r1.9<0;1,0>:d                       //  ALU pipe: int; $31
(W&f0.0) cmp (16|M0)  (gt)f0.0   null<1>:d     r20.4<0;1,0>:d    -1:w                                //  ALU pipe: int; $33
(W&f0.0) sel (1|M0)              r20.7<1>:d    r3.12<0;1,0>:w    0:w               {F@1}             //  ALU pipe: int; $35
// B005: Preds:{B004, B003},  Succs:{B006, B007}
_0_051:
(W)     shl (1|M0)               r1.4<1>:q     r20.0<0;1,0>:q    10:w                                //  ALU pipe: int; $37
        cmp (16|M0)   (lt)f0.0   null<2>:w     r1.0<1;1,0>:uw    0x100:uw                            //  ALU pipe: int; $42
(W)     shl (1|M0)               r3.3<1>:q     r20.1<0;1,0>:q    9:w               {$1.dst}          //  ALU pipe: int; $39
(W)     add (1|M0)               r2.4<1>:q     r1.4<0;1,0>:q     r2.1<0;1,0>:q    {I@3}              //  ALU pipe: int; $38
        mov (16|M0)              r21.0<1>:d    r1.0<1;1,0>:uw                                        //  ALU pipe: int; $41
(W)     add (1|M0)               r20.4<1>:q    r2.4<0;1,0>:q     r3.3<0;1,0>:q    {I@2}              //  ALU pipe: int; $40
(f0.0)  goto (16|M0)                         _0_052            _0_052                                //  ALU pipe: int; $43
// B006: [inDivergent],  Preds:{B005},  Succs:{B010}
_0_053:
        mov (16|M0)              r22.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $45
        goto (16|M0)                         _0_052            _0_054                                // $46
// B007: [inDivergent],  Preds:{B005},  Succs:{B008}
_0_052:
        join (16|M0)                         _0_054                                                  // 
L744:
        mov (16|M0)              r22.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $48
        mov (16|M0)              r23.0<1>:d    r21.0<1;1,0>:d                   {Compacted,I@5}      //  ALU pipe: int; $49
// B008: [inDivergent],  Preds:{B009, B007},  Succs:{B009, B010}
_0_055:
        shl (16|M0)              r4.0<1>:d     r23.0<1;1,0>:d    1:w               {Compacted,I@1}   //  ALU pipe: int; $51
        mov (16|M0)              r5.0<2>:ud    r4.0<1;1,0>:ud                   {I@1}                //  ALU pipe: int; $53
        add (16|M0)              r7.0<1>:q     r20.4<0;1,0>:q    r5.0<2;1,0>:ud   {I@1}              //  ALU pipe: int; $53
        load.ugm.d16u32.a64 (16|M0)  r9:1       [r7:2]             {I@1,$3} // ex_desc:0x0; desc:0x4100B80 // $54
        cmp (16|M0)   (lt)f1.0   null<1>:d     r23.0<1;1,0>:ud   0xE0:uw                             //  ALU pipe: int; $59
        mov (16|M0)              r10.0<1>:uw   r9.0<2;1,0>:uw                   {$3.dst}             //  ALU pipe: int; $56
        mov (16|M0)              r11.0<1>:f    r10.0<1;1,0>:hf                  {I@1}                //  ALU pipe: float; $56
        and (16|M0)              r12.0<1>:d    r11.0<1;1,0>:d    2147483647:d               {F@1}    //  ALU pipe: int; $57
        sel (16|M0)   (ge)f0.0   r22.0<1>:f    r22.0<1;1,0>:f    r12.0<1;1,0>:f   {I@1}              //  ALU pipe: float; $58
(~f1.0) goto (16|M0)                         _0_054            _0_054                                //  ALU pipe: int; $60
// B009: [inDivergent],  Preds:{B008},  Succs:{B008}
_0_056:
        add (16|M0)              r23.0<1>:d    r23.0<1;1,0>:d    32:w               {Compacted}      //  ALU pipe: int; $62
(W)     jmpi                                 _0_055                                                  // $64
// B010: Preds:{B008, B006},  Succs:{B011, B012}
_0_054:
        join (16|M0)                         L952                                                    // 
L952:
(W)     mov (16|M0)              r4.0<1>:f     0xFF800000:f                               {Compacted} //  ALU pipe: float; $66
        mov (16|M0)              r4.0<1>:f     r22.0<1;1,0>:f                   {Compacted,F@2}      //  ALU pipe: float; $67
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $68
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $68
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $69
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $69
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $70
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $70
(W)     sel (1|M0)    (ge)f0.0   r24.0<1>:f    r10.0<0;1,0>:f    r10.1<0;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $71
(W)     send.slm (1|M0)          r11      r19  null:0  0x0            0x0210001F           {$4} // wr:1+0, rd:1; fence.slm.none.group // $72
(W)     mov (1|M0)               r12.2<1>:f    0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $73
(W)     mov (2|M0)               r12.10<1>:ub  r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $73
(W)     mov (8|M0)               null<1>:ud    r11.0<1;1,0>:ud                  {Compacted,$4.dst}   //  memory fence commit; ALU pipe: int; $73
(W)     send.gtwy (1|M0)         null     r12  null:0  0x0            0x02000004           {I@2,$5} // wr:1+0, rd:0; signal barrier // $73
(W)     sync.bar                             0x0                                                     // $73
(W)     mul (1|M0)               acc0.0<1>:d   r3.9<0;1,0>:d     r3.16<0;1,0>:uw                     //  ALU pipe: int; $75
(W)     macl (1|M0)              r14.0<1>:d    r3.9<0;1,0>:d     r3.8<0;1,0>:d                       //  ALU pipe: int; $76
(W)     mov (1|M0)               r13.0<2>:b    r19.8<0;1,0>:b                                        //  ALU pipe: int; $74
(W)     mul (1|M0)               acc0.0<1>:d   r14.0<0;1,0>:d    r3.20<0;1,0>:uw  {I@2}              //  ALU pipe: int; $76
(W)     macl (1|M0)              r15.0<1>:d    r14.0<0;1,0>:d    r3.10<0;1,0>:d                      //  ALU pipe: int; $77
(W)     mov (1|M0)               r20.12<1>:d   r13.0<0;1,0>:ub                  {I@3}                //  ALU pipe: int; $83
(W)     add (1|M0)               r20.10<1>:d   r15.0<0;1,0>:d    15:w               {I@2}            //  ALU pipe: int; $77
(W)     mov (8|M0)               r25.0<1>:w    0x76543210:v                                          //  ALU pipe: int; $79
(W)     shr (1|M0)               r20.11<1>:ud  r20.10<0;1,0>:ud  4:w               {I@2}             //  ALU pipe: int; $78
(W)     and (1|M0)               r16.0<1>:d    r15.0<0;1,0>:d    15:w               {Compacted}      //  ALU pipe: int; $81
(W)     add (1|M0)               r17.0<1>:d    r20.11<0;1,0>:d   -1:w               {Compacted,I@2}  //  ALU pipe: int; $82
(W)     add (8|M0)               r25.8<1>:w    r25.0<1;1,0>:w    8:w                                 //  ALU pipe: int; $80
(W)     cmp (1|M0)    (gt)f0.1   null<1>:ud    r17.0<0;1,0>:ud   r20.12<0;1,0>:ud {I@2}              //  ALU pipe: int; $84
        cmp (16|M0)   (eq)f3.0   null<2>:w     r25.0<1;1,0>:w    0:w               {I@2}             //  ALU pipe: int; $88
(W&~f0.1) cmp (1|M0)  (eq)f0.1   null<1>:d     r16.0<0;1,0>:d    0:w                                 //  ALU pipe: int; $85
(W&~f0.1) sel (1|M0)             r20.13<1>:d   r16.0<0;1,0>:d    16:w                                //  ALU pipe: int; $87
(~f3.0) goto (16|M0)                         _0_057            _0_057                                //  ALU pipe: int; $89
// B011: [inDivergent],  Preds:{B010},  Succs:{B012}
_0_058:
(W)     shl (1|M0)               r4.0<1>:d     r20.12<0;1,0>:d   2:w                                 //  ALU pipe: int; $91
(W)     store.slm.d32x1t.a32 (1|M0)  [r4:1]     r24:1              {I@1,$6} // ex_desc:0x0; desc:0x2008504 // $92
// B012: Preds:{B011, B010},  Succs:{B013, B014}
_0_057:
        join (16|M0)                         L1424                                                   // 
L1424:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$7} // wr:1+0, rd:1; fence.slm.none.group // $94
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $95
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $95
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$7.dst}             //  memory fence commit; ALU pipe: int; $95
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$8} // wr:1+0, rd:0; signal barrier // $95
(W)     sync.bar                             0x0                                                     // $95
(W)     cmp (16|M0)   (gt)f2.0   null<1>:d     r20.10<0;1,0>:ud  0x10F:uw                            //  ALU pipe: int; $97
        mov (16|M0)              r26.0<1>:d    r25.0<1;1,0>:uw                                       //  ALU pipe: int; $96
(W&f2.0) jmpi                                _0_059                                                  //  ALU pipe: int; $98
// B013: Preds:{B012},  Succs:{B024}
_0_060:
(W)     mov (1|M0)               r20.14<1>:d   r20.11<0;1,0>:d                                       //  ALU pipe: int; $100
(W)     jmpi                                 _0_061                                                  // $101
// B014: Preds:{B012},  Succs:{B015}
_0_059:
(W)     shl (1|M0)               r1.8<1>:d     r20.12<0;1,0>:d   4:w                                 //  ALU pipe: int; $103
(W)     shl (1|M0)               r29.0<1>:d    r20.12<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $106
        add (16|M0)              r27.0<1>:d    r1.8<0;1,0>:d     r26.0<1;1,0>:d   {Compacted,I@2}    //  ALU pipe: int; $104
        shl (16|M0)              r28.0<1>:d    r27.0<1;1,0>:d    2:w               {I@1}             //  ALU pipe: int; $105
(W)     mov (1|M0)               r20.15<1>:d   r20.11<0;1,0>:d                                       //  ALU pipe: int; $107
// B015: Preds:{B023, B014},  Succs:{B016, B017}
_0_062:
        cmp (16|M0)   (lt)f2.1   null<1>:d     r27.0<1;1,0>:ud   r20.15<0;1,0>:ud {I@1}              //  ALU pipe: int; $112
(W)     add (1|M0)               r1.8<1>:d     r20.15<0;1,0>:d   15:w                                //  ALU pipe: int; $109
(W)     shr (1|M0)               r24.1<1>:ud   r1.8<0;1,0>:ud    4:w               {@1,$6.src}       //  ALU pipe: int; $110
(W)     and (1|M0)               r24.2<1>:d    r1.8<0;1,0>:d     536870896:d                         //  ALU pipe: int; $111
(f2.1)  goto (16|M0)                         _0_063            _0_063                                //  ALU pipe: int; $113
// B016: [inDivergent],  Preds:{B015},  Succs:{B018}
_0_064:
        mov (16|M0)              r30.0<1>:f    0xFF800000:f                               {$9.dst}   //  ALU pipe: float; $115
        goto (16|M0)                         _0_063            _0_065                                // $116
// B017: [inDivergent],  Preds:{B015},  Succs:{B018}
_0_063:
        join (16|M0)                         _0_065                                                  // 
L1792:
        load.slm.d32.a32 (16|M0)  r30:1         [r28:1]            {F@1,$9} // ex_desc:0x0; desc:0x2100500 // $118
// B018: Preds:{B017, B016},  Succs:{B019, B021}
_0_065:
        join (16|M0)                         L1824                                                   // 
L1824:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$12} // wr:1+0, rd:1; fence.slm.none.group // $120
        sync.nop                             null                             {$11.src}              // $121
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$8.src}        //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $121
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $121
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$12.dst}            //  memory fence commit; ALU pipe: int; $121
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$13} // wr:1+0, rd:0; signal barrier // $121
(W)     sync.bar                             0x0                                                     // $121
        cmp (16|M0)   (lt)f2.0   null<1>:d     r27.0<1;1,0>:ud   r24.2<0;1,0>:ud                     //  ALU pipe: int; $122
(~f2.0) goto (16|M0)                         _0_066            _0_066                                //  ALU pipe: int; $123
// B019: [inDivergent],  Preds:{B018},  Succs:{B020, B021}
_0_067:
(W)     mov (16|M0)              r4.0<1>:ud    0xFF800000:ud                                         //  ALU pipe: int; $125
        sync.nop                             null                             {Compacted,I@1}        // $126
        mov (16|M0)              r4.0<1>:f     r30.0<1;1,0>:f                   {Compacted,$9.dst}   //  ALU pipe: float; $126
        sync.nop                             null                             {Compacted,F@1}        // $127
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$13.src}  //  ALU pipe: int; $127
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $127
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $128
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $128
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $129
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $129
(W)     sel (1|M0)    (ge)f0.0   r31.0<1>:f    r10.0<0;1,0>:f    r10.1<0;1,0>:f   {@1,$10.src}       //  ALU pipe: float; $130
(~f3.0) goto (16|M0)                         _0_066            _0_066                                //  ALU pipe: int; $131
// B020: [inDivergent],  Preds:{B019},  Succs:{B021}
_0_068:
(W)     store.slm.d32x1t.a32 (1|M0)  [r29:1]    r31:1              {F@1,$10} // ex_desc:0x0; desc:0x2008504 // $133
// B021: Preds:{B020, B019, B018},  Succs:{B022, B023}
_0_066:
        join (16|M0)                         L2128                                                   // 
L2128:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$14} // wr:1+0, rd:1; fence.slm.none.group // $135
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$13.src}       //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $136
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $136
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {$14.dst}            //  memory fence commit; ALU pipe: int; $136
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$11} // wr:1+0, rd:0; signal barrier // $136
(W)     sync.bar                             0x0                                                     // $136
(W)     cmp (16|M0)   (gt)f1.1   null<1>:d     r20.15<0;1,0>:ud  0x100:uw                            //  ALU pipe: int; $137
(W)     mov (1|M0)               r24.3<1>:d    r24.1<0;1,0>:d                                        //  ALU pipe: int; $138
(W&f1.1) jmpi                                _0_069                                                  //  ALU pipe: int; $139
// B022: Preds:{B021},  Succs:{B024}
_0_070:
(W)     mov (1|M0)               r20.14<1>:d   r24.3<0;1,0>:d                   {I@2}                //  ALU pipe: int; $141
(W)     jmpi                                 _0_061                                                  // $142
// B023: Preds:{B021},  Succs:{B015}
_0_069:
(W)     mov (1|M0)               r20.15<1>:d   r24.1<0;1,0>:d                                        //  ALU pipe: int; $144
(W)     jmpi                                 _0_062                                                  // $145
// B024: Preds:{B022, B013},  Succs:{B025, B029}
_0_061:
(W)     cmp (16|M0)   (gt)f2.1   null<1>:d     r20.14<0;1,0>:ud  r20.13<0;1,0>:ud {I@4}              //  ALU pipe: int; $147
(W&f2.1) jmpi                                _0_071                                                  //  ALU pipe: int; $148
// B025: Preds:{B024},  Succs:{B026, B027}
_0_072:
        cmp (16|M0)   (gt)f2.0   null<1>:d     r20.14<0;1,0>:ud  r26.0<1;1,0>:ud                     //  ALU pipe: int; $150
(f2.0)  goto (16|M0)                         _0_073            _0_073                                //  ALU pipe: int; $151
// B026: [inDivergent],  Preds:{B025},  Succs:{B028}
_0_074:
        mov (16|M0)              r32.0<1>:f    0xFF800000:f                                          //  ALU pipe: float; $153
        goto (16|M0)                         _0_073            _0_075                                // $154
// B027: [inDivergent],  Preds:{B025},  Succs:{B028}
_0_073:
        join (16|M0)                         _0_075                                                  // 
L2448:
        shl (16|M0)              r4.0<1>:d     r26.0<1;1,0>:d    2:w               {Compacted,$6.src} //  ALU pipe: int; $156
        load.slm.d32.a32 (16|M0)  r32:1         [r4:1]             {A@1,$15} // ex_desc:0x0; desc:0x2100500 // $157
// B028: Preds:{B027, B026},  Succs:{B034}
_0_075:
        join (16|M0)                         L2488                                                   // 
L2488:
        sync.nop                             null                             {Compacted,$15.src}    // $159
(W)     mov (16|M0)              r4.0<1>:ud    0xFF800000:ud                              {$6.src}   //  ALU pipe: int; $159
        sync.nop                             null                             {Compacted,I@1}        // $160
        mov (16|M0)              r4.0<1>:f     r32.0<1;1,0>:f                   {Compacted,$15.dst}  //  ALU pipe: float; $160
        sync.nop                             null                             {Compacted,F@1}        // $161
        sync.nop                             null                             {Compacted,$11.src}    // $161
(W)     mov (8|M0)               r5.0<1>:ud    r4.8<1;1,0>:ud                   {Compacted,$8.src}   //  ALU pipe: int; $161
(W)     sel (8|M0)    (ge)f0.0   r6.0<1>:f     r4.0<1;1,0>:f     r5.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $161
(W)     mov (4|M0)               r7.0<1>:ud    r6.4<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $162
(W)     sel (4|M0)    (ge)f0.0   r8.0<1>:f     r6.0<1;1,0>:f     r7.0<1;1,0>:f    {Compacted,I@1}    //  ALU pipe: float; $162
(W)     mov (2|M0)               r9.0<1>:ud    r8.2<1;1,0>:ud                   {Compacted,F@1}      //  ALU pipe: int; $163
(W)     sel (2|M0)    (ge)f0.0   r10.0<1>:f    r8.0<1;1,0>:f     r9.0<1;1,0>:f    {I@1}              //  ALU pipe: float; $163
(W)     sel (1|M0)    (ge)f0.0   r24.4<1>:f    r10.0<0;1,0>:f    r10.1<0;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $164
(W)     jmpi                                 _0_076                                                  // $165
// B029: Preds:{B024},  Succs:{B030, B031}
_0_071:
(W)     mov (1|M0)               r4.0<1>:ud    0x0:uw                              {$6.src}          //  ALU pipe: int; $167
(W)     cmp (16|M0)   (gt)f1.1   null<1>:d     r20.14<0;1,0>:ud  0x1:uw                              //  ALU pipe: int; $169
(W)     load.slm.d32x1t.a32 (1|M0)  r33:1       [r4:1]             {I@2,$0} // ex_desc:0x0; desc:0x2108500 // $168
(W&f1.1) jmpi                                _0_077                                                  //  ALU pipe: int; $170
// B030: Preds:{B029},  Succs:{B034}
_0_078:
(W)     mov (1|M0)               r24.4<1>:f    r33.0<0;1,0>:f                   {$0.dst}             //  ALU pipe: float; $172
(W)     jmpi                                 _0_076                                                  // $173
// B031: Preds:{B029},  Succs:{B032}
_0_077:
(W)     mov (1|M0)               r24.5<1>:d    1:w                                                   //  ALU pipe: int; $175
// B032: Preds:{B032, B031},  Succs:{B033, B032}
_0_079:
(W)     shl (1|M0)               r4.0<1>:d     r24.5<0;1,0>:d    2:w               {@1,$0.src}       //  ALU pipe: int; $177
(W)     add (1|M0)               r24.5<1>:d    r24.5<0;1,0>:d    1:w                                 //  ALU pipe: int; $180
        sync.allrd                           ($8,$11)                                                // $178
(W)     load.slm.d32x1t.a32 (1|M0)  r5:1        [r4:1]             {I@2,$1} // ex_desc:0x0; desc:0x2108500 // $178
(W)     cmp (16|M0)   (lt)f0.1   null<1>:d     r24.5<0;1,0>:ud   r20.14<0;1,0>:ud {I@1}              //  ALU pipe: int; $181
        sync.nop                             null                             {Compacted,$1.dst}     // $179
(W)     sel (1|M0)    (ge)f0.0   r33.0<1>:f    r33.0<0;1,0>:f    r5.0<0;1,0>:f    {Compacted,$0.dst} //  ALU pipe: float; $179
(W)     mov (1|M0)               r24.6<1>:f    r33.0<0;1,0>:f                   {F@1}                //  ALU pipe: float; $182
(W&f0.1) jmpi                                _0_079                                                  //  ALU pipe: int; $183
// B033: Preds:{B032},  Succs:{B034}
_0_080:
(W)     mov (1|M0)               r24.4<1>:f    r24.6<0;1,0>:f                   {F@1}                //  ALU pipe: float; $185
// B034: Preds:{B033, B030, B028},  Succs:{B035, B036}
_0_076:
(W)     send.slm (1|M0)          r4       r19  null:0  0x0            0x0210001F           {$2} // wr:1+0, rd:1; fence.slm.none.group // $187
        sync.nop                             null                             {Compacted,$11.src}    // $188
(W)     mov (1|M0)               r5.2<1>:f     0x100:f                               {$8.src}        //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $188
(W)     mov (2|M0)               r5.10<1>:ub   r19.11<0;1,0>:ub                 {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $188
(W)     mov (8|M0)               null<1>:ud    r4.0<1;1,0>:ud                   {Compacted,$2.dst}   //  memory fence commit; ALU pipe: int; $188
(W)     send.gtwy (1|M0)         null     r5  null:0  0x0            0x02000004           {I@2,$3} // wr:1+0, rd:0; signal barrier // $188
(W)     sync.bar                             0x0                                                     // $188
(W)     cmp (16|M0)   (ne)f3.1   null<1>:d     r20.7<0;1,0>:d    0:w                                 //  ALU pipe: int; $192
(W)     cmp (1|M0)    (eq)f1.1   null<1>:f     r24.4<0;1,0>:f    0x0:f                               //  ALU pipe: float; $190
(W)     mul (1|M0)               r6.0<1>:f     r24.4<0;1,0>:f    0x3C010204:f                        //  ALU pipe: float; $189
(f3.1)  cmp (16|M0)   (eq)f3.1   null<2>:w     r1.0<1;1,0>:w     0:w                                 //  ALU pipe: int; $193
(W&~f1.1) sel (1|M0)             r34.0<1>:f    r6.0<0;1,0>:f     0x0:f               {F@1}           //  ALU pipe: float; $191
(~f3.1) goto (16|M0)                         _0_081            _0_081                                //  ALU pipe: int; $195
// B035: [inDivergent],  Preds:{B034},  Succs:{B036}
_0_082:
(W)     mov (2|M0)               r1.8<1>:d     r3.2<1;1,0>:d                                         //  ALU pipe: int; $197
(W)     asr (1|M0)               r2.8<1>:d     r20.5<0;1,0>:d    31:w                                //  ALU pipe: int; $198
(W)     mul (1|M0)               acc0.0<1>:ud  r20.5<0;1,0>:ud   r1.16<0;1,0>:uw  {I@2}              //  ALU pipe: int; $199
(W)     macl (1|M0)              r4.0<1>:ud    r20.5<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; $200
(W)     mul (1|M0)               acc0.0<1>:ud  r20.5<0;1,0>:ud   r1.16<0;1,0>:uw                     //  ALU pipe: int; $200
(W)     mach (1|M0)              r5.0<1>:d     r20.5<0;1,0>:ud   r1.8<0;1,0>:ud   {$3.src}           //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r20.5<0;1,0>:ud   r1.18<0;1,0>:uw                     //  ALU pipe: int; $201
(W)     macl (1|M0)              r6.0<1>:d     r20.5<0;1,0>:ud   r1.9<0;1,0>:d    {F@1}              //  ALU pipe: int; $202
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:ud    r2.16<0;1,0>:uw  {I@7}              //  ALU pipe: int; $203
(W)     add (1|M0)               r5.0<1>:d     r5.0<0;1,0>:d     r6.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $202
(W)     macl (1|M0)              r6.0<1>:d     r1.8<0;1,0>:ud    r2.8<0;1,0>:d                       //  ALU pipe: int; $205
(W)     shl (1|M0)               r7.0<1>:q     r20.6<0;1,0>:d    3:w                                 //  ALU pipe: int; $211
(W)     add (1|M0)               r4.1<1>:d     r5.0<0;1,0>:d     r6.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $205
(W)     shl (1|M0)               r11.0<1>:q    r20.1<0;1,0>:q    2:w               {Compacted}       //  ALU pipe: int; $215
(W)     shl (1|M0)               r8.0<1>:q     r4.0<0;1,0>:q     2:w               {Compacted,I@2}   //  ALU pipe: int; $212
(W)     add (1|M0)               r9.0<1>:q     r8.0<0;1,0>:q     r2.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $213
(W)     add (1|M0)               r10.0<1>:q    r9.0<0;1,0>:q     r7.0<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $214
(W)     add (1|M0)               r12.0<1>:q    r10.0<0;1,0>:q    r11.0<0;1,0>:q   {@1,$5.src}        //  ALU pipe: int; $216
(W)     store.ugm.d32x1t.a64 (1|M0)  [r12:1]    r34:1              {I@1,$4} // ex_desc:0x0; desc:0x2008584 // $217
// B036: Preds:{B035, B034},  Succs:{B037, B041}
_0_081:
        join (16|M0)                         L3344                                                   // 
L3344:
(W)     cmp (16|M0)   (ne)f1.0   null<1>:d     r20.7<0;1,0>:d    0:w                                 //  ALU pipe: int; $219
(W&~f1.0) jmpi                               _0_083                                                  //  ALU pipe: int; $220
// B037: Preds:{B036},  Succs:{B038, B041}
_0_084:
(W)     mov (2|M0)               r1.8<1>:d     r3.4<1;1,0>:d                                         //  ALU pipe: int; $222
(W)     asr (1|M0)               r2.8<1>:d     r20.5<0;1,0>:d    31:w                                //  ALU pipe: int; $223
(W)     mul (1|M0)               acc0.0<1>:ud  r20.5<0;1,0>:ud   r1.16<0;1,0>:uw  {I@2}              //  ALU pipe: int; $224
(W)     macl (1|M0)              r35.0<1>:ud   r20.5<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; $225
(W)     mul (1|M0)               acc0.0<1>:ud  r20.5<0;1,0>:ud   r1.16<0;1,0>:uw                     //  ALU pipe: int; $225
(W)     mach (1|M0)              r4.0<1>:d     r20.5<0;1,0>:ud   r1.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r20.5<0;1,0>:ud   r1.18<0;1,0>:uw                     //  ALU pipe: int; $226
(W)     macl (1|M0)              r5.0<1>:d     r20.5<0;1,0>:ud   r1.9<0;1,0>:d    {$3.src}           //  ALU pipe: int; $227
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:ud    r2.16<0;1,0>:uw  {I@7}              //  ALU pipe: int; $228
(W)     add (1|M0)               r4.0<1>:d     r4.0<0;1,0>:d     r5.0<0;1,0>:d    {I@2}              //  ALU pipe: int; $227
(W)     macl (1|M0)              r5.0<1>:d     r1.8<0;1,0>:ud    r2.8<0;1,0>:d                       //  ALU pipe: int; $230
(W)     add (1|M0)               r24.7<1>:d    r4.0<0;1,0>:d     r5.0<0;1,0>:d    {I@1}              //  ALU pipe: int; $230
(~f0.0) goto (16|M0)                         _0_083            _0_083                                //  ALU pipe: int; $231
// B038: [inDivergent],  Preds:{B037},  Succs:{B039}
_0_085:
(W)     mov (1|M0)               r3.6<1>:d     r35.0<0;1,0>:d                                        //  ALU pipe: int; $237
(W)     mov (1|M0)               r3.7<1>:d     r24.7<0;1,0>:d                   {I@3}                //  ALU pipe: int; $238
(W)     math.inv (1|M0)          r2.8<1>:f     r34.0<0;1,0>:f                                        //  ALU pipe: math; $234
(W)     cmp (1|M0)    (eq)f0.1   null<1>:f     r34.0<0;1,0>:f    0x0:f                               //  ALU pipe: float; $235
(W)     shl (1|M0)               r5.0<1>:q     r20.6<0;1,0>:d    9:w                                 //  ALU pipe: int; $243
(W)     add (1|M0)               r4.0<1>:q     r3.3<0;1,0>:q     r2.3<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $241
(W)     shl (1|M0)               r1.4<1>:q     r20.1<0;1,0>:q    8:w                                 //  ALU pipe: int; $233
(W)     add (1|M0)               r6.0<1>:q     r4.0<0;1,0>:q     r5.0<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $244
(W&~f0.1) sel (1|M0)             r24.8<1>:f    r2.8<0;1,0>:f     0x0:f               {M@1}           //  ALU pipe: float; $236
(W)     add (1|M0)               r24.5<1>:q    r6.0<0;1,0>:q     r1.4<0;1,0>:q    {I@1}              //  ALU pipe: int; $245
// B039: [inDivergent],  Preds:{B040, B038},  Succs:{B040, B041}
_0_086:
        mov (16|M0)              r4.0<2>:ud    r21.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $248
        shl (16|M0)              r6.0<1>:q     r4.0<2;1,0>:ud    1:w               {I@1}             //  ALU pipe: int; $248
        add (16|M0)              r8.0<1>:q     r20.4<0;1,0>:q    r6.0<1;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $249
        load.ugm.d16u32.a64 (16|M0)  r10:1      [r8:2]             {I@1,$7} // ex_desc:0x0; desc:0x4100B80 // $250
        cmp (16|M0)   (lt)f3.1   null<1>:d     r21.0<1;1,0>:ud   0xE0:uw                             //  ALU pipe: int; $261
        add (16|M0)              r16.0<1>:q    r24.5<0;1,0>:q    r4.0<2;1,0>:ud   {$6.src}           //  ALU pipe: int; $258
        mov (16|M0)              r11.0<1>:uw   r10.0<2;1,0>:uw                  {$7.dst}             //  ALU pipe: int; $252
        sync.nop                             null                             {Compacted,I@1}        // $252
        sync.nop                             null                             {Compacted,$4.src}     // $252
        mov (16|M0)              r12.0<1>:f    r11.0<1;1,0>:hf                  {$5.src}             //  ALU pipe: float; $252
        mul (16|M0)              acc0.0<1>:f   r24.8<0;1,0>:f    r12.0<1;1,0>:f   {F@1}              //  ALU pipe: float; $253
        rnde (16|M0)             acc0.0<1>:f   acc0.0<1;1,0>:f                                       //  ALU pipe: float; $254
        sel (16|M0)   (ge)f0.0   acc0.0<1>:f   acc0.0<1;1,0>:f   0xC2FE0000:f                        //  ALU pipe: float; $255
        sel (16|M0)   (lt)f0.0   r13.0<1>:f    acc0.0<1;1,0>:f   0x42FE0000:f                        //  ALU pipe: float; $256
        mov (16|M0)              r14.0<4>:b    r13.0<1;1,0>:f                   {F@1}                //  ALU pipe: int; $257
        mov (16|M0)              r15.0<1>:b    r14.0<4;1,0>:b                   {I@1}                //  ALU pipe: int; $257
        mov (16|M0)              r18.0<1>:ud   r15.0<1;1,0>:ub                  {I@1}                //  ALU pipe: int; $259
        store.ugm.d8u32.a64 (16|M0)  [r16:2]    r18:1              {I@1,$6} // ex_desc:0x0; desc:0x4000984 // $260
(~f3.1) goto (16|M0)                         _0_083            _0_083                                //  ALU pipe: int; $262
// B040: [inDivergent],  Preds:{B039},  Succs:{B039}
_0_087:
        add (16|M0)              r21.0<1>:d    r21.0<1;1,0>:d    32:w                                //  ALU pipe: int; $264
(W)     jmpi                                 _0_086                                                  // $265
// B041: Preds:{B039, B037, B036},  Succs:{}
_0_083:
        join (16|M0)                         L4048                                                   // 
L4048:
(W)     mov (16|M0)              r127.0<1>:f   r19.0<1;1,0>:f                                        //  ALU pipe: float; $267
(W)     send.gtwy (1|M0)         null     r127  null:0  0x0            0x02000010           {EOT,F@1,$8} // wr:1+0, rd:0; end of thread // $267
L4080:
(W)     mov (16|M0)              null<1>:ud    0xE7AB99C9:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x21E26E3B:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x5:ud                                                // 


//.BankConflicts: 0
//.ByteRMWs: 2
//


//.numALUInst: 224
//.accSubDef: 3
//.accSubUse: 3
//.accSubCandidateDef: 3
//.accSubCandidateUse: 3
//
//
//.singlePipeAtOneDistNum: 71
//.allAtOneDistNum: 4
//.syncInstCount: 11
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 17
//.AfterReadTokenDepCount: 24
