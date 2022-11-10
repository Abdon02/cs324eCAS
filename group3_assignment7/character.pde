class character{
  // Define variables
  PImage monkey, basket;
  float x; 
  float y; 
  float w; 
  float h;
  int score;
  boolean invisible_basket;
  
  //Paddle constructor
  character()
  {
    x = width/2;
    y = height - 298;

    w = 200;
    h = 250;
    monkey = loadImage("./pictures/monkey.png");
    basket = loadImage("./pictures/basket.png");
    
    score = 0;
    invisible_basket = false;
  }
  
  // Define display
  void display()
  {
    this.keyPressed();
    image(monkey, x, y, w, h);
    
    // Display basket if not invisible_basket
    if(!this.invisible_basket){
      image(basket, x+23, y+50, w-50, h-50);
    }
  }
  
  void keyPressed(){
    if(keyPressed){
      // Move left or right with arrow keys
      if (keyCode == LEFT){
        this.x -= 5;
        this.x = constrain(this.x, -50, width);
      } else if (keyCode == RIGHT){
        this.x += 5;
        this.x = constrain(this.x, -50, width-h+100);
      }
      
      // Make invisible_basket with shift button
      if(keyCode == SHIFT){
        invisible_basket = !invisible_basket;
      }
    }
  }
}
