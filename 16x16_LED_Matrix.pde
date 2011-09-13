// Pins 
enum pins { shift=8, storage=9, reg1=10, reg2=11, reg3=12, reg4=13, reg5=2,
        pulse=3,latch=4,data1=6,data2=5} pin;
           // 3         4         5       6       7       8         9
          
float mydelay = 0;

/*byte nyan1[16][16] = 
     {{0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,1,1,1,1,1, 1,1,1,1,0,0,0,0},
      {0,0,1,1,3,3,3,3, 3,2,3,1,1,0,0,2},
      {0,0,1,3,3,3,3,3, 3,2,2,3,1,0,2,2},
      {0,2,1,3,3,3,3,3, 3,2,2,2,2,2,2,2},
      {0,2,1,3,3,3,3,3, 3,2,1,1,2,1,1,2},
      {2,0,1,3,3,3,3,3, 3,2,2,2,2,2,2,2},
      {2,0,1,1,3,3,3,3, 3,3,2,2,2,2,2,0},
      {0,0,0,1,1,1,1,1, 1,1,1,2,2,2,0,0},
      {0,0,0,0,2,2,0,0, 0,2,2,0,0,0,0,0},
      {0,0,0,0,2,2,2,0, 0,2,2,2,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0}};
      
byte nyan2[16][16] = 
     {{0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,1,1,1,1,1, 1,2,1,1,0,0,0,2},
      {0,0,1,1,3,3,3,3, 3,2,2,1,1,0,2,2},
      {0,0,1,3,3,3,3,3, 3,2,2,2,2,2,2,2},
      {0,2,1,3,3,3,3,3, 3,2,1,1,2,1,1,2},
      {2,0,1,3,3,3,3,3, 3,2,2,2,2,2,2,2},
      {0,2,1,3,3,3,3,3, 3,3,2,2,2,2,2,0},
      {0,2,1,1,3,3,3,3, 3,3,3,2,2,2,0,0},
      {0,0,0,1,1,1,1,1, 1,1,1,1,0,0,0,0},
      {0,0,0,2,2,0,0,0, 2,2,0,0,0,0,0,0},
      {0,0,0,2,2,2,0,0, 2,2,2,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0}};*/   

/*byte grid[16][16] = 
     {{0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,2,2,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,2,2,2,2,0,0,0},
      {0,0,0,0,0,0,0,0, 2,2,2,2,2,2,0,0},
      {0,0,0,0,0,0,0,2, 2,2,2,2,2,2,2,0},
      {0,0,0,0,0,0,0,0, 2,2,2,2,2,2,0,0},
      {0,0,0,0,0,0,0,0, 2,2,2,2,2,2,0,0},
      {0,0,0,0,0,0,0,0, 2,2,2,2,2,2,0,0},
      {0,0,0,0,2,2,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,2,2,2,2,0, 0,0,0,0,0,0,0,0},
      {0,0,2,2,2,2,2,2, 0,0,0,0,0,0,0,0},
      {0,2,2,2,2,2,2,2, 2,0,0,0,0,0,0,0},
      {0,0,2,2,2,2,2,2, 0,0,0,0,0,0,0,0},
      {0,0,2,2,2,2,2,2, 0,0,0,0,0,0,0,0},
      {0,0,2,2,2,2,2,2, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0}};*/
      
byte grid[16][16] = 
     {
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,1,0,1,0,0,0,0, 0,0,0,0,0,1,0,1},
      {1,1,0,1,0,0,1,1, 0,1,1,0,1,1,0,1},
      {1,1,0,1,0,0,1,1, 0,1,1,0,1,1,0,1},
      
      {0,1,1,1,0,0,0,1, 0,0,1,0,0,1,1,1},
      {0,1,1,1,0,0,1,1, 1,1,1,0,0,1,1,1},
      {0,0,1,0,0,1,1,1, 1,1,1,1,0,0,1,0},
      {0,0,1,1,1,1,1,1, 1,1,1,1,1,1,1,0},
      {0,0,0,0,0,1,1,1, 1,1,1,1,0,0,0,0},
      {0,0,0,1,1,1,1,1, 1,1,1,1,1,1,0,0},
      {0,0,0,1,0,0,0,1, 1,1,0,0,0,1,0,0},
      {0,0,1,0,0,1,0,1, 0,1,0,1,0,0,1,0},
      {0,0,1,0,0,1,0,1, 0,1,0,1,0,0,1,0},
      {0,0,1,0,1,1,0,1, 0,1,0,1,1,0,1,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0}};
      
   /*
   byte grid[16][16] = 
     {
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,1,0,1,0,0,0,0, 0,0,0,0,0,1,0,1},
      {1,1,0,1,0,0,1,1, 0,1,1,0,1,1,0,1},
      {1,1,0,1,0,0,1,1, 0,1,1,0,1,1,0,1},
      {0,1,1,1,0,0,0,1, 0,0,1,0,0,1,1,1},
      {0,1,1,1,0,0,1,1, 1,1,1,0,0,1,1,1},
      {0,0,1,0,0,1,1,1, 1,1,1,1,0,0,1,0},
      {0,0,1,1,1,1,1,1, 1,1,1,1,1,1,1,0},
      {0,0,0,0,0,1,1,1, 1,1,1,1,0,0,0,0},
      {0,0,0,1,1,1,1,1, 1,1,1,1,1,1,0,0},
      {0,0,0,1,0,0,0,1, 1,1,0,0,0,1,0,0},
      {0,0,1,0,0,1,0,1, 0,1,0,1,0,0,1,0},
      {0,0,1,0,0,1,0,1, 0,1,0,1,0,0,1,0},
      {0,0,1,0,1,1,0,1, 0,1,0,1,1,0,1,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0}};*/

