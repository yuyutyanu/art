import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Cluster> clusters;
void setup(){
  size(640,360);
  physics = new VerletPhysics2D();
  clusters = new ArrayList <Cluster>();
  for(int i = 0; i < 1; i++){
     clusters.add(new Cluster(20,150,new Vec2D(random(width),random(height))));
  }  
}

void draw(){
  physics.update();
  background(255);
  
  for(int i = 0; i < clusters.size();i++){
     Cluster cluster = clusters.get(i);
     cluster.display();
     if(i != 0){
       cluster.otherClusterConnect(clusters.get(i-1));
     }
  }
}