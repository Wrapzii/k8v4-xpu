//.kernel _ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2MergeOutKernelILi4EEE
//.platform XE2
//.thread_config numGRF=128, numAcc=4, numSWSB=16
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 2337579243 2071589261 -hashmovs1 0 8 "
//.full_options "-emitLocation -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemptionR0Only -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortOnSpill 4 -enableBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 100 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 2337579243 2071589261 -hashmovs1 0 8 -GRFBumpUpNumber 2 "
//.instCount 199
//.RA type	LOCAL_ROUND_ROBIN_BC_RA
//.git-hash 3eef0f89d3a4fe2b443de595e23d7700a5d1491b

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r31.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare %null (10)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (13)  rf=r size=4 type=ud align=2 words (r2.10)
//.declare %local_id_y (14)  rf=r size=4 type=ud align=2 words (r2.11)
//.declare %local_size_x (15)  rf=r size=4 type=ud align=2 words (r2.6)
//.declare %local_size_y (16)  rf=r size=4 type=ud align=2 words (r2.7)
//.declare %group_id_x (17)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (18)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (19)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (20)  rf=r size=4 type=ud align=2 words (r2.8)
//.declare %group_count_y (21)  rf=r size=4 type=ud align=2 words (r2.9)
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
//.declare V0033 (43)  rf=r size=64 type=d alias=+0 align=32 words (r31.0)
//.declare V0034 (44)  rf=r size=4 type=d align=2 words (r2.2)
//.declare V0035 (45)  rf=r size=8 type=uq align=4 words (r1.0)
//.declare V0036 (46)  rf=r size=8 type=uq align=4 words (r1.1)
//.declare V0037 (47)  rf=r size=8 type=uq align=4 words (r1.2)
//.declare V0038 (48)  rf=r size=8 type=uq align=4 words (r1.3)
//.declare V0039 (49)  rf=r size=4 type=d align=2 words (r2.3)
//.declare V0040 (50)  rf=r size=8 type=uq align=4 words (r2.0)
//.declare V0042 (52)  rf=r size=32 type=d alias=+0 align=32 words (r31.0)
//.declare V0044 (54)  rf=r size=8 type=uq align=4 words (r2.2)
//.declare V0057 (67)  rf=r size=256 type=f align=32 words (r10.0)
//.declare V0058 (68)  rf=r size=256 type=f align=32 words (r16.0)
//.declare V0059 (69)  rf=r size=256 type=f align=32 words (r22.0)
//.declare V0060 (70)  rf=r size=256 type=f align=32 words (r26.0)
//.declare V0062 (72)  rf=r size=32 type=b alias=V0042+0 align=16 words (r31.0)
//.declare V0063 (73)  rf=r size=1 type=b align=1 words (r1.32)
//.declare V0064 (74)  rf=r size=32 type=w align=32 words (r126.0)
//.declare V0065 (75)  rf=r size=4 type=d align=2 words (r2.4)
//.declare V0066 (76)  rf=r size=4 type=d align=2 words (r3.0)
//.declare V0067 (77)  rf=r size=1 type=ub alias=V0063+0 align=1 words (r1.32)
//.declare V0068 (78)  rf=r size=4 type=d align=2 words (r33.0)
//.declare V0069 (79)  rf=r size=4 type=d align=2 words (r48.0)
//.declare V0070 (80)  rf=r size=4 type=d align=32 words (r5.0)
//.declare V0071 (81)  rf=r size=8 type=uq align=32 words (r4.0)
//.declare V0072 (82)  rf=r size=8 type=q align=4 words (r126.4)
//.declare V0073 (83)  rf=r size=4 type=d align=2 words (r33.1)
//.declare P01 (84)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0074 (85)  rf=r size=8 type=q align=4 words (r126.5)
//.declare V0075 (86)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0076 (87)  rf=r size=8 type=d align=2 words (r2.4)
//.declare V0077 (88)  rf=r size=8 type=d alias=V0075+0 align=4 words (r1.8)
//.declare P02 (89)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0078 (90)  rf=r size=8 type=ud alias=V0076+0 align=2 words (r2.4)
//.declare V0079 (91)  rf=r size=4 type=ud alias=V0034+0 align=2 words (r2.2)
//.declare P03 (92)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare P04 (93)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0080 (94)  rf=r size=4 type=d align=2 words (r3.0)
//.declare V0081 (95)  rf=r size=4 type=d align=2 words (r4.0)
//.declare P05 (96)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare V0082 (97)  rf=r size=4 type=ud alias=V0080+0 align=2 words (r3.0)
//.declare P06 (98)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare P07 (99)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0086 (103)  rf=r size=8 type=q align=4 words (r5.0)
//.declare V0087 (104)  rf=r size=8 type=d alias=V0086+0 align=4 words (r5.0)
//.declare V0088 (105)  rf=r size=4 type=d align=2 words (r125.0)
//.declare V0089 (106)  rf=r size=4 type=ud alias=V0068+0 align=2 words (r33.0)
//.declare V0090 (107)  rf=r size=4 type=ud alias=V0088+0 align=2 words (r125.0)
//.declare V0091 (108)  rf=r size=4 type=d align=32 words (r35.0)
//.declare V0092 (109)  rf=r size=4 type=d align=4 words (r126.12)
//.declare V0093 (110)  rf=r size=32 type=w align=32 words (r6.0)
//.declare V0094 (111)  rf=r size=32 type=w align=32 words (r7.0)
//.declare V0095 (112)  rf=r size=8 type=q alias=V0036+0 align=4 words (r1.1)
//.declare V0096 (113)  rf=r size=8 type=q alias=V0037+0 align=4 words (r1.2)
//.declare V0097 (114)  rf=r size=8 type=q alias=V0038+0 align=4 words (r1.3)
//.declare V0099 (116)  rf=r size=32 type=uw alias=V0093+0 align=32 words (r6.0)
//.declare V0100 (117)  rf=r size=128 type=q align=32 words (r49.0)
//.declare V0102 (119)  rf=r size=32 type=uw alias=V0094+0 align=32 words (r7.0)
//.declare V0103 (120)  rf=r size=128 type=q align=32 words (r123.0)
//.declare V0104 (121)  rf=r size=4 type=f align=2 words (r33.2)
//.declare V0105 (122)  rf=r size=4 type=f align=2 words (r126.13)
//.declare V0106 (123)  rf=r size=64 type=f align=32 words (r37.0)
//.declare V0107 (124)  rf=r size=64 type=f align=32 words (r122.0)
//.declare V0108 (125)  rf=r size=64 type=f align=32 words (r39.0)
//.declare V0109 (126)  rf=r size=64 type=f align=32 words (r121.0)
//.declare V0110 (127)  rf=r size=64 type=f align=32 words (r41.0)
//.declare V0111 (128)  rf=r size=64 type=f align=32 words (r120.0)
//.declare V0112 (129)  rf=r size=64 type=f align=32 words (r43.0)
//.declare V0113 (130)  rf=r size=64 type=f align=32 words (r119.0)
//.declare V0114 (131)  rf=r size=64 type=f align=32 words (r45.0)
//.declare V0115 (132)  rf=r size=64 type=f align=32 words (r118.0)
//.declare V0116 (133)  rf=r size=64 type=f align=32 words (r47.0)
//.declare V0117 (134)  rf=r size=64 type=f align=32 words (r117.0)
//.declare V0118 (135)  rf=r size=64 type=f align=32 words (r52.0)
//.declare V0119 (136)  rf=r size=64 type=f align=32 words (r54.0)
//.declare V0120 (137)  rf=r size=64 type=f align=32 words (r56.0)
//.declare V0121 (138)  rf=r size=64 type=f align=32 words (r58.0)
//.declare V0122 (139)  rf=r size=4 type=f align=2 words (r126.14)
//.declare V0123 (140)  rf=r size=4 type=f align=2 words (r33.3)
//.declare V0124 (141)  rf=r size=4 type=d align=2 words (r126.15)
//.declare V0125 (142)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0127 (144)  rf=r size=8 type=q align=4 words (r2.2)
//.declare V0128 (145)  rf=r size=8 type=d align=2 words (r3.0)
//.declare V0129 (146)  rf=r size=8 type=d alias=V0127+0 align=4 words (r2.4)
//.declare V0132 (149)  rf=r size=8 type=q align=4 words (r33.2)
//.declare V0133 (150)  rf=r size=8 type=d alias=V0132+0 align=4 words (r33.4)
//.declare V0134 (151)  rf=r size=8 type=q align=4 words (r4.0)
//.declare V0135 (152)  rf=r size=8 type=q align=32 words (r6.0)
//.declare V0136 (153)  rf=r size=8 type=uq alias=V0135+0 align=32 words (r6.0)
//.declare V0137 (154)  rf=r size=4 type=f align=32 words (r116.0)
//.declare V0138 (155)  rf=r size=8 type=q align=32 words (r8.0)
//.declare V0139 (156)  rf=r size=8 type=uq alias=V0138+0 align=32 words (r8.0)
//.declare V0140 (157)  rf=r size=4 type=f align=32 words (r51.0)
//.declare V0141 (158)  rf=r size=4 type=f align=2 words (r125.1)
//.declare P08 (159)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0142 (160)  rf=r size=4 type=f align=2 words (r125.2)
//.declare V0143 (161)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0144 (162)  rf=r size=4 type=f align=2 words (r2.4)
//.declare V0145 (163)  rf=r size=4 type=f alias=+0 align=2 words (r4.0)
//.declare V0146 (164)  rf=r size=4 type=f align=2 words (r5.0)
//.declare V0147 (165)  rf=r size=4 type=f align=2 words (r6.0)
//.declare V0148 (166)  rf=r size=4 type=f alias=+4 align=2 words (r4.1)
//.declare V0149 (167)  rf=r size=4 type=f alias=+0 align=2 words (r7.0)
//.declare V0150 (168)  rf=r size=4 type=f alias=+4 align=2 words (r7.1)
//.declare V0151 (169)  rf=r size=4 type=f align=2 words (r8.0)
//.declare P09 (170)  rf=f1  size=2 type=uw align=1 words (f3.1)
//.declare V0152 (171)  rf=r size=4 type=f align=2 words (r9.0)
//.declare P10 (172)  rf=f1  size=2 type=uw align=1 words (f3.0)
//.declare P11 (173)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare P12 (174)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare V0153 (175)  rf=r size=4 type=f align=2 words (r33.6)
//.declare V0154 (176)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0155 (177)  rf=r size=4 type=f align=2 words (r2.4)
//.declare V0156 (178)  rf=r size=4 type=f alias=+0 align=2 words (r4.0)
//.declare V0157 (179)  rf=r size=4 type=f align=2 words (r5.0)
//.declare V0158 (180)  rf=r size=4 type=f align=2 words (r6.0)
//.declare V0159 (181)  rf=r size=4 type=f alias=+4 align=2 words (r4.1)
//.declare V0160 (182)  rf=r size=4 type=f alias=+0 align=2 words (r7.0)
//.declare V0161 (183)  rf=r size=4 type=f alias=+4 align=2 words (r7.1)
//.declare V0162 (184)  rf=r size=4 type=f align=2 words (r8.0)
//.declare P13 (185)  rf=f1  size=2 type=uw align=1 words (f2.1)
//.declare V0163 (186)  rf=r size=4 type=f align=2 words (r9.0)
//.declare P14 (187)  rf=f1  size=2 type=uw align=1 words (f2.0)
//.declare V0164 (188)  rf=r size=4 type=f align=2 words (r2.4)
//.declare V0165 (189)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0166 (190)  rf=r size=8 type=q align=4 words (r3.0)
//.declare V0167 (191)  rf=r size=128 type=q align=32 words (r4.0)
//.declare V0168 (192)  rf=r size=128 type=uq alias=V0167+0 align=32 words (r4.0)
//.declare V0169 (193)  rf=r size=256 type=f align=32 words (r8.0)
//.declare V0174 (198)  rf=r size=128 type=q align=32 words (r6.0)
//.declare V0175 (199)  rf=r size=128 type=uq alias=V0174+0 align=32 words (r6.0)
//.declare V0176 (200)  rf=r size=256 type=f align=32 words (r12.0)
//.declare V0177 (201)  rf=r size=64 type=f align=32 words (r24.0)
//.declare V0178 (202)  rf=r size=64 type=f align=32 words (r26.0)
//.declare V0179 (203)  rf=r size=64 type=f align=32 words (r28.0)
//.declare V0180 (204)  rf=r size=64 type=f align=32 words (r30.0)
//.declare V0181 (205)  rf=r size=256 type=f align=32 words (r16.0)
//.declare V0182 (206)  rf=r size=64 type=f align=32 words (r32.0)
//.declare V0183 (207)  rf=r size=64 type=f align=32 words (r34.0)
//.declare V0184 (208)  rf=r size=64 type=f align=32 words (r36.0)
//.declare V0185 (209)  rf=r size=64 type=f align=32 words (r38.0)
//.declare V0186 (210)  rf=r size=256 type=f align=32 words (r20.0)
//.declare V0187 (211)  rf=r size=64 type=f align=32 words (r40.0)
//.declare V0188 (212)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0189 (213)  rf=r size=64 type=f align=32 words (r44.0)
//.declare V0190 (214)  rf=r size=64 type=f align=32 words (r46.0)
//.declare P15 (215)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare V0191 (216)  rf=r size=4 type=ud alias=V0124+0 align=2 words (r126.15)
//.declare V0192 (217)  rf=r size=4 type=ud alias=V0092+0 align=2 words (r126.12)
//.declare V0193 (218)  rf=r size=4 type=d align=32 words (r3.0)
//.declare V0194 (219)  rf=r size=4 type=ud alias=V0069+0 align=2 words (r48.0)
//.declare V0195 (220)  rf=r size=4 type=ud alias=V0193+0 align=2 words (r3.0)
//.declare V0196 (221)  rf=r size=4 type=d align=2 words (r125.3)
//.declare V0197 (222)  rf=r size=4 type=ud alias=V0196+0 align=2 words (r125.3)
//.declare P16 (223)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0198 (224)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0199 (225)  rf=r size=4 type=f align=2 words (r2.4)
//.declare V0200 (226)  rf=r size=4 type=d align=2 words (r4.0)
//.declare V0201 (227)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0202 (228)  rf=r size=4 type=d align=2 words (r7.0)
//.declare V0204 (230)  rf=r size=4 type=ud alias=V0202+0 align=2 words (r7.0)
//.declare V0205 (231)  rf=r size=8 type=q align=4 words (r8.0)
//.declare V0206 (232)  rf=r size=8 type=q alias=V0040+0 align=4 words (r2.0)
//.declare V0207 (233)  rf=r size=8 type=q align=4 words (r9.0)
//.declare V0208 (234)  rf=r size=128 type=q align=32 words (r14.0)
//.declare V0209 (235)  rf=r size=128 type=uq alias=V0208+0 align=32 words (r14.0)
//.declare V0210 (236)  rf=r size=128 type=q align=32 words (r20.0)
//.declare V0211 (237)  rf=r size=128 type=uq alias=V0210+0 align=32 words (r20.0)
//.declare  (238)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare  (239)  rf=r size=8 type=f align=32 words (r7.0)
//.declare  (240)  rf=r size=8 type=f align=32 words (r4.0)
//.declare  (241)  rf=r size=8 type=f align=32 words (r7.0)
//.declare  (242)  rf=r size=8 type=f align=32 words (r4.0)
//.declare  (243)  rf=r size=128 type=uw align=32 words (r8.0)
//.declare  (244)  rf=r size=128 type=uw align=32 words (r10.0)
//.declare r0 (245)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (246)  rf=r size=64 type=ud align=32 words (r127.0)
//.declare  (247)  rf=r size=32 type=ud align=2 words (r2.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0035    | :uq      |    0x8 | r1       | inline+0x0       |
// | V0036    | :uq      |    0x8 | r1+0x8   | inline+0x8       |
// | V0037    | :uq      |    0x8 | r1+0x10  | inline+0x10      |
// | V0038    | :uq      |    0x8 | r1+0x18  | inline+0x18      |
// | V0040    | :uq      |    0x8 | r2       | cti+0x20         |
// | V0034    | :d       |    0x4 | r2+0x8   | cti+0x28         |
// | V0039    | :d       |    0x4 | r2+0xC   | cti+0x2C         |
// | V0044    | :uq      |    0x8 | r2+0x10  | cti+0x30         |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
cross_thread_prolog:
(W)     and (1|M0)               r127.0<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud                       //  ALU pipe: int; 
(W)     add (1|M0)               r127.0<1>:ud  r127.0<0;1,0>:ud  0x0:ud              {I@1}           //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     load.ugm.d32x8t.a32.ca.cc (1|M0)  r2:1  bti[255][r127:1]   {A@1,$0} // ex_desc:0xFF000000; desc:0x6219C500 // 
// B001: Preds:{B000},  Succs:{B002, B003}
// _main:
(W)     mov (16|M0)              r31.0<1>:ud   r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     mov (1|M0)               r4.0<1>:uq    r1.0<0;1,0>:uq                   {A@1}                //  ALU pipe: int; $10
(W)     mov (1|M0)               r1.32<2>:b    r31.8<0;1,0>:b                   {I@3}                //  ALU pipe: int; $3
(W)     load.ugm.d32x1t.a64 (1|M0)  r5:1        [r4:1]             {A@2,$1} // ex_desc:0x0; desc:0x2108580 // $11
(W)     shl (1|M0)               r2.4<1>:d     r31.1<0;1,0>:d    3:w               {$0.dst}          //  ALU pipe: int; $6
(W)     mov (1|M0)               r3.0<1>:d     r1.32<0;1,0>:ub                  {I@2}                //  ALU pipe: int; $7
(W)     mov (8|M0)               r126.0<1>:w   0x76543210:v                                          //  ALU pipe: int; $4
(W)     add (1|M0)               r33.0<1>:d    r2.4<0;1,0>:d     r3.0<0;1,0>:d    {I@2}              //  ALU pipe: int; $8
(W)     asr (1|M0)               r33.1<1>:d    r2.2<0;1,0>:d     31:w                                //  ALU pipe: int; $13
(W)     add (8|M0)               r126.8<1>:w   r126.0<1;1,0>:w   8:w               {I@3}             //  ALU pipe: int; $5
(W)     and (1|M0)               r48.0<1>:d    r33.0<0;1,0>:d    63:w               {I@3}            //  ALU pipe: int; $9
(W)     cmp (16|M0)   (lt)f0.1   null<1>:d     r5.0<0;1,0>:d     -63:w               {$1.dst}        //  ALU pipe: int; $14
(W)     mov (1|M0)               r126.4<1>:q   r5.0<0;1,0>:d                                         //  ALU pipe: int; $12
(W&f0.1) jmpi                                _0_016                                                  //  ALU pipe: int; $15
// B002: Preds:{B001},  Succs:{B004}
_0_017:
(W)     add (1|M0)               r126.5<1>:q   r126.4<0;1,0>:q   63:w               {I@2}            //  ALU pipe: int; $17
(W)     jmpi                                 _0_018                                                  // $18
// B003: Preds:{B001},  Succs:{B004}
_0_016:
(W)     add (1|M0)               r126.5<1>:q   r126.4<0;1,0>:q   126:w                               //  ALU pipe: int; $20
// B004: Preds:{B003, B002},  Succs:{B005}
_0_018:
(W)     asr (1|M0)               r1.4<1>:q     r126.5<0;1,0>:q   6:w               {I@1}             //  ALU pipe: int; $22
        shl (16|M0)              r6.0<1>:w     r126.0<1;1,0>:w   2:w                                 //  ALU pipe: int; $45
