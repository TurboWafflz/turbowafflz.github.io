import time
from graphics import *
import sys
timelimit=int(sys.argv[1])
winx=1024
winy=768
while True:
    current=int(time.time())
    keys=0
    print(keys)
    win = GraphWin("KeySpeed (Shift)", winx, winy)
    win.setBackground("white")
    text = Text(Point(winx/2,winy/2), "Start mashing shift to begin (left/right both accepted)")
    text.draw(win)
    win.getKey()
    start=int(time.time())
    timertext = Text(Point(winx/2, winy/2-20),6)
    timertext.draw(win)
    timertext.setFill("red")
    keys=1
    text.setText(keys)
    while(current-start < timelimit ):
        timertext.setText(timelimit-(current-start))
        press=win.checkKey()
        if(press == "Shift_L" or press == "Shift_R"):
            keys=keys+1
            print(keys)
            text.setText(keys)
        current=int(time.time())
    timertext.setText("Press F5 to retry")
    kpstext=Text(Point(winx/2, winy/2+20), keys/timelimit)
    kpstext.setFill("Blue")
    kpstext.draw(win)
    while(win.getKey() != "F5"):
        print("Wait...")
    win.close()
