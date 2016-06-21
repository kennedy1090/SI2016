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
    text("Time: "+(millis()-t)/1000.0, width*7/8, 50);
    displayExtra();

    if(!targets){
      finish();
      println("yesy");
    }
  }
  void displayExtra(){}
  void finish(){
    scoreboard.score += int(getRecommendedTime()*1000-millis()+t)/10;
    kill.addAll(gravs);
    gravs.clear();
    Level tlvl = nextLevel();
    if(tlvl == null) noLoop();
    else currentLevel = tlvl;
  }
}