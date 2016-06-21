class LevelMilly extends Level
{
  Level nextLevel()
  {
    return new LevelEvan1();
  }
  ArrayList<GravObj> addGravs()
  {
    ArrayList<GravObj> objs = new ArrayList<GravObj>();
    objs.add(new Planet(200,200,80,new Vec2(0,0),20,true));
    objs.add(new Planet(200,400,60,new Vec2(0,0),3,true));
    objs.add(new Planet(550,300,40,new Vec2(0,0),15,true));
    objs.add(new Target(200,300,10,new Vec2(0,0),true,1));
    objs.add(new Target(400,400,7,new Vec2(0,0),true,2));
    objs.add(new Target(600,450,10,new Vec2(0,0),false,1));
    return objs;
  }
  int getRecommendedTime()
  {
    return 40;
  }
}