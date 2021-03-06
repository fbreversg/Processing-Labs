//Fuente a usar.
PFont font;
//Margenes y distancias para pintar la matriz, para maquetar
int margen = 50;
int longV = 50;
int margenV = margen+longV;
int longH = 35; 
int margenH = margen+longH;
//Indicador para saber que boton se ha pulsado -1 (sin seleccion) 0 1 2
int pulsado = -1;
//Arrays de valores para cada ciudad (temperatura, humedad, viento)
int[] madrid;
int[] londres;
int[] paris;

void setup(){
  size(500,600); 
  font = loadFont("Monospaced.bold-20.vlw");
  smooth();
  //Se recogen los datos asociados a cada ciudad en un array de enteros
  madrid = recogerDatos(); 
  londres = recogerDatos();
  paris = recogerDatos();
}

void draw(){
  //Fondo negro
  background(255);
  //Se pinta la botonera con las ciudades y sus valores
  pintarBotonera(madrid, londres, paris, pulsado);
  //Si no se ha pulsado un boton, hay que decirselo al usuario
  if (pulsado == -1){
    textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Haz click en alguna de las ciudades", 250,200);
  } else {
      //Se ha pulsado un boton, se pinta la matriz
      pintaMatriz();
  }
  //Dependiendo del boton pulsado, pinta en la matriz los valores de la ciudad oportuna
  if (pulsado == 0){
    pintarTemperaturaHumedad(madrid[0], madrid[1]);
    pintarViento(madrid[2]);
  }
  if (pulsado == 1){
    pintarTemperaturaHumedad(londres[0], londres[1]);
    pintarViento(londres[2]);
  }
  if (pulsado == 2){
    pintarTemperaturaHumedad(paris[0], paris[1]);
    pintarViento(paris[2]);
  }
}

//Devuelve en un array: temperatura, humedad y viento
int[] recogerDatos (){
  //Se inicializa el array con valores por defecto
  int[] datos = {0,0,0};
  datos[0] = floor(random(49));
  datos[1] = floor(random(99));
  datos[2] = floor(random(99));
  //la funcion devuelve el array
  return(datos);
}

//pinta la matriz
void pintaMatriz(){
  stroke(0);
  strokeWeight(2);
  textAlign(CENTER,CENTER);
  textFont(font, 20);
  int tempInicial = -10;
  int humedadVientoInicial = 90;
  //verticales
  for (int v=0; v<6; v++) {
    line((v*longV)+margenV, margen, (v*longV)+margenV, margen+(longH*10));
    fill(#F69679);
    text(tempInicial,(v*longV)+margenV, margen-10);
    tempInicial = tempInicial+10;
  }
  //horizontales
  for (int h=0; h<9; h++) {
     line(margen, (h*longH)+margenH, margen+(longV*7), (h*longH)+margenH); 
     fill(#8781BD);
     text(humedadVientoInicial+"%", margen-20,(h*longH)+margenH);
     fill(#00A99D);
     text(humedadVientoInicial+"km/h", margen*2+(longV*7), (h*longH)+margenH);
     humedadVientoInicial = humedadVientoInicial-10;
   }
}

//Pinta los valores asociados a la temperatura y la humedad en barras
void pintarTemperaturaHumedad(int temp, int hum){ 
  
  noStroke();
  int tempNorm;
  //¿Temperatura negativa?
  if (temp<0) {
    //Se normaliza. No utilizo map por los redondeos
    tempNorm = 1-floor(abs(temp)/10);
  } else {
    //Se normaliza. No utilizo map por los redondeos
    tempNorm = 2+ floor(temp/10); 
  }
  fill(#F69679,70);
  rect(margen+tempNorm*longV, margen, longV, longH*10 );
  //Humedad. No utilizo map por los rendondeos.
  fill(#8781BD,70);
  int humNorm = 9-ceil(hum/10);
  rect(margen, margen+humNorm*longH, longV*7, longH);
}

//Pinta el valor del viento
void pintarViento(int vie){
  fill(#00A99D,70);
  noStroke();
  //No utilizo map por los redondeos.
  int vieNorm = 9-ceil(vie/10);
  //El vertice vertical establece el valor
  triangle(margen, margen+(longH*10), margen+(longV*7)/2, margen+vieNorm*longH, margen+(longV*7), margen+(longH*10));
}

//Pinto los botones y los valores asociados a cada ciudad
void pintarBotonera (int[] madrid, int[] londres, int[] paris, int pulsado) {
  stroke(0);
  //Pulsado marca la ciudad seleccionada y asigno diferente color
  if (pulsado == 0){
    fill(100);
    rect (margen, 425, 100, 40);
  } else {
    fill(0);
    rect (margen, 425, 100, 40);
  }
  if (pulsado == 1) {
    fill(100); 
    rect (margen, 485, 100, 40);
  } else {
    fill(0); 
    rect (margen, 485, 100, 40);
  }
  if (pulsado == 2) {
    fill(100);
    rect (margen, 545, 100, 40);
  } else {
    fill(0);
    rect (margen, 545, 100, 40);
  }
  textAlign(CENTER,CENTER);
  textFont(font, 20);
  fill(255);
  //Texto de los botones
  text("Madrid", margen+50, 425+20 );
  text("Londres", margen+50, 485+20 );
  text("Paris", margen+50, 545+20 );
  fill(0);
  textAlign(LEFT,CENTER);
  //Valores asociados a cada ciudad
  text( madrid[0] + "ºC  " + madrid[1] + "%  "+ madrid[2]  +"KM/H", margen+120, 425+20 ); 
  text( londres[0] + "ºC  " + londres[1] + "%  "+ londres[2]  +"KM/H", margen+120, 485+20 ); 
  text( paris[0] + "ºC  " + paris[1] + "%  "+ paris[2]  +"KM/H", margen+120, 545+20 ); 
}

//Se detecta si se ha pulsado sobre alguno de los botones
void mouseClicked(){
  if ( (mouseX >= margen) && (mouseX <= (margen+100)) ) {
    if ((mouseY >= 425) && (mouseY <= 465) ){
      pulsado = 0;    
    }
    if ((mouseY >= 485) && (mouseY <= 525) ){
      pulsado = 1;    
    }
    if ((mouseY >= 545) && (mouseY <= 585) ){
      pulsado = 2;    
    }
  }
}
