#include <sysinit.h>
#include "basic/basic.h"
#include "lcd/render.h"
#include "lcd/display.h"
#include "basic/config.h"
#include "basic/simpletime.h"
#include "usetable.h"

void ram(void) {
    int update = 1;
    char grid[24][17];
    // set grid to 0
    lcdClear();
    lcdPrintln("init grid to 0");
    for(int i=0; i<24; ++i) {
        for(int j=0; j<17; ++j) {
            grid[i][j] = 0;
        }
    }

    lcdPrintln("set snake");
    grid[12][8] = 2;
    grid[13][8] = 2;
    grid[14][8] = 2;
    grid[15][8] = 2;

    lcdPrintln("set head and tail");
    int headX = 15;
    int headY = 8;
    int tailX = 12;
    int tailY = 8;
    int foodX = 15;
    int foodY = 7;
    int points = 0;

    grid[foodX][foodY] = 10;
    int gegessen = 0;
    char key = 2;
    time_t last_update = 0;
    setExtFont("ORBITRON14");
    while(1) {
        
        char in = getInputRaw();
        switch (in) {
        case BTN_ENTER:
            return;
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

        // draw snake
        for(int i=0; i<24; ++i) {
            for(int j=0; j<17; ++j) {
                for(int k=0; k<4; ++k) {
                    for(int l=0; l<4; ++l) {
                        if(grid[i][j]>0 && j>1) 
                             lcdSetPixel((i*4)+k,(j*4)+l,1);
                        else lcdSetPixel((i*4)+k,(j*4)+l,0);
                    }
                } 
            }
        }
        for(int i=0; i<(24*4); ++i) {
            lcdSetPixel(i,8,1);
        }
        DoString(0,0,"smrrd//shack");
        DoInt(85,0,points);
        lcdRefresh();
        if(getTimer()-10 > last_update) {
            update = 1;
            last_update = getTimer();
        }
        else update = 0;
        if(update) {
        grid[headX][headY] = key;
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
        
        if(headX>=24) headX=0;
        if(headX<0) headX=23;
        if(headY<=1) headY=16;
        if(headY>=17) headY=2;

        if(grid[headX][headY] > 0 && grid[headX][headY] != 10){
            lcdPrintln("GAME OVER");
            lcdRefresh();
            delayms(1000);
            return;
        } else if(grid[headX][headY] == 10) {
            points++;
            gegessen = 1;
            do {
                foodX = getRandom()%24;
                foodY = getRandom()%17;
            } while (grid[foodX][foodY]!=0);
            grid[foodX][foodY] = 10;
        }
        grid[headX][headY] = 4;
        
        int dir = grid[tailX][tailY];
        if(gegessen==0) grid[tailX][tailY] = 0;
        if(gegessen==0) switch(dir) {
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
        if(tailX>=24) tailX=0;
        if(tailX<0) tailX=23;
        if(tailY<=1) tailY=16;
        if(tailY>=17) tailY=2;

        if(gegessen==1) gegessen=0;
        }
    }
}    
