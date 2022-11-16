home h1;
options o1;
win w1;
ballMovement ball;
paddles right;
paddles left;
boardGame board;

void setup(){
  size(800, 500);
  h1 = new home();
  o1 = new options();
  w1 = new win();
  background(0);
  
  //Initilizing the ball
  ball = new ballMovement();
  
  //Initilizing the paddles
  right = new paddles(true);
  left = new paddles(false);  
  
  //initializing the board
  board = new boardGame(ball, left, right);
}

void draw(){ 
  o1.keyPressed(h1);
  if (h1.pause){
    h1.display();
  } else if (o1.pause){
    o1.display(h1);
  } else if (o1.restart || w1.restart){
    ball = new ballMovement();
    
    //Initilizing the paddles
    right = new paddles(true);
    left = new paddles(false);  
    
    //initializing the board
    board = new boardGame(ball, left, right);
    o1.restart = false;
    w1.restart = false;
  } else {
    if (board.leftscore == 10){
      w1.display("Left", h1);
    } else if (board.rightscore == 10){
    // Display the board
      w1.display("Right", h1);
    } else {
      board.display();
    }
  }
}

void keyPressed(){
  /*
  This function is going to be used when a key is pressed
  */   
   
  if(key == 'w'){
    //Increasing the position of the left paddle
    left.upPaddles();  
  }else if(key == 's'){
    //decreasing the position of the left paddle
    left.downPaddles();
  }
  
  if(keyCode == UP){
    //Increasing the position of the right paddle
    right.upPaddles();
  }else if(keyCode == DOWN){
    //Decreasing the position of the right paddle
    right.downPaddles();
  } 
  
  //End of function
  return;
}
