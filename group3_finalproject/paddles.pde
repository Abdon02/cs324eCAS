
class paddles{
  //Class variables
  PVector paddlePos; //This the x and y positions of the paddle
  color paddleColor;  //This is the color of the paddle
  float heightPaddle; //This is the height of the paddle
  float widthPaddle; //This is the width of the paddle
  float verticalSpeed; //This is the verticalSpeed of the paddle
  boolean rightPaddle;
  SoundFile file;
  boolean sound;
  float speed;
  float y;
  
  
  //This is the default constructor that will create the left or right paddle
  paddles(boolean rightPaddle, SoundFile file, float h, boolean effects){
    //Defining the class variables
    this.heightPaddle = h;
    this.widthPaddle = 10;
    this.rightPaddle = rightPaddle;
    this.verticalSpeed = 10;
    this.file = file;
    this.sound = effects; //true;

    if(this.rightPaddle){
      //If it is then we create the right paddle
      this.paddlePos = new PVector(width - 4 * this.widthPaddle, height / 2);
            
    }else{
      //It it is false then we create the left paddle
      this.paddlePos = new PVector(4 * this.widthPaddle, height / 2);
    }
    
    //Establishing the color of both paddles
    this.paddleColor = color(255, 255, 255);
    
    //End of function
    return;
  }
  
  
  
  //This constructor is going to be unique for the user
  paddles(color paddleColor, PVector paddlePos, float widthPaddle, float heightPaddle, float verticalSpeed){
    //Initializing the class variables
    this.paddlePos = paddlePos;
    this.paddleColor = paddleColor;
    this.heightPaddle = heightPaddle;
    this.widthPaddle = widthPaddle;
    this.verticalSpeed = verticalSpeed;
    this.speed = 0;
    this.y = 0;
    
    
    //End of function
    return;    
  }
  
  void upPaddles(){
    /*
    This function is going to move the paddles up
    */
    
    //Changing the y position of a paddle
    this.paddlePos.y -= this.verticalSpeed;    
    
    //Constraining the y position value
    this.constrainY();
    
    //End of function
    return;
  }
  
  void downPaddles(){
    /*
    This function is going to move the paddles down
    */
    
    //Changing the y position of the paddle
    this.paddlePos.y += this.verticalSpeed;
    
    //Constraining the y postion value
    this.constrainY();
    
    //End of function
  }
  
  void constrainY(){
    /*
    This function is going to constrain the paddle so it doens't get out of the canvas
    */
    
    //Constraining the y position of the paddles
    this.paddlePos.y = constrain(this.paddlePos.y, this.heightPaddle /2 , height - (this.heightPaddle / 2));
    
    //End of function
    return;
  }
  
  boolean ballHitHeight(ballMovement ball){ 
    /*
    This function is going to check if the ball hits the height of the paddle
    */
    
    if((ball.ballCoordinates.y >= paddlePos.y - (heightPaddle / 2)) && (ball.ballCoordinates.y <= paddlePos.y + (heightPaddle / 2))){
      if (sound){
        bounce.play();
      }
      return true;
    }
    
    //End of function
    return false;
  }
  
  boolean hasBallTouchedRight(ballMovement ball){
    /*
    This function is going to check if the ball hits the right paddle
    
    Input:
      ball : (ballMovement) it is the ball in question
      
    Output:
      it will return true or false if the ball did hit the paddle    
    */
    
    //Making sure that the ball is within 
    if((ball.ballCoordinates.x + (ball.sizeBall / 2) >= paddlePos.x - (widthPaddle / 2)) && (ball.ballCoordinates.x + (ball.sizeBall / 2) <= paddlePos.x)){
      //The ball's y coordinate hit within the height of the paddle
      if(this.ballHitHeight(ball)){
        return true;
      }
    }
    
    //end of function
    return false;
  }
  
  
  boolean hasBallTouchedLeft(ballMovement ball){
    /*
    This function is going to check if the ball hits the right paddle
    
    Input:
      ball : (ballMovement) it is the ball in question
      
    Output:
      it will return true or false if the ball did hit the paddle    
    */
    
    if(ball.ballCoordinates.x - (ball.sizeBall / 2) <= paddlePos.x + (widthPaddle / 2) && (ball.ballCoordinates.x - (ball.sizeBall / 2) >= paddlePos.x)){
      //The ball's y coordinate hit the height of the board
      if(this.ballHitHeight(ball)){
        return true;
      }
    }
    
    //End of function
    return false;    
  }
  
  boolean hasBallTouched(ballMovement ball){
    /*
    This function will check if the ball has touched the right or left paddle
    
    Inputs:
      - this.rightPaddle: (boolean) it will see if the right paddle is in question currently
      - ball: (ballMovement) it is the current ball instance
      
     Output:
       It will return true or false
    */
   
   if(this.rightPaddle){
     //This is the right paddle in question
     if(this.hasBallTouchedRight(ball)){
       return true;
     }
   }else{
     //This is the left paddle in question
     if(this.hasBallTouchedLeft(ball)){
       return true;
     }
   }
   
   //end of function
   return false;
    
  }
  
  void changeSound(){
    /*
    This function is going to change the value if the sound will be on or off.    
    */
    
    //Changing the value of the sound
    this.sound = !this.sound;
    
    //End of function
    return;
  }
  
  void createPHierarchy(){

      this.y = this.paddlePos.y + this.speed;
      if (this.y > this.paddlePos.y + 25|| this.y < this.paddlePos.y - 25) {
    this.speed *= -1;}
      fill(random(255), random(255), random(255));
      ellipse(this.paddlePos.x , this.y, 5, 5);
      this.speed += 0.25;
      fill(0);
        //End of function
    return;
  }
  
  void display(){
    /*
    This function is going to display the paddle    
    */

    //Drawing the paddle onto the canvas    
    rectMode(CENTER);
    fill(this.paddleColor);
    rect(this.paddlePos.x, this.paddlePos.y, this.widthPaddle, this.heightPaddle);
    this.createPHierarchy();
    
    //End of function
    return;
  }
  
 
    
 
}
