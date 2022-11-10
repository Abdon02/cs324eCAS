class ShapePoints{
  //Class variables
  int numShapes; //The number of shapes that will be displayed
  float size; //The size of the each circle that will be 
  float fallingSpeed; //This is the falling speed that all the shapes of this class will experience
  color [] colorArray; //This array will hold an image that will be correlated to a specific circle
  PVector [] shapePositions; //This array will hold the position of each shape
  boolean releasedShapes; // This will see if all the shapes have been displayed already
  int shapeGround; //This is the new shape that is already in ground and values beforehand shouldnt be drawn
  float ground; //This is the ground level
  
  //Constructor
  ShapePoints(int numShapes, float size, float fallingSpeed, float ground){
    //Setting up the class variables
    this.numShapes = numShapes;
    this.size = size;
    this.fallingSpeed = fallingSpeed;
    this.shapeGround = 0;
    this.releasedShapes = false;
    this.ground = ground;
    
    //Allocating space for the array of images
    this.colorArray = new color[this.numShapes];
    this.shapePositions = new PVector[this.numShapes];
    
    //End of function
    return;
  }    
  

  void display(int ite){
  }
  
  
  void loopShapes(int ite, character player){
    /*
    This function is going to display all the shapes that have been released already
    
    Inputs:
      - ite: (int) this is the current iteration count
      
    Output:
      - It will display the row of circles into the canvas
    */
    
    //Checks if all the shapes have been realead
    this.hasShapesBeenReleased(ite);
    
    //Checks what shapes has already hit the ground
    this.shapeNotOnGround();
    
    
    //This will loop through the values
    for(int i = this.shapeGround; i < ite; i++){
      if (player.x + 41 <= shapePositions[i].x && player.x + 154 >= shapePositions[i].x &&
          player.y + 132 <= shapePositions[i].y && player.y + 132 >= shapePositions[i].y){
        shapePositions[i].z = 1;
      }
    
      if(shapePositions[i].z == 0){
        //This will display the current shape on the canvas
        this.display(i);
      } 

      //This will increase the y value of the currentShape
      this.deltaY(i);
    }
    
    //End of function
    return;
  }
  
  void deltaY(int iter){
    /*
    This function is going to move every single shape downward by the falling speed
    
    Inputs:
      - iter: (int) this is the current iteration in the array
      
    Output:
      - Nothing, we will only increase the y position of the current shape
    */
    
    //increasing the y position
    this.shapePositions[iter].y += this.fallingSpeed;
    
    //end of function
    return;
  }
  
  void shapeNotOnGround(){
    /*
    This function is going to check if this.shapeGround is has already hit the ground.
    
    Remarks:
      1.- If the current shape already hit the ground then it will move to the next shape on the array    
    */
    
    if(this.shapeGround == this.numShapes){
      //end of function
      return;
    }
    
    if(this.shapePositions[this.shapeGround].y >= this.ground){
      this.shapeGround += 1;
    }
    
    //End of function
    return;
  }
  
  void hasShapesBeenReleased(int ite){ 
    /*
    This function will check if all the shapes have been released already
    
    Input:
      - ite: (int) this the current iteration
      
    Output:
      - It will either change the value of this.releasedShapes to true (that all the shapes have been released) or false (not all the shapes have been released)
    */
    if(ite == this.numShapes){
      this.releasedShapes = true;
    }
    
    //End of function
    return;
  }
  
  boolean haslastShapeLanded(){
    /*
    This function will check if the last shape has landed. If it has then it will return true else false
    */
    
    if(this.shapePositions[this.numShapes - 1].y >= this.ground){
      return true;
    }
    
    return false;
  }
  
 
}
