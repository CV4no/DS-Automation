#!/bin/sh
                                                #Version_1.0.0 by Bisrat Kebede, BK
                                                
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

#Moving  DS Config App to splunk apps directory
cd /opt/Splunk-DS-Automation/UF/Linux/DS-Config/
sudo mv deploy-client-uf/ /opt/splunkuniversalforwarder/etc/apps 

#Removing uncessary directories & files
sudo rm -r /opt/Splunk-DS-Automation/UF/Windows/DS-Config
sudo rm -r /opt/Splunk-DS-Automation/Deployment-Apps
cd /opt/Splunk-DS-Automation/codes/
sudo rm -rf automationScript_HF.sh
sudo rm -rf automationScript_UF.sh

sudo -H -u splunk /opt/splunkuniversalforwarder/bin/splunk restart
#Hello BK Splunk
