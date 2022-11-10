/*
This class will create the square points that will be needed in the game.
Square points will be worth 2 points.
Ideas for this class:
  1. It will have 2 different textures (both will worth the same).
  2. The textures will be chosen randomnly
  3. The textures will be added to the shape
*/

class SquarePoints extends ShapePoints{
  //Constructor
   SquarePoints(int numShapes, float size, float fallingSpeed, float ground){
    //Setting up the values
    super(numShapes, size, fallingSpeed, ground);
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
  
}
