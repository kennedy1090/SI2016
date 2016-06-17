float SunDiam = 80; 

float VenusDiam = 24;
float VenusOrbitRadius = 120; 
float VenusAngle = 0;

float EarthDiam = 30;
float EarthOrbitRadius = 200;
float EarthAngle = 0;

float MoonDiam = 6;
float MoonOrbitRadius = 26;
float MoonAngle = 0;

void setup() {
  size(1024,768);
  
  frameRate(30);
}

void draw() {
  background(0,0,0);    
  translate(width/2,height/2);   
  noStroke();
  
  fill(255,200,64);              
  ellipse(0,0,SunDiam,SunDiam);  
    

  pushMatrix();
  
 
  rotate(VenusAngle);
  
 
  translate(VenusOrbitRadius,0);
  
  fill(155,135,95);
  ellipse(0,0,VenusDiam,VenusDiam);
  
  popMatrix();
  
  rotate(EarthAngle);
  
  translate(EarthOrbitRadius, 0);
  
  fill(64,64,255);                   
  ellipse(0,0,EarthDiam,EarthDiam);  
  
 
  rotate(MoonAngle);
  
 
  translate(MoonOrbitRadius,0);
  
  fill(192,192,180);    
  ellipse(0,0,MoonDiam,MoonDiam);  
  
  VenusAngle += 0.008;
  EarthAngle += 0.005;
  MoonAngle += 0.02;
}