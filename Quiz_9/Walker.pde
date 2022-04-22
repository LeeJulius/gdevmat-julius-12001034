public class Walker 
{
  //Motion Variables
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  //Set Direction
  public PVector direction = new PVector();
  
  //Setting Walker Size
  float scale;
  public float mass;
  
  //Setting Color
  color chosenColor;
  float r, g, b;
  
  //Setting Position, Color, and Size
  public Walker(float i)
  {
    this.mass += 10 * (i + 1);
    scale = mass;
    
    r = random(256);
    g = random(256);
    b = random(256);
    
    chosenColor = color(r, g, b);
    
    position.x = -550;
    position.y = 2 * (Window.windowWidth / 2 / 8) * (i - (8 / 2));
  }
  
  //Update Position
  public void update()
  {
   this.velocity.add(this.acceleration);
   this.position.add(this.velocity); 
   this.acceleration.mult(0);
  }
  
  //Render Walker
  public void render()
  {
    circle(position.x, position.y, scale); 
    fill(chosenColor);
    stroke(chosenColor);
  }
  
  //Newton's Second Law of Motion
  public void applyForce(PVector force)
  { 
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }
}
