void setup (){
size(600,600);
frameRate(10);
smooth();
}

int desp = 0;
int cambioColor = 1;
int cambioForma = 0;

void draw(){
background(255);
elementosEnCuadrado(150);
}

void elementosEnCuadrado(int cuantos){
  float lado =sqrt(cuantos);
  int ladoN =ceil(lado);
  float ancho =width/ladoN;
  
  
  for (int n=0; n<cuantos; n++){
    int fila =ceil(n/ladoN);
    int columna =ceil(n-(fila*ladoN));
    float transparencia =map(n+desp,0,cuantos,255,64);
    float rojo =map(fila,0,ladoN,255,128);
    
    if (cambioColor == 1) {
      fill (rojo*int(random(2)),rojo*int(random(2)),rojo*int(random(2)));//,transparencia);
    } else {
      fill (rojo*int(random(2)),rojo*int(random(2)),rojo*int(random(2)),transparencia);
    }
    
    if (cambioForma == 0) {
      ellipse ((columna*ancho)+ancho/2, (fila*ancho)+ancho/2 , ancho*0.9, ancho*0.9);
    } 
    if (cambioForma == 1){
      rect ((columna*ancho)+ancho/4, (fila*ancho)+ancho/4 , ancho*0.9, ancho*0.9);
    }
    if (cambioForma == 2) {
      triangle((columna*ancho)+ancho/2,(fila*ancho), (columna*ancho), (columna*ancho)+ancho, (columna*ancho)+ancho, (columna*ancho)+ancho);
    }
    println (n);
  }
  if (cambioColor == -1) {
    desp++;
    println (desp);
  }
}

void mouseClicked() {
  cambioColor = cambioColor * (-1);
  desp = 0;
}

void keyPressed() {
  if (cambioForma <2) {
    cambioForma++; 
  } else {
    cambioForma = 0;
  }
}
