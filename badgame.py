from graphics import *
from random import randint
winx=206
winy=206
win=GraphWin("Memory Muncher", winx, winx, autoflush=False)
win.setBackground("black")
count=0
x=0
cx=0
y=0
cy=0
offset=0
number=0
meater=Text(Point(winx/2,winy/2),"Memory Muncher")
meater.setTextColor("white")
meater.draw(win)
while True:
    number += 1
    win.plot(x,y,color_rgb(cx+offset,cy+offset,0))
    cx += 1
    if cx>205:
        cx=0
    if cy>205:
        cy=0
    if x<winx:
        x += 1
    if x==winx:
        x=0
        cx=0
        y += 1
        cy += 1
        update()
        if(int(y) > int((winy/2)-10) and int(y) < int((winy/2)+10)):
            meater.undraw()
            meater.draw(win)
    if y==winy:
        x=0
        y=0
        #update()
        count += 1
        print(count)
        win=GraphWin("Memory Muncher", winx, winx, autoflush=False)
        win.setBackground("black")
        cx=0
        cy=0
        meater=Text(Point(winx/2,winy/2),"Memory Muncher")
        meater.setTextColor("white")
        meater.draw(win)
        if offset<50:
            offset += 10
        if offset==100:
            offset=0
