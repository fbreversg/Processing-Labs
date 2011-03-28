// radio del termometro cirular
float radio = 180;
// temperatura en grados Celsius
float tMin = -50;
float tMax = 50;
// extremos de la escala
float marcasFin = 60;
float marcasIni = 60 - 300;
// tipografia
PFont font;
void setup(){
size(500,500);
background(250);
smooth();
font = loadFont("ArialMT-24.vlw");
}
void draw(){
  background(250);
  termometroBase();
  dibujaLasMarcas();
  aguja(21);
  escalaDeColor();
}

void escalaDeColor(){
  color cMin = #0000FF; // azul
  color cMax = #FF0000; // rojo
  float radioC = (radio*2)+30;
  strokeWeight(10);
  noFill();
  
  // cada grado Celsius
  for(float t = tMin; t<=tMax; t++){
  float puntoIntermedio = norm(t, tMin, tMax);
  color colorIntermedio = lerpColor(cMin, cMax, puntoIntermedio);
  float angulo = gradosToAngulo(t);
  float angulo2 = gradosToAngulo(t+1);
  stroke(colorIntermedio);
  
  // arco
  arc(width/2, height/2, radioC, radioC, radians(angulo), radians(
  angulo2));
  }
}

void aguja(float gradosC){
  stroke(0);
  strokeWeight(2);
  stroke(#CC0000);
  beginShape();
  // la punta
  float angulo = gradosToAngulo(gradosC);
  float rad = radians(angulo);
  float x1 = width/2 + cos(rad)*(radio-20);
  float y1 = height/2 + sin(rad)*(radio-20);
  vertex(x1, y1);
  
  // un extremo
  // en el angulo opuesto - 30;
  angulo += (180-30);
  rad = radians(angulo);
  float x2 = width/2 + cos(rad)*40;
  float y2 = height/2 + sin(rad)*40;
  vertex(x2, y2);
  
  // segundo extremo
  // 30 + 30 grados más allá
  angulo += 60;
  rad = radians(angulo);
  float x3 = width/2 + cos(rad)*40;
  float y3 = height/2 + sin(rad)*40;
  vertex(x3, y3);
  endShape(CLOSE);
  
  // un "tornillo" en el centro
  fill(255);
  ellipse(width/2,height/2,5,5);
}

void dibujaLasMarcas(){
  int intervalo = 1;
  stroke(0);
  strokeWeight(3);
  // grados Celsius
  for(float t = tMin; t<=tMax; t+=intervalo){
    // calcula la rotación corespondiente a la temperatura "t"
    float angulo = gradosToAngulo(t);
    // angulo expredado en "radianes" 180º = 3,14
    float rad = radians(angulo);
    float x1 = width/2 + cos(rad)*radio;
    float y1 = height/2 + sin(rad)*radio;
    float x2 = width/2 + cos(rad)*(radio-5);
    float y2 = height/2 + sin(rad)*(radio-5);
    line(x1,y1,x2,y2);
  }
}

void termometroBase(){
// un circolo en el medio
fill(255);
noStroke();
ellipse(width/2,height/2,radio*2,radio*2);
}
float gradosToAngulo(float gradosC){
float angulo = map(gradosC,tMin,tMax,marcasIni,marcasFin);
return(angulo);
}