(W)     mov (2|M0)               r2.4<1>:d     r1.8<1;1,0>:d                    {I@2}                //  ALU pipe: int; $23
        add (16|M0)              r7.0<1>:w     r6.0<1;1,0>:w     64:w               {I@2}            //  ALU pipe: int; $46
(W)     cmp (16|M0)   (lt)f1.0   null<1>:d     r2.4<0;1,0>:ud    r2.2<0;1,0>:ud   {I@2}              //  ALU pipe: int; $24
(W)     shr (1|M0)               r125.0<1>:ud  r33.0<0;1,0>:ud   6:w                                 //  ALU pipe: int; $42
        mov (16|M0)              r8.0<4>:uw    r6.0<1;1,0>:uw                                        //  ALU pipe: int; $48
(W&f1.0) cmp (16|M0)  (eq)f1.0   null<1>:d     r2.5<0;1,0>:d     r33.1<0;1,0>:d                      //  ALU pipe: int; $25
        mov (16|M0)              r10.0<4>:uw   r7.0<1;1,0>:uw                   {I@5}                //  ALU pipe: int; $50
(W&~f1.0) cmp (16|M0) (lt)f1.0   null<1>:d     r2.5<0;1,0>:d     r33.1<0;1,0>:d                      //  ALU pipe: int; $27
        mov (16|M0)              r37.0<1>:ud   0x0:ud                                                //  ALU pipe: int; $53
