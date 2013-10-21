// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color col;

  Particle(PVector l,float ls, color c) {
    acceleration = PVector.sub(l,new PVector(width/2,height/2));
    acceleration.normalize();
    acceleration.div(-10);
  //  velocity = new PVector(random(-0.5,0.5),random(-0.5,0.5));
    velocity = PVector.div(acceleration,random(0,2));
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
    stroke(red(col),green(col),blue(col),lifespan);
    fill(red(col),green(col),blue(col),lifespan);
    rect(location.x,location.y,cellsize,cellsize);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0 || PVector.dist(location,new PVector(width/2,height/2)) < cellsize * 2) {
      return true;
    } else {
      return false;
    }
  }
}

