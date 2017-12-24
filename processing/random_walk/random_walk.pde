
Walker w;

void setup(){
  size(640, 360);
  w = new Walker();
  background(255);
}
  
void draw(){
  for(int i = 0; i < 500; i++){
    w.step();   
    w.display();
  }
}