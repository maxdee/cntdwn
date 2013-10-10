/* adapted from Shiffman's Nature of Code */

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector center;
  Attractor a;
  Repeller b;
  int nParticles=500;
  float aMass = 100;
  float bMass = 1/nParticles;
  float avgR;

  
  ParticleSystem(PVector l, float r){
    center = l.get();  // center of mass
    avgR = r;          // avg radius from center of mass -- this will make sense eventually
    a = new Attractor(center, aMass);
    b = new Repeller(center, bMass);
    particles = new ArrayList();
    for (int i = 0; i < nParticles; i++){
      addParticle();
    }
  }
  
  void addParticle(){
    float theta = random(-TWO_PI, TWO_PI);
    PVector start = new PVector(avgR*cos(theta), avgR*sin(theta));
    particles.add(new Particle(start));
  }
  
  void update(PVector l, float posX, float posY){
    center = l.get();
    for (int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i);
      PVector force = a.attract(p);
      p.applyForce(force);
      force = b.repell(p);
      p.applyForce(force);      
      p.update(posX, posY);
    }
  }
  
  void display(){
    for (int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i);
      strokeWeight(2);
      stroke(i%255,0,(i+50)%255);
      point(p.getLoc().x, p.getLoc().y);
    }
  }
}

class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass = 0.1;
  
  Particle(PVector l){
    loc = l.get();
    vel = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
    acc = new PVector(0,0);
   }
  
  PVector getLoc(){
    return loc;
  }
  
  void update(float posX, float posY){
    vel.add(acc);
    loc.add(vel);
    loc.x = constrain(loc.x, float(-width/2)+4*posX, float(width/2)-4*posX);
    loc.y = constrain(loc.y, float(-height/2)+4*posY, float(height/2)-4*posY);
  }
  void applyForce(PVector force){
    acc.add(force);
  }
}

// an attractor will be the center of orbit for a particle system
class Attractor{
  PVector loc;
  float mass;
  float G;
  
  Attractor(PVector l, float m){
    loc = l.get();
    mass = m;
    G = map(mouseX, 0, width, 0.01, 1);
  }
  
  void update(PVector l){
    loc = l.get();
  }
  
  PVector getLoc(){
    return loc;
  }
  
  PVector attract(Particle p){
    PVector f = PVector.sub(loc, p.loc);
    float dist = f.mag();
    dist = constrain(dist, 1.0, width); // limit 
    
    f.normalize();
    float strength = (G * p.mass) / (dist * dist);
    f.mult(strength);
    return f;
  }
}

class Repeller extends Attractor{
  float rG = -0.1;
  Repeller(PVector l, float m){
    super(l, m);
  }
  
  PVector repell(Particle p){
    PVector f = PVector.sub(loc, p.loc);
    float dist = f.mag();
    dist = constrain(dist, 1.0, 25.0); // limit 
    
    f.normalize();
    float strength = (rG * p.mass) / (dist * dist);
    f.mult(strength);
    return f;
  }
}
