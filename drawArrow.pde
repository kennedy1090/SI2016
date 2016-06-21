//! Function by Christopher Britt
//! Date June 21, 2016
//! Usage: 
//! @param _x The x coordinate for the arrows base. 
//! @param _y The y coordinate for the arrows base. 
//! @param _vx The relative x coordinate for the arrow. 
//! @param _vy The relative y coordinate for the arrow. 
//! @param _r The minimum radius of the arrow. 
//! @param _scale The factor by which to scale the arrow. 
void drawArrow(float _x, float _y, float _vx, float _vy, float _r, float _scale){
  pushMatrix();
  translate(_x,_y);
  
  // Find the inverted angle between the vectors. 
  float _Tangle = atan2(_vy,_vx);
  
  float _Tmag = sqrt(_vx*_vx + _vy*_vy);
  if(_Tmag > 0){
    pushMatrix();
    
    rotate(_Tangle);
    
    float _TlineLength = (_Tmag / 1.41 + _r) * _scale;
    
    pushMatrix();
    
    line(0,0,_TlineLength,0);
    translate(_TlineLength,0);
    
    pushMatrix();
    
    pushMatrix();
    rotate(7*PI/6);
    line(0,0,15,0);
    popMatrix();
    pushMatrix();
    rotate(-7*PI/6);
    line(0,0,15,0);
    popMatrix();
          
    popMatrix();
    
    popMatrix();
    
    popMatrix();
  }
  
  popMatrix();
}