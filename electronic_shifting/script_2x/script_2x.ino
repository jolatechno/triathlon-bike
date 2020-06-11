#include <Servo.h>

Servo front;
Servo back;

const unsigned int shifting_delay = 200;
const unsigned int up_delay = 200;

const unsigned int n_gear = 9;

float back_angles[7] = {0, 30, 60, 90, 120, 150, 180};
float front_angles[6] = {0, 0, 0, 0, 0};

unsigned int ratios[n_gear][2] = {{0, 0}, {0, 1}, {0, 2}, {0, 3} ,{0, 4} , {0, 5}, {1, 3}, {1, 4},  {1, 7}};

const int input_pin = 2;
const int front_deraileur = 9;
const int back_derailleur = 10;

int gear = 0;

bool debug = true;
bool current_dir = true;

void setup() {
  front.attach(front_deraileur);
  back.attach(back_derailleur);
  
  pinMode(input_pin, INPUT_PULLUP);

  Serial.begin(9600);
  
  long Time = millis();
  while(!Serial.available() && millis() - Time < 10000){}
  if(millis() - Time >= 10000){
    Serial.end();
    debug = false;
  }

  shift(true);
}

void loop() {
  if(debug && Serial.available() > 0) {
    char c = Serial.read();
    int input = Serial.parseInt();
      
    if(c == 'f')
      front.write(input);
    if(c == 'b')
      back.write(input);
        
    Serial.println(c + (String) input);
    delay(1000);
  }
  if(!digitalRead(input_pin)){
    delay(up_delay);
    shift(digitalRead(input_pin));
  
    current_dir = digitalRead(input_pin);
  
    do {
      shift(current_dir);
      delay(shifting_delay);
    } while(!digitalRead(input_pin));
  }
}


void shift(bool dir){
  gear = (dir) ? max(gear - 1, 0) : min(gear + 1, n_gear - 1);
  
  front.write(front_angles[ratios[gear][0]]);
  back.write(back_angles[ratios[gear][1]]);
  
  if(debug)
    Serial.println(gear);
}
