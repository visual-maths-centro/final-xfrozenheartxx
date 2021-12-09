class Cell {
  
  PVector position;
  PVector ntPos;
  PVector center = new PVector(width/2,height/2);
  float radius;

  
 Cell(float x, float y, float radius, float nx, float ny){
   this.position = new PVector(x, y);
   this.radius = radius;
   this.ntPos = new PVector(nx, ny);
 }
 
 void render(){
   noStroke();
   fill(100);
 ellipse(this.position.x,this.position.y,this.radius*2,this.radius*2);
 
   line(this.position.x,this.position.y,this.ntPos.x,this.ntPos.y);
   
 }
 
 void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/3.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

 
}
