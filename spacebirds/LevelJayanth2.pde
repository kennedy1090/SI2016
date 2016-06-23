class LevelJayanth2 extends Level {
  int getRecommendedTime(){return 5;}
  Level restart(){return new LevelJayanth2();}
  Level nextLevel(){return new LevelWhy();}
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
     float v = 10;
    g.add(new Planet(width/2-80, height/2, 35, new Vec2(0, v), 50, false));
    g.add(new Planet(width/2+80, height/2, 35, new Vec2(0, -v), 50, false));
    g.add(new Planet(width/2, height/2+80, 20, new Vec2(0, 0), 50, false));
    g.add(new Planet(width/2, height/2-80, 20, new Vec2(0, 0), 50, false));
    g.add(new Target(width/2, height/2,10, true));
    return g;
  }
      void displayExtra(){
         textSize(30);
    fill(255);
    text("Level 9", width/2, height/8);
      }

}