int timer = 0;
ArrayList<Cell> cells;


void setup(){
  cells = new ArrayList<Cell>();
  Cell centerCell = new Cell(width /9.0, height / 9.5, 10, width / 4.0, height / 1.0); 
  cells.add(centerCell);
    background(0);
  blendMode(DIFFERENCE);
  size(700, 700);


}

void draw(){
  background(255,100,100);
  //background(255,185,228);
  
  if(timer > 10){
    newCell();
    timer = 100;
  }

  Cells();
  
    
  timer++;
}

void newCell(){
  float cellRadius = random(1,50);
  float closestCellR = 2;
  PVector rPos = new PVector(random(width),random(height));
  PVector newPos = new PVector();
  float cellDis = width + height;
  PVector closestCell = new PVector();
  


  for (int i = 0; i < cells.size(); i++) {
    Cell cellLecture = cells.get(i);
    PVector lastPos = new PVector(cellLecture.position.x, cellLecture.position.y);
    float newDist = lastPos.dist(rPos);
    if(newDist < cellDis){
      cellDis = newDist;
      closestCell.x = lastPos.x;
      closestCell.y = lastPos.y;
      closestCellR = cellLecture.radius;
      
    }
  }
  
 newPos = rPos.copy();
 newPos.sub(closestCell);
 
  float TotalRadius = cellRadius + closestCellR;
  float spaceCells = TotalRadius/cellDis;

  cells.add(new Cell(closestCell.x+newPos.x*spaceCells, closestCell.y+newPos.y*spaceCells, cellRadius, closestCell.x, closestCell.y)); 

}

void Cells(){
  for (Cell actualCell : cells) {
    actualCell.render();
  }
}

void keyPressed(){
  saveFrame("fractalchems-##.png");
}
