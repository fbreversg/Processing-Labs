String tsv = "coches.tsv"; //nombre del tsv
StringTable datosTSV; //Donde se carga la informacion del tsv
ArrayList coches; //ArrayList de clases Coche (ver Coche)

void setup(){ //setup
  
   size(1000, 800); 
   smooth(); 
   datosTSV = new StringTable(tsv); //Se lee el TSV
   coches = new ArrayList(); //Se crea el arrayList de coches que
   for (int i=0; i<datosTSV.getRowCount();i++){ //Se pasan los valores al arrayList de coches
     String matricula = datosTSV.getString(i,0);  //matricula
     String modelo = datosTSV.getString(i,1); //modelo
     String colorCocheTSV = datosTSV.getString(i,2); //color
     color colorCoche; //Donde guardaremos el color en formato processing RFGB
     if (colorCocheTSV.equals("ROJO")) { //Si es ROJO
        colorCoche = #FF0000; //ponemos rojo
     } else { //si no es ROJO
        colorCoche = #0000FF;  //ponemos azul 
     }
     int tamanyo = int(datosTSV.getString(i,3)); //tamanyo
     Coche coche = new Coche(matricula, modelo, colorCoche, tamanyo); //Creamos un coche
     coches.add(coche); //se añade el coche a la lista
   }
}

void draw() {
   background(0); //fondo
   for (int i=0; i<coches.size();i++){ //recorremos la lista de coches
     Coche coche = (Coche)coches.get(i); //recuperamos cada uno de ellos teniendo en cuenta de que el arrayList no sabe que contiene, hay que usar (Coche) para decirselo
     println("Modelo: "+coche.getModelo()); //Escribimos el modelo del coche
     println("Matricula: "+coche.getMatricula()); //Escribimos la matricula del coche
     coche.display(); //lo pintamos
   }
}

void keyPressed(){  //Si se pulsa una tecla
  for (int i=0; i<coches.size();i++){ //recorremos la lista de coches
     Coche coche = (Coche)coches.get(i); //recuperamos cada uno de ellos teniendo en cuenta de que el arrayList no sabe que contiene, hay que usar (Coche) para decirselo
     coche.acelerar(); //aceleramos cada uno de ellos
     println("Mi nueva velocidad es: "+coche.getVelocidad()); //pintamos la velocidad de cada uno
   }
  
}

void mouseClicked(){   //Si se clicka
  for (int i=0; i<coches.size();i++){ //recorremos la lista de coches
     Coche coche = (Coche)coches.get(i); //recuperamos cada uno de ellos teniendo en cuenta de que el arrayList no sabe que contiene, hay que usar (Coche) para decirselo
     coche.frenar(); //lo pintamos
     println("Mi nueva velocidad es: "+coche.getVelocidad()); //pintamos la velocidad de cada uno
   }
}
