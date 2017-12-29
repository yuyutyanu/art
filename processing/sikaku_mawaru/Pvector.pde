static class Pvector{
  float x;
  float y;
  Pvector(float x_, float y_){
    x = x_;
    y = y_;
  }
  static Pvector add(Pvector v1, Pvector v2){
    return new Pvector(v1.x + v2.x , v1.y + v2.y );
  }
  static Pvector sub(Pvector v1, Pvector v2){
    return new Pvector(v1.x - v2.x, v1.y - v2.y);
  }
  static Pvector div(Pvector force, float mass){
    return  new Pvector(force.x / mass, force.y /mass);
  } 
  Pvector get(){
    return new Pvector(x,y);
  }
  
  void add(Pvector v){
    x += v.x;
    y += v.y;
  }
  void mult(float n){
   x*=n;
   y*=n;
  }
  void div(float n){
   x /=n;
   y /=n;
  }
  float mag(){
   return sqrt(x*x + y*y);
  }
  void normalize() {
   float m = mag();
   if(m != 0){
    div(m);
   }
  }
  void limit (float max, float min){
    if(x > max){
      x = max;
    }
    if(y > max){
      y = max;
    }
    
    if(x < min){
      x = min;
    }
    if(y < min){
      y = min;
    }
  }
  //Pvector random2D(){
  //   Pvector acceleration = new Pvector(random(-1,1),random(-1,1));
  //   acceleration.normalize();
  //   return acceleration;
  //}
}