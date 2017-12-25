Mover movers[] = new Mover[12];
Liquid liquid;

float c = 0.01; //masatu keisu
float normal = 1; // suityoku kouryoku
float frictionMag = c * normal;

void setup(){
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0.01,5),random(width/2 -100, width/2 + 100), 0);
  }
  liquid = new Liquid(0, height/2, width, height/2,0.1);
  
  size(640,360);
}

void draw(){
// situryou * kasokudo = tikara
// tikara / situryou = kasokudo 
// tikara / kasokudo = situryou
  
  background(255);
  liquid.display();
  
  Pvector wind = new Pvector(0.01,0);

 
  for(int i = 0; i < movers.length; i++){
     if(liquid.contains(movers[i])){
        Pvector dragForce = liquid.drag(movers[i]);
        movers[i].applyForce(dragForce);
     }
    
    Pvector gravity = new Pvector(0,0.1 * movers[i].mass);
    movers[i].applyForce(gravity);
        
    Pvector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    movers[i].applyForce(friction);
   

    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}