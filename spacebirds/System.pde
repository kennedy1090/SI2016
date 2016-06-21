 class System extends Level {
   
   ArrayList<GravObj> addGravs(){
     return new ArrayList<GravObj>();
   }
   int getRecommendedTime(){
    return 0;
   }
   Level nextLevel(){
     return new LearningLevel1();
   }
   void finish(){
     if(keysDown[0]){
       currentLevel = nextLevel();
     }
   }
  System() {
     f = createFont("Arial",16,true);
    SunDiam = 58; 
    factor = 25;
    ORfactor = 1.5;
    MercuryFactor = 1.00125;
    JupiterFactor = 6;
    SaturnFactor = 5;
    UranusFactor = 9;
    NeptuneFactor = 7.99;

    MercuryDiam = .3*factor;
    MercuryOrbitRadius = 32.9875*MercuryFactor;
    MercuryAngle = 0;

    VenusDiam = 0.7*factor;
    VenusOrbitRadius = 68/ORfactor; 
    VenusAngle = 0;

    EarthDiam = .8*factor;
    EarthOrbitRadius = 99/ORfactor;
    EarthAngle = 0;

    MoonDiam = 0.2*factor;
    MoonOrbitRadius = (3/ORfactor)+ (EarthDiam/2);
    MoonAngle = 0;

    MarsDiam = .4*factor;
    MarsOrbitRadius = 143/ORfactor; 
    MarsAngle = 0;

    JupiterDiam = 8.7*JupiterFactor;
    JupiterOrbitRadius = 486/ORfactor; 
    JupiterAngle = 0;

    SaturnDiam = 7.2*SaturnFactor;
    SaturnOrbitRadius = 875/ORfactor; 
    SaturnAngle = 0;

    UranusDiam = 3.1*UranusFactor;
    UranusOrbitRadius = 950/ORfactor;
    UranusAngle = 0;

    NeptuneDiam = 3.0*NeptuneFactor;
    NeptuneOrbitRadius = 1000/ORfactor; 
    NeptuneAngle = 0;
  }
  float SunDiam;
  float factor;
  float ORfactor;
  float MercuryFactor;
  float JupiterFactor;
  float SaturnFactor;
  float UranusFactor;
  float NeptuneFactor;

  float MercuryDiam;
  float MercuryOrbitRadius;
  float MercuryAngle;

  float VenusDiam;
  float VenusOrbitRadius;
  float VenusAngle;

  float EarthDiam;
  float EarthOrbitRadius;
  float EarthAngle;

  float MoonDiam;
  float MoonOrbitRadius;
  float MoonAngle;

  float MarsDiam;
  float MarsOrbitRadius;
  float MarsAngle;

  float JupiterDiam;
  float JupiterOrbitRadius;
  float JupiterAngle;

  float SaturnDiam;
  float SaturnOrbitRadius;
  float SaturnAngle;

  float UranusDiam;
  float UranusOrbitRadius;
  float UranusAngle;

  float NeptuneDiam;
  float NeptuneOrbitRadius;
  float NeptuneAngle;
  PFont f;
 void displayExtra(){
     background(0, 0, 0);  
    translate(width/2, height/2);   
    noStroke();

    fill(255, 200, 64);              
    ellipse(0, 0, SunDiam, SunDiam);  

    pushMatrix();
    rotate(MercuryAngle);

    translate(MercuryOrbitRadius, 0);

    fill(192, 192, 192);
    ellipse(0, 0, MercuryDiam, MercuryDiam);

    popMatrix();

    pushMatrix();
    rotate(VenusAngle);

    translate(VenusOrbitRadius, 0);

    fill(155, 135, 95);
    ellipse(0, 0, VenusDiam, VenusDiam);

    popMatrix();
textFont(f,16);
textSize(100);
textAlign(CENTER);
  fill(255);                         
  text("SpaceBirds",0,-125); 
  textSize(25);
  text("(Press Spacebar to play)",0,-100);
    pushMatrix();

    rotate(MarsAngle);

    translate(MarsOrbitRadius, 0);

    fill(250, 6, 6);
    ellipse(0, 0, MarsDiam, MarsDiam);

    popMatrix();
    pushMatrix();

    rotate(JupiterAngle);

    translate(JupiterOrbitRadius, 0);

    fill(255, 165, 0);
    ellipse(0, 0, JupiterDiam, JupiterDiam);

    popMatrix();
    pushMatrix();

    rotate(SaturnAngle);

    translate(SaturnOrbitRadius, 0);

    fill(238, 232, 170);
    ellipse(0, 0, SaturnDiam, SaturnDiam);

    popMatrix();
    pushMatrix();

    rotate(UranusAngle);

    translate(UranusOrbitRadius, 0);

    fill(13, 152, 186);
    ellipse(0, 0, UranusDiam, UranusDiam);

    popMatrix();
    pushMatrix();

    rotate(NeptuneAngle);

    translate(NeptuneOrbitRadius, 0);

    fill(175, 238, 238);
    ellipse(0, 0, NeptuneDiam, NeptuneDiam);

    popMatrix();

    rotate(EarthAngle);

    translate(EarthOrbitRadius, 0);

    fill(64, 64, 255);                   
    ellipse(0, 0, EarthDiam, EarthDiam);  


    rotate(MoonAngle);


    translate(MoonOrbitRadius, 0);

    fill(192, 192, 180);    
    ellipse(0, 0, MoonDiam, MoonDiam);  

    MercuryAngle += 0.01;
    VenusAngle += 0.008;
    EarthAngle += 0.005;
    MarsAngle += 0.003;
    JupiterAngle += 0.001;
    SaturnAngle += 0.0009;
    UranusAngle += 0.0007;
    NeptuneAngle += 0.0005;
    MoonAngle += 0.02;

  } 
}