//returns (shot_x, shot_y, shot_speed, shot_theta)

//coodinates for cannon
class Cannon {
float x_base;
float y_base;
float theta_cannon;

//sizes for cannon
float WBase = 60;
float HBase = 20;
float ballRadius;
float HBarrel = 60;
float WBarrel = 15;
//coodinates for cannon top's corners
/*float URCornerX;
float URCornerY;
float ULCornerX;
float ULCornerY;
float BRCornerX;
float BRCornerY;
float BLCornerX;
float BLCornerY;
*/

//array for keys that are pressed
Boolean[] keysDown;

//variables for shot
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
void init() {
  size(750,500);
  keysDown = new Boolean[7];
  
  x_base = 0.5*width;
  y_base = height-10;
  for (int i = 0; i < keysDown.length; i += 1) {
    keysDown[i] = false;
  }
}

void displayBase() {
  background(127);
  if (keysDown[1] == true && x_base > .5 * WBase)
    x_base -= moveIncrement*dt;
  if (keysDown[3] == true && x_base < (width - .5 * WBase))
    x_base += moveIncrement*dt;
  if (keysDown[2] == true)
    cannonPower += 1*dt;
  if (keysDown[4] == true)
    cannonPower -= 1*dt;
  if (keysDown[0] == true)
    shot = true;
  if (keysDown[5] == true && theta_cannon > - PI * .5)
    theta_cannon -= rotateSpeed*dt;
  if (keysDown[6] == true && theta_cannon < PI * .5)
    theta_cannon += rotateSpeed*dt;
    
    
  rect(x_base-30,y_base,WBase,HBase);
  rect(x_base-10,y_base-20,20,20);
  
  /*BLCornerX = x_base - cos(theta_cannon) * WBarrel * .5;
  BLCornerY = y_base + sin(theta_cannon) * WBarrel * .5;
  ULCornerX = BLCornerX + sin(theta_cannon) * HBarrel;
  ULCornerY = BLCornerY + cos(theta_cannon) * HBarrel;
  BRCornerX = x_base + cos(theta_cannon) * WBarrel * .5;
  BLCornerY = y_base - sin(theta_cannon) * WBarrel * .5;
  URCornerX = BRCornerX - sin(theta_cannon) * HBarrel;
  URCornerY = BRCornerY - cos(theta_cannon) * HBarrel;
  
  beginShape();
  vertex(BLCornerX,BLCornerY);
  vertex(ULCornerX,ULCornerY);
  vertex(URCornerX,URCornerY);
  vertex(BRCornerX,BRCornerY);
  endShape();  */
  
  pushMatrix();
  translate(x_base, y_base-30);
  rotate(theta_cannon);
  rect(0-WBarrel*.5,0,WBarrel,-HBarrel);
  popMatrix();
  
  ellipse(x_base,y_base-30,30,30);
}

public void keyPressed(){
  if(key == CODED){
    if (keyCode == LEFT)
      keysDown[1] = true;
    else if (keyCode == RIGHT)
      keysDown[3] = true;
    else if (keyCode == UP)
      keysDown[2] = true;
    else if (keyCode == DOWN)
      keysDown[4] = true;
  }
  else if ( key == ' ')
    keysDown[0] = true;
  else if (key == 'r' || key == 'R')
    keysDown[5] = true;
  else if (key == 't' || key == 'T')
    keysDown[6] = true;
}

public void keyReleased(){
  if (key == CODED){
    if (keyCode == LEFT)
      keysDown[1] = false;
    else if (keyCode == RIGHT)
      keysDown[3] = false;
    else if (keyCode == UP)
      keysDown[2] = false;
    else if (keyCode == DOWN)
      keysDown[4] = false;
  }
  else if (key == ' ')
    keysDown[0] = false;
  else if (key == 'r' || key == 'R')
    keysDown[5] = false;
  else if (key == 't' || key == 'T')
    keysDown[6] = false;

}
}