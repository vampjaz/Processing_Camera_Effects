// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  
//  PVector center = new PVector(width/2,height/2);

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle(PVector location, float life, color col) {
    particles.add(new Particle(location.get(), life, col));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
