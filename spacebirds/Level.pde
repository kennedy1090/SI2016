static ArrayList<GravObj> kill = new ArrayList<GravObj>();
abstract class Level {
  ArrayList<GravObj> gravs;
  int t;
  Level(){
    gravs = addGravs();
    t = millis();
  }
  abstract int getRecommendedTime();
  abstract Level nextLevel();
  abstract Level restart();
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
    boolean targets = false;
    for( int i = 0; i < gravs.size(); ++i ){
      GravObj g = gravs.get(i);
      targets = targets || g instanceof Target;
      if(!g.isImmobile()){
        for(GravObj q : gravs){
          if(q!=g)
            g.applyGravForce(q);
        }
      }
      g.display();
    }
    fill(0);
    text(String.format("Time: %.3f",(millis()-t)/1000.0), width*7/8, height-20);
    displayExtra();

    if(!targets){
      finish();
    }
  }
  void displayExtra(){}
  void finish(){finish(true, false);}
  void finish(boolean legit, boolean restart){
    if(legit)scoreboard.addScore(int(getRecommendedTime()*1000-millis()+t)/10);
    kill.addAll(gravs);
    gravs.clear();
    Level tlvl = restart?restart():nextLevel();
    if(tlvl == null) noLoop();
    else currentLevel = tlvl;
  }
}