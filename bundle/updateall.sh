#!/bin/bash
for i in *
do
    if [ -d $i ]
    then
        cd $i
        if [ ! -e '.git' ]; then
            tput setaf 7
            echo $i omitted
            tput sgr0 
            cd ..
            continue
        fi
        echo $i
        tput setaf 2
        echo $i checking...
        tput sgr0
        let updated=`git remote show origin | grep -c "out of date"`
        let updated_chinese=`git remote show origin | grep -c "本地已过时"`
        if [ $updated -gt 0 ] || [ $updated_chinese -gt 0 ]; then
            tput setaf 1
            echo $i has updated
            tput sgr0
            git pull
        fi
        rm -f 0
        cd ..
    fi
done
