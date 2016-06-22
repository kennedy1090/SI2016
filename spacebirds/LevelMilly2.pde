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
    obj2.add(new Planet(500,400,60,new Vec2(0,0),100,true));
    obj2.add(new Target(100,300,30,new Vec2(0,0),0.001,true,4, loadImage("black-cat.jpg")));
    obj2.add(new Target(200,400,20,new Vec2(0,0),0.001,true,5,loadImage("black-cat.jpg")));
    obj2.add(new Target(650,150,35,new Vec2(0,0),1.0,false,4,loadImage("black-cat.jpg")));
    return obj2;
  }
  void displayExtra(){
         textSize(30);
    fill(255);
    text("Level 8", width/2, height/8);
      }
  int getRecommendedTime()
  {
    return 20;
  }
  void dispalyExtra()
  {
    fill(0,0,199);
    text("CRUSH THE CATS",width/2,height/5);
}