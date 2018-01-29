#!/bin/bash

# @filename           :  clean.bash
# @author             :  Copyright (C) drunkwater
# @date               :  Tue Jan 16 12:59:51 HKT 2018
# @function           :  
# @see                :  
# @require            :  

EX_OK=0

work_dir=`pwd`

for dir in `\ls`
do

	if [ ! -d "$dir" ]
		then
		continue
	fi

	echo "cd $dir"
	cd $dir

	make clean
	rm -f test
	echo -e "$dir done\n"

	cd $work_dir
done

exit $EX_OK
