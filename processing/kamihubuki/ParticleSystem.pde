import java.util.Iterator;

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.get();
    particles = new ArrayList();
  }
  void addParticle(){
    float r = random(1);
    if(r < 0.5){
     particles.add(new Particle(origin));   
    }else{
     particles.add(new Confetti(origin));  
    }
  }
  void run(){
    Iterator<Particle> it = particles.iterator();
  
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }
  }
  void applyForce(PVector f){
    for(Particle p : particles){
      p.applyForce(f);
    }
  }
  void applyRepeller(Repeller r){
    for(Particle p: particles){
     PVector force = r.repel(p); 
     p.applyForce(force);
    }
  }
}