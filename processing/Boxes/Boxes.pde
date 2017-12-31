import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;


void setup(){
  size(400,300);
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
}

void draw(){
  background(255);
  
  if(mousePressed){
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for(Box d: boxes){
    d.display();
  }
  
  box2d.step();
  
  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
}