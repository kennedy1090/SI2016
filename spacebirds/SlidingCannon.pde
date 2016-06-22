//returns (shot_x, shot_y, shot_speed, shot_theta)

//coodinates for cannon
class Cannon {
float x_base;
float y_base;
float theta_cannon;

//sizes for cannon
float WBase = 60;
float HBase = 20;
float HBarrel = 60;
float WBarrel = 15;
float cannonPower = 50;
boolean shot = false;

//speeds
float moveIncrement = 20;
float rotateSpeed = .7;

//time step
float dt = .1;

Cannon(float x, float y){
  x_base = x;
  y_base = y;
  init();
}
Player getProjectile(float v){
  float x = x_base+HBarrel*cos(PI/2-theta_cannon);
  float y = y_base-30-HBarrel*sin(PI/2-theta_cannon);
  Vec2 v2 = new Vec2(v*cos(PI/2-theta_cannon),v*sin(PI/2-theta_cannon));
  return new Player(x, y, v2);
}
  
void init() {
    
  x_base = 0.5*width;
  y_base = height-10;
  for (int i = 0; i < spacebirds.getKeys().length; i += 1) {
    spacebirds.getKeys()[i] = false;
  }
}

void display() {
  pushMatrix();
  stroke(0);
  strokeWeight(1);
  fill(128);
  if (spacebirds.getKeys()[1] == true && x_base > .5 * WBase)
    x_base -= moveIncrement*dt;
  if (spacebirds.getKeys()[3] == true && x_base < (width - .5 * WBase))
    x_base += moveIncrement*dt;
  if (spacebirds.getKeys()[2] == true)
    cannonPower += 1*dt;
  if (spacebirds.getKeys()[4] == true)
    cannonPower -= 1*dt;
  if (spacebirds.getKeys()[0] == true)
    shot = true;
  if (spacebirds.getKeys()[5] == true && theta_cannon > - PI * .5)
    theta_cannon -= rotateSpeed*dt;
  if (spacebirds.getKeys()[6] == true && theta_cannon < PI * .5)
    theta_cannon += rotateSpeed*dt;
    
  
  rect(x_base-30,y_base,WBase,HBase);
  rect(x_base-10,y_base-20,20,20);
  
  pushMatrix();
  translate(x_base, y_base-30);
  rotate(theta_cannon);
  rect(0-WBarrel*.5,0,WBarrel,-HBarrel);
  popMatrix();
  
  ellipse(x_base,y_base-30,30,30);
  popMatrix();
}


}