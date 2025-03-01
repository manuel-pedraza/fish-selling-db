#! /bin/bash
numOfDirs=$(echo */ | wc -w)
# numOfDirs=$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) # same result
for ((i=1;i<=$numOfDirs;i++)); do 
    dir="$i/"
    file="./${dir}all${i}queries.sql"
    touch $file
    cat ./START.sql > $file
    find ./${dir} -type f -name "Q*.sql" | sort -V | xargs cat >> $file
    cat ./END.sql >> $file
done
