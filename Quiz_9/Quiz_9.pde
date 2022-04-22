//Defining entities
Walker[] walkers = new Walker[8];
PVector wind = new PVector(0.2, 0);

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  createCanvas();
}

void draw()
{
  background(80);
  
  for(Walker w : walkers) {
    //Reposition Walker
    w.update();
    w.render();
    //Wind Force
    w.applyForce(wind);
    
    //Apply appropriate Fricitonal Force based on position
    if (w.position.x < 0)
      w.applyForce(setFriction(0.01, w));
      
    else 
      w.applyForce(setFriction(0.4, w));
  }
  
  // Line to mark middle.
  createLine();
  
}

//Restarting if mouse clicked
void mouseClicked() {
  clear();
  createCanvas();
 }
 
//Draw line
void createLine() {
  strokeWeight(4);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line (0, 360, 0, -360);
}

//Spawning 10 Walkers.
void createCanvas() {
  for(int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker(i);
  }
}


//Set friction
PVector setFriction(float mew, Walker walker) {  
    float normal = 1;
    float frictionMagnitude = mew * normal; 
    PVector friction = walker.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude); 
    
    return friction;
}
