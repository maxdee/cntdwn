int strt = 0;

float posX = 0.5;
float posY = 0;
float fluct = 0;

color rb = color(47, 0, 170);
color md = color(54, 143, 255);

ParticleSystem psRB;
ParticleSystem psMD;
PVector origin = new PVector(0, 0);

void setup(){
  size(800,400,P3D);

  println(strt);
  startPS();
}


void draw(){
  background(0);
  translate(width/2,height/2);
  noStroke();
  
 
  fluct+=0.01;
  
  posY = sin(fluct);
  posX = cos(fluct)/2+0.5;
  
  fill(rb);
  ellipse(posX*(width/2),posY*(height/2),30,30);
  fill(md);
  ellipse(posX*(-width/2),posY*(height/2),30,30);
  
  drawPS(posX,posY);  
}

int getSec(int d, int h, int m, int s){
  return(((d*24+h)*60+m)*60+s);
}

void startPS(){
  PVector strtRB = new PVector(strt, 0);
  PVector strtMD = new PVector(-strt, 0);
  psRB = new ParticleSystem(origin, height/6);
  psMD = new ParticleSystem(origin, height/6);
}

void drawPS(float posX, float posY){
  
  pushMatrix();
  translate(posX*(width/2),0);
  psRB.update(origin, posX, posY);
  psRB.display();
  popMatrix();
  
  pushMatrix();
  translate(posX*(-width/2),0);
  psMD.update(origin, posX, posY);
  psMD.display();
  popMatrix();
}
