void setup(){
  size(640,360);
}

void draw(){
  background(255);
  
  float period = 120;
  float xAmplitude = 220;
  float yAmplitude = 100;
  float x = xAmplitude * cos(TWO_PI * frameCount/120);
  float y = yAmplitude * sin(TWO_PI * frameCount/120);
  stroke(0);
  fill(175);
  translate(width/2,height/2);
  line(0,0,x,0);
  line(0,0,0,y);
  ellipse(x,0,20,20);
  ellipse(0,y,20,20);
}