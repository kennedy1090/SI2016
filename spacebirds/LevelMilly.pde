class LevelMilly extends Level
{
  Level nextLevel()
  {
    return null;
  }
  ArrayList<GravObj> addGravs()
  {
    ArrayList<GravObj> objs = new ArrayList<GravObj>();
    objs.add(Planet(200,200,40,new Vec2(0,0),100,true));
    objs.add(Planet(200,400,60,new Vec2(0,0),150,true));
    objs.add(Planet(400,300,20,new Vec2(0,0),90,false));
    objs.add(Target(200,300,10,new Vec2(0,0),true,1));
    objs.add(Target(400,350,10,new Vec2(0,0),true,2));
    return objs;
  }
}