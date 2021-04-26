from graphics import *
from random import *
import time
import pygame
winx = 1024
winy = 768
def main():
    global winx
    global winy
    resselect = GraphWin("Select resolution", 640, 170)
    text = Text(Point(320, 30), "Enter resolution")
    text.draw(resselect)
    x = Text(Point(50, 60), "X")
    y = Text(Point(50, 90), "Y")
    y.draw(resselect)
    x.draw(resselect)
    xres = Entry(Point(320, 60), 50)
    xres.draw(resselect)
    yres = Entry(Point(320, 90), 50)
    yres.draw(resselect)
    xres.setText(int(winx))
    yres.setText(int(winy))
    ok = Rectangle(Point(640 / 2 - 100, 120), Point(640 / 2 + 100, 150))
    ok.draw(resselect)
    oktext = Text(Point(640 / 2, 135), "OK")
    oktext.draw(resselect)
    while True:
        click = resselect.checkMouse()
        if click is None:
            click = Point(0, 0)

        if resselect.checkKey() == "Return" or (int(click.getX()) > int(640 / 2 - 100) and int(click.getX()) < int(640 / 2 + 100) and int(click.getY()) > int(120) and int(click.getY()) < int(150) ):
            ok.setFill("black")
            oktext.setTextColor("white")
            winx = xres.getText()
            winy = yres.getText()
            time.sleep(0.1)
            resselect.close()
            if int(winx) >= 100 and int(winy) >= 100:
                game()
            else:
                error = GraphWin("Error", 640, 120)
                message = Text(Point(320, 50), "Resolution must be at least 100x100")
                cont = Text(Point(320, 90), "Press any key to go back")
                cont.draw(error)
                message.draw(error)
                error.getKey()
                error.close()
                main()

def game():
    global winx
    global winy
    print(int(winx))
    print(int(winy))
    def end():
        gameover = Text(Point(int(winx) / 2, int(winy) / 2), "Game Over")
        gameover.draw(win)
        gameover.setTextColor("white")
        win.getKey()
        win.close()
        game()
    win = GraphWin("Eatie square", int(winx), int(winy))
    win.setBackground("black")
    image = Image(Point(int(winx)/2, int(winy)/2), "eatie-square-big.png")
    image.draw(win)
    text = Text(Point(int(winx)/2, int(winy)/2+200), "Press any key to begin")
    text.draw(win)
    text.setTextColor("white")
    dnd = Text(Point(int(winx)/2, int(winy)/2+150), "Alpha preview, do not distribute")
    dnd.setTextColor("white")
    dnd.draw(win)
    bbfc = Text(Point(110, 10), "Copyright 2019 BBFC Gaming")
    bbfc.setTextColor("white")
    bbfc.draw(win)
    text.setSize(20)
    dnd.setSize(10)
    pygame.mixer.init()
    pygame.mixer.music.load("eatie-square.wav")
    pygame.mixer.music.play()
    win.getKey()
    pygame.mixer.music.stop()
    text.undraw()
    image.undraw()
    bbfc.undraw()
    dnd.undraw()
    player = Rectangle(Point(int(int(winx)) / 2 - 5, int(int(winy)) / 2 - 5), Point(int(int(winx)) / 2 + 5, int(int(winy)) / 2 + 5))
    player.setFill("red")
    player.draw(win)
    X = randint(int(0), int(int(winx)))
    Y = randint(int(0), int(int(winy)))
    circle = Circle(Point(X, Y), 5)
    color = color_rgb(randint(0,255), randint(0,255), randint(0,255))
    circle.setFill(color)
    circle.setOutline("white")
    player.setOutline("white")
    circle.draw(win)
    pointcount = Text(Point(int(winx) / 2, 30), str(0))
    pointcount.draw(win)
    points = 0
    pointcount.setTextColor("white")
    speed = 10
    badguy = Rectangle(Point(int(int(winx)) / 2 - 5, int(int(winy)) / 2 - 100), Point(int(int(winx)) / 2 + 5, int(int(winy)) / 2 - 100 + 10))
    badguy.setOutline("red")
    badguy.draw(win)
    while True:
        pointcount.setText(points)
        key = win.checkKey()
        location = player.getCenter()
        circle.location = circle.getCenter()
        badguy.location = badguy.getCenter()
        x = location.getX()
        y = location.getY()
        click = win.checkMouse()
        #def get():
            #badguy.move((int((badguy.location.getX() + location.getX()) / 2) - int(badguy.location.getX())) / 2, (int((badguy.location.getY() + location.getY()) / 2) - int(badguy.location.getY())) / 2 )
        if ( key == "Up" or key == "w" ) and y > 10:
            player.move(0, -speed)
            #get()
        if ( key == "Down" or key == "s" ) and y < int(winy) - 5:
            player.move(0, speed)
            #get()
        if ( key == "Left" or key == "a" ) and x > 10:
            player.move(-speed, 0)
            #get()
        if ( key == "Right" or key == "d" ) and x < int(winx) - 5:
            player.move(speed, 0)
            #get()
        if key == "Escape":
            win.close()
        if location.getX() > badguy.location.getX() - speed and location.getX() < badguy.location.getX() + speed and location.getY() > badguy.location.getY() - speed and location.getY() < badguy.location.getY() + speed:
            end()
        if location.getX() > circle.location.getX() - speed and location.getX() < circle.location.getX() + speed and location.getY() > circle.location.getY() - speed and location.getY() < circle.location.getY() + speed:
            badspeed = 2
            badguy.move((int((badguy.location.getX() + location.getX()) / badspeed) - int(badguy.location.getX())) / badspeed, (int((badguy.location.getY() + location.getY()) / badspeed) - int(badguy.location.getY())) / badspeed )
            player.setFill(color)
            circle.undraw()
            X = randint(0, int(winx))
            Y = randint(0, int(winy))
            circle = Circle(Point(X, Y), 5)
            color = color_rgb(randint(0,255), randint(0,255), randint(0,255))
            circle.setFill(color)
            circle.setOutline("white")
            circle.draw(win)
            points = points + 1
            #playsound('click.wav')
            #speed = speed + 10
            print(speed)

main()
