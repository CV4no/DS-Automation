#!/bin/sh

echo ""

echo "Checks if unzip is installed"

echo ""

sudo yum install unzip -y > ~/output.txt
bk=`cat ~/output.txt |grep -i "already installed" |grep -o "already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The unzip package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to unzip the file"
                           
                           fi


sudo yum install unzip -y > ~/output.txt
bk=`cat ~/output.txt |grep -i "already installed" |grep -o "already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The unzip package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to unzip the file"
                           
                           fi
