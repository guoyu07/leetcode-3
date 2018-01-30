#!/bin/bash

# @filename           :  copy.bash
# @author             :  Copyright (C) drunkwater
# @date               :  Tue Jan 16 12:59:51 HKT 2018
# @function           :  
# @see                :  
# @require            :  

EX_OK=0

FILENAME=./medium.list

test -f $FILENAME || exit 0

i=0
while read dir
do
	suffix=`printf %04d $i`
	echo $dir
	rm -fr $dir
	mkdir -p $dir

	cp -fr c000/* $dir/

	mv -f $dir/00_leetcode_000.c $dir/00_leetcode_$suffix.c
	mv -f $dir/01_leetcode_000.c $dir/01_leetcode_$suffix.c
	mv -f $dir/02_leetcode_000.c $dir/02_leetcode_$suffix.c
	mv -f $dir/03_leetcode_000.c $dir/03_leetcode_$suffix.c
	mv -f $dir/04_leetcode_000.c $dir/04_leetcode_$suffix.c
	mv -f $dir/05_leetcode_000.c $dir/05_leetcode_$suffix.c

	sed s/000/$suffix/g -i $dir/Makefile
	echo -e "$dir done\n"
	i=$(($i+1))

done  < $FILENAME


exit $EX_OK
