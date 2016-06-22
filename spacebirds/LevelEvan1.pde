class LevelEvan1 extends Level {
  Level restart(){return new LevelEvan1();}
  Level nextLevel(){
    return new LevelBinary();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width*.5,height/2,50,new Vec2(0,0), 60,true));
    g.add(new Planet(width*.75,height/2,30,new Vec2(0, -16), 3,false));
    g.add(new Planet(width*.69,height/2,10,new Vec2(0, -19), 3,false));
    g.add(new Planet(width*.65,height/2,10,new Vec2(0, -21), 3,false));
    g.add(new Target(width*.5,height*.25,10,new Vec2(3,0),true));
    return g;
  }
  void displayExtra(){
       textSize(30);
    fill(255);
    text("Level 6", width/2, height/8);
  }
 int getRecommendedTime()
  {
    return 20;
  }
}