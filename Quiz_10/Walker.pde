public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  float scale;
  
  public float velocityLimit = 15;
  public PVector direction = new PVector();
  public float mass;
  
  color chosenColor;
  float r, g, b;
  
  public Walker(float i)
  {
    this.mass += 15 * (i + 1);
    scale = mass;
    
    r = random(256);
    g = random(256);
    b = random(256);
    
    chosenColor = color(r, g, b);
    
    position.y = 300;
    position.x = 2 * (Window.windowWidth / 10) * (i - (10 / 2));
  }
  
  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {    
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity); 
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    circle(position.x, position.y, scale); 
    fill(chosenColor);
    stroke(chosenColor);
  }
  
  public void checkEdges() 
  {
    if ((position.x >= Window.right) || (position.x <= Window.left)) velocity.x *= -1;
    if ((position.x <= Window.right) || (position.x >= Window.left)) velocity.x *= 1;
    if (position.y <= Window.bottom) {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
}
