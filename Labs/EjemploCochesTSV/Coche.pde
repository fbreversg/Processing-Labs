class Coche { //Nombre de la clase, siempre el mismo que el fichero

  String matricula;
  String modelo;
  color colorCoche;
  int tamanyo;
  int velocidad;
  int posX;
  int posY;

  Coche(String matr, String mod, color col, int tam){ //Constructor del coche, solo acepta matricula, modelo, color y tamaño, el resto se genera dentro
    matricula = matr;
    modelo = mod;
    colorCoche = col;
    tamanyo = tam;
    
    velocidad = 0;
    posX = round(random(200,800)); //posicion inicial aleatoria
    posY = round(random(100,700)); //posicion inicial aleatoria
  }
  
  void setMatricula(String matr){ //permite cambiar la matricula del coche
    matricula = matr; 
  }
  
  String getMatricula(){ //devuelve la matricula del coche
    return(matricula); 
  }
  
  void setmodelo(String mod){ //permite cambiar el modelo del coche
    modelo=mod;
  }  
  
  String getModelo(){ //devuelve el modelo del coche
    return(modelo); 
  }
  
  int getVelocidad(){
    return(velocidad);
  }
  
  void acelerar(){ //incrementa la velocidad
    velocidad = velocidad+round(random(1,2));  
  }
  
  void frenar(){ //decrementa la velocidad
     velocidad = velocidad-round(random(1,2)); 
  }
  
  void display(){ //muestra el coche
    posX = posX + velocidad; //aumentamos la posicion en funcion de la velocidad
    posY = posY + velocidad; //aumentamos la posicion en funcion de la velocidad
    fill(colorCoche); //rellenamos con el color del coche
    rect(posX, posY, tamanyo, tamanyo/2); //pintamos el "coche"
  }
}


