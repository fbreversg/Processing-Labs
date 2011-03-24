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
Pelota bola1 = new Pelota(0,250,400);
Pelota bola2 = new Pelota(0,100,100);
Pelota bola3 = new Pelota(0,300,300);
Pelota bola4 = new Pelota(0,350,150);

//setup
void setup() {
  size(ancho,alto);
  smooth();
}

//repintado
void draw() {
  background(255);
  bola1.mover();
  bola1.display();
  bola2.mover();
  bola2.display();
  bola3.mover();
  bola3.display();
  bola4.mover();
  bola4.display();
}

void mouseClicked() {
  bola1.acelerar();
  bola2.acelerar();
  bola3.acelerar();
  bola4.acelerar();
}

