import controlP5.*;
import processing.serial.*;

Serial port;  
ControlP5 cp5;
String text;
PImage robot;

void setup() {
  size(600, 800);
  robot = loadImage("robot.jpg");
  port = new Serial(this, "COM3", 115200); 

  cp5 = new ControlP5(this);

  cp5.addSlider("rHip")
    .setPosition(19, 246)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
   cp5.addSlider("lHip")
    .setPosition(321, 246)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
    cp5.addSlider("rKnee")
    .setPosition(19, 474)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
    cp5.addSlider("lKnee")
    .setPosition(324, 474)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
    cp5.addSlider("rAnkle")
    .setPosition(19, 705)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
    cp5.addSlider("lAnkle")
    .setPosition(327, 705)
    .setValue(90)
    .setSize(200,20)
    .setRange(0, 180)
    ;
    
    cp5.addBang("Reset")
    .setPosition(265,122);
}

void draw() {
  background(0);
  image(robot, 0, 0);
} 

/*void mousePressed() {
  ellipse( mouseX, mouseY, 2, 2 );
  println( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
}
*/

void rHip(int pos){
 port.write("q" +pos);
  
}
void lHip(int pos){
 port.write("w" +pos);
  
}
void rKnee(int pos){
 port.write("a" +pos);
  
}
void lKnee(int pos){
 port.write("s" +pos);
  
}
void rAnkle(int pos){
 port.write("z" +pos);
  
}
void lAnkle(int pos){
 port.write("x" +pos);
}

void Reset(){
  cp5.getController ("rHip").setValue(90);
  cp5.getController ("lHip").setValue(90);
  cp5.getController ("rKnee").setValue(90);
  cp5.getController ("lKnee").setValue(90);
  cp5.getController ("rAnkle").setValue(90);
  cp5.getController ("lAnkle").setValue(90);
  
  port.write('p');
}
