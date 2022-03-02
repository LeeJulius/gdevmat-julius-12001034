class Walker {
  
  float x;
  float y;
  
  void randomDirection() {
    
    // 1/8 chance for it to move any direction (including corners)
    
    int rng = int(random(8));
    
    if (rng == 0) x += 20;
    
    if (rng == 1) x -= 20;
    
    if (rng == 2) y += 20;
    
    if (rng == 3) y -= 20;
    
    if (rng == 4) {
      x += 20;
      y += 20;
    }
    
    if (rng == 5) {
      x -= 20;
      y -= 20;
    }
    
    if (rng == 6) {
      x += 20;
      y -= 20;
    }
    
    if (rng == 7) {
      x -= 20;
      y += 20;
    }
  }
  
  void biasedDirection() {
    int rng = int(random(45));
    
    // 2/9 chance to move right
    if (rng >= 0  && rng <= 10) x += 20;
    
    // 1/9 chance to move left
    if (rng >= 11  && rng <= 15) x -= 20;
    
    // 1/3 chance to move up
    if (rng >= 16 && rng <= 30) y += 20;
    
    // 1/3 chance to move down
    if (rng >= 31 && rng <= 45) y -= 20;
  }
  
  void randomColor() {
    // randomizing color and alpha
    int red = int(random(1, 255));
    int green = int(random(1, 255));
    int blue = int(random(1, 255));
    int alpha = int(random(50, 100));
    
    // setting color
    color randomColor = color(red, green, blue, alpha);
    fill(randomColor);
    stroke(randomColor);
  }
  
  void render() {
   circle(x, y, 30);
  }
}
