
#If you see this in your web browser, press CRTL+S to download MashSpeed


import time
from graphics import *
timelimit=10
while True:
    start=int(time.time())
    current=int(time.time())
    keys=0
    print(keys)
    win = GraphWin("MashSpeed", 640, 480)
    text = Text(Point(640/2,480/2), "Start typing to begin")
    text.draw(win)
    win.getKey()
    timertext = Text(Point(640/2, 480/2-20),6)
    timertext.draw(win)
    timertext.setFill("red")
    keys=1
    text.setText(keys)
    while(current-start < timelimit ):
        timertext.setText(timelimit-(current-start))
        if(win.checkKey() != ""):
            keys=keys+1
            print(keys)
            text.setText(keys)
        current=int(time.time())
    timertext.setText("Press F5 to retry")
    kpstext=Text(Point(640/2, 480/2+20), keys/timelimit)
    kpstext.setFill("Blue")
    kpstext.draw(win)
    while(win.getKey() != "F5"):
        print("Wait...")
    win.close()
