static ArrayList<GravObj> kill;
abstract class Level {
  ArrayList<GravObj> gravs;
  Level(){
    gravs = addGravs();
  }
  abstract ArrayList<GravObj> addGravs();
  void add(GravObj g){
    gravs.add(g);
  }
  void display(){
    while(kill.size()>0){
      GravObj b = kill.get(0);
      gravs.remove(b);
      if(!box2d.world.isLocked()&&b!=null){
        box2d.destroyBody(b.body);
        kill.remove(0);
      }
    }
    for( int i = 0; i < gravs.size(); ++i ){
      GravObj g = gravs.get(i);
      if(!g.isImmobile()){
        for(GravObj q : gravs){
          if(q!=g)
            g.applyGravForce(q);
        }
      }
      g.display();
    }
  }
  void finish(){
    
  }
}