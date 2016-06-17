
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

// An ArrayList of particles that will fall on the surface
ArrayList<GravObj> gravs;


// Particle properties
float particle_radius = 6.0;
float coeff_friction = 0.05;
float coeff_restitution = 1; // =1 for elastic collisions
                               // =0 for (almost) perfeclty inelastic collisions 
float grav_constant = 1;
// For people with C++ experience, box2d is a class
Box2DProcessing box2d;

void setup() {
  size(600,400);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);

  // Create the empty list
  gravs = new ArrayList<GravObj>();
  gravs.add(new Planet(100,100,30,new Vec2(6,0), 1,false));
  gravs.add(new Planet(100,300,60,new Vec2(0, 0), 10,false));
}

void draw() {
  background(255);
  box2d.step();
  for( GravObj g : gravs){
    if(!g.isImmobile()){
      for(GravObj q : gravs){
        if(q!=g)
          g.applyGravForce(q.body);
      }
    }
    g.display();
  }
} // end draw()