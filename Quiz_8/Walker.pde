public class Walker 
{
  
  //Motion Varaibles 
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  //Direction variable
  public PVector direction = new PVector();
  
  //Size variables
  float scale;
  float mass;
  
  //Color variables
  color chosenColor;
  float r, g, b;
  
  public Walker(float i)
  {
    //Set mass and scale
    this.mass += 15 * (i + 1);
    scale = mass;
    
    //Set color
    r = random(256);
    g = random(256);
    b = random(256);
    
    chosenColor = color(r, g, b);
  }
  
  //Update position
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity); 
    this.acceleration.mult(0);
  }
  
  //Render
  public void render()
  {  
    circle(position.x, position.y, scale); 
    fill(chosenColor);
    stroke(chosenColor);
  }
  
  //Second Law of Motion (F = ma)
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }
  
  //Third Law of Motion
  public void checkEdges() 
  {
    if (this.position.x > Window.right) 
      this.velocity.x *= -1;
      
    else if (this.position.x < Window.left)
      this.velocity.x *= 1;
      
    if (this.position.y > Window.top)
      this.velocity.y *= 1;
      
    else if (this.position.y < Window.bottom)
      this.velocity.y *= -1;
  }
}
