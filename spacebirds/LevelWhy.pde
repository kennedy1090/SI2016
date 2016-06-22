class LevelWhy extends Level{
  Level restart(){return new LevelWhy();}
  Level nextLevel(){
    return new GameOver(scoreboard.score);
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    for(float i : new float[]{0.25,0.5,0.75})
      for(float j : new float[]{0.25,0.5,0.75}){
        if(i==j&&j==0.5)
          g.add(new Planet(width*i, height*j, 100, new Vec2(0,0), 100, false));
        else if(random(1)>0.5)
          g.add(new Planet(width*i, height*j, 10, new Vec2(0,0), 1, false));
        else
          g.add(new Target(width*i, height*j, 10, new Vec2(0,0), false));
      }
    return g;
  }
  int getRecommendedTime(){return 20;}
}