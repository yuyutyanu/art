class Box {
  float w,h;
  Body body;
  
  Box(float x_, float y_){
    w = 16;
    h = 16;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw,box2dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }
  
  void display(){
   Vec2 pos = box2d.getBodyPixelCoord(body);
   float a = body.getAngle();
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(-a);
   fill(175);
   stroke(0);
   rectMode(CENTER);
   rect(0,0,w,h);
   popMatrix();
  }
}