public class Matter 
{
  //Motion Variables
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  //Direction Vairable
  public PVector direction = new PVector();
  
  //Velocity Limit
  public float velocityLimit = 10;
  
  //Mass and Scale
  public float mass;
  public float scale = 15;
  
  //Graviational Constant
  public float gravitationalConstant = 1;
  
  //Color Variables
  color chosenColor;
  float r, g, b;
  
  //Initializa Matter
  public Matter()
  {
    //Setting random position
    position.x = random(-500, 500);
    position.y = random(-500, 500);
    
    //Setting random scale (and equating it with its mass)
    scale = random(40, 80);
    mass = scale;
    
    //Setting random color
    r = random(256);
    g = random(256);
    b = random(256);
    
    chosenColor = color(r, g, b);
  }
  
  public void update()
  {
   direction = PVector.sub(direction, this.position);
    
   this.direction.add(direction.normalize().mult(0.2));
   
   this.acceleration = direction;
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity); 
   this.acceleration.mult(0);
  }
  
  //Render Matter
  public void render()
  {
    circle(position.x, position.y, scale); 
    fill(chosenColor);
    stroke(chosenColor);
  }
  
  //Chekcing for Edges
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
  
  //Applying Second Law of Motion
  public void applyForce(PVector force)
  {
   PVector f = PVector.div(force, this.mass);
   this.acceleration.add(f); 
  }
  
  //Calculating Gravitaitonal Attraction
  public PVector calculateAttraction(Matter matter)
  {
   PVector force = PVector.sub(this.position, matter.position);
   float distance = force.mag();
   
   distance = constrain(distance, 5, 25);
   
   float strength = (this.gravitationalConstant * this.mass * matter.mass) / (distance * distance);
   force.mult(strength);
   
   return force;
  }
}
