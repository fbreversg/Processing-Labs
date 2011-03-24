class Pelota {

  //posicion
  int x;
  int y;
  //velocidad
  int velocidadX;
  int velocidadY;
  //propiedades
  int tamX;
  int tamY;
  color c;
  
  //constructor
  Pelota(int velocidad, int posX, int posY){
    c = color(random(255),random(255),random(255));
    x = posX;
    y = posY;
    velocidadX = velocidad;
    velocidadY = velocidad;
    tamX = 32;
    tamY = 32;
  }
  
  //display
  void display(){
    stroke(0);
    fill(c);
    ellipse(x,y,32,32);
  }
  
  void mover(){
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
  }
  
  void acelerar(){
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
}
//tamaño pantalla
int alto = 500;
int ancho = 800;
Pelota bola = new Pelota(0,250,400);

//setup
void setup() {
  size(ancho,alto);
  smooth();
}

//repintado
void draw() {
  background(255);
  bola.mover();
  bola.display();
}

void mouseClicked() {
  bola.acelerar();

}

