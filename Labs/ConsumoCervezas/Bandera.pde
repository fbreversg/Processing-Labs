class Bandera { //Banderas, se corresponde con cada fila del tsv
  
  String banPais; //nombre
  color[] banColores; //array con los tres colores de la bandera
  int banAlin; //tipo de alineacion de los colores, 0 horizontal, 1 vertical
  float banNumCer; //numero de cervezas
  int despXh = 90;
  int despYh = 15;
  int despXv = 30;
  int despYv = 45;
  
  
  Bandera (String pais, color[] colores, int alin, float numCer) { //creador de banderas
   banPais = pais; 
   banColores = colores;
   banAlin = alin;
   banNumCer = numCer;
  }
  
  float getNumeroCervezas (){ //Devuelve el numero de cervezas asociado al pais
    return(banNumCer); 
  }
  
  String getNombrePais (){ //Devuelve el nombre del pais
    return(banPais);
  }
  
  void displayInd (float banTam, int banX, int banY){ //Pinta la bandera
    for (int i=0; i<banColores.length; i++){ //recorre el array de colores
      fill(banColores[i]); //asigna el color
      if (banAlin ==0) { //¿es horizontal o vertical?
        //horizontal
        rect(banX,banY+i*despYh*banTam, despXh*banTam,despYh*banTam);
      } else {
        //vertical
        rect(banX+i*despXv*banTam,banY, despXv*banTam,despYv*banTam);
      }
    }   
  }
}