(W&f1.0) sel (1|M0)              r3.0<1>:d     r2.4<0;1,0>:d     r2.2<0;1,0>:d                       //  ALU pipe: int; $29
(W&f1.0) sel (1|M0)              r4.0<1>:d     r2.5<0;1,0>:d     r33.1<0;1,0>:d                      //  ALU pipe: int; $30
(W)     cmp (16|M0)   (gt)f0.1   null<1>:d     r3.0<0;1,0>:ud    0x1:uw              {I@2}           //  ALU pipe: int; $31
        mov (16|M0)              r122.0<1>:f   0x0:f                                                 //  ALU pipe: float; $54
(W&f0.1) cmp (16|M0)  (eq)f0.1   null<1>:d     r4.0<0;1,0>:d     0:w               {I@2}             //  ALU pipe: int; $32
        mov (16|M0)              r39.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $55
(W&~f0.1) cmp (16|M0) (gt)f0.1   null<1>:d     r4.0<0;1,0>:d     0:w                                 //  ALU pipe: int; $34
        mov (16|M0)              r121.0<1>:f   0x0:f                               {Compacted}       //  ALU pipe: float; $56
(W&f0.1) sel (1|M0)              r5.0<1>:d     r3.0<0;1,0>:d     1:w                                 //  ALU pipe: int; $36
(W&f0.1) sel (1|M0)              r5.1<1>:d     r4.0<0;1,0>:d     0:w                                 //  ALU pipe: int; $37
        mov (16|M0)              r41.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $57
        mov (16|M0)              r120.0<1>:f   0x0:f                               {Compacted}       //  ALU pipe: float; $58
        mov (16|M0)              r43.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $59
        mov (16|M0)              r119.0<1>:f   0x0:f                               {Compacted}       //  ALU pipe: float; $60
        mov (16|M0)              r45.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $61
        mov (16|M0)              r118.0<1>:f   0x0:f                               {Compacted}       //  ALU pipe: float; $62
        mov (16|M0)              r47.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $63
        mov (16|M0)              r117.0<1>:f   0x0:f                               {Compacted}       //  ALU pipe: float; $64
        mov (16|M0)              r52.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $65
        mov (16|M0)              r54.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $66
        mov (16|M0)              r56.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $67
        mov (16|M0)              r58.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $68
