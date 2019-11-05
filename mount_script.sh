for x in {b..u}
do
	echo "mount -t ext4 /dev/sd"$x" /mnt/sd""$x"
	mount -t ext4 /dev/sd"$x" /mnt/sd"$x"
done
