void setup() {
  size(800,800);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
  //aceleracion del raton
  strokeWeight(abs(abs( mouseX - pmouseX )));
  line(pmouseX ,pmouseY ,mouseX ,mouseY );
}
