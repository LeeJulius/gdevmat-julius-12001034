Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 1.f);
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
 
  for(int i = 0; i < walkers.length; i++) {
     walkers[i] = new Walker(i);
  }
}

void draw()
{
  background(255);
 
  ocean.render();
 
  for(Walker w : walkers) {   
   
    w.update();
    w.render();
    w.checkEdges();
    
    w.applyForce(wind);
    w.applyForce(new PVector(0, -0.15f * w.mass));
    w.applyForce(setFriction(w));
    
    if (ocean.isCollidingWith(w)) 
    {
       PVector dragForce = ocean.calculateDragForce(w);
       w.applyForce(dragForce);
    }
  }  
}

void mouseClicked() {
  
  clear();
  
  for(int i = 0; i < walkers.length; i++) {
     walkers[i] = new Walker(i);
  }
}

PVector setFriction(Walker walker) {
    float mew = 0.1f;
    float normal = 1;
    float frictionMagnitude = mew * normal; 
    PVector friction = walker.velocity.copy();
    friction.mult(-1).normalize().mult(frictionMagnitude); 
    
    return friction;
}
