// An array of Rotater objects
Rotater[] rotaters;

void setup() {
  size(200,200);
  rotaters = new Rotater[20];
  // Rotaters are made randomly
  for (int i = 0; i < rotaters.length; i++ ) {
  rotaters[i] = new Rotater(random(width),random(height),random(-0.1,0.1),random(48));
  }
}

void draw() {
background(255);
// All Rotaters spin and are displayed
for (int i = 0; i < rotaters.length; i++ ) {
  rotaters[i].spin();
  rotaters[i].display();
  }
}

// A Rotater class
class Rotater {

  float x,y; // x,y location
  float theta; // angle of rotation
  float speed; // speed of rotation
  float w; // size of rectangle

Rotater(float tempX, float tempY, float tempSpeed, float tempW) {
  x = tempX;
  y = tempY;
  theta = 0; // Angle is always initialized to 0
  speed = tempSpeed;
  w = tempW;
}

// Increment angle
void spin() {
  theta += speed;
}

// Display rectangle
void display() {
  rectMode(CENTER);
  stroke(0);
  fill(0,100);
  // Note the use of pushMatrix()
  // and popMatrix() inside the object's
  // display method!
  pushMatrix();
  translate(x,y);
  rotate(theta);
  rect(0,0,w,w);
  popMatrix();
  }
}
