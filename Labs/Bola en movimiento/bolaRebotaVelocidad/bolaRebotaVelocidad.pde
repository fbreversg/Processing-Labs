//tamaño
int alto = 500;
int ancho = 800;

//coordenadas iniciales
int x = ancho/2;
int y = alto/2;

//velocidades iniciales
int velocidadX = 1;
int velocidadY = 1;

//setup
void setup() {
  size(ancho,alto);
  smooth();
}

//repintado
void draw() {
  background(255);
  x = x + velocidadX;
  y = y + velocidadY;
  
  if ((x > ancho-32) || (x < 32)) {
    //Si el objeto choca cambiar el sentido
    velocidadX = velocidadX *-1;
  }
  
  if ((y > alto-32) || (y < 32)) {
    //Si el objeto choca cambiar el sentido
    velocidadY = velocidadY * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(x,y,32,32);
}

void mouseClicked() {
  if (velocidadX<0) {
    velocidadX--;
  } else {
    velocidadX++;
  }
  if (velocidadY<0) {
    velocidadY--;
  } else {
    velocidadY++;
  }

}