byte rotated_grid[16][16] = 
     {{2,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1},
      {2,2,0,0,0,0,0,0, 0,0,0,0,0,0,1,1},
      {2,2,2,0,0,0,0,0, 0,0,0,0,0,1,1,1},
      {2,2,2,2,0,0,0,0, 0,0,0,0,2,0,1,0},
      {0,0,0,0,1,0,0,0, 0,0,0,2,2,0,1,0},
      {0,0,0,1,1,1,0,0, 0,0,2,2,2,0,0,0},
      {0,0,1,1,1,1,1,0, 0,2,2,2,2,0,0,0},
      {0,0,0,1,1,1,1,1, 2,2,2,2,2,0,0,0},
      {1,1,1,1,1,2,1,1, 1,0,0,0,0,0,0,2},
      {0,1,1,1,1,2,1,0, 1,1,0,0,0,0,2,2},
      {0,0,1,1,1,2,0,0, 1,1,1,0,0,2,2,2},
      {0,0,0,1,1,0,0,0, 1,1,1,1,2,2,2,2},
      {0,0,0,2,2,0,0,0, 1,1,1,1,2,2,2,2},
      {0,0,2,2,2,1,0,0, 2,2,2,0,0,1,1,1},
      {0,2,2,2,2,1,2,0, 1,1,0,0,0,0,2,2},
      {2,2,2,2,2,1,2,2, 1,0,0,0,0,0,0,2}};

void rotate_grid() {
  int i=0;
  int j=0; 
 for(i=0; i<16; ++i) {
   for(j=0; j<16; ++j) {
      //rotated_grid[i][j] = grid[i][j];
      if(i<8 && j<8) {
        rotated_grid[7-j][i] = grid[i][j];    
      } else if (i<8 && j>=8) {
        rotated_grid[i][j] = grid[i][(7-(j-8))+8]; 
      }  else if (i>=8 && j<4) {
        rotated_grid[i][j] = grid[(7-(i-8))+8][j+4]; 
      } else if (i>=8 && j<8 && j>=4) {
        rotated_grid[i][j] = grid[(7-(i-8))+8][j-4]; 
      }  else if (i>=8 && j>=8 && j<12) {
        rotated_grid[i][j+4] = grid[(7-(j-8))+8][i]; 
      } else if (i>=8 && j>=8 && j>=12 ) {
        rotated_grid[i][j-4] = grid[(7-(j-8))+8][i]; 
      } 
   }  
 }
}

//   15 14 13 12 11 10  9  8
//    8  9 10 11 12 13 14 15
//   7 6 5 4 3 2 1 0
//   0 1 2 3 4 5 6 7


      //               REIHE           l.u. links
byte matrix[5][16]={{0,0,0,0,0,0,0,0, 0,1,0,1,0,1,0,1},
      //              r.u. oben          REIHE
                  {1,0,1,0,1,0,1,0, 0,0,0,0,0,0,0,0},
      //              r.o. rechts      r.o. links
                  {0,1,0,1,0,1,0,1, 0,1,0,1,0,1,0,1},
      //              l.o. oben        l.o. unten
                  {1,0,1,0,1,0,1,0, 1,0,1,0,1,0,1,0},
      //              l.u. rechts      r.u. unten
                  {1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1}};
                  
