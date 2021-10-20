#!/bin/sh
                                                #Version_01 by BK
                                                
#Splunk-DS-Automation by BK
#Splunk Autobahn Delivery Engineering Team


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

sudo git clone https://github.com/SplunkAutobahnConsultants/DS-Automation.git /opt/Splunk-DS-Automation
sudo rm -rf /opt/Splunk-DS-Automation/DS-Automation/UF 
sudo rm -rf /opt/Splunk-DS-Automation/DS-Automation/Deployment-Apps/Windows 
sudo rm -rf /opt/Splunk-DS-Automation/DS-Automation/automationScript.sh

sudo tar /opt/Splunk-DS-Automation/Deployment-Apps/Linux/Splunk_TA_Linux.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar /opt/Splunk-DS-Automation/Deployment-Apps/Linux/Splunk_TA_windows.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar /opt/Splunk-DS-Automation/Deployment-Apps/Linux/org_all_internal_forwarder_outputs.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar /opt/Splunk-DS-Automation/Deployment-Apps/Linux/Splunk_TA_windows_DC.tar.gz  -C /opt/splunk/etc/deployment-apps



