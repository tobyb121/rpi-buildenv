#! /bin/bash
set -e

FDISK=`fdisk -l $1`

SECTOR_SIZE=`echo "$FDISK" | sed -n 's/Units: sectors of [0-9]* \* [0-9]* = \([0-9]*\) bytes.*/\1/p'`

PARTITIONS=`echo "$FDISK" | awk ' BEGIN { start=100 } /Device *Boot *Start *End *Sectors *Size *Id *Type/ { start=NR; col_start=index($0,"Boot")+5; col_end=index($0,"Start")+5;} {if (NR>start) print substr($0,col_start,col_end-col_start) }'`

p=0
for PARTITION in $PARTITIONS
do
   mkdir -p mnt/$p && (mount -o loop,offset=$((512*PARTITION)) $1 mnt/$p || (echo "Failed to mount partion $p" && rm -r mnt/$p))
   p=$((p+1))
done



