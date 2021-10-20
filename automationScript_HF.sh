#!/bin/sh

echo ""

echo "Checks if git is installed"

echo ""

sudo yum install git -y > ~/output.txt
bk=`cat ~/output.txt |grep -i "already installed" |grep -o "already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The git package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to download the file using git"
                           
                           fi

git clone https://github.com/SplunkAutobahnConsultants/DS-Automation.git /opt/Splunk-DS-Automation
rm -rf /opt/Splunk-DS-Automation/DS-Automation/UF 
rm -rf /opt/Splunk-DS-Automation/DS-Automation/Deployment-Apps/Windows 
rm -rf /opt/Splunk-DS-Automation/DS-Automation/automationScript.sh

tar /opt/Splunk-DS-Automation/Deployment-Apps/Linux/Splunk_TA_Linux.tar.gz  -C /opt/splunk/etc/




