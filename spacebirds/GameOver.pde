class GameOver extends Level {
  int score;
  ArrayList<GravObj> addGravs(){return new ArrayList<GravObj>();}
  GameOver(int _score){
    score=_score;
  }
  void displayExtra(){
    background(255);
    fill(50);
    text("You "+(score>0?"win!":"lose..."),width/2, height/2);
    text("Final score: "+score,width/2, height/2+50);
    text("Press E to restart.",width/2, height/2+100);

  }
  Level nextLevel(){return null;}
  Level restart(){
    scoreboard.addScore(-scoreboard.score);
    return new System();
  }
  int getRecommendedTime(){return 0;}
  void finish(){};
}