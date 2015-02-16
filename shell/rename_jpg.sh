# rename JPG files by adding date at the beginning of names
# %Y: year; %m: month; %d: day
# %f: file name; 
for pics in *.JPG 
do
	jhead -n%Y-%m-%d-%f $pics
done

# remove first 9 letters of each file name
for pics in *.jpg
do
	mv $pics ${pics:9}
done

# rename according to file names
for folders in 2014-08* 2014-09* 2014-10* 2014-11*
do
	cd $folders
	for files in *.JPG
	do
		cp $files ../zoey_jpg/$(basename $(pwd))-$files
	done
	cd ..
done

# change CR2 files to jpeg
for i in *.CR2
do
	ufraw-batch $i --out-type=jpeg --compression=95 --output $i.jpg
done

# rename files from .CR2.jpg to .jpg
rename 's/.CR2.jpg$/.jpg/' *.CR2.jpg

