#IInstall 1.0

#Set up IInstall for your program by editing the  properties below

#Installer file name (MUST be the same as the name of this file)
filename='iinstall.sh'
#Program Name
name='Program Name'
#Program Description
description='A program to do things'
#Script to install dependencies
depends='./depends.sh'
#Location of your binaries/scripts
bin='./bin'
#Location to install scripts to
installto='/usr/local/bin/'
#Location of assets
assets='./share'
#Location to copy assets to
installassets='/usr/share/prg/'
#Message displayed on completion
completionmessage='Installation Complete'
#Message displayed on installation cancel
cancelmessage='Installation Canceled'







#You probably don't need to change anything below here.






readargs="-n 1"
if [ `/bin/sed -r -e 's/\x0.*//' /proc/$$/cmdline` != "bash" ]
then
if [ `/bin/sed -r -e 's/\x0.*//' /proc/$$/cmdline` != "/bin/bash" ]
    then
    clear
    tput setaf 2
    echo "Compatibility issue"
    echo "==================="
    tput setaf 6
    echo 'Your terminal may not be fully compatible with IInstall, if you have bash installed, run "bash' $filename'" to insure compatibility  with IInstall. Press [ENTER] to continue.'
    read waiting
    readargs=""
    fi
fi
clear
tput setaf 2
echo "ImaginaryInfinity IInstall 1.0"
echo '=============================='
echo ""
tput sgr0
echo $name":"
echo $description
echo ""
tput setaf 6
echo "Do you want to install" $name"?"
tput setaf 3
echo "(y/n)"
read $readargs confirm
if [ "$confirm" = "y" ]
then
sudo clear
tput setaf 2
echo "Installing"
echo "=========="
tput setaf 6
echo ""
echo "Installing program files..."
sudo cp -r -a -p $bin $installto
sleep 0.5
clear
tput setaf 2
echo "Installing"
echo "=========="
tput setaf 6
echo ""
echo "Copying assets..."
sudo cp -r -a -p $assets $installassets
sleep 0.5
clear
tput setaf 2
echo "Complete"
echo "========"
tput setaf 6
echo ""
echo $completionmessage
tput sgr0
echo "Press enter to exit IInstall"
read
clear
exit
fi
clear
tput setaf 2
echo "Canceled"
echo "========"
tput setaf 6
echo $cancelmessage
tput sgr0
exit
