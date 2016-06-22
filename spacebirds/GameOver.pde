class GameOver extends Level {
  int score;
  boolean enteringName;
  ArrayList[] scoress;
  ArrayList<GravObj> addGravs(){return new ArrayList<GravObj>();}
  GameOver(int _score){
    score=_score;
    enteringName = true;
    scoress = SQLScores.getScores();
  }
  void enterName(String name){
    enteringName = false;
    SQLScores.enterScore(name, score);
  }
  void displayExtra(){
    background(255);
    fill(50);
    text("You "+(score>0?"win!":"lose..."),width/2, height/2-80);
    text("Final score: "+score,width/2, height/2-40);
    if(enteringName){
      fill(255);
      stroke(0);
      rect(width/2-100, height/2-20, 200, 40);
      fill(50);
      text(text, width/2, height/2+10);
    }else{
      text("Press E to restart",width/2, height/2);
    }
    textSize(20);
    text("High Scores:",width/2, height/2+80);

    for(int i = 0; i < 5 && i < scoress[0].size(); i++){
      text(scoress[0].get(i)+"  "+scoress[1].get(i),width/2, height/2+110+30*i);
    }
  }
  Level nextLevel(){return null;}
  Level restart(){
    scoreboard.addScore(-scoreboard.score);
    return new System();
  }
  int getRecommendedTime(){return 0;}
  void finish(){};
}