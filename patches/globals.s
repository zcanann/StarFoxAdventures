# a few patches need to use global variables so that others
# (mainly the PDA Menu) kno where to find them.

.set PATCH_STATE_PTR,0x8000000C # address to store our state
.set PATCH_STATE_SIZE,0x08 # bytes

# offsets within state
# state always starts at an address aligned to 4 bytes.
.set ENABLE_FREE_MOVE,   0x00
.set CUR_CHAR_ADDR,      0x01 # which character model to use (0=Krystal 1=Fox)
.set SAVE_TEXT_COUNTDOWN,0x02
.set AUTOSAVE_ENABLED,   0x03
.set SHOW_DEBUG_OBJS,    0x04
.set FORCE_TEXT_WIDTH,   0x05
.set CAMERA_OPTIONS,     0x06

# camera option bits
.set CAMERA_OPTION_PAD3,    0x01 # use controller 3 to move
.set CAMERA_OPTION_INVERTX, 0x02 # invert X axis movement
.set CAMERA_OPTION_INVERTY, 0x04 # invert Y axis movement

# offsets into saveData
.set SAVEDATA_SUBTITLES,      0x02
.set SAVEDATA_CAMERA_OPTIONS, 0x03 # replace unused HUD setting
.set SAVEDATA_WIDESCREEN,     0x06
.set SAVEDATA_CUR_CHAR,       0x07 # unused field
.set SAVEDATA_RUMBLE,         0x08
.set SAVEDATA_SOUND_MODE,     0x09
.set SAVEDATA_MUSIC_VOL,      0x0A
.set SAVEDATA_SFX_VOL,        0x0B
.set SAVEDATA_CUTSCENE_VOL,   0x0C
.set SAVEDATA_OPTIONS,        0x0D # unused field
.set SAVEDATA_FOV,            0x0E # unused field
.set SAVEDATA_MAP_OPACITY,    0x0F # unused field
# XXX: game speed
# autosave is handled elsewhere because I did it earlier

.set SAVEDATA_OPTION_MAP_SIZE,0x03
.set SAVEDATA_OPTION_PDA_MODE,0x03 << 2
