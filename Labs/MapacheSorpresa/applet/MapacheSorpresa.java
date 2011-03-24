import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class MapacheSorpresa extends PApplet {

String rutaJuanjo = "jjgarciam.JPG";
String rutaMapache = "mapache.jpg";

PImage imgJuanjo;
PImage imgMapache;

public void setup(){
  size(320,256);
  imgMapache = loadImage(rutaMapache);
  imgJuanjo = loadImage(rutaJuanjo);
  background(imgMapache);
}

public void draw() {
  loadPixels();
  
  for (int x = 0; x < imgJuanjo.width; x++ ) {
    for (int y = 0; y < imgJuanjo.height; y++ ) {
       //Se calcula la posicion
      int loc = x + y*imgJuanjo.width;
      // Se recuperan los colores
      float r = red   (imgJuanjo.pixels[loc]);
      float g = green (imgJuanjo.pixels[loc]);
      float b = blue  (imgJuanjo.pixels[loc]);
      //se calcula la distancia con respecto al raton
      float distancia = dist(x,y,mouseX,mouseY);
      //se ajusta el canal alpha
      float ajusteAlpha = (50-distancia)/50;
      //se aplica 
      float canalAlpha = 255*ajusteAlpha;
      //se restringe al maximo valor
      canalAlpha = constrain(canalAlpha,0,255);
      //se crea el color
      int c = color(r,g,b,canalAlpha);
      //se aplica    
      pixels[loc] = c;
    }
  }
  
  updatePixels();  
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "MapacheSorpresa" });
  }
}
