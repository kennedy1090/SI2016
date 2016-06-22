class LevelJayanth extends Level {
  Level restart(){return new LevelJayanth();}
   int getRecommendedTime()
  {
    return 30;
  }
  Level nextLevel(){
    return new LevelMilly();
  }
  ArrayList<GravObj> addGravs(){
    ArrayList<GravObj> g = new ArrayList<GravObj>();
    //g.add(new Planet(550,300,40,new Vec2(0,0),15,true));
    g.add(new Planet((width/1.5),height/2,100,new Vec2(0,0), 3,true));
    g.add(new Planet(width/2.25, height/2, 100, new Vec2(0,0), 3, true));
    g.add(new Planet(width/1.75, height/2, 100, new Vec2(0,0), 3, true));
    g.add(new Planet(width/2, height/3, 100, new Vec2(0,0), 100, true));
    g.add(new Target(width/1.5,height*.2,10,new Vec2(0,0),true));
    g.add(new Target(width/1.5,height*.25,10,new Vec2(0,0),true));
    g.add(new Target(width/1.5, height*.3, 10,new Vec2(0,0), true));
    return g;
  }
}