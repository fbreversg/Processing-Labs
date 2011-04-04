float theta = 0.0; // angulo
int fact = 4; //factor, prueba a cambiarlo.

void setup() {
  frameRate(15);
  size(1000,1000);
}
void draw() {
  background(0);
  stroke(255);
  rectMode(CENTER);
  displayRecursiveArm(fact, theta); 
  theta+=0.1;
 
  
}

void displayRecursiveArm(int factor, float theta){
  translate((width)/factor,(height)/factor);
  rotate (sin(theta));
  fill(random(255),random(255),random(255));
  rect(0,0,factor,factor);
  if (factor < 64) {
    displayRecursiveArm(factor+4, theta);     
  }  
}
