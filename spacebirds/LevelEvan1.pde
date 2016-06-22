class LevelEvan1 extends Level {
  Level restart(){return new LevelEvan1();}
  Level nextLevel(){
    return new LevelBinary();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width*.5,height/2,50,new Vec2(0,0), 60,true));
    g.add(new Planet(width*.75,height/2,30,new Vec2(0, -16), 3,false));
    g.add(new Planet(width*.69,height/2,10,new Vec2(0, -21), 3,false));
    g.add(new Planet(width*.65,height/2,10,new Vec2(0, -2147483648), 3,false));
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