void setup() {
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos() {
  float x =  mouseX - Window.windowWidth / 2;
  float y =  - (mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw() {
  background(130);
  
  PVector mouse = mousePos();
  
  stroke(color(256, 140, 200, 40));
  strokeWeight(19);  // Beastly
  line(0, 0, mouse.x, mouse.y);
  
  strokeWeight(12);  // Thicker
  stroke(color(256, 0, 0));
  line(0, 0, mouse.x, mouse.y);
  
  strokeWeight(7);  // Default
  stroke(color(256, 230, 230, 150));
  line(0, 0, mouse.x, mouse.y);
  
  mouse.div(2.2);
  
  strokeWeight(12);  // Thicker
  stroke(color(0, 0, 0));
  line(mouse.x / .8, mouse.y / .8, mouse.x, mouse.y);
  
  println(mouse.mag());

}
