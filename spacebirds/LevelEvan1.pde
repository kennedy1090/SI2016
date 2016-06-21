class LevelEvan1 extends Level {
  Level nextLevel(){
    return null;
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2,height/2,30,new Vec2(6,0), 1,false));
    g.add(new Planet(width/2,height*3/4,60,new Vec2(0, 0), 10,false));
    g.add(new Target(100,200,10,new Vec2(3,0),true));
    return g;
  }
  void displayExtra(){
    text("Hello", 100,100);
  }
}