(W)     mul (1|M0)               acc0.0<1>:d   r125.0<0;1,0>:d   r2.4<0;1,0>:uw                      //  ALU pipe: int; $43
        shl (16|M0)              r49.0<1>:q    r8.0<4;1,0>:uw    2:w                                 //  ALU pipe: int; $48
        shl (16|M0)              r123.0<1>:q   r10.0<4;1,0>:uw   2:w                                 //  ALU pipe: int; $50
(W)     mov (1|M0)               r33.2<1>:f    0xB5BFBE8E:f                                          //  ALU pipe: float; $51
(W)     mov (1|M0)               r126.13<1>:f  0xBF317200:f                                          //  ALU pipe: float; $52
(W)     mov (1|M0)               r126.14<1>:f  0xFF800000:f                                          //  ALU pipe: float; $69
(W)     mov (1|M0)               r33.3<1>:f    0x0:f                                                 //  ALU pipe: float; $70
(W)     mov (1|M0)               r126.15<1>:d  0:w                                                   //  ALU pipe: int; $71
(W)     mov (1|M0)               r126.12<2>:d  r5.0<0;1,0>:q                    {I@5}                //  ALU pipe: int; $44
(W)     macl (1|M0)              r35.0<1>:d    r125.0<0;1,0>:d   r2.2<0;1,0>:d    {Compacted}        //  ALU pipe: int; $44
// B005: Preds:{B012, B004},  Succs:{B006, B007}
_0_019:
(W)     add (1|M0)               r1.8<1>:d     r35.0<0;1,0>:d    r126.15<0;1,0>:d {I@1}              //  ALU pipe: int; $73
(W)     cmp (16|M0)   (eq)f0.0   null<1>:f     r126.14<0;1,0>:f  0xFF800000:f               {F@2}    //  ALU pipe: float; $88
(W)     shl (1|M0)               r2.2<1>:q     r1.8<0;1,0>:d     6:w               {I@1}             //  ALU pipe: int; $75
(W)     mov (2|M0)               r3.0<1>:d     r2.4<1;1,0>:d                    {Compacted,I@1}      //  ALU pipe: int; $76
(W)     or (1|M0)                r33.4<1>:d    r2.4<0;1,0>:d     r48.0<0;1,0>:d                      //  ALU pipe: int; $77
(W)     mov (1|M0)               r33.5<1>:d    r3.1<0;1,0>:d                    {I@2}                //  ALU pipe: int; $79
(W)     shl (1|M0)               r4.0<1>:q     r33.2<0;1,0>:q    2:w               {Compacted,I@1}   //  ALU pipe: int; $82
(W)     add (1|M0)               r6.0<1>:q     r4.0<0;1,0>:q     r1.1<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $83
(W)     add (1|M0)               r8.0<1>:q     r4.0<0;1,0>:q     r1.2<0;1,0>:q                       //  ALU pipe: int; $85
(W)     load.ugm.d32x1t.a64 (1|M0)  r116:1      [r6:1]             {I@2,$2} // ex_desc:0x0; desc:0x2108580 // $84
(W)     load.ugm.d32x1t.a64 (1|M0)  r51:1       [r8:1]             {I@1,$3} // ex_desc:0x0; desc:0x2108580 // $86
(W)     sel (1|M0)    (ge)f0.0   r125.1<1>:f   r126.14<0;1,0>:f  r116.0<0;1,0>:f  {$2.dst}           //  ALU pipe: float; $87
(W&~f0.0) jmpi                               _0_020                                                  //  ALU pipe: int; $89
// B006: Preds:{B005},  Succs:{B008}
_0_021:
(W)     mov (1|M0)               r125.2<1>:f   0x0:f                                                 //  ALU pipe: float; $91
(W)     jmpi                                 _0_022                                                  // $92
// B007: Preds:{B005},  Succs:{B008}
_0_020:
(W)     add (1|M0)               r1.8<1>:f     r126.14<0;1,0>:f  -r125.1<0;1,0>:f {F@2}              //  ALU pipe: float; $94
(W)     mul (1|M0)               r2.4<1>:f     r1.8<0;1,0>:f     0x3FB8AA3B:f               {F@1}    //  ALU pipe: float; $95
(W)     cmp (1|M0)    (lt)f3.1   null<1>:f     r1.8<0;1,0>:f     0xC2D20000:f                        //  ALU pipe: float; $103
(W)     rndz (1|M0)              r4.0<1>:f     r2.4<0;1,0>:f                    {F@2}                //  ALU pipe: float; $96
(W)     cmp (1|M0)    (gt)f3.0   null<1>:f     r1.8<0;1,0>:f     0x42D20000:f                        //  ALU pipe: float; $105
(W)     mad (1|M0)               r5.0<1>:f     r1.8<0;0>:f       r126.13<0;0>:f    r4.0<0>:f        {F@2} //  ALU pipe: float; $97
(W)     math.exp (1|M0)          r7.0<1>:f     r4.0<0;1,0>:f                                         //  ALU pipe: math; $215
(W)     mad (1|M0)               r6.0<1>:f     r5.0<0;0>:f       r33.2<0;0>:f      r4.0<0>:f        {F@1} //  ALU pipe: float; $98
(W)     mul (1|M0)               r4.1<1>:f     r6.0<0;1,0>:f     0x3FB8AA3B:f               {F@1}    //  ALU pipe: float; $99
(W)     math.exp (1|M0)          r7.1<1>:f     r4.1<0;1,0>:f                    {F@1}                //  ALU pipe: math; $100
        sync.nop                             null                             {Compacted,M@1}        // $102
