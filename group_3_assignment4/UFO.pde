class UFO {  
  //Class variables
  PVector ufoSpeed; //Speed that ufo will move in the x and y direction
  PVector ufoCoordinates; //The original coordinates (x, y, z)
  float changing_x, changing_y; //These are the values that will change
  color [] array_for_ufo; //Color array to make the ufo different colors
  Ground grd; //The inputted ground so it knows when to stop moving
  boolean hasTouchedDown = false; //If the ufo has touched down on the ground
  boolean startMovingRight = false; //If the ufo should start to move to the right
  int value = 0; //This will be used to create the increase or decrease light of UFO
  
  //Constructor
  UFO(PVector coordinates, PVector speed, color [] color_array, Ground inputted_ground){
    //Set the values
    this.array_for_ufo = color_array;
    this.ufoSpeed = speed;
    this.ufoCoordinates = coordinates;
    this.grd = inputted_ground;
    this.changing_x = coordinates.x;
    this.changing_y = coordinates.y;
  }
  
  //This function will draw out when the light gets longer
  void longerLight(){
    quad(this.changing_x - 10, this.changing_y + 15, this.changing_x + 10, this.changing_y + 15, 
    this.changing_x + 25, this.changing_y + 30 + this.value, this.changing_x - 25, this.changing_y + 30 + this.value);
    
    //End of function
    return;  
  }
  
  //This function will draw out when the light gets smaller
  void smallerLight(){
    quad(this.changing_x - 10, this.changing_y + 15, this.changing_x + 10, this.changing_y + 15, 
    this.changing_x + 25, this.changing_y + 30 - (this.value - 30), this.changing_x - 25, this.changing_y + 30 - (this.value - 30));
    
    //End of function
    return;    
  }  
  
  //Draw out the bottom light of UFO
  void drawBottom(){
    /*
    We need the light to increase and decrease in height.    
    When it starts to get to the bottom the light should get smaller and smaller.   
    */    
    
    //White color light
    fill(255);    
    
    if(this.value <= 20){
      //The light will increase
      this.longerLight();
      
    }else if (this.value <= 40){ 
      //The light will decrease
      this.smallerLight();
      
    }else{
      //Setting value to 0
      this.value = 0;      
    }
    
    //Add the value number
    this.value += 1;
    
    //End of function
    return;    
  }
  
  //Draws out the UFO
  void draw_ufo(){   
    //Creating the top of the ufo
    fill(this.array_for_ufo[0]);
    circle(this.changing_x, this.changing_y - 10, 35);
    
    //Coloring the quad
    fill(this.array_for_ufo[1]);
    //noStroke();
    //Drawing the base of the UFO
    quad(this.changing_x - 20, this.changing_y - 10, this.changing_x + 20, this.changing_y - 10,
    this.changing_x + 30, this.changing_y + 10, this.changing_x - 30, this.changing_y + 10);
    
    //Add circles to the base of the ufo
    fill(this.array_for_ufo[2]);
    circle(this.changing_x, this.changing_y, 10);
    circle(this.changing_x - 20, this.changing_y, 5);
    circle(this.changing_x + 20, this.changing_y, 5);
    
    //Adding a small border on the ufo
    fill(125);
    rect(this.changing_x - 30, this.changing_y + 10, 60, 5); 
    
    //Add a light to the UFO
    this.drawBottom();
    
    //End of function
    return;
  }
  
  //Displays the UFO on canvas
  void display(){   
    this.draw_ufo(); 
    
    //End of function
    return;
  }
  
  //This function will reset canvas and draw out the UFO
  void resetDraw(){
    grd.resetCanvas();
    this.display();
    
    //End of function
    return;
  }
  
  //Function will combine all the other translating functions together
  void moveUFO(){    
    //The UFO will keep moving right until it hits "ufoCoordinates.z"
    if(!(this.changing_x >= ufoCoordinates.z) || startMovingRight){      
      //If the ufo is already at the end of the canvas, then reset all the variables
      if(this.changing_x >= width){
        this.resetsCoordinates();
        
        //End of function
        return;
      }
      
      //Moves to the right      
      this.move_horizontal();
      
      //End of function
      return;
    }
    
    //The UFO will go down until it reaches the bottom of the ground
    if(!(this.changing_y >= grd.y) && !hasTouchedDown){
      //Moves the ufo downward
      this.move_Dvertical();
      
      //End of function
      return;
    }
    
    //At this point the UFO has touched the ground
    hasTouchedDown = true;    
    
    //The UFO will start to go up vertically until it reaches the original y coordinate
    if(!(this.changing_y <= ufoCoordinates.y) && hasTouchedDown){
      //Moves the ufo upwards
      this.move_Uvertical();
      
      //End of function
      return;
    }
    
    //At this point the UFO is ready to go to the right
    startMovingRight = true;
    
    //End of function
    return;   
  }
  
  //Moves the UFO to the right
  void move_horizontal(){    
    this.changing_x += ufoSpeed.x;   
    
    //End of function
    return;
  }
  
  //Moves the UFO downward
  void move_Dvertical(){
    
    this.changing_y += ufoSpeed.y;
    
    //End of function
    return;
  }  
  
  //Moves the UFO upward
  void move_Uvertical(){    
        
    this.changing_y -= ufoSpeed.y;
    
    //End of function
    return;    
  }
  
  //scales the UFO
  void ufo_scale(){
    
    //End of function
    return;
  }  
  
  //Resets the coordinates of the UFO and other variables
  void resetsCoordinates(){
    this.changing_x = ufoCoordinates.x;
    this.changing_y = ufoCoordinates.y;
    
    this.hasTouchedDown = false;
    this.startMovingRight = false;
    //End of function
    return;    
  } 
  
}
