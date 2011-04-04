//based on example of Learning Processing @shiffman

// Global angle for rotation

boolean tecla, raton = false;
float theta = 0;
void setup() {
  size(800, 800);
smooth();
}
void draw() {
  background(theta);
  
  if (!raton) {
    stroke(255);
  } else {
    stroke(random(255),random(255),random(255));
  }
  
  if (!tecla)  {
    strokeWeight(0);
  } else {
    strokeWeight(4);
  }
    
  // Translate to center of window
  translate(width/2,height/2);
  // Loop from 0 to 360 degrees (2*PI radians)
  for(float i = 0; i < TWO_PI; i += 0.2) {
  // Push, rotate and draw a line!
  pushMatrix();
  rotate(theta + i);
  line(0,0,100,0);
  // Loop from 0 to 360 degrees (2*PI radians)
  for(float j = 0; j < TWO_PI; j += 0.5) {
  // Doesn't push, translate, rotate and draw a line!
  //pushMatrix(); COMENTADO
  translate(100,0);
  rotate(-theta-j);
  line(0,0,50,0);
  //doesn't pop to var
  //popMatrix(); //COMENTADO
  }
// We're done with the outside loop, pop!
popMatrix();
}
endShape();
// Increment theta
theta += 0.01;
}

void keyPressed(){
  tecla = !tecla;
}

void mouseClicked(){
  raton = !raton;
}
