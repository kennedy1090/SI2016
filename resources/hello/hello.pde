import shiffman.box2d.*;

PImage img;


void setup() {
    size(750,500);
    smooth();
    background(255); // Set background to white
    img = loadImage("http://www.clipart-box.com/zoom/target-01.jpg");
    
    
}


void draw () {
 
    
  
    display();
   
    if(key == ' ')
    {
      img = loadImage("target_shattered_ab.jpg");
      
    }
}