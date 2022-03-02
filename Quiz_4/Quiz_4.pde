void setup() {
  size(1260, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker perlinWalker = new Walker();

void draw() {
  perlinWalker.render();
  perlinWalker.perlinWalk();
}
