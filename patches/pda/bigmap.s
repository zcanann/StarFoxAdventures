.ascii "bigmap  " # 8 byte file ID for debug

drawItem_mapSize:
    addi    r4,  r14, (s_MapSize - mainLoop)
    lbz     r6,  (menuMapSize - mainLoop)(r14)
    slwi    r6,  r6,  1
    addi    r5,  r14, .mapSizeLabels - mainLoop
    lhzx    r5,  r5,  r6
    add     r5,  r5,  r14
    blr


adjItem_mapSize: # r3 = amount to adjust by (0=A button)
    lbz     r4,  (menuMapSize - mainLoop)(r14)
    cmpwi   r3,  0
    bne     .adjItem_mapSize_notA
    li      r3,  1 # A button = increase
.adjItem_mapSize_notA:

    # do the adjustment and wrap
    add     r4,  r4,  r3
    cmpwi   r4,  3
    blt     .adjItem_mapSize_notThree
    li      r4,  0
.adjItem_mapSize_notThree:
    cmpwi   r4,  0
    bge     .adjItem_mapSize_notZero
    li      r4,  2
.adjItem_mapSize_notZero:

    stb     r4,  (menuMapSize - mainLoop)(r14) # store the setting
    LOADWH  r5,  saveData
    LOADBL2 r7,  SAVEDATA_OPTIONS+saveData, r5
    andi.   r7,  r7,  (~SAVEDATA_OPTION_MAP_SIZE) & 0xFFFF
    #slwi    r6,  r6,  0
    or      r7,  r7,  r4
    STOREB  r7,  SAVEDATA_OPTIONS+saveData, r5

    # get the override for this setting
    slwi    r4,  r4,  1
    addi    r3,  r14, .mapSizes - mainLoop
    lhzx    r3,  r3,  r4
    sth     r3,  (minimapSizeOverride - mainLoop)(r14) # store it

    blr

.mapSizes:
    .short 0x0000 # normal - disable override
    .short 0x0100 # huge
    .short 0x0040 # small

.mapSizeLabels:
    .short s_Normal - mainLoop
    .short s_Huge   - mainLoop
    .short s_Small  - mainLoop
