 
class Planet extends GravObj{

  // We need to keep track of a Body and a radius
  float r;
  Planet(float x, float y, float r_, Vec2 v, float d, boolean immobile){
    r = r_;
    // This function puts the particle in the Box2d world
    this.immobile = immobile;
    makeBody(x,y,r,v,d);
  }
  Planet(float x, float y, float r_, boolean immobile) {
    this(x,y,r_,new Vec2(0,0),1,immobile);
  }


  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  // 
  void display() {
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
    // Let's add a line so we can see the rotation
    line(0,0,r,0);
    popMatrix();
  }
  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r, Vec2 v, float density) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = density;
    fd.friction = coeff_friction;
    fd.restitution = coeff_restitution;
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
//    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
   body.setLinearVelocity(v);
    //body.setAngularVelocity(random(-10,10));
        body.setAngularVelocity(0.0);
  }


}