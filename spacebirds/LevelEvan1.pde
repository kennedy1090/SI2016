class LevelEvan1 extends Level {
  Level nextLevel(){
    return null;
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width*.5,height/2,50,new Vec2(0,0), 30,true));
    g.add(new Planet(width*.75,height/2,30,new Vec2(0, -8), 5,false));
    g.add(new Target(width*.5,height*.25,10,new Vec2(3,0),true));
    return g;
  }
  void displayExtra(){
    text("Hello", 100,100);
  }
 int getRecommendedTime()
  {
    return 20;
  }
}