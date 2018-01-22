class Branch{
  int level, num;
  PointObj[] outerPoints = {};
  PointObj[] midPoints = {};
  PointObj[] projPoints = {};
  Branch[] myBranches = {};
  int maxlevels = 2;
  
  Branch(int lev, int n, PointObj[] points){
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints  = calcStrutPoints();
    if((level+1) < maxlevels){
      Branch childBranch = new Branch(level + 1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      
      for(int k = 0; k < outerPoints.length; k++){
        int nextk = k - 1;
        if(nextk < 0){nextk += outerPoints.length;}
        PointObj[] newPoints = {projPoints[k], midPoints[k],outerPoints[k], midPoints[nextk],projPoints[nextk]};
        childBranch = new Branch(level+1, k+1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }
  
  void drawMe(){
    strokeWeight(5 - level);
    for(int i = 0; i < outerPoints.length; i++){
      int nexti = i + 1;
      if(nexti == outerPoints.length){nexti = 0;}
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    strokeWeight(0.5);
    fill(255, 150);
    for(int j = 0; j < midPoints.length;j++){
      ellipse(midPoints[j].x, midPoints[j].y, 15,15);
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y);
      ellipse(projPoints[j].x,projPoints[j].y, 15, 15);
    }
    for(int k = 0; k < myBranches.length; k++){
      myBranches[k].drawMe();
    }
  }
  
  PointObj[] calcMidPoints(){
    PointObj[] mpArray = new PointObj[outerPoints.length];
    for(int i = 0; i < outerPoints.length; i++){
      int nexti = i+1;
      if( nexti == outerPoints.length){nexti = 0;}
      PointObj midPoint = calcMidPoint(outerPoints[i], outerPoints[nexti]);
      mpArray[i] = midPoint;
    }
    return mpArray;
  }
  
  PointObj calcMidPoint(PointObj end1, PointObj end2){
    float mx, my;
    if(end1.x > end2.x){
      mx = end2.x + ((end1.x - end2.x) / 2);
    }else{
      mx = end1.x + ((end2.x - end1.x) / 2);
    }
    if(end1.y > end2.y){
      my = end2.y + ((end1.y - end2.y) / 2);
    }else{
     my = end1.y + ((end2.y - end1.y) / 2); 
    }
   
    return new PointObj(mx, my);
  }
  
  PointObj[] calcStrutPoints(){
    PointObj[] strutArray = new PointObj[midPoints.length];
    for(int i = 0; i < midPoints.length; i++){
      int nexti = i + 3;
      if(nexti >= midPoints.length){nexti -= midPoints.length;}
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);
      strutArray[i] = thisSP;
    }
    return strutArray;
  }
  
  PointObj calcProjPoint(PointObj mp, PointObj op){
    float px,py;
    float adj, opp;
    
    if(op.x > mp.x){
      opp = op.x - mp.x; 
      px = mp.x + (opp * strutFactor);
    }else{
      opp = mp.x - op.x; 
      px = mp.x - (opp * strutFactor);
    }
    
    if(op.y > mp.y){
      adj = op.y - mp.y;
      py = mp.y + (adj * strutFactor);
    }else{
      adj = mp.y - op.y;
      py = mp.y - (adj * strutFactor);
    }
    
    return new PointObj(px,py);
    
    
  }
}