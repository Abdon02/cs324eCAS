class ballMovement{
  //Class variables
  color ballColor; //This the color of the ball that we decide
  PVector ballCoordinates; //This is the ball coordinates that will be changing around the game
  float sizeBall; //This will be the radius of the ball that will be displayed
  PVector xyVel; //This is the x and y velcity that will change accordingly as the ball bounces around
  
  //Default constructor
  ballMovement(){
    //Initializing class variables
    this.ballColor = color (255, 255, 255);
    this.ballCoordinates = new PVector(width/2, height / 2);
    this.sizeBall = 15;
    this.xyVel = new PVector(5, 1);    
    
    //End of function
    return;
  }  
  
  //Special constructor
  ballMovement(color ballColor, float sizeBall, PVector xyVel){
    //Defining the class variables
    this.ballColor = ballColor;
    this.ballCoordinates = new PVector(width / 2, height / 2);
    this.sizeBall = sizeBall;
    this.xyVel = xyVel;    
    
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
    
    //End of function
    return;
  }
  
}
