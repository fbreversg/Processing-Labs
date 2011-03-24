int ancho=600;
int alto=600;

//setup
void setup() {
  size(ancho,alto);
  smooth();
}

//repintado
void draw() {
  background(255);
  fill(0);
  //Descomenta la figura que quieras utilizar y asignale tamaño
  point(mouseX,mouseY);
  //ellipse(mouseX,mouseY,100,100);
  //rect(mouseX,mouseY,100,100);
  //triangle(mouseX, mouseY, 58, 20, 86, 75);
  
}

void mouseClicked() {
 println("X,Y:"+mouseX+','+mouseY);
}

