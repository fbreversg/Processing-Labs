//based on drawCircle of Learning Processing @shiffman

float theta = 0.0;
int radio = 10; 
int factor = 100;

void setup() {
  size(800,800);
  smooth();
}
void draw() {
  background(255);
  stroke(0);
  noFill();
  float x = (sin(theta)/10 + 1) * width/2;
  float y = (sin(theta/10)) * height/2;
  drawCircle(x,y,radio);
  theta += 0.05;
  radio= int((sin(theta)+1)*factor);
}
void drawCircle(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 10) {
    fill(random(255),random(255),random(255));
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  }
}
