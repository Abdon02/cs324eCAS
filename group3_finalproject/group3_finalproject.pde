home h1;
options o1;
ballMovement ball;
paddels right;
paddels left;
boardGame board;

void setup(){
  size(800, 500);
  h1 = new home();
  o1 = new options();
  background(0);
  
  //Initilizing the ball
  ball = new ballMovement();
  
  //Initilizing the paddels
  right = new paddels(true);
  left = new paddels(false);  
  
  //initializing the board
  board = new boardGame(ball, left, right);
}

void draw(){
  //Display the board
  board.display();
  
  o1.keyPressed(h1);
  if (h1.pause){
    h1.display();
  } else if (o1.pause){
    o1.display(h1);
  } else {
    backdrop();
  }
}

void keyPressed(){
  /*
  This function is going to be used when a key is pressed
  */   
   
  if(key == 'w'){
    //Increasing the position of the left paddle
    left.upPaddels();  
  }else if(key == 's'){
    //decreasing the position of the left paddle
    left.downPaddels();
  }
  
  if(keyCode == UP){
    //Increasing the position of the right paddle
    right.upPaddels();
  }else if(keyCode == DOWN){
    //Decreasing the position of the right paddle
    right.downPaddels();
  } 
  
  //End of function
  return;
}

void backdrop(){
  rectMode(CENTER);
  background(0);
  noStroke();
  fill(255);
  for (int i = 10; i<=height -10; i+= 30){
    rect(width/2, i, 20, 20);
  }
}