(W)     mul (1|M0)               r8.0<1>:f     r7.0<0;1,0>:f     r7.1<0;1,0>:f    {Compacted,$3.src} //  ALU pipe: float; $102
(W&~f3.1) sel (1|M0)             r9.0<1>:f     r8.0<0;1,0>:f     0x0:f               {F@1}           //  ALU pipe: float; $104
(W&~f3.0) sel (1|M0)             r125.2<1>:f   r9.0<0;1,0>:f     0x7F800000:f               {F@1}    //  ALU pipe: float; $106
// B008: Preds:{B007, B006},  Succs:{B009, B010}
_0_022:
(W)     cmp (16|M0)   (eq)f1.0   null<1>:f     r125.1<0;1,0>:f   0xFF800000:f                        //  ALU pipe: float; $108
(W&~f1.0) cmp (16|M0) (eq)f1.0   null<1>:f     r116.0<0;1,0>:f   0xFF800000:f                        //  ALU pipe: float; $109
(W&~f1.0) jmpi                               _0_023                                                  //  ALU pipe: int; $111
// B009: Preds:{B008},  Succs:{B011}
_0_024:
(W)     mov (1|M0)               r33.6<1>:f    0x0:f                                                 //  ALU pipe: float; $113
(W)     jmpi                                 _0_025                                                  // $114
// B010: Preds:{B008},  Succs:{B011}
_0_023:
(W)     add (1|M0)               r1.8<1>:f     r116.0<0;1,0>:f   -r125.1<0;1,0>:f                    //  ALU pipe: float; $116
(W)     mul (1|M0)               r2.4<1>:f     r1.8<0;1,0>:f     0x3FB8AA3B:f               {F@1}    //  ALU pipe: float; $117
(W)     cmp (1|M0)    (lt)f2.1   null<1>:f     r1.8<0;1,0>:f     0xC2D20000:f                        //  ALU pipe: float; $125
(W)     rndz (1|M0)              r4.0<1>:f     r2.4<0;1,0>:f                    {F@2}                //  ALU pipe: float; $118
(W)     cmp (1|M0)    (gt)f2.0   null<1>:f     r1.8<0;1,0>:f     0x42D20000:f                        //  ALU pipe: float; $127
(W)     mad (1|M0)               r5.0<1>:f     r1.8<0;0>:f       r126.13<0;0>:f    r4.0<0>:f        {F@2} //  ALU pipe: float; $119
(W)     math.exp (1|M0)          r7.0<1>:f     r4.0<0;1,0>:f                                         //  ALU pipe: math; $215
(W)     mad (1|M0)               r6.0<1>:f     r5.0<0;0>:f       r33.2<0;0>:f      r4.0<0>:f        {F@1} //  ALU pipe: float; $120
(W)     mul (1|M0)               r4.1<1>:f     r6.0<0;1,0>:f     0x3FB8AA3B:f               {F@1}    //  ALU pipe: float; $121
(W)     math.exp (1|M0)          r7.1<1>:f     r4.1<0;1,0>:f                    {F@1}                //  ALU pipe: math; $122
        sync.nop                             null                             {Compacted,M@1}        // $124
