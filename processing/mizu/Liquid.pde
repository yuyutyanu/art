class Liquid{
  float x,y,w,h;
  float c;
  
  Liquid(float x_, float y_,float w_ , float h_, float c_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display(){
    noStroke();
    fill(175);
    rect(x,y,w,h);
  }
  
  boolean contains(Mover m){
   Pvector l  = m.location;
   return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  // teikou
  Pvector drag(Mover m){
    float speed = m.velocity.mag();
    float dragMag = c * speed * speed;
    
    Pvector dragForce = m.velocity.get();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }
  
}