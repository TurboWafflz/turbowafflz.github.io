clear
tput setaf 1
figlet -w 999 '[==FMW==]'
tput setaf 2
figlet -w 999 '    [=CALC=]'
tput setaf 3
echo "v0.1 beta"
echo ""
echo ""
while /bin/true
do
tput setaf 9
echo ">"
tput setaf 5
read x
if [ "$x" = 'exit' ]
then
clear
tput sgr0
exit
fi
tput setaf 7
awk "BEGIN {print $x}"
tput sgr0
done

