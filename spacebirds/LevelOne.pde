class LevelOne extends Level {
  int getRecommendedTime(){return 3;}
  Level nextLevel(){
    return new LevelTwo();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    g.add(new Planet(width/2,height/4,30,new Vec2(13,0), 1,false));
    g.add(new Planet(width/2,height/2,60,new Vec2(0, 0), 20,false));
    g.add(new Target(width/2,height/3,10,new Vec2(15,0),false));
    return g;
  }
}