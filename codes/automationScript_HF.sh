#!/bin/sh
                                                #Version_1.0.0 by Bisrat Kebede, BK
                                                
#Splunk-DS-Automation by BK
#Splunk Autobahn Delivery Engineering Team

#setting up colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}DS Automation on Splunk Core Begins now${reset}"


#coping  necessary files to Splunk Deployment Apps directories
cd /opt/Splunk-DS-Automation/Deployment-Apps/Linux/
sudo tar -xvzf Splunk_TA_Linux.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf Splunk_TA_windows.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf org_all_internal_forwarder_outputs.tar.gz  -C /opt/splunk/etc/deployment-apps
sudo tar -xvzf Splunk_TA_windows_DC.tar.gz  -C /opt/splunk/etc/deployment-apps

#Removing uncessary directories & files
sudo rm -r /opt/Splunk-DS-Automation/UF 
sudo rm -r /opt/Splunk-DS-Automation/Deployment-Apps/Windows 
cd /opt/Splunk-DS-Automation/codes/
sudo rm -rf automationScript_UF.sh 


echo "${green}DS Automation on Splunk Core Ends now${reset}" 

#Ji Bisrat