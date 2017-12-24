
int x = width / 2;
int y = height / 2;
void setup(){
  stroke(0);
  background(255);
  size(640,360);
}

void draw(){
  float num = random(1);
  if(num < 0.4) x++;
  else if(num < 0.6) x--;
  else if(num < 0.8) y++;
  else y--;
  point(x,y);
}