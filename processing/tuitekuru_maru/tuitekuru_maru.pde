Mover mover;

void setup(){
  mover = new Mover();
  size(640,360);
}

void draw(){
  
  background(255);
  mover.update();
  mover.checkEdge();
  mover.display();
}