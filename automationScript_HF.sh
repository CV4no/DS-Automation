#!/bin/sh
                                                #Version_01 by BK
                                                
#Splunk-DS-Automation by BK
#Splunk Autobahn Delivery Engineering Team


echo ""

echo "Checks if git is installed"

echo ""

#git install
sudo yum install git -y > ~/output.txt
bk=`cat ~/output.txt |grep -i "already installed" |grep -o "Git is already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The git package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to clone the file using git"
                           
                           fi
#Cloning DS folder from SplunkAutobahnConsultants repo
sudo git clone https://github.com/SplunkAutobahnConsultants/DS-Automation.git /opt/Splunk-DS-Automation

#coping  necessary files to Splunk Deployment Apps directories
cd /opt/Splunk-DS-Automation/Deployment-Apps/Linux/
sudo tar -xvzf Splunk_TA_Linux.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf Splunk_TA_windows.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf org_all_internal_forwarder_outputs.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf Splunk_TA_windows_DC.tar.gz  -C /opt/splunk/etc/deployment-apps

#Removing uncessary directories & files
sudo rm -r /opt/Splunk-DS-Automation/UF 
sudo rm -r /opt/Splunk-DS-Automation/Deployment-Apps/Windows 
sudo rm -rf /opt/Splunk-DS-Automation/automationScript.sh
