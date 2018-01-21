  float xstart, xnoise, ystart, ynoise ,xstartNoise,ystartNoise;
void setup(){
  size(600,600);
  background(0);

  smooth();
  frameRate(24);
  xstart = random(10);
  ystart = random(10);
  xstartNoise = random(20);
  ystartNoise = random(20);
  
 
}

void draw(){
  background(0,0,255);
  xstartNoise +=0.01;
  ystartNoise +=0.01;
  xstart += (noise(xstartNoise) * 0.5) - 0.25;
  ystart += (noise(ystartNoise) * 0.5) - 0.25;
 
  xnoise = xstart;
  ynoise = ystart;
  for(int y = 0; y <= height; y+=5){
    ynoise += 0.01;
    xnoise = xstart;
    for(int x = 0; x <= width; x+=5){
      xnoise += 0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(360));
  float edgeSize = noiseFactor * 35;
  float grey = 100 + (noiseFactor * 170);
  float alph = 100 + (noiseFactor * 170);
  noStroke();
  fill(grey, alph);
  ellipse(0,0,edgeSize, edgeSize /2 );
  popMatrix();
}