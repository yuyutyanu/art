class Mover{
  Pvector location;
  Pvector velocity;
  Pvector acceleration;
  float maxspeed;
  float minspeed;
  
  Mover(){
   location = new Pvector(random(width),random(height));
   velocity = new Pvector(0,0);
   acceleration = new Pvector(0,0);
   maxspeed = 4;
   minspeed = -4;
  }
  void update(){
   Pvector mouse =  new Pvector(mouseX,mouseY);
   Pvector dir = Pvector.sub(mouse,location);
   dir.normalize();
   dir.mult(0.5);
   acceleration = dir;
   velocity.add(acceleration); 
   velocity.limit(maxspeed, minspeed);
   println(velocity.x,velocity.y);
   location.add(velocity);
  }
  void display(){
   stroke(0);
   fill(175);
   ellipse(location.x,location.y,60,60);
  }
  
  void checkEdge(){
    if(location.x > width) location.x = 0;
    else if(location.x < 0) location.x = width;
    if(location.y > height) location.y = 0;
    else if(location.y < 0) location.y = height;
  }
}