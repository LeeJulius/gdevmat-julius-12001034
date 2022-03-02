int screenWipe = 300;
int currentTime = 0;

void setup() {
  size(1260, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw() {
 float gaussian = randomGaussian();
 
 float xStandardDeviation = 300;
 float xMean = 0;
 
 float scaleStandardDeviation = 50;
 float scaleMean = 20;
 
 // Plotting position and scale (Using gaussian and random)
 float x = xStandardDeviation * gaussian + xMean;
 float y = random(-330, 330);
 float scale = scaleStandardDeviation * gaussian + scaleMean;
 
 // Randomizing color and Alpha
 float red = random(256);
 float green = random(256);
 float blue = random(256);
 float alpha = random(10, 100);
 
 // Set color
 color randomColor = color(red, green, blue, alpha);
 fill(randomColor);
 stroke(randomColor);

 // Render Circle
 circle(x, y, scale);
 
 // counts how much frames
 if (currentTime != screenWipe) currentTime++;
 
 // clear screen after 300 frames
 if (currentTime == screenWipe) {
  clear();
  currentTime = 0;
 }
 
}
