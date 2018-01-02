ArrayList <Vehicle> vehicles;

void setup(){
  background(255);
  size(640,360);
  vehicles = new ArrayList<Vehicle>();
}

void draw(){
  background(255);
  
  PVector target = new PVector(300,300);
  fill(255);
  stroke(0);
  ellipse(target.x,target.y, 48, 48);
  
  if(mousePressed){
    vehicles.add(new Vehicle(mouseX,mouseY));
  }
  
  for(Vehicle vehicle: vehicles){
    vehicle.arrive(new PVector(300,300));
    vehicle.update();
    vehicle.display();
  }
}