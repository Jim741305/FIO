
# File Name: fio_script.sh
# Author: charlie_chen
# mail: charliecqc@dcslab.snu.ac.kr
# Created Time: Fri 04 Oct 2019 04:59:39 PM KST
#########################################################################
#!/bin/bash

MAXJOBS=1
SIZE=48
DIRECT=1
njobs=1
BS=1024
DIR="/mnt/sdb"
output="./result_sdb_blksize_direct.txt"

for ((iter1=0; iter1<=2; iter1++)){
	for((iter2=0; iter2<=2; iter2++)){
		for x in {b..e}
		do
			echo "fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=write --numjobs="$njobs" try "$iter2
			./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=write --numjobs="$njobs" >> ./result_sd"$x"_blksize_direct.txt 2>&1 & 
		done
		wait
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for((iter2=0; iter2<2; iter2++)){
		for x in {b..e}
		do
			echo "fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=read --numjobs="$njobs" try "$iter2
			./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=read --numjobs="$njobs" >> ./result_sd"$x"_blksize_direct.txt 2>&1 & 
		done
		wait
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for((iter2=0; iter2<2; iter2++)){
		for x in {b..e}
		do
			echo "fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randread --numjobs="$njobs" try "$iter2
			./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randread --numjobs="$njobs" >> ./result_sd"$x"_blksize_direct.txt 2>&1 & 
		done
		wait
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for((iter2=0; iter2<=2; iter2++)){
		for x in {b..e}
		do
			echo "fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randwrite --numjobs="$njobs" try "$ite2
			./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randwrite --numjobs="$njobs" >> ./result_sd"$x"_blksize_direct.txt 2>&1 & 
		done
		wait
	}
	let BS=$BS*2;
}
