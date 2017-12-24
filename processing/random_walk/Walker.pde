class Walker {
  int x;
  int y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }
  void display(){
    stroke(0);
    point(x,y);
  }
  void step(){
   Float stepx = random(3) - 1;
   Float stepy = random(3) - 1;
   
   x += stepx;
   y += stepy;
  } 
}