void setup() {
  size(1260, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker walker = new Walker();
Walker biasedWalker = new Walker();

void draw() {
  
  walker.render();
  walker.randomColor();
  walker.randomDirection();
  
  biasedWalker.render();
  biasedWalker.biasedDirection();
}
