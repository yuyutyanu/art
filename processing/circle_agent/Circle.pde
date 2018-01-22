class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove,ymove;
  
  Circle(){
    x = random(width);
    y = random(height);
    
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255));
    alph = random(10);
    
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }
  
  void drawMe(){
    noStroke();
    fill(fillcol,alph);
    ellipse(x,y,radius*2, radius*2);
    stroke(linecol,150);
  }
  
  void updateMe(){
     x += xmove;
     y += ymove;
     
     if(x > (width + radius)) x = 0 - radius;
     if(x < (0 - radius)) x = width + radius;
     if(y > (height + radius)) y = 0 - radius;
     if(y < (0 - radius)) y = height + radius;
     
     boolean touching = false;
     for(int i = 0; i < circleArr.length;i++){
         Circle otherCircle = circleArr[i];
         if(otherCircle != this){
            float dis = dist(x, y, otherCircle.x, otherCircle.y);
            float overlap = dis - radius - otherCircle.radius;
            if(overlap < 0){
              float midx, midy;
              midx = (x + otherCircle.x) / 2;
              midy = (y + otherCircle.y) / 2;
              stroke(0, 30);
              
              noFill();
              overlap *= 1;
              ellipse(midx, midy, overlap, overlap);
            }
         }
     }
     drawMe();
  }
}