abstract class GravObj{
  Body body;
  boolean immobile;
  boolean isImmobile(){return immobile;}
  abstract void display();
  void applyGravForce(Body b){

    Vec2 r = b.getPosition().sub(body.getPosition());
    float f = grav_constant*b.getMass()*body.getMass()/pow(r.length(),2);
    Vec2 f2 = new Vec2(f*r.x/r.length(), f*r.y/r.length());
    applyForce(f2);
  }
  void applyForce(Vec2 f){
    body.applyForceToCenter(f);
  }
}