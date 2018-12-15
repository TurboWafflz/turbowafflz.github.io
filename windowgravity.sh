#!/bin/bash
while true
do
bounce=100
eval $(xwininfo -id $(xdotool getactivewindow) |
  sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
         -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
         -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" \
         -e "s/^ \+Relative upper-left X: \+\([0-9]\+\).*/b=\1/p" \
         -e "s/^ \+Relative upper-left Y: \+\([0-9]\+\).*/t=\1/p" )
#while [ "$bounce" -ge "0" ]
#do
eval $(xwininfo -id $(xdotool getactivewindow) |
  sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
         -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
         -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" \
         -e "s/^ \+Relative upper-left X: \+\([0-9]\+\).*/b=\1/p" \
         -e "s/^ \+Relative upper-left Y: \+\([0-9]\+\).*/t=\1/p" )
speed=1
while [ "$y" -le 1070 ]
do
eval $(xwininfo -id $(xdotool getactivewindow) |
  sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
         -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
         -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" \
         -e "s/^ \+Relative upper-left X: \+\([0-9]\+\).*/b=\1/p" \
         -e "s/^ \+Relative upper-left Y: \+\([0-9]\+\).*/t=\1/p" )
newy=`expr $y + $speed`
wmctrl -r :ACTIVE: -e 0,$x,$newy,-1,-1
echo $x,$y
speed=`expr $speed + 1`
done
while [ "$newy" -ge `expr 1080 - $speed` ] && [ "$bounce" -ne "0" ]
do
newy=`expr $newy - $speed`
wmctrl -r :ACTIVE: -e 0,$x,$newy,-1,-1
if [ "$speed" -ne "1" ]
then
speed=`expr $speed - 1`
fi
done
#bounce=`expr $bounce - 10`
y=$newy
#done
done
