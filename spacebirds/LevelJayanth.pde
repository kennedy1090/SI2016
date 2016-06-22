class LevelJayanth extends Level {
  Level restart() {
    return new LevelJayanth();
  }
  int getRecommendedTime()
  {
    return 30;
  }
  Level nextLevel() {
    return new LevelMilly();
  }
  ArrayList<GravObj> addGravs() {
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2, height/1.28, 30, new Vec2(0, 0), 3, true));
    g.add(new Planet(width/2, height/2, 100, new Vec2(0, 0), 100, true));
    g.add(new Planet((width/2), height/4.75, 50, new Vec2(0, 0), 3, true));
    g.add(new Target(width/2, height/3.15, 10, new Vec2(5, 0), true, 5));
    g.add(new Target(width/2, height/1.425, 10, new Vec2(3, 0), true,3));
    return g;
  }
     void displayExtra(){
    fill(0);
    textSize(30);
    text("Level 4", width/2,height/8);
  }
}