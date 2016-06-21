abstract class GravObj{
  Body body;
  boolean immobile;
  Vec2 s;
  Vec2 f = new Vec2(0,0);
  boolean isImmobile(){return immobile;}
  abstract void display();
  void applyGravForce(GravObj g){
    Vec2 r = g.body.getPosition().sub(body.getPosition());
    float tf = grav_constant*g.body.getMass()*body.getMass()/pow(r.length(),2);
    Vec2 f2 = new Vec2(tf*r.x/r.length(), tf*r.y/r.length());
    applyForce(f2);
  }
  void applyForce(Vec2 _f){
    f.addLocal(_f);
    body.applyForceToCenter(_f);
  }
  void makeBody(float x, float y, Vec2 v, float density) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    s = bd.position;
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    
    FixtureDef fd = new FixtureDef();
    fd.shape = getShape();
    // Parameters that affect physics
    fd.density = density;
    fd.friction = coeff_friction;
    fd.restitution = coeff_restitution;
    fd.setUserData(this);
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
//    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
   body.setLinearVelocity(v);
    //body.setAngularVelocity(random(-10,10));
        body.setAngularVelocity(0.0);
  }
  void displayArrow(){
    //println(f);
    drawArrow(box2d.getBodyPixelCoord(body), body.getLinearVelocity(), 10, 1.5, color(255,0,0));
    drawArrow(box2d.getBodyPixelCoord(body), f, 10, 1.5, color(204,0,204));
    f = new Vec2(0,0);
  }
  abstract Shape getShape();
}