void setup (){
size(600,600);
smooth();
}

int desp = 0;

void draw(){
background(255);
elementosEnCuadrado(324);
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
    fill (rojo,0,0,transparencia);
    ellipse ((columna*ancho)+ancho/2, (fila*ancho)+ancho/2 , ancho*0.9, ancho*0.9);
    println (n);
  }
  desp++;
  println (desp);
}
