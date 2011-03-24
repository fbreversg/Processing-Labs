//tamaño pantalla
int alto = 500;
int ancho = 800;

//Fuente
PFont miFont;

//Numero de pelotas
int numeroPelotas = 0;

//Pelotas (posX, posY)
Pelota bola = new Pelota(round(random(20,ancho)), round(random(20,alto))); 
Pelota bolaAdi1 = new Pelota(round(random(20,ancho)), round(random(20,alto)));
Pelota bolaAdi2 = new Pelota(round(random(20,ancho)), round(random(20,alto)));

//setup
void setup() {
  
  //tamanyo de la pantalla
  size(ancho,alto);
  
  //se carga la fuente
  miFont = loadFont("ArialMT-48.vlw");
  
  //frecuencia de refresco
  frameRate(30);
  smooth();
}

//repintado
void draw() {
  background(255);
  
  //Si no hay pelotas
  if (numeroPelotas == 0) {
    fill(0); //para que se pinte negro
    textFont(miFont, 14); //tipo de fuente
    textAlign(CENTER,BASELINE); //alineamiento
    text("Pulsa el ratón para empezar", width/2 ,height-20); //texto
  } 
  //Si hay una pelota
  if (numeroPelotas == 1) {
    fill(0);
    textFont(miFont, 14);
    textAlign(CENTER,BASELINE);
    text("Pulsa el ratón para sacar mas pelotas o barra espaciadora para cambiar su tamaño.", width/2 ,height-20);
    bola.mover(); //decimos a la pelota que se mueva
    bola.display(); //la repintamos
  }
  //Si hay dos pelotas
  if (numeroPelotas == 2) {
    fill(0);
    textFont(miFont, 14);
    textAlign(CENTER,BASELINE);
    text("Pulsa el ratón para sacar mas pelotas o barra espaciadora para cambiar su tamaño de la principal.", width/2 ,height-20);
    bola.mover();
    bola.display();
    bolaAdi1.mover(); //hay que refrescar dos pelotas
    bolaAdi1.display();
  }
  //Si hay tres pelotas
  if (numeroPelotas == 3) {
    fill(0);
    textFont(miFont, 14);
    textAlign(CENTER,BASELINE);
    text("Pulsa barra espaciadora para cambiar el tamaño de la pelota principal o 'q' si quieres volver a empezar.", width/2 ,height-20);
    bola.mover();
    bola.display();
    bolaAdi1.mover();
    bolaAdi2.mover();
    bolaAdi1.display(); //hay que refrescar tres pelotas
    bolaAdi2.display();
  }
 
  escalaHorizontal(); //pinta la escala horizontal que marca el tinte-Hue
  escalaVertical(bola.velocidadX.value); //pinta la escala vertical que marca la saturacion y usa el tinte de la pelota principal 
}

//Pinta una escala horizontal de 36 cuadrados en progresion del Hue-tinte
void escalaHorizontal(){
  colorMode(HSB,360,100,100); //cambio de modo de color
  for(float n = 0; n< width; n+=(width/36)){ //divide la pantalla en 36 cuadros
    fill(map(n,0,width,0,360),100,100); //rellena con el correspondiente tinte
    rect(n,0,width/36,5); //pinta el cuadrado
  }
  // vuelve a RGB
  colorMode(RGB,255,255,255);
}

//Pinta una escala vertical de 20 cuadrados en progresion de la saturacion y coge el tinte de la pelota principal
void escalaVertical(float colorPelota){
  colorMode(HSB,360,100,100); //cambio de modo de color
  for(float n = 5; n< height; n+=(height/20)){ //divide la pantalla en 20 cuadrados
    fill(map(colorPelota,0,width,0,360),map(n,0,height,100,0),100); //rellena con la correspondiente saturacion y el tinte de la pelota principal pasada como parametro
    rect(0,n,10,height/20); //pinta el cuadrado
  }
  // vuelve a RGB
  colorMode(RGB,255,255,255);
}

//Si se pulsa espacio, se varia el tamaño de la pelota principal
//Si se pulsa q se resetea
void keyPressed(){ 
  if(key == ' '){ //si pulsa espacio
    float nuevoH = random(5,200); //tamaño aleatorio entre 5 y 200
    bola.tamanyo.target(nuevoH); //se asigna al target
    bola.tamanyo.update(); //se actualiza
  }
  if(key == 'q'){ //si pulsa q
     numeroPelotas=0; //se pone a 0 el contador de pelotas
  }
}

//Si se pulsa el raton se añade una pelota mas (hasta tres)
void mousePressed(){
  if (numeroPelotas<3) { //Si son menos de tres
    numeroPelotas++; //Se incrementa
  }
}

//Clase pelota
class Pelota {

  //propiedades
  color c;
  Integrator velocidadX;
  Integrator velocidadY;
  Integrator tamanyo;
  
  //Creador de pelotas
  Pelota(int posX, int posY){
    //Integrator para la velocidad X
    velocidadX = new Integrator(posX,0.1,0.1); // 0.1 son los parametros de damping y attraction, para que vaya mas despacio
    velocidadX.target(800); //Al principio su objetivo es ir a la derecha
    //Integrator para la velocidad Y
    velocidadY = new Integrator(posY,0.1,0.1);
    velocidadY.target(0); //Al principio su objetivo es ir hacia arriba
    //Integrator para el tamanyo
    tamanyo = new Integrator(30);
  }
  
  //Metodo que muestra las pelotas
  void display(){
    stroke(0);
    float miHHorizontal = map(velocidadX.value,0,width,0,360); //Se calcula el tinte en funcion de la X
    float miBVertical =  map(velocidadY.value,0,height,100,0); //Se calcula el brillo en funcion de la Y
    colorMode(HSB,360,100,100);  //Cambio a HSB
    c = color(miHHorizontal,miBVertical,100); //Se asigna el color
    colorMode(RGB,255,255,255); //Vuelvo a RGB
    fill(c); //relleno con el color relativo
    ellipse(velocidadX.value,velocidadY.value,tamanyo.value,tamanyo.value);  //Pinto la pelota en x,y,tamanyo de integrators
  }
  
  //Metodo que calcula los rebotes en las paredes
  void mover(){
   //Si choca contra la pared lateral
   if (velocidadX.value > ancho-tamanyo.value/2){
     //se cambia el target al sentido contrario
     velocidadX.target(0);
    } else if (velocidadX.value < (tamanyo.value/2)+10){
      //se cambia el target al sentido contrario
       velocidadX.target(800); 
    }
    //Si choca contra la pared inferior o superior
    if (velocidadY.value > alto-tamanyo.value/2){
      //se cambia el target
      velocidadY.target(0);
    } else if (velocidadY.value < (tamanyo.value/2)+5){
      //se cambia el target
        velocidadY.target(500); 
    }
    
    //Actualiza los cambios
    velocidadX.update();
    velocidadY.update();
  }
}
