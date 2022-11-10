class character{
  PImage monkey, basket;
  float x; 
  float y; 
  float w; 
  float h;
  int score;
  
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
  }

  void display()
  {
    this.keyPressed();
    image(monkey, x, y, w, h);
    image(basket, x+23, y+50, w-50, h-50);
  }
  
  void keyPressed(){
    if(keyPressed){
      if (keyCode == LEFT){
        this.x -= 5;
        this.x = constrain(this.x, -50, width);
      } else if (keyCode == RIGHT){
        this.x += 5;
        this.x = constrain(this.x, -50, width-h+100);
      }
    }
  }
}
