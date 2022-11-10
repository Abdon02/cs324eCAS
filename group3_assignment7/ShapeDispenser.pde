/*
This class will dispense the different shapes from the sky to the ground.

This class has a relationship (refers to other class(es)) with:
  1. CirclePoints
  2. TrianglePoints
  3. SquarePoints
*/

class ShapeDispenser{
  //Class variables
  PVector numShapes; //This will be the number of circles, squares, and triangles (circle, squares, triangles)
  //SquarePoints square;  //This will start a SquarePoint class instance
  SquarePoints square;
  TrianglePoints triangle; //This will start a TrianglePoints class instance
  CirclePoints circle;  //This will start a CirclePoints class instance
  int circleCounter; //This will be the counter for the circle
  int squareCounter; //This will be the counter for the square
  int triangleCounter; //This will be the counter for the triangle
  
  //Create constructor
  ShapeDispenser(PVector numShapes, float size, PVector fallingSpeed, float ground){
    //Setting up the values
    this.numShapes = numShapes;
    this.circleCounter = 0;
    this.squareCounter = 0;
    this.triangleCounter = 0;
    
    //Starting to instantiate the other classes
    circle = new CirclePoints((int) this.numShapes.x, size, fallingSpeed.x, ground);
    square = new SquarePoints((int) this.numShapes.y, size, fallingSpeed.y, ground);
    triangle = new TrianglePoints((int) this.numShapes.z, size, fallingSpeed.z, ground);
    
    //Choosing random color values for each shape
    circle.colorArray = randomColor(circle.colorArray);
    square.colorArray = randomColor(square.colorArray);
    triangle.colorArray = randomColor(triangle.colorArray);
    
    //Choosing randomPosition values for each shape
    circle.shapePositions = randomPositions(circle.shapePositions);
    square.shapePositions = randomPositions(square.shapePositions);
    triangle.shapePositions = randomPositions(triangle.shapePositions);
    
    //End of function
    return;
  }
  
  color[] randomColor(color [] colorArray){
    /*
    This function is going to store random color into the array that was inputted
    
    Input:
      - colorArray: (color []) it is an array that has all the colors

    Output:
      - A color array that now contains random color values
    */
    
    //looping through the color array
    for(int i = 0; i < colorArray.length; i++){
      colorArray[i] = color(random(0, 255), random(0, 255), random(0, 255));
    }
    
    //Returning the color array
    return colorArray;
  }
  
  PVector [] randomPositions(PVector [] shapePositions){
    /*
    This function is going to get random shape positions for each shape
    
    Input:
      - shapePositions: (PVector []) it is the shape position of every shape
      
    Output:
      - shapePosition: It will be an array with positions of a shape alredy randomized
    */
    
    int h = 0;
    //looping through the positionArray
    for(int i = 0; i < shapePositions.length; i++){
      shapePositions[i] = new PVector(random(50, width - 50), h, 0);
      h -= 30;
    }
    
    //returning the array of PVectors
    return shapePositions;    
  }
    
  void dispenseShape(character player){
    /*
    This function is going to dispense a new shape into the canvas when it is called.
    This function is going to be calles in the draw function.
    */
    
    //Calling the next Shape to be dispensed
    this.nextShape();    
    
    //Now we display that shape to the canvas, we call all of the classes (circle, square, triangle)
    this.displayShapes(player);
    
    //End of function
    return;
  }
  
  boolean allShapesLanded(){
    /*
    This function is going to see if all the shapes have landed
    */
    if(circle.haslastShapeLanded() && square.haslastShapeLanded() && triangle.haslastShapeLanded()){
      return true;
    }
    
    return false;
  }
  
  void displayShapes(character player){
    /*
    This function is going to call the shapes classes to display the shapes on the canvas
    */
    
    circle.loopShapes(this.circleCounter, player);
    square.loopShapes(this.squareCounter, player);
    triangle.loopShapes(this.triangleCounter, player);
    
    int points = 0;
    
    for(int i = 0; i < circle.numShapes; i++){
      points += circle.shapePositions[i].z;
    }
    
    for(int i = 0; i < triangle.numShapes; i++){
      points -= triangle.shapePositions[i].z;
    }
    
    for(int i = 0; i < square.numShapes; i++){
      points += 2 * square.shapePositions[i].z;
    }
    
    player.score = points;

    
    //End of function
    return;
  }
  
  void nextShape(){
    /*
    This function is going to decide what shape will be distributed out.
    
    Remarks:
      1.- It will decide what shape by random chance
      2.- It will decide on a new shape every iteration until all the shapes have fallen to ground
      3.- If one shape has no more shapes then it will decide on the next avilable shape    
    */
    
    //This will keep looping until all the shapes have been released
    while(true && (!circle.releasedShapes || !square.releasedShapes || !triangle.releasedShapes)){
      //This is the randomValue
      float val = random(0, 3);
      
      if(val <= 1 && circle.releasedShapes == false){
        //A circle will be released
        this.circleCounter += 1;
        break;
      }else if(val <= 2 && square.releasedShapes == false){
        //A square will be released
        this.squareCounter += 1;
        break;
      }else if(val <= 3 && triangle.releasedShapes == false){
        //A triangle will be released
        this.triangleCounter += 1;
        break;
      }else{
        continue;
      }
      
    }
    
    //End of function
    return;    
  }
  
  
}
