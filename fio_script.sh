
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
	for ((iter2=0; iter2<=2; iter2++)) {
		if [[ $DIRECT -eq 0 ]]
		then 
			echo 1 > /proc/sys/vm/drop_caches
			echo 2 > /proc/sys/vm/drop_caches
			echo 3 > /proc/sys/vm/drop_caches
		fi

		echo "fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=write --numjobs="$njobs" try "$iter
		./fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=write --numjobs="$njobs" >> $output 2>&1
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for ((iter2=0; iter2<2; iter2++)) {
		if [[ $DIRECT -eq 0 ]]
		then 
			echo 1 > /proc/sys/vm/drop_caches
			echo 2 > /proc/sys/vm/drop_caches
			echo 3 > /proc/sys/vm/drop_caches
		fi

		echo "fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=read --numjobs="$njobs" try "$iter
		./fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=read --numjobs="$njobs" >> $output 2>&1
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for ((iter2=0; iter2<2; iter2++)) {
		if [[ $DIRECT -eq 0 ]]
		then 
			echo 1 > /proc/sys/vm/drop_caches
			echo 2 > /proc/sys/vm/drop_caches
			echo 3 > /proc/sys/vm/drop_caches
		fi

		echo "fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randread --numjobs="$njobs" try "$iter
		./fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randread --numjobs="$njobs" >> $output 2>&1
	}
	let BS=$BS*2;
}
let BS=1024

for ((iter1=0; iter1<=2; iter1++)){
	for ((iter2=0; iter2<=2; iter2++)) {
		if [[ $DIRECT -eq 0 ]]
		then 
			echo 1 > /proc/sys/vm/drop_caches
			echo 2 > /proc/sys/vm/drop_caches
			echo 3 > /proc/sys/vm/drop_caches
		fi

		echo "fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randwrite --numjobs="$njobs" try "$iter
		./fio --group_reporting --name=test --directory="$DIR" --size="$SIZE"GB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randwrite --numjobs="$njobs" >> $output 2>&1
	}
	let BS=$BS*2;
}


