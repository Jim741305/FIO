
# File Name: fio_script.sh
# Author: charlie_chen
# mail: charliecqc@dcslab.snu.ac.kr
# Created Time: Fri 04 Oct 2019 04:59:39 PM KST
#########################################################################
#!/bin/bash

MAXJOBS=1
SIZE=2400
DIRECT=0
njobs=1
BS=1024
cpu=0
for ((iter=0; iter<=1; iter++)){
	let cpu=0
	for x in {b..u}
	do
		echo "taskset -c "$cpu" fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=write --numjobs="$njobs" try "$iter2
		taskset -c "$cpu" ./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=write --numjobs="$njobs" >> ./result_device_buffered_cpupinned_"$x".txt 2>&1 & 
	
	let cpu=$cpu+1;
	done
	wait
	#let BS=$BS*2;
}
let BS=1024

for ((iter=0; iter<=0; iter++)){
	let cpu=0
	for x in {b..u}
	do
		echo "taskset -c "$cpu" fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=read --numjobs="$njobs" try "$iter2
		taskset -c "$cpu" ./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=read --numjobs="$njobs" >> ./result_device_buffered_cpupinned_"$x".txt 2>&1 & 
	let cpu=$cpu+1;
	done
	wait
	#let BS=$BS*2;
}
let BS=1024

for ((iter=0; iter<=0; iter++)){
	let cpu=0
	for x in {b..u}
	do
		echo "taskset -c "$cpu" fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randread --numjobs="$njobs" try "$iter2
		taskset -c "$cpu" ./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randread --numjobs="$njobs" >> ./result_device_buffered_cpupinned_"$x".txt 2>&1 & 
	
	let cpu=$cpu+1;
	done
	wait
	#let BS=$BS*2;
}
let BS=1024

for ((iter=0; iter<=1; iter++)){
	let cpu=0
	for x in {b..u}
	do
		echo "taskset -c "$cpu" fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fync=0 --rw=randwrite --numjobs="$njobs" try "$iter2
		taskset -c "$cpu" ./fio --group_reporting --name=test --directory=/mnt/sd"$x" --size="$SIZE"MB --bs="$BS"KB --direct="$DIRECT" --fsync=0 --rw=randwrite --numjobs="$njobs" >> ./result_device_buffered_cpupinned_"$x".txt 2>&1 & 
	
	let cpu=$cpu+1;
	done
	wait
	#let BS=$BS*2;
}




