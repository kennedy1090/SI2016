 
class Planet extends GravObj{
  color colour;
  // We need to keep track of a Body and a radius
  float r;
  Planet(float x, float y, float r_, Vec2 v, float d, boolean immobile){
    r = r_;
    // This function puts the particle in the Box2d world
    this.immobile = immobile;
    makeBody(x,y,v,d);
  }
  Planet(float x, float y, float r_, boolean immobile) {
    this(x,y,r_,new Vec2(0,0),1,immobile);
  }

  void changeColor(color c){colour = c;}
  // 
  void display(){
    
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
    fill(175);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    stroke(0xff,0x00,0x00);
    if(!immobile) super.displayArrow();
  }
  Shape getShape(){
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    return cs;
  }
}