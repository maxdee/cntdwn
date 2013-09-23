int startDay = 23; 
int startHour = 16;
int targDay = 28;
int targHour = 17;

int strt = 0;

color rb = color(47, 0, 170);
color md = color(54, 143, 255);

void setup(){
size(800,200,P3D);
strt = getSec(targDay-startDay,abs(targHour-startHour),0,0);
println(strt);
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
}

int getSec(int d, int h, int m, int s){
  return(((d*24+h)*60+m)*60+s);
}
