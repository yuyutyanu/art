FractalRoot pentagon;
float strutFactor = 0.2;
float strutNoise;
int maxlevels = 4;
int numsides = 3;
void setup(){
  size(1000,1000);
  background(255);
  smooth();
  strutNoise = random(10);
}

void draw(){
  background(255);
  strutNoise += 0.01;
  strutFactor = noise(strutNoise) * 2;
  pentagon = new FractalRoot(frameCount);
  pentagon.drawShape();
}