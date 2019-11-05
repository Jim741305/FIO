

for x in {b..u}
do
	echo "mkfs.ext4 /dev/sd""$x" 
	mkfs.ext4 /dev/sd"$x" 
done
