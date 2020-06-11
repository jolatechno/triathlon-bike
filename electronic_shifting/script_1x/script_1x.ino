#include <Servo.h>

Servo servo;

const unsigned int shifting_delay = 800;
const unsigned int up_delay = 300;
const unsigned int debug_delay = 1000;

const unsigned int n_gear = 11;

float angles_up[n_gear] = {170, 117, 103, 94, 83, 76, 65, 58, 50, 42, 20};
float angles_down[n_gear] = {170, 140, 127, 110, 103, 93, 87, 75, 70, 60, 20};
float angles[n_gear] = {149, 128, 115, 98, 91, 83, 70, 65, 60, 50, 42};

const int input_pin = 2;
const int derailleur = 9;

int gear = 0;

bool debug = true;
bool current_dir = true;

void setup() {
  servo.attach(derailleur);
  servo.write(angles[gear]);
  
  pinMode(input_pin, INPUT_PULLUP);
  
  Serial.begin(9600);

  long Time = millis();
  while(!Serial.available() && millis() - Time < debug_delay){}
  if(millis() - Time >= debug_delay){
    Serial.end();
    debug = false;
  }
}

void loop() {
  if(debug && Serial.available() > 0) {
    int input = Serial.parseInt();
      
    servo.write(input);
        
    Serial.println(input);
    delay(1000);
  }
  if(!digitalRead(input_pin)){
    delay(up_delay);
    current_dir = digitalRead(input_pin);
    
    do {
      shift(current_dir);
    } while(!digitalRead(input_pin));
  }
}

void shift(bool dir){
  gear += 2*dir - 1;
  gear = constrain(gear, 0, n_gear - 1);
  
  servo.write(dir ? angles_up[gear] : angles_down[gear]);
  delay(shifting_delay);
  servo.write(angles[gear]);
  
  if(debug)
    Serial.println(gear);
}
