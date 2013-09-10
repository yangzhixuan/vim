#!/bin/bash
rm git.list git.rm.list
for i in *
do
    if [ -d $i ]
    then
        cd $i
        if [ ! -d '.git' ]; then
            cd ..
            continue
        fi
        echo $i
#        echo $i
#        tput setaf 2
#        echo $i checking...
#        tput sgr0
#        let updated=`git remote show origin | grep -c "out of date"`
#        if [ $updated -gt 0 ]; then
#            tput setaf 1
#            echo $i has updated
#            tput sgr0
#            git pull
#        fi
#        rm -f 0
        name=`awk  '/url/{print "git submodule add "$3}' .git/config`
#        echo "$name $i" >> ../git.list
#        echo "git rm -r bundle/$i" >> ../git.rm.list
        cd ..
        rm -fr $i
    fi
done
