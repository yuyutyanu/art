class Pvector{
  float x;
  float y;
  Pvector(float x_, float y_){
    x = x_;
    y = y_;
  }
  void add(Pvector v){
    x += v.x;
    y += v.y;
  }
}