(W)     mul (1|M0)               r8.0<1>:f     r7.0<0;1,0>:f     r7.1<0;1,0>:f    {Compacted,$3.src} //  ALU pipe: float; $124
(W&~f2.1) sel (1|M0)             r9.0<1>:f     r8.0<0;1,0>:f     0x0:f               {F@1}           //  ALU pipe: float; $126
(W&~f2.0) sel (1|M0)             r33.6<1>:f    r9.0<0;1,0>:f     0x7F800000:f               {F@1}    //  ALU pipe: float; $128
// B011: Preds:{B010, B009},  Succs:{B012, B013}
_0_025:
(W)     shl (1|M0)               r1.4<1>:q     r33.2<0;1,0>:q    10:w                                //  ALU pipe: int; $131
(W)     add (1|M0)               r126.15<1>:d  r126.15<0;1,0>:d  1:w                                 //  ALU pipe: int; $172
(W)     add (1|M0)               r3.0<1>:q     r1.4<0;1,0>:q     r1.3<0;1,0>:q    {I@2}              //  ALU pipe: int; $132
(W)     mul (1|M0)               r2.4<1>:f     r33.6<0;1,0>:f    r51.0<0;1,0>:f   {@1,$3.dst}        //  ALU pipe: float; $130
        add (16|M0)              r6.0<1>:q     r3.0<0;1,0>:q     r123.0<1;1,0>:q  {Compacted,I@1}    //  ALU pipe: int; $143
        add (16|M0)              r4.0<1>:q     r3.0<0;1,0>:q     r49.0<1;1,0>:q   {Compacted}        //  ALU pipe: int; $133
        load.ugm.d32x4.a64 (16|M0)  r12:4       [r6:2]             {I@2,$4} // ex_desc:0x0; desc:0x4403580 // $144
        load.ugm.d32x4.a64 (16|M0)  r16:4       [r6:2+0x100]       {$5} // ex_desc:0x100000; desc:0x4403580 // $153
        load.ugm.d32x4.a64 (16|M0)  r20:4       [r6:2+0x200]       {$6} // ex_desc:0x200000; desc:0x4403580 // $162
        load.ugm.d32x4.a64 (16|M0)  r8:4        [r4:2]             {I@1,$7} // ex_desc:0x0; desc:0x4403580 // $134
