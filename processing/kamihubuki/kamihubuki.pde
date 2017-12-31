ArrayList<Particle> particles;
ParticleSystem ps;
ArrayList<ParticleSystem> systems;
Repeller repeller;

void setup(){
  background(255);
  size(640,360);
  particles = new ArrayList<Particle>();
  systems = new ArrayList<ParticleSystem>();
  repeller = new Repeller(width/2 - 20, height/2);
}

void draw(){
  background(255);
  PVector gravity = new PVector(0,0.1);
  
  for(ParticleSystem ps : systems){
    ps.addParticle();
    ps.applyForce(gravity);
    ps.applyRepeller(repeller);
    ps.run();
    repeller.display();
  }
}
void mousePressed(){
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}