import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Surface surface;

void setup(){
  size(500,300);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  surface = new Surface();
}

void draw(){
  box2d.step();
  
  background(255);
  surface.display();
}