#include <sysinit.h>
#include "basic/basic.h"
#include "lcd/render.h"
#include "lcd/display.h"
#include "basic/config.h"
#include "basic/simpletime.h"
#include "usetable.h"

void ram(void) {
    
    int update = 1; // variable for Frames per Second stuff
    char grid[24][17]; // snake grid
    lcdClear();
    lcdPrintln("init grid to 0");
    // set whole grit to 0
    for(int i=0; i<24; ++i) {
        for(int j=0; j<17; ++j) {
            grid[i][j] = 0;
        }
    }

    // set the snake
    lcdPrintln("set snake");
    grid[12][8] = 2;
    grid[13][8] = 2;
    grid[14][8] = 2;
    grid[15][8] = 2;

    // set some importnat x/y coordinates
    lcdPrintln("set head and tail");
    int headX = 15;
    int headY = 8;
    int tailX = 12;
    int tailY = 8;
    int foodX = 15;
    int foodY = 7;
    int points = 0;

    grid[foodX][foodY] = 10; // grid number 10 means it is food
    int gegessen = 0; // checks if food detected
    char key = 2; // key = current snake direction. starts with 2 = right
    time_t last_update = 0; // used for fps stuff
    setExtFont("ORBITRON14");
    while(1) {
        
        char in = getInputRaw(); // get input without a wait
        // check the buttons and set the current snake direction in variable key
        switch (in) {
        case BTN_ENTER:
            return; // return = quit program
            break;
        case BTN_UP:
            key = 1;
            break;
        case BTN_DOWN:
            key = 3;
            break;
        case BTN_RIGHT:
            key = 2;
            break; 
        case BTN_LEFT:
            key = 4;
            break;
        }

        // 1: up, 2: right, 3: down, 4: left

        // draw snake
        for(int i=0; i<24; ++i) {
            for(int j=0; j<17; ++j) {
                for(int k=0; k<4; ++k) {
                    for(int l=0; l<4; ++l) {
                        // draw only snakes and food 
                        if(grid[i][j]>0 && j>1) 
                             lcdSetPixel((i*4)+k,(j*4)+l,1);
                        else lcdSetPixel((i*4)+k,(j*4)+l,0);
                    }
                } 
            }
        }
        // draw the stuff for the top text and score
        for(int i=0; i<(24*4); ++i) {
            lcdSetPixel(i,8,1);
        }
        DoString(0,0,"shackspace:");
        DoInt(85,0,points);
        lcdRefresh(); // draw everything

        // check current time, if the last update is 10(ms?) ago, then update. if not, skip and test again. Update logic only 10(ms?) are passed, to get a good FPS (frames per Second)
        if(getTimer()-10 > last_update) {
            update = 1;
            last_update = getTimer();
        }
        else update = 0;
        // if 10(ms?) passed, update the logic = move snake
        if(update) {
        
        // set current head to the direction. needed for checking the tail direction later
        grid[headX][headY] = key;
        // move the head
        switch (key) {
        case 1:
            headY -= 1;
            break;
        case 3:
            headY += 1;
            break;
        case 2:
            headX += 1;
            break; 
        case 4:
            headX -= 1;
            break;
        }
        
        // if head is at the border, set it to the other side
        if(headX>=24) headX=0;
        if(headX<0) headX=23;
        if(headY<=1) headY=16;
        if(headY>=17) headY=2;

        // if new head position is not 0 (empty) and no food (10) you are game over
        if(grid[headX][headY] > 0 && grid[headX][headY] != 10){
            lcdPrintln("GAME OVER");
            lcdRefresh();
            delayms(1000);
            return;
        } else if(grid[headX][headY] == 10) {
            // if grid at head position is 10 = food, inc points
            points++;
            gegessen = 1;
            do { // search for new random free food position
                foodX = getRandom()%24;
                foodY = getRandom()%17;
            } while (grid[foodX][foodY]!=0);
            grid[foodX][foodY] = 10;
        }
        grid[headX][headY] = 4; // what the hell do I do here? It looks wrong, but code works?!?...
        
        // get current tail direction (to set the next tail to the right position)
        int tail_dir = grid[tailX][tailY];
        // gegessen is used to check if you want to set the tail new. if gegessen=1, dont move the tail = snake gets bigger.
        if(gegessen==0) grid[tailX][tailY] = 0;
        if(gegessen==0) switch(tail_dir) {
        case 1:
            tailX = tailX;
            tailY -= 1;
            break;
        case 2:
            tailX += 1;
            tailY = tailY;
            break;
        case 3:
            tailX = tailX;
            tailY += 1;
            break;
        case 4:
            tailX -= 1;
            tailY = tailY;
            break;
        }
        // do the wall/border stuff also for the tail
        if(tailX>=24) tailX=0;
        if(tailX<0) tailX=23;
        if(tailY<=1) tailY=16;
        if(tailY>=17) tailY=2;

        if(gegessen==1) gegessen=0;
        }
    }
}    
