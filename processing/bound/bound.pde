Pvector location;
Pvector velocity;

void setup(){
  size(640,360);
  location = new Pvector(100,100);
  velocity = new Pvector(2.5,5);
}

void draw(){
  background(255);
  location.add(velocity);
  println(location.x,velocity.x);
  println(location.y,velocity.y);
  
  if( (location.x > width) || (location.x < 0)){
    velocity.x *= -1;
  }
  if((location.y > height) || (location.y < 0)){
    velocity.y *= -1;
  }
  fill(175, 10);
  ellipse(location.x,location.y,60,60);
}