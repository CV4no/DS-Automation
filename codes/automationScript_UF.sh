#!/bin/sh
                                                #Version_1.0.0 by Bisrat Kebede, BK
                                                
#Splunk-UF Installation With DS by BK
#Splunk Autobahn Delivery Engineering Team


#setting up colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

echo "${green}Splunk UF Install with DS Config Automation${reset}"
echo "${green}Splunk Inc. 2021${reset}"
echo "${green}Splunk Autobahn Delivery Engineering Team${reset}"

# CentOS/RedHat installation Script - Splunk Core
sudo wget -O splunkforwarder-8.0.6-152fb4b2bb96-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.6&product=universalforwarder&filename=splunkforwarder-8.0.6-152fb4b2bb96-linux-2.6-x86_64.rpm&wget=true'
sudo mv splunkforwarder-8.0.6-152fb4b2bb96-linux-2.6-x86_64.rpm /opt/
cd /opt/
sudo rpm -i splunkforwarder-8.0.6-152fb4b2bb96-linux-2.6-x86_64.rpm


 #Ubuntu installation Script - Splunk Core
: '
sudo wget -O splunk-8.0.4.1-ab7a85abaa98-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.4.1&product=splunk&filename=splunk-8.0.4.1-ab7a85abaa98-linux-2.6-amd64.deb&wget=true'
sudo mv splunk-8.0.4.1-ab7a85abaa98-linux-2.6-amd64.deb /opt/
cd /opt/
dpkg -i splunk-8.0.4.1-ab7a85abaa98-linux-2.6-amd64.deb
   '

sudo /opt/splunkforwarder/bin/splunk start --accept-license




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


sudo /opt/splunkforwarder/bin/splunk stop

sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk
sudo chown  -R splunk: /opt/splunkforwarder

sudo -H -u splunk /opt/splunkuniversalforwarder/bin/splunk start
#Hello BK Splunk
