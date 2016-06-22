class LevelMilly2 extends Level
{
  Level restart()
  {
    return new LevelMilly2();
  }
  Level nextLevel()
  {
    return new LevelJayanth2();
  }
  ArrayList<GravObj> addGravs()
  {
    ArrayList<GravObj> obj2 = new ArrayList<GravObj>();
    obj2.add(new Planet(200,200,80,new Vec2(0,0),20,true));
    obj2.add(new Planet(500,400,60,new Vec2(0,0),40,true));
    obj2.add(new Target(100,300,30,new Vec2(0,0),0.001,true,4, loadImage("black-cat.jpg")));
    obj2.add(new Target(200,400,20,new Vec2(0,0),0.001,true,5,loadImage("black-cat.jpg")));
    obj2.add(new Target(600,450,35,new Vec2(0,0),0.001,false,4,loadImage("black-cat.jpg")));
    return obj2;
  }
  int getRecommendedTime()
  {
    return 20;
  }
}