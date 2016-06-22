//import processing.sound.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.callbacks.*;
import org.jbox2d.collision.*;

Cannon c;
Contacter ter;
float cooldown_time = 0.4;
float cooldown = 0;
PImage bg;
float max_t = 15;

//Pulse nse;

//stuff for the scoreboard
int targetsRed;
int targetsBlue;
int shots;
score scoreboard;

Level currentLevel;

static boolean[] keysDown;

// Particle properties
float particle_radius = 6.0;
float coeff_friction = 0.05;
float coeff_restitution = .9; // =1 for elastic collisions
                               // =0 for (almost) perfeclty inelastic collisions 
float grav_constant = 1;
// For people with C++ experience, box2d is a class
Box2DProcessing box2d;

World world;

void setup() {
  size(800,600);
  //nse = new Pulse(this);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  world = box2d.world;
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  keysDown = new boolean[7];
  ter = new Contacter(box2d);
  c = new Cannon(width/2, height);
  scoreboard = new score();
  // Create the empty list
  currentLevel = new System();
  bg = loadImage("bg.jpg");
  bg.resize(width,height);
}

void draw() {
  background(bg);
  try{
    world.step(frameRate > 0 ? 1 / frameRate : 1 / 30,10,8);
  }
  catch(Throwable e){
    println("Excpt = "+e);
    println("Msg = "+e.getMessage());
    println("Cause = "+e.getCause());
  }
  currentLevel.display();
  for(Target t : ter.getDestroyed()){
    t.destroy();
  }
  c.display();
  scoreboard.displayScore(targetsRed, targetsBlue, shots);
  if(c.shot&&cooldown<=0){
    currentLevel.add(c.getProjectile(30));
    c.shot=false;
    cooldown = cooldown_time;
    shots++;
  }else{
    c.shot=false;
    cooldown-=1/(frameRate==0?1:frameRate);
  }
  currentLevel.displayExtra();
} // end draw()
static boolean[] getKeys(){
  return keysDown;
}
Vec2 rTheta(float r, float theta){return new Vec2(r*cos(theta), r*sin(theta));}
float hypotenuse(float x, float y, float xMouse, float yMouse){return sqrt((x-xMouse+(width/2))*(x-xMouse+(width/2))+(y+(height/2)-yMouse)*(y+(height/2)-yMouse));}
public void mousePressed(){
  if(currentLevel instanceof System){
    System s = (System)currentLevel;
    float[] distance = {0, s.MercuryOrbitRadius, s.VenusOrbitRadius, s.EarthOrbitRadius, s.MoonOrbitRadius, s.MarsOrbitRadius, s.JupiterOrbitRadius, s.SaturnOrbitRadius, s.UranusOrbitRadius, s.NeptuneOrbitRadius};
    float[] angle = {0, s.MercuryAngle, s.VenusAngle, s.EarthAngle, s.MoonAngle, s.MarsAngle, s.JupiterAngle, s.SaturnAngle, s.UranusAngle, s.NeptuneAngle};
    float[] radii = {s.SunDiam/2, s.MercuryDiam/2, s.VenusDiam/2, s.EarthDiam/2, s.MoonDiam/2, s.MarsDiam/2, s.JupiterDiam/2, s.SaturnDiam/2, s.UranusDiam/2, s.NeptuneDiam/2};
    boolean clicked[] = {false, false, false, false, false, false, false, false, false, false};
    for (int i = 0; i <= 9; i++){
      
      if (hypotenuse(rTheta(distance[i], angle[i]).x, rTheta(distance[i], angle[i]).y, mouseX, mouseY) <= radii[i])
        clicked[i] = true;
      else
        clicked[i] = false;
    }
    if (clicked[0]){
      currentLevel = new LearningLevel1();
      println("you good");
    }
    else if (clicked[1])
      currentLevel = new LevelOne();
    else if (clicked[2])
      currentLevel = new LevelTwo();
    else if (clicked[3])
      currentLevel = new LevelJayanth();
    else if (clicked[4])
      currentLevel = new LevelMilly();
    else if (clicked[5])
      currentLevel = new LevelEvan1();
    else if (clicked[6])
      currentLevel = new LevelBinary();
    else if (clicked[7])
      currentLevel = new LevelMilly2();
    else if (clicked[8])
      currentLevel = new LevelJayanth2();
    else if (clicked[9])
      currentLevel = new LevelWhy();
    else {
      println("miss");
    }
  }
  
  /* planets to levels
  sun learning level 1
  mercury level one
  venus level two
  earth level jayanth
  moon level milly
  mars level evan 1
  jupiter level binary
  saturn level why
  uranus
  neptune
  */
  
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
  else if(key == 'n' || key == 'N')
    currentLevel.finish(false, false);
  else if(key == 'e'||key == 'E'){
    currentLevel.finish(false, true);
  }
}

class Contacter implements ContactListener{
  ArrayList<Target> ts = new ArrayList<Target>();
  Contacter(Box2DProcessing b){
    b.world.setContactListener(this);
  }
  public void beginContact(Contact c){
    Object a = c.getFixtureA().getUserData();
    Object b = c.getFixtureB().getUserData();
    if(a instanceof Player && b instanceof Target){
      Target t = (Target)b;
      targetsRed++;
      if(t.hit()==0){
        t.destroy();
      }
    }
    else if(a instanceof Target && b instanceof Player){
      Target t = (Target)a;
      targetsRed++;
      if(t.hit()==0){
        t.destroy();
      }
    }
  }
  public void endContact(Contact c){}
  public void preSolve(Contact c, Manifold m){}
  public void postSolve(Contact c, ContactImpulse i){}
  ArrayList<Target> getDestroyed(){
    ArrayList<Target> t = (ArrayList<Target>)ts.clone();
    ts.clear();
    return t;
}
}