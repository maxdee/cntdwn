int strt = 0;

float pos = 0.5;

color rb = color(47, 0, 170);
color md = color(54, 143, 255);

ParticleSystem psRB;
ParticleSystem psMD;
PVector origin = new PVector(0, 0);

void setup(){
  size(800,200,P3D);

  println(strt);
  startPS();
}


void draw(){
  background(0);
  translate(width/2,height/2);
  noStroke();
  
  pos+=(random(200)-100)/10000;
  println(pos);
  
  fill(rb);
  ellipse(pos*(width/2),0,30,30);
  fill(md);
  ellipse(pos*(-width/2),0,30,30);
  
  drawPS(pos);  
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

void drawPS(float pos){
  strokeWeight(2);
  stroke(80, 200, 180);
  
  pushMatrix();
  translate(pos*(width/2),0);
  psRB.update(origin, pos);
  psRB.display();
  popMatrix();
  
  pushMatrix();
  translate(pos*(-width/2),0);
  psMD.update(origin, pos);
  psMD.display();
  popMatrix();
}
