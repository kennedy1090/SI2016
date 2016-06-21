int total = 10;

ArrayList<Particle> particles = new ArrayList<Particle>();

int count = 0;
int countMax = 20;


void setupMilly() {
  
  //p = new Particle(new PVector(width/2,10));
  for(int i=0; i<total;i++){
    ++count;
   particles.add(new Particle(new PVector(width/2,50))); 
 }
 
}

void setup() {
  size(640,360);
  setupMilly();
  
}
 
void drawTarget() {
  background(255);
//Operating the single Particle
 // p.run();
  //if (p.isDead()) {
    //println("Particle dead!");
    
    if(count < countMax){
      particles.add(new Particle(new PVector(width/2,50)));
      ++count;
    }
    for(int j=particles.size()-1;j>=0;j--)
     {
       Particle p = particles.get(j);
       p.run();
       if(p.isDead())
       {
         particles.remove(j);
       }
     }
  }
  
void draw(){
  drawTarget();
}

 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float dist;
  float choice;
  float theta;
 
  Particle(PVector l) {
//For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 3000.0;
    dist = random(3,15);
    choice = random(0,2);
    theta = random(0,PI*2);
  }
 
//Sometimes it’s convenient to have a “run” function that calls all the other functions we need.
  void run() {
    update();
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  
 
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    // Range from 0x00 to 0xff (000 to 255)
    float R = 255;
    float G = 0;
    float B = 0;
    fill(R,G,B);
    stroke(R,G,B);
    
    triangle(0,0,
             dist,0,
             0,dist);
    popMatrix();
  }
 
//Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}