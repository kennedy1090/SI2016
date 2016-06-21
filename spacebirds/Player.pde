 
class Player extends GravObj{
  float r = 10;
  float d = 0.1;
  float t;
  Player(float x, float y, Vec2 v){
    makeBody(x,y,v,d);
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
      kill.add(this);
    }
  }
  Shape getShape(){
    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    return cs;
  }
}