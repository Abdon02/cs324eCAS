/*
This class will create Triangle Points that will be used in the game.

Triangle Points will be worth -1 points (deduction).

Ideas for this class:
  1. It will have 2 different textures (both will worth the same).
  2. The textures will be chosen randomnly
  3. The textures will be added to the shape
*/

class TrianglePoints{
  //Class variables
  int numTriangles; //This will be the number of triangles
  float size; //This will be size of each triangle  
  float fallingSpeed; //This is going to be the falling speed of each triangle
  color [] colorArray; //This array will hold images that will be correlated to a specific triangle 
  PVector [] shapePositions; //This array will hold all the positions of every shape
  int shapeGround; //This is the new shape that is already in ground and values beforehand shouldnt be drawn
  boolean releasedShapes; //This variable will see if all the shapes have been released
  float ground; //This is the ground level
  
  //Constructor
  TrianglePoints(int numTriangles, float size, float fallingSpeed, float ground){
    //setting up the values
    this.numTriangles = numTriangles;    
    this.size = size;
    this.fallingSpeed = fallingSpeed;
    this.shapeGround = 0;
    this.releasedShapes = false;
    this.ground = ground;
    
    //Setting an array of PImages
    this.colorArray = new color[this.numTriangles];
    
    //Setting an array of PVectors
    this.shapePositions = new PVector[this.numTriangles];
    
    //End of function
    return;
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
    
    if(this.shapeGround == this.numTriangles){
      //End of function
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
    if(ite == this.numTriangles){
      this.releasedShapes = true;
    }
    
    //End of function
    return;
  }
  
  boolean haslastShapeLanded(){
    /*
    This function will check if the last shape has landed. If it has then it will return true else false
    */
    
    if(this.shapePositions[this.numTriangles - 1].y >= this.ground){
      return true;
    }
    
    return false;
  }
  
}
