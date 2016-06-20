 
class Player extends GravObj{
  float r = 10;
  float d = 0.1;
  float t;
  Player(float x, float y, Vec2 v){
    makeBody(x,y,r,v,d);
    t = millis();
  }


  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(0,200,0);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    if(millis()-t>5000){
      spacebirds.kill.add(body);
    }
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