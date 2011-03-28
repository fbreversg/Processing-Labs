int c = 0;
int tam= 900;
boolean baja = false;
int var = 20;

void setup() {
  size(600,600);
}

void draw() {
  ellipseMode(CENTER);
    if ((tam > 0) && (tam < 900)) {
      fill(random(0,255),random(0,255),random(0,255), c);
      ellipse(width/2, height/2, tam, tam);
      tam = tam+var; 
    } else {
      var = var* (-1); 
      tam = tam+var; 
    }
    if (c > 25) {
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
