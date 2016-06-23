class GameOver extends Level {
  int score;
  float time;
  boolean enteringName;
  ArrayList[] scoress;
  ArrayList<GravObj> addGravs(){return new ArrayList<GravObj>();}
  GameOver(int _score){
    time = (millis()-speedrun)/1000f;
    score=_score;
    enteringName = true;
    try{
      URL whatismyip = new URL("http://checkip.amazonaws.com/");
      BufferedReader in = new BufferedReader(new InputStreamReader(whatismyip.openStream()));
      String ip = in.readLine();
      if(ip.substring(0,10).equals("131.187.80"))scoress = SQLScores.getScores();
    }catch(Exception e){}
  }
  void enterName(String name){
    enteringName = false;
    if(scoress!=null)
    try{
      SQLScores.enterScore(name, score);
    }catch(Exception e){return;}
  }
  void displayExtra(){
    background(255);
    fill(50);
    text("You "+(score>0?"win!":"lose..."),width/2, height/2-80);
    text("Final score: "+score,width/2, height/2-40);
    text("Time: "+time,width/2, height/2);

    if(enteringName){
      fill(255);
      stroke(0);
      rect(width/2-100, height/2+20, 200, 40);
      fill(50);
      text(text, width/2, height/2+50);
    }else{
      text("Press E to restart",width/2, height/2+40);
    }
    textSize(20);
    text("High Scores:",width/2, height/2+120);
    if(scoress!=null)
    for(int i = 0; i < 5 && i < scoress[0].size(); i++){
      text(scoress[0].get(i)+"  "+scoress[1].get(i),width/2, height/2+150+30*i);
    }
    else text("Can't connect to server ;(", width/2, height/2 + 150);
  }
  Level nextLevel(){return null;}
  Level restart(){
    scoreboard.addScore(-scoreboard.score);
    scoreboard.shots = 0;
    return new System();
  }
  int getRecommendedTime(){return 0;}
  void finish(){};
}