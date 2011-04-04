int c = 0;
int tam = 900;
boolean baja = false;

void setup() {
  size(600,600);
  smooth();
}

void draw() {
   if (tam > 2){
     drawEllipse(tam);
     tam *= 0.75;
   } else {
     tam=900; 
   }
}

//recursive function
void drawEllipse(int tamanyo){
   ellipseMode(CENTER);
   fill(c,random(0,255),random(0,255));
   ellipse(width/2, height/2, tamanyo, tamanyo);
}
