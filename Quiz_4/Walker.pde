public class Walker {
 public float x, y;
 public float tx = 0, ty = 10000;
 
 public float r, g, b;
 public float thick;
 
 public float tr = 700, tg = 500, tb = 400;
 public float tthick = 10;
 
 void render() {
  // creating circle
  color randomColor = color(r, g, b);
  fill(randomColor);
  stroke(randomColor);
   
  circle(x, y, thick);
 }
 
 void perlinWalk() {
  // changing position
  x = map(noise(tx), 0 , 1, -640, 640);
  y = map(noise(ty), 0 , 1, -640, 640);
  
  tx += 0.01f;
  ty += 0.01f;
  
  // changing colors
  r = map(noise(tr), 0 , 1, 0, 255);
  g = map(noise(tb), 0 , 1, 0, 255);
  b = map(noise(tg), 0 , 1, 0, 255);
  
  tr += 0.01f;
  tg += 0.01f;
  tb += 0.01f;
  
  // chanigng thickness
  thick = map(noise(tthick), 0 , 1, 5, 150);
  tthick += 0.01f;
 }
}
