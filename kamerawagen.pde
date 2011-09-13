/*
  Blink
  Turns on an LED on for one second, then off for one 
  second, repeatedly.
 
  This example code is in the public domain.
 */

int pin_ds = 0,
    pin_oe = 1,
    pin_stcp = 2,
    pin_shcp = 3,
    pin_mr = 4,
    pin_taste1 = 6,
    pin_taste2 = 5,
    pin_taste3 = 7,
    pin_relay = 10;

int del = 300;



void shift() {
  digitalWrite(pin_shcp,LOW);
  digitalWrite(pin_shcp,HIGH);
}

void output() {
  digitalWrite(pin_stcp,LOW);
  digitalWrite(pin_stcp,HIGH);
}

void showNumber(int no) {
  switch(no) {
    case -1:    
        digitalWrite(pin_ds,LOW); // 7
        shift();
        digitalWrite(pin_ds,LOW); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,LOW); // 4
        shift();
        digitalWrite(pin_ds,LOW); // 3
        shift();
        digitalWrite(pin_ds,LOW); // 2
        shift();
        digitalWrite(pin_ds,LOW); // 1
        shift();
      break;
    case 0:
        digitalWrite(pin_ds,LOW); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,HIGH); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 1:
        digitalWrite(pin_ds,LOW); // 7
        shift();
        digitalWrite(pin_ds,LOW); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,LOW); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,LOW); // 1
        shift();
      break;
    case 2:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,LOW); // 6
        shift();
        digitalWrite(pin_ds,HIGH); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,LOW); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 3:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,LOW); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 4:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,LOW); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,LOW); // 1
        shift();
      break;
    case 5:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,LOW); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 6:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,HIGH); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,LOW); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 7:
        digitalWrite(pin_ds,LOW); // 7
        shift();
        digitalWrite(pin_ds,LOW); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,LOW); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 8:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,HIGH); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
    case 9:
        digitalWrite(pin_ds,HIGH); // 7
        shift();
        digitalWrite(pin_ds,HIGH); // 6
        shift();
        digitalWrite(pin_ds,LOW); // 5
        shift();
        digitalWrite(pin_ds,HIGH); // 4
        shift();
        digitalWrite(pin_ds,HIGH); // 3
        shift();
        digitalWrite(pin_ds,HIGH); // 2
        shift();
        digitalWrite(pin_ds,HIGH); // 1
        shift();
      break;
  }
  output();
}

void driveFor(int time) {
  digitalWrite(pin_relay,LOW);
  delay(time); 
  digitalWrite(pin_relay,HIGH); 
}

void waitFor(int time) {
  showNumber(8);
  int t=time/8;
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
  delay(t);
  digitalWrite(pin_ds,LOW); // 1
  shift();output();
}

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(pin_ds, OUTPUT);
  pinMode(pin_oe, OUTPUT);
  pinMode(pin_stcp, OUTPUT);
  pinMode(pin_shcp, OUTPUT);
  pinMode(pin_mr, OUTPUT);
  pinMode(pin_relay, OUTPUT);
  pinMode(pin_taste1, INPUT);
  pinMode(pin_taste2, INPUT);
  pinMode(pin_taste3, INPUT);
  digitalWrite(pin_mr,HIGH);
  digitalWrite(pin_oe,LOW);
  digitalWrite(pin_stcp,LOW);
  digitalWrite(pin_shcp,LOW);
  digitalWrite(pin_ds,LOW);
  digitalWrite(pin_taste1,HIGH);
  digitalWrite(pin_taste2,HIGH);
  digitalWrite(pin_taste3,HIGH);
  digitalWrite(pin_relay,HIGH);
  
}

unsigned long pressed[3] = {0,0,0};
int hysterese=50;
int nr=0;
void loop() {
  
  showNumber(nr);
  if(digitalRead(pin_taste1)==LOW && !pressed[0]) {
    nr>0 ? nr-=1: nr=9;
    pressed[0]=millis();
  } else if(digitalRead(pin_taste1)==HIGH && millis()-pressed[0]>hysterese) {
    pressed[0]=0;
  }
  
  if(digitalRead(pin_taste2)==LOW && !pressed[1]) {
    nr<9 ? nr+=1: nr=0; 
    pressed[1]=millis();
  } else if(digitalRead(pin_taste2)==HIGH && millis()-pressed[1]>hysterese) {
    pressed[1]=0;
  }
  
  if(digitalRead(pin_taste3)==LOW && !pressed[2]) {
    showNumber(-1);
    switch(nr) {
      case 0:
         waitFor(100);
         driveFor(2500);
         break; 
      case 1:
         waitFor(100);
         driveFor(4000);
         break; 
      case 2:
         waitFor(1000);
         driveFor(2000);
         break;  
      case 3:
         waitFor(1000);
         driveFor(3000);
         break;   
      case 4:
         waitFor(1000);
         driveFor(4000);
         break;   
      case 5:
         waitFor(2000);
         driveFor(2000);
         break;   
      case 6:
         waitFor(2000);
         driveFor(3000);
         break;   
      case 7:
         waitFor(2000);
         driveFor(4000);
         break;   
      case 8:
         waitFor(3000);
         driveFor(2500);
         break;   
      case 9:
         waitFor(3000);
         driveFor(4000);
         break; 
    }
    
    showNumber(0);
    pressed[2]=millis(); 
  } else if(digitalRead(pin_taste3)==HIGH && millis()-pressed[2]>hysterese) {
    pressed[2]=0;
  }

}
