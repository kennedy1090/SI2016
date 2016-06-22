class LevelBinary extends Level {
  int getRecommendedTime(){return 10;}
  Level restart(){return new LevelBinary();}
  Level nextLevel(){return new LevelWhy();}
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    float v = 10;
    g.add(new Planet(width/2-80, height/2, 50, new Vec2(0, v), 50, false));
    g.add(new Planet(width/2+80, height/2, 50, new Vec2(0, -v), 50, false));
    g.add(new Target(width/2, height/2,10, true));
    return g;
  }
}