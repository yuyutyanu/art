class Mover{
  Pvector location;
  Pvector velocity; // sokudo
  Pvector acceleration; // kasokudo
  float angle = 0;
  float aVelocity;
  float aAcceleration;
  float mass; // situryo
  
  /*
   property 
   float m : situryou,
   float x : x jiku
   float y : y jiku
  */
  Mover(float m, float x, float y){
   location = new Pvector(x,y);
   velocity = new Pvector(0,0);
   acceleration = new Pvector(0,0);
   mass = m;
  }
  
  void update(){
   velocity.add(acceleration);
   location.add(velocity);
   aAcceleration = acceleration.x;
   aVelocity += aAcceleration;
   angle += aVelocity;
   acceleration.mult(0);
  }
  
  void display(){
   stroke(0);
   fill(175,200);
   rectMode(CENTER);
   pushMatrix();
   translate(location.x,location.y);
   rotate(angle);
   rect(0,0,mass*16,mass*16);
   popMatrix();
  }
  
  void checkEdge(){
   if(location.x > width){
    location.x = width;
    velocity.x *= -1;
   }else if (location.x < 0) {
     velocity.x *= -1;
     location.x = 0;
   }
   if(location.y > height){
     velocity.y *= -1;
     location.y = height;
   }
  }
  
  void applyForce(Pvector force){
     Pvector f = Pvector.div(force, mass);
     acceleration.add(f); 
  }
  
   Pvector attract(Mover m){
    Pvector force = Pvector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25);
    force.normalize();
    float strength = (1 * mass * m.mass) / (distance * distance );
    force.mult(strength);
    return force;
  }
}