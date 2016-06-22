class Target extends GravObj{
  
  // We need to keep track of a Body and a radius
  float r;
  int hits;
  PImage img;
  Target(float x, float y, float r_, Vec2 v, boolean immobile, int hits, PImage _img){
    this(x,y,r_,v,immobile,hits);
    img=_img;
  }
  Target(float x, float y, float r_, Vec2 v, boolean immobile, int hits){
    this(x,y,r_,v,immobile);
    this.hits=hits;
  }
  Target(float x, float y, float r_, Vec2 v,boolean immobile){
    r = r_;
    // This function puts the particle in the Box2d world
    if(hits==0)hits=1;
    this.immobile = immobile;
    makeBody(x,y,v,0.1);
  }
  Target(float x, float y, float r_, boolean immobile) {
    this(x,y,r_,new Vec2(0,0),immobile, 1);
  }
  int hit(){
    return --hits;
  }

  // 
  void display() {
    
    if(immobile){
      body.setLinearVelocity(new Vec2(0,0));
      body.setTransform(s, body.getAngle());
    }
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    colorMode(HSB);
    fill((hits-1)*256/6, 255,255);
    colorMode(RGB);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    if(img!=null){
      tint((hits-1)*256/6, 255,255);
      image(img, -r/2, -r/2, r, r);
    }
    popMatrix();
    stroke(0xff,0x00,0x00);
    if(!immobile) super.displayArrow();
  }
  Shape getShape(){
    // Make the body's shape a corcl
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    return cs;
  }

int total = 1;

ArrayList<Particle> particles = new ArrayList<Particle>();

int count = 0;
int countMax = 20;

void destroy() {
  /*for (int i=0; i<total; i++) {
    ++count;
    levels.get(currentLevel).add(new Particle(box2d.coordWorldToPixels(body.getPosition())));
  }*/
  kill.add(this);

}
}

class Particle extends GravObj {
  float lifespan;
  float dist;
  float choice;
  Particle(Vec2 l) {
    Vec2 velocity = box2d.coordPixelsToWorld(new Vec2(random(-1, 1), random(-2, 0)));
    lifespan = 3000.0;
    dist = box2d.scalarPixelsToWorld(random(3,15));
    choice = random(1, 2);
    makeBody(l.x+random(-3000,3000), 
            l.y+random(-3000,3000), new Vec2(0,0), 0.1);
  }
  Shape getShape(){
    Vec2 pos = new Vec2(0,0);

    // Make the body's shape a circle
    PolygonShape cs = new PolygonShape();
    if (choice <1.5)
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

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    println(body.getPosition());
    pushMatrix();
    // Range from 0x00 to 0xff (000 to 255)
    float R = 255;
    float G = 0;
    float B = 0;
    fill(R, G, B);
    stroke(R, G, B);
    translate(pos.x, pos.y);
    rotate(body.getAngle());
    Vec2[] vs = ((PolygonShape)body.getFixtureList().getShape()).getVertices();
    for(int i = 0; i < 3; i++){
      vs[i]=box2d.coordWorldToPixels(vs[i]);
    }
    triangle(vs[0].x, vs[0].y,vs[1].x, vs[1].y,vs[2].x, vs[2].y);
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