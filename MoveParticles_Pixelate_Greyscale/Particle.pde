// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color col;

  Particle(PVector l,float ls, color c) {
    acceleration = new PVector(0,0.1);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = ls;
    col = c;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(red(col),green(col),blue(col));
    fill(red(col),green(col),blue(col));
    rect(location.x,location.y,cellsize,cellsize);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0 || location.y > height) {
      return true;
    } else {
      return false;
    }
  }
}

