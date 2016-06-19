float SunDiam = 58; 
float factor = 25;
float ORfactor = 1.5;
float MercuryFactor = 1.00125;
float JupiterFactor = 6;
float SaturnFactor = 5;
float UranusFactor = 9;
float NeptuneFactor = 7.99;

float MercuryDiam = .3*factor;
float MercuryOrbitRadius = 32.9875*MercuryFactor;
float MercuryAngle = 0;

float VenusDiam = 0.7*factor;
float VenusOrbitRadius = 68/ORfactor; 
float VenusAngle = 0;

float EarthDiam = .8*factor;
float EarthOrbitRadius = 99/ORfactor;
float EarthAngle = 0;

float MoonDiam = 0.2*factor;
float MoonOrbitRadius = (5/ORfactor)+ (EarthDiam/2);
float MoonAngle = 0;

float MarsDiam = .4*factor;
float MarsOrbitRadius = 143/ORfactor; 
float MarsAngle = 0;

float JupiterDiam = 8.7*JupiterFactor;
float JupiterOrbitRadius = 486/ORfactor; 
float JupiterAngle = 0;

float SaturnDiam = 7.2*SaturnFactor;
float SaturnOrbitRadius = 875/ORfactor; 
float SaturnAngle = 0;

float UranusDiam = 3.1*UranusFactor;
float UranusOrbitRadius = 950/ORfactor;
float UranusAngle = 0;

float NeptuneDiam = 3.0*NeptuneFactor;
float NeptuneOrbitRadius = 1000/ORfactor; 
float NeptuneAngle = 0;

void setup() {
  
  size(1366,768);
  
  frameRate(30);
}

void draw() {
  background(0,0,0);    
  translate(width/2,height/2);   
  noStroke();
  
  fill(255,200,64);              
  ellipse(0,0,SunDiam,SunDiam);  

  pushMatrix();
      rotate(MercuryAngle);
   
  translate(MercuryOrbitRadius,0);
  
  fill(192,192,192);
  ellipse(0,0,MercuryDiam,MercuryDiam);
  
  popMatrix();
  
  pushMatrix();
      rotate(VenusAngle);
   
  translate(VenusOrbitRadius,0);
  
  fill(155,135,95);
  ellipse(0,0,VenusDiam,VenusDiam);
  
  popMatrix();
  
    pushMatrix();
  
       rotate(MarsAngle);
   
  translate(MarsOrbitRadius,0);
  
  fill(250,6,6);
  ellipse(0,0,MarsDiam, MarsDiam);
  
    popMatrix();
    pushMatrix();
  
       rotate(JupiterAngle);
   
  translate(JupiterOrbitRadius,0);
  
  fill(255,165,0);
  ellipse(0,0,JupiterDiam,JupiterDiam);
  
      popMatrix();
    pushMatrix();
 // line(0,0,(SaturnDiam/2),0);
 //   line(0,0,100,100);
  //stroke(250,6,6);
       rotate(SaturnAngle);
   
  translate(SaturnOrbitRadius,0);
  
  fill(238,232,170);
  ellipse(0,0,SaturnDiam,SaturnDiam);
  
        popMatrix();
    pushMatrix();
  
       rotate(UranusAngle);
   
  translate(UranusOrbitRadius,0);
  
  fill(13,152,186);
  ellipse(0,0,UranusDiam,UranusDiam);
  
        popMatrix();
    pushMatrix();
  
       rotate(NeptuneAngle);
   
  translate(NeptuneOrbitRadius,0);
  
  fill(175,238,238);
  ellipse(0,0,NeptuneDiam,NeptuneDiam);
  
  popMatrix();
  
  rotate(EarthAngle);
  
  translate(EarthOrbitRadius, 0);
  
  fill(64,64,255);                   
  ellipse(0,0,EarthDiam,EarthDiam);  
  
 
  rotate(MoonAngle);
  
 
  translate(MoonOrbitRadius,0);
  
  fill(192,192,180);    
  ellipse(0,0,MoonDiam,MoonDiam);  
  
  MercuryAngle += 0.01;
  VenusAngle += 0.008;
  EarthAngle += 0.005;
  MarsAngle += 0.002;
  JupiterAngle += 0.001;
  SaturnAngle += 0.0009;
  UranusAngle += 0.0007;
  NeptuneAngle += 0.0005;
  MoonAngle += 0.02;
}