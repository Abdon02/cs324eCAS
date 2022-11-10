/*
This class will create Triangle Points that will be used in the game.

Triangle Points will be worth -1 points (deduction).

Ideas for this class:
  1. It will have 2 different textures (both will worth the same).
  2. The textures will be chosen randomnly
  3. The textures will be added to the shape
*/

class TrianglePoints extends ShapePoints{
  //Constructor
  TrianglePoints(int numShapes, float size, float fallingSpeed, float ground){
    //Setting up the values
    super(numShapes, size, fallingSpeed, ground);
  }

  
  void display(int ite){
    /*
    This function is going to display a single triangle  
    
    Inputs:
      - ite: (int) it is the current iteration on the array
      
    Output:
      - It will display the circle onto the canvas
    */
    
    //Drawing the triangle onto the canvas
    fill(colorArray[ite]);
    //triangle(this.shapePositions[ite].x, this.shapePositions[ite].y - this.size, cos(PI/2)*this.size, -sin(PI/2)*this.size, -cos(PI/2)*this.size, -sin(PI/2)*this.size);
    triangle(this.shapePositions[ite].x - cos(PI/4)*this.size, sin(PI/4)*this.size + this.shapePositions[ite].y,
      this.shapePositions[ite].x, this.shapePositions[ite].y - this.size,
      this.shapePositions[ite].x + cos(PI/4)*this.size, this.shapePositions[ite].y +  sin(PI/4)*this.size);
    
    //End of function
    return;
  }
}
