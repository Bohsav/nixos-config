# The first option is a translation of the catppuccin colors to their closest match in a 256 color scheme (dependency free)
BLK="E5" CHR="E5" DIR="99" EXE="97" REG="07" HARDLINK="E1" SYMLINK="E1" MISSING="08" ORPHAN="D3" FIFO="9F" SOCK="E5" UNKNOWN="D3"

# Export Context Colors
export NNN_COLORS="#9997E5D3;4231"

# # This second option relies on you're terminal using the catppuccin theme and well use true catppuccin colors:
# BLK="03" CHR="03" DIR="04" EXE="02" REG="07" HARDLINK="05" SYMLINK="05" MISSING="08" ORPHAN="01" FIFO="06" SOCK="03" UNKNOWN="01"
#
# # Export Context Colors
# export NNN_COLORS="#04020301;4231"

# Finally Export the set file colors ( Both options require this)
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$UNKNOWN"
