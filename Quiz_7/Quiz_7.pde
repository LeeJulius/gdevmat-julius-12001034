Walker[] walkers = new Walker[100];

int screenWipe = 300;
int currentTime = 0;

// Creating Canvas
void createCanvas() {
  for(int i = 0; i < 100; i++) {
    walkers[i] = new Walker();
  }
}

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  createCanvas();
}

void draw()
{
  background(80);
  
  //Rendering Walkers
  for(Walker w : walkers) {
    w.update();
    w.render();
    w.checkEdges();
  }
  
  currentTime++;
  
  //Restart Canvas
  if (currentTime == screenWipe) {
    clear();
    createCanvas();
    currentTime = 0;
  }  
}
