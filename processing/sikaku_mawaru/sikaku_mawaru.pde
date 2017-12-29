Mover[] movers = new Mover[5];
  float r = 0;
  float theta = 0;
void setup(){
  size(640,360);
  for(int i = 0; i < movers.length;i++){
    movers[i] = new Mover(random(1,3),random(width),random(height));
  }
  background(255);
}

void draw(){
  background(255);
 
  for(int i = 0; i < movers.length; i++){
    Pvector wind  = new Pvector(random(-1,1),random(0,1));
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}