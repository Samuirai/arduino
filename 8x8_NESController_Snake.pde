 /*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
int pin_ds = 2,
    pin_shcp = 0,
    pin_stcp = 1,
  // latch, data, pulse, power, gnd  
  // yellow,brown,blue,red,white
    pin_gnd = 3,
    pin_power = 4,
    pin_pulse = 5,
    pin_data = 6, 
    pin_latch = 7;
byte data;
int mydelay=0;

int matrix[24] =  {1,0,1,0,1,0,1,0, 1,0,1,0,1,0,1,0 ,1,1,1,1,1,1,1,1};

int plain[8][8] = {{0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0}};
                  
int buffer[8][8] = {{0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0,0}};
                  
int nyan[2][8][8] = {{{0,0,0,0,0,0,0,0},
                      {0,0,1,1,1,0,0,0},
                      {0,1,1,1,2,1,0,2},
                      {0,1,1,1,2,2,2,2},
                      {2,1,1,1,2,3,3,2},
                      {0,1,1,1,1,2,2,0},
                      {0,0,2,0,2,0,0,0},
                      {0,0,0,0,0,0,0,0}},
                      
                      {{0,0,0,0,0,0,0,0},
                      {0,0,1,1,2,0,0,2},
                      {0,1,1,1,2,2,2,2},
                      {2,1,1,1,2,2,2,2},
                      {0,1,1,1,1,2,2,0},
                      {0,1,1,1,1,1,0,0},
                      {0,2,0,2,0,0,0,0},
                      {0,0,0,0,0,0,0,0}}};   
                  
void load(int arr[][8]) {
  for(int i=0; i<8; ++i) {
    buffer[i][0] = arr[i][0];
    buffer[i][1] = arr[i][1];
    buffer[i][2] = arr[i][2];
    buffer[i][3] = arr[i][3];
    buffer[i][4] = arr[i][4];
    buffer[i][5] = arr[i][5];
    buffer[i][6] = arr[i][6];
    buffer[i][7] = arr[i][7];  
  }
}  
                  
/*int game[8][8] = {{0,0,0,0,0,0,0,0},
                  {0,0,1,1,1,0,0,0},
                  {0,1,1,1,2,1,0,2},
                  {0,1,1,1,2,2,2,2},
                  {2,1,1,1,2,3,3,2},
                  {0,1,1,1,1,2,2,0},
                  {0,0,2,0,2,0,0,0},
                  {0,0,0,0,0,0,0,0}};*/

void showMatrix() {
  int i,j;
  for(j=23;j>=0;j--) {
    digitalWrite(pin_ds,matrix[j]);
    delay(mydelay);
    digitalWrite(pin_shcp,HIGH);
    delay(mydelay);
    digitalWrite(pin_shcp,LOW);
    
  } 
  digitalWrite(pin_stcp,HIGH);
  delay(mydelay);
  digitalWrite(pin_stcp,LOW);
}

int col[8] =   {8,10,12,14,0,2,4,6};
int row[8] =   {19,18,17,16,23,22,21,20};

void resetMatrix() {
  int i;
  for(i=0; i<8; ++i) {
    matrix[col[i]] = 1;
    matrix[col[i]+1] = 1;  
  }
  for(i=0; i<8; ++i) {
    matrix[row[i]]=0;  
  }
}

void draw(int arr[8][8]){
  int i,j;
  for(i=0; i<8; ++i) {
    resetMatrix();
    matrix[row[i]]=1;
    for(j=0; j<8; ++j) {
        if(arr[j][i]==1) {
          matrix[col[j]]=0;
        } else if(arr[j][i]==2) {
            matrix[col[j]+1]=0;
        } else if(arr[j][i]==3) {
            matrix[col[j]]=0;
            matrix[col[j]+1]=0;
        } else {
            matrix[col[j]]=1;
        }  
      }
        showMatrix();
      delay(mydelay);
    } 
}

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(pin_ds, OUTPUT);
  pinMode(pin_shcp, OUTPUT);
  pinMode(pin_stcp, OUTPUT);
  pinMode(pin_pulse, OUTPUT);
  pinMode(pin_power, OUTPUT);
  pinMode(pin_gnd, OUTPUT);
  pinMode(pin_latch, OUTPUT);
  pinMode(pin_data, INPUT);
  pinMode(14, INPUT);
  pinMode(15, INPUT);
  pinMode(16, INPUT);
  digitalWrite(pin_ds,LOW);
  digitalWrite(pin_shcp,LOW);
  digitalWrite(pin_stcp,LOW);
  digitalWrite(pin_power,HIGH);
  digitalWrite(pin_gnd,LOW);
  digitalWrite(pin_latch,HIGH);
  digitalWrite(pin_pulse,HIGH);
  digitalWrite(pin_data,HIGH);
  
  showMatrix();
  delay(500);
  resetMatrix();
  showMatrix();
  digitalWrite(10,LOW);
  delay(1000);
  digitalWrite(10,HIGH);
  randomSeed(analogRead(14)+millis()+analogRead(15)+analogRead(16));
  placeFood();
}

int btns[8] = {0,0,0,0,0,0,0,0};



