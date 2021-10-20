#!/bin/sh

echo ""

echo "Checks if git is installed"

echo ""

sudo yum install git -y > ~/output02.txt
bk=`cat ~/output02.txt |grep -i "already installed" |grep -o "already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The git package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to download the file using git"
                           
                           fi



echo ""

echo "Checks if git is installed"

echo ""

sudo apt install git-all -y > ~/output02.txt
bk=`cat ~/output02.txt |grep -i "already installed" |grep -o "already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The git package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to download the file using git"
                           
                           fi
