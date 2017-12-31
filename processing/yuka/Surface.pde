class Surface{
  ArrayList<Vec2> surface;
  
  Surface(){
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(0,height/2+50));
    surface.add(new Vec2(width/2,height/2+50));
    surface.add(new Vec2(width,height/2));
    
    Vec2[] vertices = new Vec2[surface.size()];
    
    for(int i = 0; i < vertices.length; i++){
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
    ChainShape chain = new ChainShape();
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain,1);
  }
  
  void display(){
    strokeWeight(1);
    stroke(0);
    fill(0);
    
    beginShape();
    for(Vec2 v: surface){
       vertex(v.x,v.y);
    }
    vertex(width,height);
    vertex(0,height);
    endShape();
  }
}