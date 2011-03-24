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

public class FigurasEnCuadradosDiscoFeverDegradadoPorClick extends PApplet {

public void setup (){
size(600,600);
frameRate(10);
smooth();
}

int desp = 0;
int cambioColor = 1;
int cambioForma = 0;

public void draw(){
background(255);
elementosEnCuadrado(150);
}

public void elementosEnCuadrado(int cuantos){
  float lado =sqrt(cuantos);
  int ladoN =ceil(lado);
  float ancho =width/ladoN;
  
  
  for (int n=0; n<cuantos; n++){
    int fila =ceil(n/ladoN);
    int columna =ceil(n-(fila*ladoN));
    float transparencia =map(n+desp,0,cuantos,255,64);
    float rojo =map(fila,0,ladoN,255,128);
    
    if (cambioColor == 1) {
      fill (rojo*PApplet.parseInt(random(2)),rojo*PApplet.parseInt(random(2)),rojo*PApplet.parseInt(random(2)));//,transparencia);
    } else {
      fill (rojo*PApplet.parseInt(random(2)),rojo*PApplet.parseInt(random(2)),rojo*PApplet.parseInt(random(2)),transparencia);
    }
    
    if (cambioForma == 0) {
      ellipse ((columna*ancho)+ancho/2, (fila*ancho)+ancho/2 , ancho*0.9f, ancho*0.9f);
    } 
    if (cambioForma == 1){
      rect ((columna*ancho)+ancho/4, (fila*ancho)+ancho/4 , ancho*0.9f, ancho*0.9f);
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

public void mouseClicked() {
  cambioColor = cambioColor * (-1);
  desp = 0;
}

public void keyPressed() {
  if (cambioForma <2) {
    cambioForma++; 
  } else {
    cambioForma = 0;
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ECE9D8", "FigurasEnCuadradosDiscoFeverDegradadoPorClick" });
  }
}
