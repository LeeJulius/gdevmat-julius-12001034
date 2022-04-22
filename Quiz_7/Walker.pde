public class Walker 
{
  
  //Motion Varaibles 
  public PVector position = new PVector();
  public PVector velocity = new PVector(5, 8);
  public PVector acceleration = new PVector();
  
  //Direction
  public PVector direction = new PVector();
  
  //Velocity Limit
  public float velocityLimit = 10;
  
  //Scale
  public float scale = 15;
  
  //Constructor
  public Walker()
  {
    //Randomizer
    float gaussian = randomGaussian();
    
    //Set random position
    position.x = random(-500, 500);
    position.y = random(-500, 500);
    
    //Setting Scale
    float scaleStandardDeviation = 5;
    float scaleMean = 20;
    scale = scaleStandardDeviation * gaussian + scaleMean;
  }
  
  public void update()
  {
   //Direction follows the mouse
   if (mouseX != 0 && mouseY != 0) 
   {
     direction.x =  mouseX - Window.windowWidth / 2;
     direction.y =  - (mouseY - Window.windowHeight / 2);
   }
   
   //Setting direction magnitude.
   direction = PVector.sub(direction, this.position);
   this.direction.add(direction.normalize().mult(0.2));
   
   //Moving using acceleration
   this.acceleration = direction;
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity); 
  }
  
  public void render()
  {
    circle(position.x, position.y, scale); 
  }
  
  public void checkEdges() 
  {
    if (this.position.x > Window.right) 
      this.position.x = Window.left;
      
    else if (this.position.x < Window.left)
      this.position.x = Window.right;
      
    if (this.position.y > Window.top)
      this.position.y = Window.bottom;
      
    else if (this.position.y < Window.bottom)
      this.position.y = Window.top;
  }
}
