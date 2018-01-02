class Vehicle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;
  float r;
  
  Vehicle(float x, float y){
    acceleration = new PVector(0,0);
    velocity = new PVector(520,0);
    location = new PVector(x,y);
    r = 3.0;
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    float theta = velocity.heading() + PI/2 ;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r * 2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void arrive(PVector target){
    PVector desired = PVector.sub(target,location);
    
    float d = desired.mag();
    desired.normalize();
    
    if(d < 100){
      float m = map(d ,0, 100,0,maxspeed);
      desired.mult(m);
    }else{
      desired.mult(maxspeed);
    }
    
    println(desired,velocity);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    
  }
}