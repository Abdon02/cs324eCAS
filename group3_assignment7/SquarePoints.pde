/*
This class will create the square points that will be needed in the game.

Square points will be worth 2 points.

Ideas for this class:
  1. It will have 2 different textures (both will worth the same).
  2. The textures will be chosen randomnly
  3. The textures will be added to the shape
*/

class SquarePoints{
  //Class Variables
  int numSquares; //This will be the number of squares that will be used
  float size; //This will be size of all the squares
  color [] colorArray; //This array will hold an image that will be correlated to a specific square
  PVector [] shapePositions; //This array will hold the position of every shape
  float fallingSpeed; //This is going to be falling speed of each item
  int shapeGround; //This is the new shape that is already in ground and values beforehand shouldnt be drawn
  boolean releasedShapes; //This variable will see if all the shapes have been released
  float ground; //This is the ground level
  
  //Constructor
 SquarePoints(int numSquares, float size, float fallingSpeed, float ground){
    //Setting up the values
    this.numSquares = numSquares; 
    this.size = size;
    this.fallingSpeed = fallingSpeed;
    this.shapeGround = 0;
    this.releasedShapes = false;
    this.ground = ground;
    
    //Create an Array of colors, allocating space to choose what will be the texture to be shown
    this.colorArray = new color[this.numSquares];  
    
    //Create an array of PVectors, allocating space to choose what will be starting the positions of each shape
    this.shapePositions = new PVector[this.numSquares];
    
    //End of function
    return;
  }
  
  void display(int ite){
    /*
    This function is going to display a square on the canvas
    
    Inputs:
      - ite: (int) it is the iteration value
      
     Output:
       - it will display the shape onto the canvas     
    */
    
    rectMode(CENTER);
    fill(colorArray[ite]);    
    rect(shapePositions[ite].x, shapePositions[ite].y, this.size, this.size);    
    
    //End of function
    return;
 
  }
  
  void loopShapes(int ite){
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
      //This will display the current shape on the canvas
      this.display(i);
      
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
    
    if(this.shapeGround == this.numSquares){
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
    if(ite == this.numSquares){
      this.releasedShapes = true;
    }
    
    //End of function
    return;
  }
  
  boolean haslastShapeLanded(){
    /*
    This function will check if the last shape has landed. If it has then it will return true else false
    */
    
    if(this.shapePositions[this.numSquares - 1].y >= this.ground){
      return true;
    }
    
    return false;
  }
  

}
