// Angle of rotation around sun and planets
float theta = 0;
void setup() {
  size(200,200);
smooth();
}

void draw() {
  background(255);
  stroke(0);
  // Translate to center of window
  // to draw the sun.
  translate(width/2,height/2);
  fill(255,200,50);
  ellipse(0,0,20,20);
  // The earth rotates around the sun
  pushMatrix();
  rotate(theta);
  translate(50,0);
  fill(50,200,255);
  ellipse(0,0,10,10);
  // Moon #1 rotates around the earth
  pushMatrix();
  rotate(-theta*4);
  translate(15,0);
  fill(50,255,200);
  ellipse(0,0,6,6);
  popMatrix();
  // Moon #2 also rotates around the earth
  pushMatrix();
  rotate(theta*2);
  translate(25,0);
  fill(50,255,200);
  ellipse(0,0,6,6);
  popMatrix();
  popMatrix();
  theta += 0.01;
}
