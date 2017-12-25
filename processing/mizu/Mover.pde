class Mover{
  Pvector location;
  Pvector velocity; // sokudo
  Pvector acceleration; // kasokudo
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
   acceleration.mult(0);
  }
  
  void display(){
   stroke(0);
   fill(175);
   ellipse(location.x,location.y,mass * 16,mass * 16);
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
}