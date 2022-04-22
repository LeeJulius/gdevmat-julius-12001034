
Matter[] matter = new Matter[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   
  //Creating matter
  for(int i = 0; i < matter.length; i++)
     matter[i] = new Matter();
}

void draw()
{
  background(80);
  
  for(int i = 0; i < matter.length; i++) {
      
      //Calculating Gravatitational Attraction with each other
      for(int j = 0; j < matter.length; j++) {
        
        if (matter[i] != matter[j]) {
          matter[j].applyForce(matter[i].calculateAttraction(matter[j]));
        }
        
      }
      
      //Updating positions.
      matter[i].update();
      matter[i].render();
  }
}
