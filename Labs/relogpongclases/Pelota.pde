class Pelota {

  //propiedades
  int colorPelota = 255;
  int x;
  int y;
  int tamanyo;
  int velX = 2;//velocidad constante de desplazamiento en vez de usar el integrator
  int velY = 2;  
  Pala pIzq;
  Pala pDer;

  //Creador de pelot
  Pelota(int posX, int posY, Pala palaIzq, Pala palaDer) {
    x = posX;
    y = posY;
    pIzq = palaIzq;
    pDer = palaDer;
    tamanyo = 24;
  }

  //Metodo que muestra la pelota
  void display() {
    noStroke();
    fill(255); //relleno con blanco
    ellipse(x,y,tamanyo, tamanyo);  //Pinto la pelota en x,y,tamaño de integrators
    fill(0);
    textAlign(CENTER,CENTER);//metemos el texto del secundero del reloj
    textFont(font16, 16);
    text(nf(second(),2), x, y);
  }

  //Metodo que calcula los rebotes en las paredes
  void mover() {
    //Si choca contra la pared lateral
    if ( (x > width+tamanyo/2) || (x < (0 - tamanyo/2)) ) {//si la pelota se va hasta los margenes laterales, empezamos la partida de nuevo
      partidaEmpezada = 0;
    }
    //Si choca contra la pared inferior o superior
    if ( (y > height-5-tamanyo/2) || (y < (tamanyo/2)+25) ) {
      //se cambia la direccion que lleva la bola
      velY = velY * (-1);
    }

    //Si choca contra la pala izquierda
    if ( (x-tamanyo/2 == palaIzq.x+anchoPala) && (y>=palaIzq.y) && (y<=palaIzq.y+altoPala) ) {//palaIzq.x/palaizq.y son una propiedad del objeto, delimitamos cuando tiene que rebotar con las palas
      velX = velX * (-1);
    }

    //Si choca contra la pala derecha
    if ( (x+tamanyo/2 == palaDer.x) && (y>=palaDer.y) && (y<=palaDer.y+altoPala) ) {
      velX = velX * (-1);
    }

    //Actualiza los cambios
    x = x + velX;
    y = y + velY;
  }
}

