class LevelOne extends Level {
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(100,100,30,new Vec2(6,0), 1,false));
    g.add(new Planet(100,300,60,new Vec2(0, 0), 10,false));
    g.add(new Target(100,200,10,new Vec2(3,0),true));
    return g;
  }
}