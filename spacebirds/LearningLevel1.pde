class LearningLevel1 extends Level {
  Level restart(){return new LearningLevel1();}
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
    fill(255);
    textSize(20);
    text("Use the arrow keys to move left and right.", width/2 + 70,height-220, 340, 240);
     text("Press 't' and 'r' to rotate the cannon right and left, respectively.", width/2 + 75, height- 165, 265, 160);
    text("Press the spacebar to shoot. ", width/2 + 95, height- 300, 330, 280);
    text("Press 'e' to restart a level and press 'n' to skip a level. ", width/2 + 85, height- 275, 305, 255);
    textSize(30);
    text("Level 1", width/2,height/8);
  }
  int getRecommendedTime()
  {
    return 60;
  }
}