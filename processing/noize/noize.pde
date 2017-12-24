import java.util.Random;

Random generator;


void setup(){
  size(640,360);
  background(255);
  loadPixels();
  float xoff = 0.0;
  float yoff = 0.0;
  for (int x = 0; x < width; x++){ 
    for(int y = 0; y < height; y++){
      float bright = map(noise(xoff,yoff),0,1,0,255);
      pixels[y*width + x] = color(bright);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels();
}