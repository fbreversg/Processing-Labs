class Pala {

  int x;
  int y;
  int tipoPala;

  Pala (int posX, int posY, int tipo) {
    x = posX;
    y = posY;
    tipoPala = tipo;//tipoPala0 para la izquierda y tipoPala1 para la derecha
  } 

  void mover() {
    if ( (mouseX < width/2) && (tipoPala == 0) ) {//si el raton esta a la izquierda
      y = round(map(mouseY, 0, height, 30, height-10-altoPala));//y el round es porque me devuelve un float, controlar el desplazamiento maximo
    }
    if ( (mouseX > width/2) && (tipoPala == 1) ) {
      y = round(map(mouseY, 0, height, 30, height-10-altoPala));
    }
  }

  void display() {
    mover();
    fill(255);
    rect(x,y, anchoPala, altoPala);
  }
}

