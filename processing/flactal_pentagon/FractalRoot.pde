class FractalRoot{
  
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;
  FractalRoot(float startAngle){
    float centerX = width / 2;
    float centerY = height / 2;
    float radius = 400;
    int count = 0;
    
    
    for(float i = 0; i < 360; i += 72){
      float x = centerX + (radius * cos(radians(startAngle + i)));
      float y = centerY + (radius * sin(radians(startAngle + i)));
      pointArr[count] = new PointObj(x,y);
      count++;
    }
    rootBranch = new Branch(0,0, pointArr);
  }
  
  void drawShape(){
    rootBranch.drawMe();
  }

}