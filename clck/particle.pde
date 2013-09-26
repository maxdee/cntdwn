/* adapted from Shiffman's Nature of Code */

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector center;
  Attractor a;
  float aMass = 10;
  float avgR;
  
  ParticleSystem(PVector l, float r){
    center = l.get();  // center of mass
    avgR = r;          // avg radius from center of mass
    a = new Attractor(center, aMass);
    particles = new ArrayList();
    for (int i = 0; i < 10; i++){
      addParticle();
    }
  }
  
  void addParticle(){
    particles.add(new Particle(center));
  }
  
  void update(PVector l){
    center = l.get();
    for (int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i);
      p.update();
    }
  }
  
  void display(){
    for (int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i);
      point(p.getLoc().x, p.getLoc().y);
    }
  }
}

class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float pMass = 0.1;
  
  Particle(PVector l){
    loc = l.get();
    vel = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
    acc = new PVector(random(-0.003, 0.003), random(-0.003, 0.003));
  }
  
  PVector getLoc(){
    return loc;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
  }
}

// an attractor will be the center of orbit for a particle system
class Attractor{
  PVector loc;
  float mass;
  
  Attractor(PVector l, float m){
    loc = l.get();
    mass = m;
  }
  
  void update(PVector l){
    loc = l.get();
  }
  
  PVector getLoc(){
    return loc;
  }
}
