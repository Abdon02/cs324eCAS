
class boardGame{
  //Class variables
  boolean two; //This boolean is whether it is a two player game or if it is a single player game
  ballMovement ball; //This variable corresponds to the ball
  paddles right; //This variable corresponds to the right paddle
  paddles left; //This variable corresponds to the left paddle 
  int leftscore; //This variable will count the score of the left player
  int rightscore; //This variable will count the score of the right player
  int count; //This varialble will count how long th rally is. If the rally is really big then we will increase the ball velocities
  singlePlayerData singleData; //This variable corresponds to saved data for single player mode

  //Default constructor
  boardGame(){ 
    //Defining the class variables
    ball = new ballMovement();
    right = new paddles(true, bounce, 60, effects);
    left =  new paddles(false, bounce, 60, effects);
    leftscore = 0;
    rightscore = 0;
    count = 0;
    
    //End of function
    return;
  }
  
  //Specific constructor
  boardGame(ballMovement ball, paddles left, paddles right, boolean two){
    //Defining the class variables
    this.two = two;
    this.singleData = new singlePlayerData();
    this.ball = ball;
    this.right = right;
    this.left = left;
    this.leftscore = 0;
    this.rightscore = 0;
    this.count = 0;
    
    //end of function
    return;
  }
  
  void increaseBallVelocity(){
    /*
    This function is going to increase the ball x and y velcity depending on how much the rally has been going
    */

    //This will be the first change in velocity
    if(count == 3){
      ball.incXVel(0.02);
      ball.incYVel(0.01);
    }else if(count == 5){
      ball.incXVel(0.05);
      ball.incYVel(0.02);
    }

    //If the count is much bigger and the ball needs to dramatically need to be increased
    if(count >= 9){
      ball.incXVel(1.0);
      ball.incYVel(1.0);
    }    

    //End of function
    return;
  }
  
  void touchedPaddles(){
    /*
    This function will modify the ball coordinates if it touched the paddles
    */
    
    //This is for 2 player game mode
    if(right.hasBallTouched(ball) || left.hasBallTouched(ball)){
      //Changing how the ball is going to be bouncing back and forth
      ball.switchXVel();
      
      //Increase the count value
      count++;
      
      delay(50);

      //Change the speed of the ball
      this.increaseBallVelocity();
      
      if (!this.two && right.hasBallTouched(ball)){
        this.rightscore++;
      }
    }
    
    //end of function
    return;
  }
  
  void displayScores(){
    /*
    This function is going to display the scores of the players
    */
    
    //Displaying the left players score
    fill(255);
    textSize(30);
    if (this.two){
      text(leftscore, 140, 40);
    } else {
      text("High Score: " + singleData.maxScore, 160, 40);
    }

    text(rightscore, width - 140, 40);    
    
    //end of function
    return;
  }
  
  void addingPoints(){
    /*
    This function is going to add points to the player that has won that point
    */
    
    //Second player has scored
    if(ball.ballCoordinates.x < 0){
      rightscore++;
      count = 0;
      ball.moveLeft();
    }else if (ball.ballCoordinates.x > width){ //Player 1 has scored
      leftscore++;
      count = 0;
      ball.moveRight();
    }
    
    //End of fuction
    return;
  }
  
  void moveSlidersSound(boolean [] arrayBools){
    /*
    This function is going to move the sliders.
    
    Inputs:
      -arrayBools: It is an array that has boolean values
      
    Output:
      - It will display nothing. It will move the sliders
    */
    
    for(int i = 0; i < arrayBools.length; i++){
      
      //Moving the left slider up
      if(arrayBools[i] && i == 0){
        left.upPaddles();        
      }
      
      //Moving the left slider down
      if(arrayBools[i] && i == 1){
        left.downPaddles();
      }
      
      //Moving the right slider up
      if(arrayBools[i] && i == 2){
        right.upPaddles();
      }
      
      //Moving the right slider down
      if(arrayBools[i] && i == 3){
        right.downPaddles();
      }
      
      
    }
    
    //End of funtion
    return;
  }
  
  void display(){
    /*
    This function is going to display the game board on the canvas
    */
    
    rectMode(CENTER);
    background(0);
    noStroke();
    fill(255);
    for (int i = 10; i<= height -10; i+= 30){
      rect(width/2, i, 20, 20);
    }
    
    //Display the score
    this.displayScores();
    
    //display the ball
    ball.display();
    
    //display the right scroller
    right.display();
    
    //display the left scroller
    left.display();
    
    //Move the ball accordingly
    ball.moveBall();
    
    //Check of edges of canvas
    ball.edgesCollision();
    
    //Check for paddle connection
    this.touchedPaddles();
    
    //Check if the ball if out of play
    this.addingPoints();
    
    //Printing the ball velocity
    //println("ballVel, xVel: ", ball.xyVel.x, " yVel: ", ball.xyVel.y);
    
    //End of function
    return;
  }
  
  
}
