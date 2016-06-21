class score {
int shots = 0;
int score = 0;

float score_x = 20;
float score_y = height - 20;

  score() {
  }
  
  void displayScore(int targetsRed, int targetsBlue, int shotsTotal){
    score = targetsRed * 500 + targetsBlue * 300;
    shots = shotsTotal;
    textSize(30);
    text("Shots: " + shots, score_x, score_y - 35);
    text("Score: " + score, score_x, score_y);
  }
}