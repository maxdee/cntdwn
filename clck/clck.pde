int startDay = 23; 
int startHour = 16;
int targDay = 28;
int targHour = 17;

int strt = 0;

color rb = color(47, 0, 170);
color md = color(54, 143, 255);

ParticleSystem psRB;
ParticleSystem psMD;
PVector origin = new PVector(0, 0);

void setup(){
  size(800,200,P3D);
  strt = getSec(targDay-startDay,abs(targHour-startHour),0,0);
  println(strt);
  startPS();
}


void draw(){
  background(0);
  translate(width/2,height/2);
  noStroke();
  
  float pos = getSec(targDay-day(),abs(targHour-hour()),minute(),second())/float(strt);

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
  psRB = new ParticleSystem(origin, height/5);
  psMD = new ParticleSystem(origin, height/5);
}

void drawPS(float pos){
  strokeWeight(2);
  stroke(80, 200, 180);
  pushMatrix();
  translate(pos*(width/2),0);
  psRB.update(origin);
  psRB.display();
  popMatrix();
  pushMatrix();
  translate(pos*(-width/2),0);
  psMD.update(origin);
  psMD.display();
  popMatrix();
}
