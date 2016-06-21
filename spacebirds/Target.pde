class Target extends GravObj{
  
  // We need to keep track of a Body and a radius
  float r;
  boolean destroyed = false;
  Target(float x, float y, float r_, Vec2 v,boolean immobile){
    r = r_;
    // This function puts the particle in the Box2d world
    this.immobile = immobile;
    makeBody(x,y,v,0.01);
  }
  Target(float x, float y, float r_, boolean immobile) {
    this(x,y,r_,new Vec2(0,0),immobile);
  }


  // 
  void display() {
    if(destroyed){
      displayParticles();
    }
    else{
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    }
  }
  Shape getShape(){
    // Make the body's shape a corcl
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    return cs;
  }

int total = 10;

ArrayList<Particle> particles = new ArrayList<Particle>();

int count = 0;
int countMax = 20;

void destroy() {
  destroyed = true;
  box2d.destroyBody(body);
  for (int i=0; i<total; i++) {
    ++count;
    particles.add(new Particle(body.getPosition()));
  }
}

void displayParticles() {
  for (Particle p : particles)p.display();
}
}

class Particle extends GravObj {
  float lifespan;
  float dist;
  float choice;
  Body body;

  Particle(Vec2 l) {
    Vec2 velocity = new Vec2(random(-1, 1), random(-2, 0));
    lifespan = 3000.0;
    dist = random(3, 15);
    choice = random(1, 2);
    makeBody(l.x, l.y, velocity, 0.001);
  }
  Shape getShape(){
    Vec2 pos = box2d.getBodyPixelCoord(body);

    // Make the body's shape a circle
    PolygonShape cs = new PolygonShape();
    if (choice == 1)
    {
      cs.set(new Vec2[]{pos, 
        new Vec2(pos.x+dist, pos.y), 
        new Vec2(pos.x, pos.y+dist)}, 3);
    } else
    {
      cs.set(new Vec2[]{new Vec2(pos.x, pos.y+dist), 
        pos, 
        new Vec2(pos.x+dist, pos.y)}, 3);
    }
    return cs;
  }
  Vec2 p2w(Vec2 v){
    return new Vec2(box2d.coordPixelsToWorld(v));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    // Range from 0x00 to 0xff (000 to 255)
    float R = 255;
    float G = 0;
    float B = 0;
    fill(R, G, B);
    stroke(R, G, B);
    if (choice == 1)
    {
      triangle(pos.x, pos.y, 
        pos.x+dist, pos.y, 
        pos.x, pos.y+dist);
    } else
    {
      triangle(pos.x, pos.y+dist, 
        pos.x, pos.y, 
        pos.x+dist, pos.y);
    }
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