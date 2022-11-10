/*
This class will create the Circle points that will be needed for in the game.

The circle points will be worth 1 point.

Ideas for this class:
  1. It will have 2 different textures (both will worth the same).
  2. The textures will be chosen randomnly
  3. The textures will be added to the shape
*/

class CirclePoints extends ShapePoints{
  //Constructor
  CirclePoints(int numShapes, float size, float fallingSpeed, float ground){
    //Setting up the values
    super(numShapes, size, fallingSpeed, ground);
  }
  
  void display(int ite){
    /*
    This function is going to display a circle with its corresponding color
    
    Input:
      - ite: (int) it is the current iteration count
      
     Output:
       - It will display the circle onto the canvas
    */
    
    //This the ellipse
    ellipseMode(CENTER);
    fill(colorArray[ite]);
    ellipse(shapePositions[ite].x, shapePositions[ite].y, size, size);
    
    //End of function
    return;
  }
}
