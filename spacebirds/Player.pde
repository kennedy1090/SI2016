class Player extends GravObj{
  void display(){
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(200,0,0);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,2,2);
    popMatrix();
  }
}