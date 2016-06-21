
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

float max_t = 15;

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
}

void draw() {
  background(255);
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
} // end draw()
static boolean[] getKeys(){
  return keysDown;
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