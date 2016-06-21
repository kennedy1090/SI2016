class LevelMilly extends Level
{
  Level nextLevel()
  {
    return null;
  }
  ArrayList<GravObj> addGravs()
  {
    ArrayList<GravObj> objs = new ArrayList<GravObj>();
<<<<<<< HEAD
    objs.add(new Planet(200,200,80,new Vec2(0,0),30,true));
    objs.add(new Planet(200,400,60,new Vec2(0,0),3,true));
    objs.add(new Planet(550,300,40,new Vec2(0,0),50,true));
    objs.add(new Target(200,300,10,new Vec2(0,0),true,1));
    objs.add(new Target(400,400,7,new Vec2(0,0),true,2));
    objs.add(new Target(600,450,10,new Vec2(0,0),false,1));
=======
    objs.add(new Planet(200,200,40,new Vec2(0,0),100,true));
    objs.add(new Planet(200,400,60,new Vec2(0,0),150,true));
    objs.add(new Planet(400,300,20,new Vec2(0,0),90,false));
    objs.add(new Target(200,300,10,new Vec2(0,0),true,1));
    objs.add(new Target(400,350,10,new Vec2(0,0),true,2));
>>>>>>> origin/master
    return objs;
  }
}