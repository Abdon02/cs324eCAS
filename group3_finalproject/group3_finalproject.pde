import processing.sound.*;
home h1;
options o1;
win w1;
ballMovement ball;
paddles right;
paddles left;
paddles wall;
boardGame twoGame;
boardGame singleGame;
SoundFile file;

void setup(){
  size(800, 500);
  h1 = new home();
  o1 = new options();
  w1 = new win();
  background(0);
  file = new SoundFile(this, "./files/bounce.mp3");

  
  //Initilizing the ball
  ball = new ballMovement();
  
  //Initilizing the paddles
  right = new paddles(true, file, 60);
  left = new paddles(false, file, 60);  
  wall = new paddles(false, file, height);
  
  //Initializing the twoGame
  twoGame = new boardGame(ball, left, right, true);
  
  // Initializing the singleGame
  singleGame = new boardGame(ball, wall, right, false);
}

void draw(){ 
  // Options menu
  o1.keyPressed(h1);
  
  // Game play
  if (h1.pause){
    background(0); // Display home menu
    h1.display();
  } else if (o1.pause){
    o1.display(h1); // Display options menu (only possible if home menu not displayed)
  } else if (h1.singlePlayer){ // If single player mode
    if (o1.restart || w1.restart){ // If restarting game
      //Initializing the singleGame
      ball = new ballMovement();
  
      //Initilizing the paddles
      right = new paddles(true, file, 60);  
      wall = new paddles(false, file, height);
  
      singleGame = new boardGame(ball, wall, right, false);
      o1.restart = false;
      w1.restart = false;
    } else { // If ball out of bounds, display win screen
      // Win conditions
      if (singleGame.leftscore == 1){
        singleGame.ball.xyVel = new PVector (0, 0);
        singleGame.display();
        w1.display("Score: " + singleGame.rightscore, h1);
      } else {
        // Not win conditions
        singleGame.display();
      }
    }
  } else if (h1.twoPlayer){ // If two player mode
    if (o1.restart || w1.restart){ // If restarting game
      //initializing the twoGame
      ball = new ballMovement();
  
      //Initilizing the paddles
      right = new paddles(true, file, 60);
      left = new paddles(false, file, 60);
  
      twoGame = new boardGame(ball, left, right, true);
      o1.restart = false;
      w1.restart = false;
      
    } else { // First to twn wins, display win screen
      // Win conditions
      if (twoGame.leftscore == 10){
        twoGame.ball.xyVel = new PVector (0, 0);
        twoGame.display();
        w1.display("Left wins!", h1);
      } else if (twoGame.rightscore == 10){
      // Display the twoGame
        twoGame.ball.xyVel = new PVector (0, 0);
        twoGame.display();
        w1.display("Right wins!", h1);
      } else {
        // Not win conditions
        twoGame.display();
      }
    } 
  }
}

void keyPressed(){
  /*
  This function is going to be used when a key is pressed
  */   
   
   
  if(key == 'w' || key == 'W'){
    //Increasing the position of the left paddle
    left.upPaddles();  
  } else if(key == 's' || key == 'S'){
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
  
  
  // V to toggle sound when ball hits paddle
  if (key == 'v' || key == 'V'){
    left.sound = !left.sound;
    right.sound = !right.sound;
  }
  
  //End of function
  return;
}