/*
                   //               REIHE           l.u. links
  int matrix[5][16]={{0,0,0,0,0,0,0,1, 0,1,0,1,0,1,0,1},
      //              r.u. oben          REIHE
                  {1,0,1,0,1,0,1,0, 0,0,0,0,0,0,0,1},
      //              r.o. rechts      r.o. links
                  {0,1,0,1,0,1,0,1, 0,1,0,1,0,1,0,1},
      //              l.o. oben        l.o. unten
                  {1,0,1,0,1,0,1,0, 1,0,1,0,1,0,1,0},
      //              l.u. rechts      r.u. unten
                  {0,1,0,1,0,1,0,1, 1,0,1,0,1,0,1,0}};
                  */
                  
  int row[] = {7,6,5,4,0,1,2,3};
  
void draw_matrix() {
  int i=0;
  for(i=0; i<16; ++i) {
    digitalWrite(reg1,matrix[0][i]);
    digitalWrite(reg2,matrix[1][i]);
    digitalWrite(reg3,matrix[2][i]);
    digitalWrite(reg4,matrix[3][i]);
    digitalWrite(reg5,matrix[4][i]);
    //delay(mydelay);
    digitalWrite(shift,HIGH);
    //delay(mydelay);
    digitalWrite(shift,LOW);
  }
  digitalWrite(storage,HIGH);
  delay(mydelay);
  digitalWrite(storage,LOW);  
}

void del_matrix() {
  int i=0;
  for(i=0; i<16; ++i) {
    digitalWrite(reg1,1);
    digitalWrite(reg2,1);
    digitalWrite(reg3,1);
    digitalWrite(reg4,1);
    digitalWrite(reg5,1);
    //delay(mydelay);
    digitalWrite(shift,HIGH);
    //delay(mydelay);
    digitalWrite(shift,LOW);
  }
  digitalWrite(storage,HIGH);
  delay(mydelay);
  digitalWrite(storage,LOW);  
}

void setup() 
{
  pinMode(shift,OUTPUT);
  pinMode(storage,OUTPUT);
  pinMode(reg1,OUTPUT);
  pinMode(reg2,OUTPUT);
  pinMode(reg3,OUTPUT);
  pinMode(reg4,OUTPUT);
  pinMode(reg5,OUTPUT);
  pinMode(latch,OUTPUT);
  pinMode(pulse,OUTPUT);
  pinMode(data1,INPUT);
  pinMode(data2,INPUT);
  digitalWrite(shift,LOW);
  digitalWrite(storage,LOW);
  digitalWrite(reg1,LOW);
  digitalWrite(reg2,LOW);
  digitalWrite(reg4,LOW);
  digitalWrite(reg5,LOW);
  digitalWrite(pulse,HIGH);
  digitalWrite(latch,HIGH);
  digitalWrite(data1,HIGH);
  digitalWrite(data2,HIGH);
  draw_matrix();
}

int fps=0;
/*
1/0 -> 3/6
delta_y= (-6)/(-2) = 3
0000000
XXX0000
000XXX0
000000X
0000000
0000000
0000000
0000000

*/
void draw_line(byte x0,byte y0,byte x1,byte y1,byte color) {
  byte dx = abs(x1-x0);
  byte dy = abs(y1-y0); 
  float sx,sy;
  byte e2;
  if(x0 < x1) sx = 1; else sx = -1;
  if(y0 < y1) sy = 1; else sy = -1;
  byte err = dx-dy;
  byte looping=1;
  while(looping) {
     grid[x0][y0]=color;
     if(x0 == x1 && y0 == y1) looping=0;
     e2 = 2*err;
     if(e2 > -dy) { 
       err = err - dy;
       x0 = x0 + sx;
     }
     if(e2 <  dx) {
       err = err + dx;
       y0 = y0 + sy; 
     }
  }
}

void draw_square(byte x1,byte y1,byte x2,byte y2,byte color) {
  int i,j;
  for(i=x1; i<=x2; ++i) {
    for(j=y1; j<=y2; ++j) {
      grid[i][j] = color;  
    }  
  }
}

