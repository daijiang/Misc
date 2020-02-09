# brew install ffmpeg
# brew install gifsicle
ffmpeg -i input.mov -r 10 -f gif - | gifsicle --optimize=3 > out.gif
