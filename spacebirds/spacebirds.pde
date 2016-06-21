
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.callbacks.*;
import org.jbox2d.collision.*;

Cannon c;
ArrayList<GravObj> gravs;
static ArrayList<Body> kill;
float cooldown_time = 0.1;
float cooldown = 0;
static boolean[] keysDown;

// Particle properties
float particle_radius = 6.0;
float coeff_friction = 0.05;
float coeff_restitution = 1; // =1 for elastic collisions
                               // =0 for (almost) perfeclty inelastic collisions 
float grav_constant = 1;
// For people with C++ experience, box2d is a class
Box2DProcessing box2d;

void setup() {
  size(800,600);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  keysDown = new boolean[7];
  c = new Cannon(width/2, height);
  kill = new ArrayList<Body>();
  // Create the empty list
  gravs = new ArrayList<GravObj>();
  gravs.add(new Planet(100,100,30,new Vec2(6,0), 1,false));
  gravs.add(new Planet(100,300,60,new Vec2(0, 0), 10,false));
  gravs.add(new Target(100,200,10,new Vec2(3,0),true));
}

void draw() {
  background(255);
  box2d.step();
  /*
  while(kill.size()>0){
    Body b = kill.remove(0);
    if(!box2d.world.isLocked()&&b!=null){
      box2d.destroyBody(b);
    }
  }*/
  for( GravObj g : gravs){
    if(!g.isImmobile()){
      for(GravObj q : gravs){
        if(q!=g)
          g.applyGravForce(q);
      }
    }
    g.display();
  }
  c.display();
  if(c.shot&&cooldown<=0){
    gravs.add(c.getProjectile(30));
    c.shot=false;
    cooldown = cooldown_time;
  }else{
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

}
class Contacter implements ContactListener{
  ArrayList<Target> ts = new ArrayList<Target>();
  Contacter(Box2DProcessing b){
    b.world.setContactListener(this);
  }
  public void beginContact(Contact c){
    Object a = c.getFixtureA().getUserData();
    Object b = c.getFixtureB().getUserData();
    println(a instanceof Player && b instanceof Target || a instanceof Target && b instanceof Player);
    if(a instanceof Player && b instanceof Target){
      ts.add((Target)b);
    }
    else if(a instanceof Target && b instanceof Player){
      ts.add((Target)a);
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