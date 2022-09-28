/*
Abdon Verdejo-Parada
av34626
*/

class Ground {
  //Class variables
  color ground_color;
  float x, y;
  
  //Constructor
  Ground(PVector coordinates, color c){
    this.ground_color = c;  
    this.y = coordinates.y;
    
    //Making sure that the x values is 0
    if(!(coordinates.x == 0)){
      println("The value of x for the ground needs to be 0");
      exit();
    }
    
    //Setting the value of x to the private variable
    this.x = coordinates.x;
  }
  
  //Display the ground
  void display(){
    //Create a rectangle at the bottom of the canvas
    colorMode(RGB, 255, 255, 255);
    noStroke();
    fill(this.ground_color);
    
    //Draw out the rectangle
    rect(this.x, this.y, 700, height - this.y);    
  }
  
  //Function that will redraw the canvas
  void redraws_canvas(){
    //redraws the scene
    background(13, 200, 250);    
    
    //End of function
    return;    
  }
  
  //Function that will call the whole process
  void resetCanvas(){
    this.redraws_canvas();
    this.display();
    
    //End of function
    return;
  }
  
}
