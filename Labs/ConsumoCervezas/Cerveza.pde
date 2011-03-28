class Cerveza { //Clase que se encarga de pintar las cervezas
 
 int cerX; //x
 int cerY; //y
 float cerTam; //tamaño relativo
 int tamVasoX = 50;
 int tamVasoY = 80;
 Integrator cerTamInt = new Integrator(300);
 
 Cerveza (int x, int y){ //Creador de cervezas, no se le pasa tamaño, se le asigna a parte.
  cerX = x;
  cerY = y;
 }
 
 void setTamanyo(float tam){ //Asignador de tamaño
   cerTamInt.target(tam);
   cerTamInt.update();
   cerTam = cerTamInt.value;
 }
 
 void setTamanyoSinInteg(float tam){
   cerTam = tam;
 }
 
 void display(){ //pinta la cerveza
  rectMode(CENTER); //centrado
  fill(#FFFFFF); //blanco
  rect (cerX,cerY, tamVasoX*cerTam,tamVasoY*cerTam); //vaso
  rect (cerX+tamVasoX*2/3*cerTam, cerY+tamVasoY/16*cerTam, tamVasoX/3*cerTam, tamVasoY/2*cerTam); //asa exterior
  rect (cerX-tamVasoX/100*cerTam, cerY-tamVasoY*2/5*cerTam, tamVasoX*cerTam-tamVasoX/25*2*cerTam , tamVasoY/6*cerTam ); //espuma interior
  fill(190); //igual que el fondo
  rect (cerX+tamVasoX*2/3*cerTam,cerY+tamVasoY/16*cerTam, tamVasoX/3*cerTam-tamVasoX/12.5*cerTam, tamVasoY/2*cerTam-tamVasoY/20*cerTam); //asa interior
  fill(204, 102, 0); //naranja
  rect (cerX-tamVasoX/100*cerTam, cerY+tamVasoY*1/15*cerTam, tamVasoX*cerTam-tamVasoX/25*2*cerTam, tamVasoY*cerTam- tamVasoY*7/40*cerTam); //cerveza
  rectMode(CORNER); //lo vuevo a dejar por defecto
 } 
}
