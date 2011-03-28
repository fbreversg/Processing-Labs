//Susana Gascón Morcuende
//Reloj-calendario con el juego del pong integrado
//Clases por separado

//He creado tres tamaños de fuentes porque, al cambiar el tamaño sobre la misma perdia calidad
PFont font;
PFont font80;
PFont font16;
//He creado 2 clases, las palas y la pelota 
Pelota bola;
Pala palaIzq;
Pala palaDer;
int anchoPala = 15;
int altoPala = 80;
int partidaEmpezada = 0;


void setup() {
  size(800,500);
  font = loadFont("DigitalReadout-24.vlw");
  font80 = loadFont("DigitalReadout-80.vlw");
  font16 = loadFont("DigitalReadout-16.vlw");
  palaIzq = new Pala(5, height/2-altoPala/2, 0);
  palaDer = new Pala(width-anchoPala-5, height/2-altoPala/2, 1);
  bola = new Pelota(400, 250, palaIzq, palaDer);
  smooth();
}


void draw() {
  background(0);
  fill(0);
  noStroke();
  pintarTablero();
  palaIzq.display();
  palaDer.display();
  if (partidaEmpezada == 1) {
    bola.mover();
    bola.display();
  }
}

void mouseClicked() {
  if (partidaEmpezada == 0) {
    partidaEmpezada = 1;
    bola.x = 400;
    bola.y = 250;
  }
}

void pintarTablero() {
  stroke(255);
  strokeWeight(4);
  line(0,25,width,25);
  line(0,height-5,width,height-5);
  noStroke();
  fill(255);
  for (float y=25; y<495; y=y+10) {
    rect(400, y, 5, 5) ;
  }
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(font, 24);
  text(fecha(), width/2, 10);
  if (partidaEmpezada == 0) {
    text("Haz click para empezar a jugar", width/2, height-50);
  }
  textFont(font80, 80);
  text(hora(), width/2, 100);
}

String fecha () {
  String[] meses = {
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
  };
  int dia = day();
  int mesInt = month();
  int anyo = year();
  String mesStr = meses[mesInt-1];//los meses los devuelve del 1 al 12 pero los arrays se ordenan de 0 a n-1
  return (dia + " / " + mesStr + " / " + anyo);
}

String hora () {
  int hora = hour();
  int minuto = minute();
  return (hora + " " + minuto);
}  
