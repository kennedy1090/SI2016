class LevelTwo extends Level {
  Level nextLevel(){
    return new LevelMilly();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2, height/2, 100, new Vec2(0,0), 100, false));
    g.add(new Target(width/2, height/6, 10,new Vec2(0,0), true,2));
    return g;
  }
}