/* adapted from Shiffman's Nature of Code */

class ParticleSystem{
  ArrayList particles;
  PVector center;
  Attractor a;
  float aMass = 10;
  
  ParticleSystem(PVector l){
    center = l.get();
    a = new Attractor(center, aMass);
    particles = new ArrayList();
  }
  
  void addParticle(){
    particles.add(new Particle(center));
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
