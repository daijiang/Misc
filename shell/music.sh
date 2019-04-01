# split an album with cue file
# https://coderwall.com/p/6ydyoq/how-to-split-flac-files-by-cue-and-convert-to-alac-on-mac-os-x

brew install shnsplit flac

shnsplit -o flac -f file.cue file.flac
shnsplit -o ape -f file.cue file.ape


# conver flac to mp3

for i in *.flac; do ffmpeg -i "$i" -ab 320k -map_metadata 0 -id3v2_version 3 "`basename "$i" .flac`.mp3"; done;

# convert ape to mp3

for i in *.ape; do ffmpeg -i "$i" -ab 320k "`basename "$i" .ape`.mp3"; done;