byte btns[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

void NESController() {
  digitalWrite(latch,LOW);
  digitalWrite(pulse,LOW);
  
  digitalWrite(latch,HIGH);
  delayMicroseconds(14);
  digitalWrite(latch,LOW);
  delayMicroseconds(8);
  btns[0] = digitalRead(data1);
  btns[8] = digitalRead(data2);
  for (int i = 1; i < 8; i ++) {
    digitalWrite(pulse,HIGH);
    delayMicroseconds(13);
    btns[i] = digitalRead(data1);
    btns[i+8] = digitalRead(data2);
    delayMicroseconds(3);
    digitalWrite(pulse,LOW);
    delayMicroseconds(5);
  }

}


void loop() {
  
  /*NESController();
  
  
  if(btns[3] == LOW) {
    draw_square(4,8,11,11,1);
  } else {
    draw_square(4,8,11,11,2);
  }
  if(btns[11] == LOW) {
    draw_square(4,4,11,7,1);
  } else {
    draw_square(4,4,11,7,2);
  }*/
  //draw_line(0,0,3,4,2);
  //draw_line(12,12,15,15,2);
  //draw_line(5,0,14,14,2);
  draw_square(0,0,15,15,0);
  draw_square(4,4,11,7,2);

  rotate_grid(); 
  
  int i=0;
  int j=0;
  int k=0;
  for(i=0; i<8; ++i) {
          for (k=0; k<8;++k) {
              matrix[0][row[k]+0] = 0;
              matrix[1][row[k]+8] = 0;
          } 
          matrix[0][row[i]+0] = 1;
          matrix[1][row[i]+8] = 1;
     for (j=0; j<8;++j) {
          
          // l.o
          
          
          
          if(rotated_grid[i][j] == 1) {
            matrix[3][(j*2)+1]=0;
            matrix[3][j*2]=1;
          } else if(rotated_grid[i][j] == 2) {
            matrix[3][(j*2)+1]=1;
            matrix[3][j*2]=0;
          } else if(rotated_grid[i][j] == 3) {
            matrix[3][(j*2)+1]=0;
            matrix[3][j*2]=0;
          } else if(rotated_grid[i][j] == 0) {
            matrix[3][(j*2)+1]=1;
            matrix[3][j*2]=1;
          }
          // r.o
          if(rotated_grid[i][j+8] == 1) {
            matrix[2][(j*2)+1]=1;
            matrix[2][j*2]=0;
          } else if(rotated_grid[i][j+8] == 2) {
            matrix[2][(j*2)+1]=0;
            matrix[2][j*2]=1;
          } else if(rotated_grid[i][j+8] == 3) {
            matrix[2][(j*2)+1]=0;
            matrix[2][j*2]=0;
          } else if(rotated_grid[i][j+8] == 0){
            matrix[2][(j*2)+1]=1;
            matrix[2][j*2]=1;
          }
          
          // r.u
          if(rotated_grid[i+8][j+8] == 1) {
            if(j<4) {
              matrix[1][(j*2)+1]=0;
              matrix[1][j*2]=1;
            } else {
              matrix[4][(j*2)+1]=0;
              matrix[4][j*2]=1;
            } 
          } else if(rotated_grid[i+8][j+8] == 2) {
            if(j<4) {
              matrix[1][(j*2)+1]=1;
              matrix[1][j*2]=0;
            } else {
              matrix[4][(j*2)+1]=1;
              matrix[4][j*2]=0;
            } 
          } else if(rotated_grid[i+8][j+8] == 3) {
            if(j<4) {
              matrix[1][(j*2)+1]=0;
              matrix[1][j*2]=0;
            } else {
              matrix[4][(j*2)+1]=0;
              matrix[4][j*2]=0;
            } 
          } else if(rotated_grid[i+8][j+8] == 0){
            if(j<4) {
              matrix[1][(j*2)+1]=1;
              matrix[1][j*2]=1;
            } else {
              matrix[4][(j*2)+1]=1;
              matrix[4][j*2]=1;
            } 
          }
            
          //l.u
            
          if(rotated_grid[i+8][j] == 1) {
            if((j)<4) {
              matrix[4][(j*2)+1]=1;
              matrix[4][j*2]=0;
            } else {
              matrix[0][(j*2)+1]=1;
              matrix[0][j*2]=0;
            }   
          } else if(rotated_grid[i+8][j] == 2) {
            if(j<4) {
              matrix[4][(j*2)+1]=0;
              matrix[4][j*2]=1;
            } else {
              matrix[0][(j*2)+1]=0;
              matrix[0][j*2]=1;
            } 
          } else if(rotated_grid[i+8][j] == 3) {
            if(j<4) {
              matrix[4][(j*2)+1]=0;
              matrix[4][j*2]=0;
            } else {
              matrix[0][(j*2)+1]=0;
              matrix[0][j*2]=0;
            } 
          } else if(rotated_grid[i+8][j] == 0) {
            if(j<4) {
              matrix[4][(j*2)+1]=1;
              matrix[4][j*2]=1;
            } else {
              matrix[0][(j*2)+1]=1;
              matrix[0][j*2]=1;
            } 
          }
        
     }
    draw_matrix();
  }
  del_matrix();
}