(W)     cmp (16|M0)   (lt)f1.1   null<1>:d     r126.15<0;1,0>:ud  r126.12<0;1,0>:ud                  //  ALU pipe: int; $173
(W)     mad (1|M0)               r33.3<1>:f    r2.4<0;0>:f       r33.3<0;0>:f      r125.2<0>:f      {F@1} //  ALU pipe: float; $171
        mul (16|M0)              r24.0<1>:f    r2.4<0;1,0>:f     r12.0<1;1,0>:f   {Compacted,$4.dst} //  ALU pipe: float; $145
        mul (16|M0)              r26.0<1>:f    r2.4<0;1,0>:f     r13.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $146
        mul (16|M0)              r28.0<1>:f    r2.4<0;1,0>:f     r14.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $147
        mul (16|M0)              r30.0<1>:f    r2.4<0;1,0>:f     r15.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $148
        mul (16|M0)              r32.0<1>:f    r2.4<0;1,0>:f     r16.0<1;1,0>:f   {Compacted,$5.dst} //  ALU pipe: float; $154
        mul (16|M0)              r34.0<1>:f    r2.4<0;1,0>:f     r17.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $155
        mul (16|M0)              r36.0<1>:f    r2.4<0;1,0>:f     r18.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $156
        mul (16|M0)              r38.0<1>:f    r2.4<0;1,0>:f     r19.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $157
        mul (16|M0)              r40.0<1>:f    r2.4<0;1,0>:f     r20.0<1;1,0>:f   {Compacted,$6.dst} //  ALU pipe: float; $163
        mul (16|M0)              r42.0<1>:f    r2.4<0;1,0>:f     r21.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $164
        mul (16|M0)              r44.0<1>:f    r2.4<0;1,0>:f     r22.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $165
        mul (16|M0)              r46.0<1>:f    r2.4<0;1,0>:f     r23.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $166
        mul (16|M0)              acc0.0<1>:f   r2.4<0;1,0>:f     r8.0<1;1,0>:f    {Compacted,$7.dst} //  ALU pipe: float; $135
        mul (16|M0)              acc1.0<1>:f   r2.4<0;1,0>:f     r9.0<1;1,0>:f    {Compacted}        //  ALU pipe: float; $136
        mul (16|M0)              acc2.0<1>:f   r2.4<0;1,0>:f     r10.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $137
        mul (16|M0)              acc3.0<1>:f   r2.4<0;1,0>:f     r11.0<1;1,0>:f   {Compacted}        //  ALU pipe: float; $138
        mad (16|M0)              r45.0<1>:f    r24.0<1;0>:f      r45.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $149 R{} IR{}{E:4,O:6,O:6,},  {BC=1}
        mad (16|M0)              r118.0<1>:f   r26.0<1;0>:f      r118.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $150
        mad (16|M0)              r47.0<1>:f    r28.0<1;0>:f      r47.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $151
        mad (16|M0)              r117.0<1>:f   r30.0<1;0>:f      r117.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $152
        mad (16|M0)              r41.0<1>:f    r32.0<1;0>:f      r41.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $158
        mad (16|M0)              r120.0<1>:f   r34.0<1;0>:f      r120.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $159
        mad (16|M0)              r43.0<1>:f    r36.0<1;0>:f      r43.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $160
        mad (16|M0)              r119.0<1>:f   r38.0<1;0>:f      r119.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $161
        mad (16|M0)              r37.0<1>:f    r40.0<1;0>:f      r37.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $167
        mad (16|M0)              r122.0<1>:f   r42.0<1;0>:f      r122.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $168 R{r125,} IR{}{E:5,E:5,},  {BC=1}
        mad (16|M0)              r39.0<1>:f    r44.0<1;0>:f      r39.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $169
        mad (16|M0)              r121.0<1>:f   r46.0<1;0>:f      r121.0<1;0>:f     r125.2<0>:f      {Compacted} //  ALU pipe: float; $170
        mad (16|M0)              r52.0<1>:f    acc0.0<1;0>:f     r52.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $139
        mad (16|M0)              r54.0<1>:f    acc1.0<1;0>:f     r54.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $140
        mad (16|M0)              r56.0<1>:f    acc2.0<1;0>:f     r56.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $141
        mad (16|M0)              r58.0<1>:f    acc3.0<1;0>:f     r58.0<1;0>:f      r125.2<0>:f      {Compacted} //  ALU pipe: float; $142
