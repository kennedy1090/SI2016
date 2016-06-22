class LevelTwo extends Level {
  Level restart(){return new LevelTwo();}
  int getRecommendedTime(){return 6;}
  Level nextLevel(){
    return new LevelJayanth();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2, height/2, 100, new Vec2(0,0), 100, false));
    g.add(new Target(width/2, height/6, 10,new Vec2(0,0), true,2));
    return g;
  }
      void displayExtra(){
    fill(255);
    textSize(30);
    text("Level 3", width/2,height/8);
  }
}