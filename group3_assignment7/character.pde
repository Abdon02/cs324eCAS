class character{
  PImage monkey, basket;
  float x; 
  float y; 
  float w; 
  float h; 
  
  //Paddle constructor
  character()
  {
    x = -50;
    y = height - 250;

    w = 200;
    h = 250;    
  }

  void move()
  {
    monkey = loadImage("./pictures/monkey.png");
    basket = loadImage("./pictures/basket.png");
    image(monkey, x, y, w, h);
    image(basket, x+23, y+50, w-50, h-50);
  }
}