(W&~f1.1) jmpi                               _0_026                                                  //  ALU pipe: int; $174
// B012: Preds:{B011},  Succs:{B005}
_0_027:
(W)     mov (1|M0)               r126.14<1>:f  r125.1<0;1,0>:f                                       //  ALU pipe: float; $176
(W)     jmpi                                 _0_019                                                  // $177
// B013: Preds:{B011},  Succs:{B014, B015}
_0_026:
(W)     mul (1|M0)               acc0.0<1>:ud  r48.0<0;1,0>:ud   0xAAAB:uw              {F@4}        //  ALU pipe: int; $179
(W)     mach (1|M0)              r3.0<1>:ud    r48.0<0;1,0>:ud   0xAAAAAAAB:ud                       //  ALU pipe: int; 
(W)     shr (1|M0)               r125.3<1>:ud  r3.0<0;1,0>:ud    2:w               {I@1}             //  ALU pipe: int; $180
(W)     cmp (16|M0)   (lt)f0.0   null<1>:d     r125.3<0;1,0>:d   r2.3<0;1,0>:d    {I@1}              //  ALU pipe: int; $181
(W&~f0.0) jmpi                               _0_028                                                  //  ALU pipe: int; $182
// B014: Preds:{B013},  Succs:{B015}
_0_029:
(W)     mad (1|M0)               r4.0<1>:d     r48.0<0;0>:d      r125.3<0;0>:d     -6:w               //  ALU pipe: int; $186
(W)     sel (1|M0)    (ge)f0.0   r1.8<1>:f     r33.3<0;1,0>:f    0x1E3CE508:f                        //  ALU pipe: float; $184
(W)     mad (1|M0)               r6.0<1>:d     r4.0<0;0>:d       r125.0<0;0>:d     6:w               {I@1} //  ALU pipe: int; $187
(W)     math.inv (1|M0)          r2.4<1>:f     r1.8<0;1,0>:f                    {F@1}                //  ALU pipe: math; $185
(W)     mad (1|M0)               r7.0<1>:d     r6.0<0;0>:d       r125.3<0;0>:d     24:w               {I@1} //  ALU pipe: int; $188
        mul (16|M0)              r10.0<1>:f    r52.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $192
(W)     shl (1|M0)               r8.0<1>:q     r7.0<0;1,0>:ud    10:w               {I@1}            //  ALU pipe: int; $190
        mul (16|M0)              r11.0<1>:f    r54.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $194
(W)     add (1|M0)               r9.0<1>:q     r8.0<0;1,0>:q     r2.0<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $191
        mul (16|M0)              r12.0<1>:f    r56.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $195
        mul (16|M0)              r13.0<1>:f    r58.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $196
        mul (16|M0)              r16.0<1>:f    r45.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $198
        mul (16|M0)              r17.0<1>:f    r118.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $200
        mul (16|M0)              r18.0<1>:f    r47.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $201
        mul (16|M0)              r19.0<1>:f    r117.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $202
        mul (16|M0)              r22.0<1>:f    r41.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $204
        mul (16|M0)              r23.0<1>:f    r120.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $205
        mul (16|M0)              r24.0<1>:f    r43.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $206
        mul (16|M0)              r25.0<1>:f    r119.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $207
        mul (16|M0)              r26.0<1>:f    r37.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $209
        mul (16|M0)              r27.0<1>:f    r122.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $210
        mul (16|M0)              r28.0<1>:f    r39.0<1;1,0>:f    r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $211
        mul (16|M0)              r29.0<1>:f    r121.0<1;1,0>:f   r2.4<0;1,0>:f    {Compacted}        //  ALU pipe: float; $212
        add (16|M0)              r14.0<1>:q    r9.0<0;1,0>:q     r49.0<1;1,0>:q   {Compacted,I@1}    //  ALU pipe: int; $193
        add (16|M0)              r20.0<1>:q    r9.0<0;1,0>:q     r123.0<1;1,0>:q                     //  ALU pipe: int; $199
        store.ugm.d32x4.a64 (16|M0)  [r14:2]    r10:4              {I@2,$8} // ex_desc:0x0; desc:0x4003584 // $197
        store.ugm.d32x4.a64 (16|M0)  [r20:2]    r16:4              {A@1,$9} // ex_desc:0x0; desc:0x4003584 // $203
        store.ugm.d32x4.a64 (16|M0)  [r20:2+0x100] r22:4           {F@5,$10} // ex_desc:0x100000; desc:0x4003584 // $208
        store.ugm.d32x4.a64 (16|M0)  [r20:2+0x200] r26:4           {F@1,$11} // ex_desc:0x200000; desc:0x4003584 // $213
// B015: Preds:{B014, B013},  Succs:{}
_0_028:
(W)     mov (16|M0)              r127.0<1>:f   r31.0<1;1,0>:f                                        //  ALU pipe: float; $215
(W)     send.gtwy (1|M0)         null     r127  null:0  0x0            0x02000010           {EOT,F@1,$12} // wr:1+0, rd:0; end of thread // $215
L2528:
(W)     mov (16|M0)              null<1>:ud    0x8B54A0EB:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x7B79F18D:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x8:ud                                                // 


//.BankConflicts: 2
//.ByteRMWs: 1
//


//.numALUInst: 177
//.accSubDef: 4
//.accSubUse: 4
//.accSubCandidateDef: 16
//.accSubCandidateUse: 16
//
//
//.singlePipeAtOneDistNum: 37
//.allAtOneDistNum: 4
//.syncInstCount: 2
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 8
//.AfterReadTokenDepCount: 2
