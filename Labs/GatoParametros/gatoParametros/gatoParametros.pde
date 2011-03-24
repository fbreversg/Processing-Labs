//Susana Gascón Morcuende

//Mi mascota: gato 
void setup(){
  size(1000,800);
  smooth();
}

void draw(){
  background(255);
  gatoXParametros(300,400,250,color(0));
  gatoXParametros(600,600,100,color(0));
}

void gatoXParametros(float x, float y, float tamanyo, color relleno){
  fill(0);
  noStroke();
  //cuerpo
  ellipse(x,y,tamanyo,tamanyo*6/5);
  //cabeza
  ellipse(x,y-((tamanyo*12/25)+(tamanyo*3/10)),tamanyo*3/5,tamanyo*3/5); //tamanyo*12/25 = tamanyo*6/5/2*4/5
  //ojos
  fill(255);
  //me baso en la posicion relativa de la y de la cabeza para calcular los ojos
  ellipse(x-(tamanyo/7),y-((tamanyo*12/25)+(tamanyo*6/17)),tamanyo*3/25,tamanyo*3/25); //me baso en la posicion relativa de la y de la cabeza para calcular los ojos
  ellipse(x+(tamanyo/7),y-((tamanyo*12/25)+(tamanyo*6/17)),tamanyo*3/25,tamanyo*3/25);
  fill(0);
  ellipse(x-(tamanyo/7),y-((tamanyo*12/25)+(tamanyo*6/17)),tamanyo*3/50,tamanyo*1/12); 
  ellipse(x+(tamanyo/7),y-((tamanyo*12/25)+(tamanyo*6/17)),tamanyo*3/50,tamanyo*1/12);
  //orejas
  triangle(x-(tamanyo*3/11),y-((tamanyo*12/25)+(tamanyo*7/17)),x-(tamanyo*3/11),y-((tamanyo*12/25)+(tamanyo*7/17)+(tamanyo*6/17)),x-(tamanyo/20),y-((tamanyo*12/25)+(tamanyo*7/17)));
  triangle(x+(tamanyo*3/11),y-((tamanyo*12/25)+(tamanyo*7/17)),x+(tamanyo*3/11),y-((tamanyo*12/25)+(tamanyo*7/17)+(tamanyo*6/17)),x+(tamanyo/20) ,y-((tamanyo*12/25)+(tamanyo*7/17)) );
  //nariz
  fill(255);
  triangle(x-tamanyo/25,y-((tamanyo*12/25)+(tamanyo*3/10)),x+tamanyo/25,y-((tamanyo*12/25)+(tamanyo*3/10)),x,y-((tamanyo*12/25)+(tamanyo*2/10)));
  //bigotes
  stroke(255);
  //derecha
  line(x+tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x+tamanyo/5,y-((tamanyo*12/25)+(tamanyo*6/21)));
  line(x+tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x+tamanyo/5,y-((tamanyo*12/25)+(tamanyo*5/21)));
  line(x+tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x+tamanyo/5,y-((tamanyo*12/25)+(tamanyo*4/21)));
  //izquierda
  line(x-tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x-tamanyo/5,y-((tamanyo*12/25)+(tamanyo*6/21)));
  line(x-tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x-tamanyo/5,y-((tamanyo*12/25)+(tamanyo*5/21)));
  line(x-tamanyo*1/20,y-((tamanyo*12/25)+(tamanyo*5/21)),x-tamanyo/5,y-((tamanyo*12/25)+(tamanyo*4/21)));
  //cola
  fill(0);
  stroke(0);
  ellipse(400,500,50,50);
  ellipse(440,480,50,50);
  ellipse(455,440,45,45);
  ellipse(460,400,40,40);
  ellipse(480,370,40,40);
  ellipse(505,350,35,35);
  ellipse(530,330,35,35);
  ellipse(535,300,30,30);
  ellipse(515,280,30,30);
  ellipse(490,285,25,25);
  ellipse(480,300,25,25);
}

void mouseClicked() {
 println("X,Y:"+mouseX+','+mouseY);
}
