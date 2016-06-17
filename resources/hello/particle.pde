 
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
//A new variable to keep track of how long the particle has been “alive”
  float lifespan;
 
  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector();
    velocity = new PVector();
//We start at 255 and count down for convenience
    lifespan = 255;
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
//Lifespan decreases
    lifespan -= 2.0;
  }
 
  void display() {
//Since our life ranges from 255 to 0 we can use it for alpha
    stroke(0,lifespan);
    fill(175,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
    boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
   }
}