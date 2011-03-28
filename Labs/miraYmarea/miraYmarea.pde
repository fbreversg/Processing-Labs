int c = 0;
int tam = 900;
boolean baja = false;

void setup() {
  size(600,600);
}

void draw() {
  ellipseMode(CENTER);
    if (tam > 0){
      fill(c,random(0,255),random(0,255));
      ellipse(width/2, height/2, tam, tam);
      tam = tam-20; 
    } else {
      tam = 900; 
    }
    if (c > 255) {
      baja = true;
    } if (c < 0) {
      baja = false; 
    }
    
    if (baja) {
      c--; 
    } else {
      c++;  
    }
}
