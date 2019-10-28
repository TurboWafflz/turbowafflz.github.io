if [ `/bin/sed -r -e 's/\x0.*//' /proc/$$/cmdline` != "bash" ] 
then
bash ./lintest.sh
exit
fi
clear
x=0
y=0
tput setaf 1
toilet ImaginaryInfinity -w 999
tput sgr0
tput setaf 11
echo ''
echo ''
echo 'Press [ENTER]'
tput sgr0
read -n 1 x
echo ''
clear
tput setaf 3
figlet LinTest 1.0 Beta -w 999
tput sgr0
echo `echo 'IN   '; tput setaf 1; echo C; tput setaf 2; echo O; tput setaf 3; echo L; tput setaf 4; echo O; tput setaf 5; echo R; tput sgr0`
tput setaf 12
echo 'Run at:'
tput sgr0
tput setaf 6
date
tput sgr0
tput setaf 12
echo 'Run by:'
tput sgr0
tput setaf 1
whoami
tput sgr0
tput setaf 11
echo ''
echo ''
echo 'Press [ENTER] to continue or press [o] for options'
tput sgr0
read -n 1 x
if [ "$x" = "e" ]
then
clear
cowsay -f unipony 'You found me!' | /usr/games/lolcat
exit
fi
if [ "$x" = "o" ]
then
clear
tput setaf 200
echo '[1] Run LinTest 1.0'
echo '[2] Set date'
echo '[3] View code'
echo '[4] Screen details without xrandr'
echo '[5] Screen test'
echo '[6] Test keyboard leds (X MUST NOT be running)'
echo '[7] About'
echo '[8] Internet speed test'
echo '[q] Exit'
tput sgr0
echo ''
echo ''
tput setaf 11
echo ''
echo ''
echo 'Type Number of selection or [q] to quit and press [ENTER]'
tput sgr0
read -N 1 y
if [ "$y" = "7" ]
then
clear
echo 'Lintest 1.0 by Finian Wright'
echo 'Visit https://turbowafflz.github.io for more cool stuff!'
exit
fi
if [ "$y" = "8" ]
then
speedtest
exit
fi
if [ "$y" = "6" ]
then
while /bin/true
do
setleds +num
setleds +caps
setleds +scroll
sleep 5
setleds -num
sleep 1
setleds -caps
sleep 1
setleds -scroll
sleep 5
setleds +num
sleep 1
setleds +caps
sleep 1
setleds +scroll
done
fi
if [ "$y" = "5" ]
then
/usr/bin/cmatrix -b -s
exit
fi
if [ "$y" = "4" ]
then
tput setaf 4
clear
xdpyinfo
tput sgr0
exit
fi
if [ "$y" = "3" ]
then
clear
cat ./lintest.sh
exit
fi
if [ "$y" = "q" ]
then
tput setaf 100
echo 'EXIT'
tput sgr0
exit
fi
if [ "$y" = "1" ]
then
echo ''
fi
if [ "$y" = "2" ]
then
tput setaf 4
echo 'Current date is:'
date
tput setaf 11
echo 'Enter New Date:'
tput sgr0
read d
date d
echo 'New date is:'
date
exit
fi
fi


clear
tput setaf 3
figlet LinTest 1.0 -w 999
tput sgr0
tput setaf 6
date
tput sgr0
echo ''
tput setaf 19
echo 'Internet:'
tput setaf 3
ifconfig
tput sgr0
echo ''
tput setaf 11
echo ''
echo ''
echo 'Press [ENTER]'
tput sgr0
read x
clear
tput setaf 3
figlet LinTest 1.0 -w 999
tput sgr0
tput setaf 6
date
tput sgr0
echo ''
echo ''
tput setaf 19
echo 'Window:'
tput setaf 3
echo `echo 'Columns:'; tput cols; echo 'Lines:'; tput lines`
echo ''
tput sgr0
tput setaf 19
echo 'Screen (X only)'
tput setaf 3
xrandr
tput sgr0
tput setaf 11
echo ''
echo ''
echo 'Press [ENTER]'
read x
tput sgr0
clear


##LinTest 1.0 by Finian Wright
##Find the easter egg?
