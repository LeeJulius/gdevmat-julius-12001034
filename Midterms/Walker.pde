public enum Type {
  BLACKHOLE, WALKER 
}


public class Walker {
 
  Type type;
  color chosenColor;
  float r, g, b;
  PVector position = new PVector();
  PVector direction;
  float scale;
  float xStandardDeviation, xMean;
  
 void spawnCircle(Type type) {
   
    float gaussian = randomGaussian();
    position.y = random(-500, 500);
    
    switch(type) {
      
     case WALKER: 
     
       xStandardDeviation = 1000;
       xMean = 0;
       position.x = xStandardDeviation * gaussian + xMean;
     
       float scaleStandardDeviation = 10;
       float scaleMean = 40;
       scale = scaleStandardDeviation * gaussian + scaleMean;
  
        r = random(256);
        g = random(256);
        b = random(256);
        chosenColor = color(r, g, b);
        break;
      
     case BLACKHOLE:
        
        xStandardDeviation = 100;
        xMean = 0;
        position.x = xStandardDeviation * gaussian + xMean;
        
        chosenColor = color(255, 255, 255);
      
        scale = 75;
        break;
      
     default:
        throw new NullPointerException();
   }
 }
 
 void movement(Type type, Walker target) {
    switch(type) {
      
     case WALKER: 
     
        direction = PVector.sub(target.position, this.position);
        this.position.add(direction.normalize().mult(3));
        
        break;
      
     case BLACKHOLE:
     
          if (mouseX != 0 && mouseY != 0) {
          position.x =  mouseX - Window.windowWidth / 2;
          position.y =  - (mouseY - Window.windowHeight / 2);
          }
          
          break;
      
     default:
        throw new NullPointerException();
   }
   
   fill(chosenColor);
   stroke(chosenColor);
   circle(position.x, position.y, scale);
 }
 
}
