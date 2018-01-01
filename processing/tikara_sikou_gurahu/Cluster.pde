class Cluster {
  ArrayList<Node> nodes;
  
  float diameter;
  
  Cluster(int n, float d, Vec2D center){
    nodes = new ArrayList<Node>();
    diameter = d;
    
    for(int i = 0; i < n; i++){
      nodes.add(new Node(center.add(Vec2D.randomVector())));
    }
    
    for(int i = 0; i< nodes.size()-1; i++){
      VerletParticle2D ni = nodes.get(i);
      for(int j = i+1; j < nodes.size(); j++){
       VerletParticle2D nj = nodes.get(j);
       physics.addSpring(new VerletSpring2D(ni,nj,diameter,0.01));
      }
    }
  }
  ArrayList<Node> getNodes(){
    return nodes;
  }
  void display(){
 
    //for (Node n : nodes) {
    //  n.display();
    //}
    
    for (int i = 0; i < nodes.size()-1; i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);
        stroke(0, 150);
        strokeWeight(2);
        line(pi.x, pi.y, pj.x, pj.y);
      }
    }
  }
  void otherClusterConnect(Cluster other){
    ArrayList<Node> otherNodes = other.getNodes();
    
    for(int i = 0; i < nodes.size(); i++){
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for(int j = 0; j < otherNodes.size(); j++){
        VerletParticle2D pj = (VerletParticle2D) otherNodes.get(j);
        line(pi.x,pi.y,pj.x,pj.y);
      }
    }
  }
}