class boardGame{
  //Class variables
  ballMovement ball;
  paddles right;
  paddles left;
  int leftscore;
  int rightscore;
  
  //Default constructor
  boardGame(){ 
    //Defining the class variables
    ball = new ballMovement();
    right = new paddles(true);
    left =  new paddles(false);
    leftscore = 0;
    rightscore = 0;
    
    //End of function
    return;
  }
  
  //Specific constructor
  boardGame(ballMovement ball, paddles left, paddles right){
    //Defining the class variables
    this.ball = ball;
    this.right = right;
    this.left = left;
    
    //end of function
    return;
  }
  
  void touchedPaddles(){
    /*
    This function will modify the ball coordinates if it touched the paddles
    */
    
    if(right.hasBallTouched(true, ball) || left.hasBallTouched(false, ball)){
      ball.switchXVel();
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
    text(leftscore, 40, 40);
    text(rightscore, width - 40, 40);    
    
    //end of function
    return;
  }
  
  void addingPoints(){
    /*
    This function is going to add points to the player that has won that point
    */
    
    if(ball.ballCoordinates.x < 0){
      rightscore++;
      ball.resetBall();
    }else if (ball.ballCoordinates.x > width){
      leftscore++;
      ball.resetBall();
    }
    
    //End of fuction
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
    for (int i = 10; i<=height -10; i+= 30){
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
    
    //End of function
    return;
  }
  
  
}
