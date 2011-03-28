PFont font; //fuente a usar
String tsvNombre = "cervezaPaises.tsv"; //nombre del tsv
StringTable datosTSV; //Donde se carga la informacion del tsv
ArrayList banderas; //ArrayList de clases tipo bandera (ver Bandera)
int tipoVisualizacion = -1; //-1 visualizacion por defecto, una sola cerveza ; 1 visualizacion tras pulsar tecla, todos los paises
int cervezaEscogida = -1; // pais elegido en la visualizacion por defecto
Cerveza cerveza; // Clase de tipo cerveza que se usa para la visualizacion por defecto

void setup(){
 size(1050, 600); 
 smooth(); 
 font = loadFont("BlueHighway-48.vlw"); //Fuente a usar
 datosTSV = new StringTable(tsvNombre); //Se lee el TSV
 println("Numero de lineas leidas del TSV: "+datosTSV.getRowCount());
 banderas = new ArrayList(); //Se crea el arrayList de Banderas que recogera los datos en clases tipo Bandera
 for (int i=0; i<datosTSV.getRowCount();i++){ //Se recogen los valores y se pasan al arraylist de Banderas
   String pais = datosTSV.getString(i,0);  //Pais
   color color1 = unhex (datosTSV.getString(i,1)); //Se recogen los tres colores en formato FF (alfa) R G B 
   color color2 = unhex (datosTSV.getString(i,2)); //unhex - Converts a String representation of a hexadecimal number to its equivalent integer value.
   color color3 = unhex (datosTSV.getString(i,3)); 
   color[] colores = {color1, color2, color3}; //Se añaden a un array color[]
   int alin = int(datosTSV.getString(i,4)); //Tipo de alineacion de la bandera
   float numCer = float(datosTSV.getString(i,5)); //Numero de cervezas 
   banderas.add(new Bandera(pais, colores, alin, numCer)); //Se añade al arrayList
   cerveza = new Cerveza(width/2,250); //Se crea la cerveza del tipo de visualizacion por defecto
 }
}
void draw(){
  background(190); //fondo gris
  if (tipoVisualizacion == -1) { //por defecto
    pintaBanderas(); //pinta una unica cerveza de tamaño variable en funcion del pais escogido
  } else {
    cervezaEscogida = -1; //se resetea el pais escogido
    pintaCervezas();  //pinta todos los paises
  }  
}

void pintaBanderas () { //Pinta una unica cerveza de tamaño variable en funcion del pais escogido
  for (int i=0; i<banderas.size();i++){ //se recorre el arrayList
    Bandera bandera = (Bandera) banderas.get(i); //Se recuperan las banderas
    bandera.displayInd(0.8, 40+i*100, 520); //Se pinta la bandera (tamaño, x, y)
  }
  if (cervezaEscogida!=-1) { //Si se ha escogido alguna bandera
    Bandera bandera = (Bandera)banderas.get(cervezaEscogida); //Se recupera la bandera escogida
    float numCervezas = bandera.getNumeroCervezas(); //Se recupera el numero de cervezas
    float tam = map (numCervezas, 30,160, 1,6); //Se mapea para que su tamaño oscile entre 1.0 y 6
    cerveza.setTamanyo(tam); //Se asigna tamaño a la clase por el setTamaño
    cerveza.display(); //Se pinta la cerveza
    String pais = bandera.getNombrePais(); //Se recupera el nombre del pais de la clase
    if (pais.equals("Espanya")) {pais="España";} //El tsv no parece llevarse bien con las ñs, asi que lo apaño
    fill(0); //negro
    textFont(font, 60); //tamaño de la fuente
    text(pais,width/4, 250); //pinto el pais
    text(numCervezas, width*4/5, 250); //pinto el numero de cervezas
  } else { //no se ha seleccionado ninguna bandera
     fill(0); //negro
     textAlign(CENTER,CENTER); //texto centrado
     textFont(font, 48); //tamaño de letra
     text("Haz click en las banderas o cualquier tecla", width/2, height/2); //pinto banner de instrucciones
  }
}
void mouseClicked(){ //Si se pulsa el raton
 if (tipoVisualizacion == -1){ //¿Estamos en visualizacion de unica cerveza?
   if ((mouseY > 520) && (mouseY <556)) { //¿Posicion Y en la franja de banderas? 
     if ((mouseX > 40) && (mouseX <1010)) { //Posicion x en la franja de banderas?
       cervezaEscogida = round((mouseX-40)/100); //Deja margenes a ambos lados de las banderass
     }
   }  
 }
}

void pintaCervezas(){ //pinta todos los paises
  for (int i=0; i<banderas.size();i++){ //se recorre el arrayList
    Bandera bandera = (Bandera) banderas.get(i); //se recogen las banderas
    bandera.displayInd(0.8, 40, 10+i*60); //Se pintan las banderas
    float cervezas = bandera.getNumeroCervezas(); //se recupera el numero de cervezas
    float cervezasGraf = map (cervezas, 30,160, 1,20); //Maximo 20 cervezas
    for (int j=0; j<cervezasGraf; j++){ // se pintan las cervezas de cada bandera
      Cerveza cer = new Cerveza(170+j*50,28+i*60); //se crea la cerveza
      cer.setTamanyoSinInteg(0.5); //se asigna tamaño
      cer.display(); //se pinta
    }
  }  
}
  
void keyPressed(){ //si se pulsa una tecla, alterna el modo de visualizacion
  tipoVisualizacion = -tipoVisualizacion;
}

