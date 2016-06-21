class LearningLevel1 extends Level {
  Level nextLevel(){
    return new LevelOne();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2, height/2, 100, new Vec2(0,0), 100, false));
    g.add(new Target(width/2, height/6, 10,new Vec2(0,0), true));
    return g;
  }
  void displayExtra(){
    textSize(24);
    fill(0);
    text("Use the arrow keys to move left and right", width/2 + 80,height-90, 300, 200);
  }
  int getRecommendedTime()
  {
    return 60;
  }
}