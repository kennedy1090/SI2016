class LevelMilly extends Level
{
  Level restart(){return new LevelMilly();}
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
    objs.add(new Target(200,300,20,new Vec2(0,0),0.001,true,1, loadImage("$_1.JPG")));
    objs.add(new Target(400,400,7,new Vec2(0,0),true,2));
    objs.add(new Target(600,450,10,new Vec2(0,0),false,1));
    return objs;
  }
  int getRecommendedTime()
  {
    return 40;
  }
  void displayExtra()
  {
       textSize(30);
    fill(255);
    text("Level 5", width/2, height/8);
  fill(255,0,0);
  text("#CLE",199,210);
  text("KYRIE",200,410);
  fill(255,255,0);
  text("23",550,310);
  fill(0,0,255);
 // textSize(12);
  //text("CURRY",400,405);
  }
}