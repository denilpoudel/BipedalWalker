#include <Arduino.h>
#include <Servo.h>

/*
    Servos
 */
Servo rHip;
Servo lHip;
Servo rKnee;
Servo lKnee;
Servo rAnkle;
Servo lAnkle;

/*
 Functions
 */
void servogui();
void initialpos();

void setup() {
rHip.attach(11);
rKnee.attach(10);
rAnkle.attach(9);

lHip.attach(6);
lKnee.attach(5);
lAnkle.attach(3);

Serial.begin(115200);
}

void loop() {
  servogui();

}

void servogui(){
  float n = 0;
    static int v = 0;

    if(Serial.available()) {
      char ch = Serial.read();

      switch(ch) {
        case '0'...'9':
          v = v * 10 + ch - '0';
          break;
        case 'q':
          n = map(v, 0, 180, 0, 180);
          rHip.write(v);
          v = 0;
          break;
        case 'w':
          n = map(v, 0, 180, 0, 180);
          lHip.write(v);
          v = 0;
          break;
        case 'a':
          n = map(v, 0, 180, 0, 180);
          rKnee.write(v);
          v = 0;
          break;
        case 's':
          n = map(v, 0, 180, 0, 180);
          lKnee.write(v);
          v = 0;
          break;
        case 'z':
          n = map(v, 0, 180, 0, 180);
          rAnkle.write(v);
          v = 0;
          break;
        case 'x':
          n = map(v, 0, 180, 0, 180);
          lAnkle.write(v);
          v = 0;
          break;
        }
    }
}
