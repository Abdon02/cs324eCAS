class ballMovement{
  //Class variables
  color ballColor; //This the color of the ball that we decide
  PVector ballCoordinates; //This is the ball coordinates that will be changing around the game
  float sizeBall; //This will be the radius of the ball that will be displayed
  PVector xyVel; //This is the x and y velcity that will change accordingly as the ball bounces around
  float totalVelocity; //This is the total velocity
  float xVel; //This variable will hold the original xVal velocity
  float yVel; //This variable will hold the original yVal velocity
  float theta;
  
  //Default constructor
  ballMovement(){
    //Initializing class variables
    this.ballColor = color (255, 255, 255);
    this.ballCoordinates = new PVector(width/2, height / 2);
    this.sizeBall = 15;
    this.totalVelocity = 5.;
    this.theta = 0;
    
    //Setting up the velocity values that will move the ball around
    this.setUpXandYSpeed();
    
    //End of function
    return;
  }    
  
  void setUpXandYSpeed(){
    /*
    This function is going to set up the x and y velocity values
    */
    
    //This is getting a randomAngle value
    float randomAngle = random(-PI/3, PI/3);
    this.xyVel = new PVector(this.totalVelocity * cos(randomAngle), this.totalVelocity * sin(randomAngle));    
    this.xVel = this.xyVel.x;
    this.yVel = this.xyVel.y;
    
    //End of function
    return;
  }
  
  void switchXVel(){
    /*
    This function is going to switch the xvelocity by multiplying by -1
    */
    
    this.xyVel.x = -this.xyVel.x;
    
    //end of function
    return;
  }
  
  void switchYVel(){
    /*
    This function is going to switch the yvelocity by multiplying by -1
    */
    
    this.xyVel.y = -this.xyVel.y;
    
    //End of function
    return;
  }
  
  void edgesCollision(){
    /*
    This function is going to change the position coordinates when the ball hits the wall either the top or bottom    
    */
    
    //This is when the ball hits the top/bottom wall or rihgt/left wall
    if(this.ballCoordinates.y - (this.sizeBall / 2) < 0 || this.ballCoordinates.y + (this.sizeBall / 2) > height){
      this.switchYVel();
    }else if (this.ballCoordinates.x < 0 || this.ballCoordinates.x > width){
      this.switchXVel();
    }
    
    //End of function
    return;
  }
  
  void moveBall(){
    /*
    This function is going to move the ball coordinates so the ball can move around    
    */
    
    this.ballCoordinates.x += this.xyVel.x;
    this.ballCoordinates.y += this.xyVel.y;    
    
    //End of function
    return;    
  }
  
  void resetBall(){
    /*
    This moves the ball back to the middle of the canvas
    */
    
    //If the ball is out of play then it gets reset back to the middle of the canvas
    ballCoordinates.x = width / 2;
    ballCoordinates.y = height / 2;
    this.switchXVel();
    
    //End of function
    return;
  }
  
  void changeYvel(){
    /*
    This function is going to change the y value of the velocity once a point has been scored
    */

    if(random(0, 1) <= 0.5){
      this.switchYVel();
    }else{
      this.xyVel.y = this.xyVel.y;
    }

    //End of function
    return;
  }

  void changeVelocites(boolean rightWon){
    /*
    This function is going to change to the magnitude of the original velocities back to normal
    
    Input:
      - righWon: It is a boolean to see if the right player had won that battle
    */
    
    //Getting new x and y values for the ball to follow
    this.setUpXandYSpeed();
    
    //Changing the values of velocities back
    if(rightWon){
      this.xyVel.x = -this.xyVel.x;
    }

    //End of function
    return;
  }

  void incXVel(float value){
    /*
    This function is going to increase the X Velocity of the ball
    */

    if(this.xyVel.x < 0){
      this.xyVel.x -= value;
    }else{
      this.xyVel.x += value;
    }

    //End of function
    return;
  }

  void incYVel(float value){
    /*
    This function is going to increase the Y Velocity of the ball
    */

    if(this.xyVel.y < 0){
      this.xyVel.y -= value;
    }else{
      this.xyVel.y += value;
    }

    //End of function
    return;
  }

  void moveRight(){
    /*
    This function is going to make the ball go to the right after Player 1 has scored.
    This function will also change the direction as it is going to travel. It will choose a random value.
    */

    //Change the velocites back to its original values
    this.changeVelocites(false);

    //Change the y velocity
    this.changeYvel();

    //Moving the ball to the middle of the canvas
    this.resetBall();
    
    //Printing the velocity of the ball
    //println("mRight, xVel: ", this.xyVel.x, " yVel: ", this.xyVel.y);

    //End of function
    return;
  }

  void moveLeft(){
    /*
    This function is going to make the ball go to the left after Player 2 scored.
    This function will also change the direction as it is going to travel. It will choose a random value.
    */

    //Change the velocites back to its original values
    this.changeVelocites(true);

    //Change the y velocity direction
    this.changeYvel();

    //Moving the ball to the middle of the canvas
    this.resetBall();
    
    //Printing the velocity
    //println("mLeft, xVel: ", this.xyVel.x, " yVel: ", this.xyVel.y);

    //End of function
    return;
  }
  
  void BHierarchy(){
    pushMatrix();
      translate(4 * sin(this.theta),  4 * cos(this.theta));
      fill(random(255), random(255), random(255));
      ellipse(ballCoordinates.x , ballCoordinates.y, sizeBall/2, sizeBall/2);
    popMatrix();
    this.theta += PI/20;
    
    //End of function
    return;
  }
  
  void display(){
    /*
    This function is going to display the ball onto the canvas
    */   
        
    //Draw out the ball
    ellipseMode(CENTER);
    fill(ballColor);
    ellipse(ballCoordinates.x, ballCoordinates.y, sizeBall, sizeBall);
    this.BHierarchy();
    
    //End of function
    return;
  }
  
}
