int screenWipe = 1000;
int currentTime = 0;

Walker blackhole = new Walker();
Walker[] walkers = new Walker[100];

void createCanvas() {
   blackhole.spawnCircle(Type.BLACKHOLE);
  
  for(int i = 0; i < 100; i++) {
    walkers[i] = new Walker();
    walkers[i].spawnCircle(Type.WALKER);
  }
}

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  background(0);
  createCanvas();
}

void draw() {
  background(0);
  
  for (int i = 0; i < 100; i++)
  walkers[i].movement(Type.WALKER, blackhole);
  
  blackhole.movement(Type.BLACKHOLE, null);
  
  currentTime++;
  
 // reset screen after 1000 frames
 if (currentTime == screenWipe) {
  clear();
  createCanvas();
  currentTime = 0;
 }
 
}
