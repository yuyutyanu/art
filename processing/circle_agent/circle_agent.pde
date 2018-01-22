int num = 10;
Circle[] circleArr = {};
void setup(){
  size(1000,600);
  background(255);
  smooth();
  strokeWeight(0.3);
  fill(150,50);
  drawCircles();
}
void draw(){
  //background(255);
  for(int i = 0; i < circleArr.length; i++){
     Circle circle = circleArr[i];
     circle.updateMe();
  }
}

void mousePressed(){
  drawCircles();
}

void drawCircles(){
  for(int i = 0; i< num; i++){
    Circle circle = new Circle();
    circle.drawMe();
    circleArr = (Circle[])append(circleArr, circle);
  }
}