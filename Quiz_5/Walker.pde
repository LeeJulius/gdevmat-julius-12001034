public class Walker {
 PVector position = new PVector();
 PVector speed = new PVector(2, 5);
 
 // changing direction if it hits the border
 // move and bounce function
 void changeDirection() {
  if ((position.x > Window.right) || (position.x < Window.left)) speed.x *= -1;
  if ((position.x < Window.right) || (position.x > Window.left)) speed.x *= 1;
  if ((position.y > Window.top) || (position.y < Window.bottom)) speed.y *= -1;
  if ((position.y < Window.top) || (position.y > Window.bottom)) speed.y *= 1;
 }
 
 // move the circle
 void moveWalker() {
  
  position.add(speed);
   
  background(255);
  fill(0, 0, 255);
  circle(position.x, position.y, 50); 
 }
 
}
