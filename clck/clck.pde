int startDay = 23; 
int startHour = 16;
int targDay = 28;
int targHour = 17;

int strt = 0;

color rb = color(47, 0, 170);
color md = color(54, 143, 255);

ParticleSystem psRB;
ParticleSystem psMD;

void setup(){
  size(800,200,P3D);
  strt = getSec(targDay-startDay,abs(targHour-startHour),0,0);
  println(strt);
  PVector strtRB = new PVector(strt, 0);
  PVector strtMD = new PVector(-strt, 0);
  psRB = new ParticleSystem(strtRB, height/5);
  psMD = new ParticleSystem(strtMD, height/5);
}


void draw(){
  background(0);
  translate(width/2,height/2);
  noStroke();
  
  float pos = getSec(targDay-day(),abs(targHour-hour()),minute(),second())/float(strt);
  PVector rbPos = new PVector(pos*(width/2),0);
  PVector mdPos = new PVector(pos*(-width/2),0);
  fill(rb);
  ellipse(pos*(width/2),0,30,30);
  fill(md);
  ellipse(pos*(-width/2),0,30,30);
  
  strokeWeight(2);
  stroke(80, 200, 180);
  psRB.update(rbPos);
  psRB.display();
  psMD.update(mdPos);
  psMD.display();

}

int getSec(int d, int h, int m, int s){
  return(((d*24+h)*60+m)*60+s);
}
