float currentTime = 0;
float maxFrequency = 2;

float frequency = 1;
float amplitude = 15;

int scale = 15;

void setup() {
  size(1260, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void drawCartesianPlane() {
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  
  line (360, 0, -360, 0);
  line (0, 360, 0, -360);
  
  for (int i = -360; i<= 360; i += scale) {
   line (i, -5, i, 5);
   line (5, i, -5, i);
  }
}

void drawParabola() {
  // coloring parabola
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  // drawing parabola
  for (float x = -300; x <= 300; x += 0.1f) {
    circle(x * scale, x*x - 15 * x - 3, 3);
  }
}

void drawLinearFunction() {
  // coloring linear function
  color purple = color(127, 0, 255);
  fill(purple);
  stroke(purple);
  
  // drawing the linear function
  for (float x = -360; x <= 360; x += 0.1f) {
    circle(x * scale, -(5 * x) + 30, 3);
  }
}

void drawSinWave() {
  // coloring sin wave
  color lightBlue = color(0, 150, 200);
  fill(lightBlue);
  stroke(lightBlue);
  
  // drawing the sine wave (moving) 
  for (float x = -360; x <= 360; x+=0.1f) {
     circle(x * scale, amplitude * (float)Math.sin(x + currentTime), 3);
  }
  
  // making sin wave move
  currentTime += frequency;
  if (currentTime == maxFrequency) currentTime = 0; 
}


void sinWaveManipulation() {
  
  // making sin wave slower when left arrow key is pressed
  if (keyPressed && keyCode == LEFT && frequency >= 0) {
    frequency -= 0.1f;
  }
  
  // making sin wave faster when right arrow key is pressed
  if (keyPressed && keyCode == RIGHT && frequency <= maxFrequency) {
    frequency += 0.1f;
  }
  
  // making sin wave peak higher when up key is pressed
  if (keyPressed && keyCode == UP) {
    amplitude += 15;
  }
  
  // making sin wave peak lower when down key is pressed
  if (keyPressed && keyCode == DOWN && amplitude != 0) {
    amplitude -= 15;
  }
}

void draw() {
  background(0);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawParabola();
  drawSinWave();
  sinWaveManipulation();

}
