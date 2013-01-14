#!/bin/bash
for i in *
do
    if [ -d $i ]
    then
        cd $i
        if [ ! -d '.git' ]; then
            tput setaf 7
            echo $i omitted
            tput sgr0 
            cd ..
            continue
        fi

        tput setaf 2
        echo $i checking...
        tput sgr0
        let updated=`git remote show origin | grep -c "out of date"`
        if [ $updated -gt 0 ]; then
            tput setaf 1
            echo $i has updated
            tput sgr0
            git pull
        fi
        cd ..
    fi
done