void NESController() {
  data = 0;
  digitalWrite(pin_latch,LOW);
  digitalWrite(pin_pulse,LOW);
  
  digitalWrite(pin_latch,HIGH);
  delayMicroseconds(14);
  digitalWrite(pin_latch,LOW);
  delayMicroseconds(8);
  btns[0] = digitalRead(pin_data);
  for (int i = 1; i < 8; i ++) {
    digitalWrite(pin_pulse,HIGH);
    delayMicroseconds(13);
    btns[i] = digitalRead(pin_data);
    delayMicroseconds(3);
    digitalWrite(pin_pulse,LOW);
    delayMicroseconds(5);
  }

}
               //  0 1 2 3 4 5 6 7
int snake[8][8] ={{0,0,0,0,0,0,0,0}, // 0
                  {0,0,0,0,0,0,0,0}, // 1
                  {0,0,0,0,0,0,0,0}, // 2
                  {0,0,0,0,4,4,4,4}, // 3
                  {0,0,0,0,0,0,0,0}, // 4
                  {0,0,0,0,0,0,0,0}, // 5
                  {0,0,0,0,0,0,0,0}, // 6
                  {0,0,0,0,0,0,0,0}};// 7
                  
int head[2] = {3,4};
int tail[2] = {3,7};
int dir = 4;

int snakeAction;

void updateSnake() {
  
   snake[head[0]][head[1]] = dir;
   int oldTail[2] = {tail[0],tail[1]};
   
   
   if(snakeAction==1) {
     snakeAction=0;
     placeFood();
   } else {
     if(snake[tail[0]][tail[1]] == 1) {
       tail[0] > 0 ? tail[0]-=1 : tail[0]=7;   
     } else if(snake[tail[0]][tail[1]] == 2) {
       tail[1] < 7 ? tail[1]+=1 : tail[1]=0;  
     }  else if(snake[tail[0]][tail[1]] == 3) {
       tail[0] < 7 ? tail[0]+=1 : tail[0]=0;  
     } else if(snake[tail[0]][tail[1]] == 4) {
       tail[1] > 0 ? tail[1]-=1 : tail[1]=7;   
     } 
      snake[oldTail[0]][oldTail[1]] = 0; 
   }
   
   if(dir == 1) {
     head[0] > 0 ? head[0]-=1 : head[0]=7;   
   } else if(dir == 2) {
     head[1] < 7 ? head[1]+=1 : head[1]=0;  
   }  else if(dir == 3) {
     head[0] < 7 ? head[0]+=1 : head[0]=0;  
   } else if(dir == 4) {
     head[1] > 0 ? head[1]-=1 : head[1]=7;   
   } 
   
   if(snake[head[0]][head[1]]==5) {
     snakeAction=1;
     snake[head[0]][head[1]] = dir;
   } else if(snake[head[0]][head[1]]>0) {
     snakeAction=2; 
     
     delay(1500);
     draw(plain);
     load(plain);
     delay(500);
   } else {
     snakeAction=0;
     snake[head[0]][head[1]] = dir;
   }
   
   for(int i=0; i<8; ++i) {
     for(int j=0; j<8; ++j) {
       if(snake[i][j]>0 && snake[i][j] < 5) {
         buffer[i][j] = 1;  
       } else if(snake[i][j]==5) {
         buffer[i][j] = 2;
       } else {
         buffer[i][j] = 0;
       }
     }  
   }
   
}

int state=0;
int hysterese = 50;
long lastFrame=0;
int nyananimation=0;
boolean dir_chosen=0;                                           // LOOOOOOOOOOOOOOOOOOOP
void loop() {
  
  if(150<(millis()-lastFrame)) {
    // UPDATE DRAWING
    
    if(snakeAction!=2) updateSnake();
    NESController();
    lastFrame=millis();
    dir_chosen=0;
    if (btns[4]==LOW && state==0 && dir!=3 && !dir_chosen) { //hoch
      dir = 1;  
    }else if (btns[5]==LOW && state==0 && dir!=1 && !dir_chosen) { //runter
      dir = 3;
    }else if (btns[6]==LOW && state==0 && dir!=2 && !dir_chosen) { //links
      dir = 4;
    }else if (btns[7]==LOW && state==0 && dir!=4 && !dir_chosen) { //rechts
      dir = 2;
    }
  }
  
  if(snakeAction==2) {
    for(int i=0; i<50; ++i) draw(nyan[0]);
    for(int i=0; i<50; ++i) draw(nyan[1]); 
    NESController();
    
    if(btns[3] == LOW) {
      snakeAction=1;
      for(int i=0; i<8; ++i) {
        for(int j=0; j<8; ++j) {
          snake[i][j] = 0;
        }
      }
      snake[3][4] = 4;
      snake[3][5] = 4;
      snake[3][6] = 4;
      snake[3][7] = 4;  
      dir=4;
      head[0] = 3;
      head[1] = 4;
      tail[0] = 3;
      tail[1] = 7;
    }
  } else {
    draw(buffer);
        
  }
  
}
int rnd[2];
void placeFood() {
  
  do {
    rnd[0] = random(0,7);
    rnd[1] = random(0,7);
  } while(snake[rnd[0]][rnd[1]] != 0);  
  snake[rnd[0]][rnd[1]] = 5;
}
