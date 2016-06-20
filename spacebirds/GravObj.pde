abstract class GravObj{
  Body body;
  boolean immobile;
  boolean isImmobile(){return immobile;}
  abstract void display();
  void applyGravForce(GravObj g){

    Vec2 r = g.body.getPosition().sub(body.getPosition());
    float f = grav_constant*g.body.getMass()*body.getMass()/pow(r.length(),2);
    Vec2 f2 = new Vec2(f*r.x/r.length(), f*r.y/r.length());
    applyForce(f2);
  }
  void applyForce(Vec2 f){
    body.applyForceToCenter(f);
  }
}