#!/bin/sh
                                                #Version_1.0.0 by BK
                                                
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
                           
   : ' git install on Ubuntu                          
sudo  apt install git-install -y > ~/output.txt
bk=`cat ~/output.txt |grep -i "already installed" |grep -o "Git is already installed"`
 if [ "$bk" == "already installed" ]
                then 
                           echo "The git package is $bk"
                           
                           echo ""
                           
                           echo "We are ok to clone the file using git"
                           
                           fi
    '   
    
#Cloning DS folder from SplunkAutobahnConsultants repo
sudo git clone https://github.com/SplunkAutobahnConsultants/DS-Automation.git /opt/Splunk-DS-Automation

#coping  necessary files to Splunk Deployment Apps directories
cd /opt/Splunk-DS-Automation/UF/Linux/DS-Config/
sudo tar -xvzf deploy-client-uf (1).tar.gz  -C /opt/splunkuniversalforwarder/etc/apps

#Removing uncessary directories & files
sudo rm -r /opt/Splunk-DS-Automation/UF/DC/DS-Config
sudo rm -r /opt/Splunk-DS-Automation/Deployment-Apps
cd /opt/Splunk-DS-Automation/codes/
sudo rm -rf automationScript_HF.sh
sudo rm -rf automationScript_UF.sh
