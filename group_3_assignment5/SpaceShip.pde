class SpaceShip{
  //Class variables
  PShape SpaceShip; //Spaceship PShape
  PVector sCoord; //starting coordinates of the spaceship
  float initialAngle; //this is the starting angle of the spaceShip
  color colorofballs; //This will the color of the balls
  int numberofBalls; //These are the number of balls that will be rotating around the spaceship
  float [] startAngles; 
  
  //Constructor
  SpaceShip(int size, PVector sCoord, color spaceShipcolor, color colorofBalls, int numberofBalls){
    /*
    This constructor is going to be used to create the spaceship.
    
    Inputs:
      int size: This will be the size of the box (represent the ship)
      PVector sCoord: This PVector will contain (distance_from_center, orbit_speed, starting_angle)
    */
    
    //This is the starting coordinates
    this.sCoord = sCoord;
    
    //These will be the color of the balls
    this.colorofballs = colorofBalls;
    
    //Creating the SpaceShip PShape variables
    this.SpaceShip = this.createSpaceShip(size, spaceShipcolor);
    
    //This is the startingAngle
    this.initialAngle = this.sCoord.z;
    
    //This will get the values of the balls that will be rotated
    this.numberofBalls = numberofBalls;
    
    //This function is going to get the starting points of the spheres
    this.startAngles = this.anglesofSpheres();
    
    //End of function
    return;
  }
  
  //This function is going to fill out the angles
  float [] anglesofSpheres(){
    float [] result = new float [this.numberofBalls];
    
    float middle = 2*PI / this.numberofBalls;
    
    //This will have the spaces in between the spheres
    for(int i = 0; i < this.numberofBalls; i++){
      result[i] = (i + 1) * middle;
    }
    
    //End of function
    return result;
  }
  
  //This functions is going to create the spaceship
  PShape createSpaceShip(int size, color inputColor){
    //This will create a PShape of the spaceship
    PShape result = createShape(BOX, size);
    result.setFill(inputColor);         
        
    //End of function
    return result;    
  } 
  
  //This function is going to move the spaceship around
  void moveSpaceship(){
    /*
    This function is going to move the spaceship around in orbit, around the center point
    
    This functions also going to move the spheres that are rotating about the spaceShip
    */
    
    rotateY(this.sCoord.z);
    translate(this.sCoord.x, 0, 0);
    shape(SpaceShip);
    for(int i = 0; i < this.numberofBalls; i++){
      pushMatrix();
      noStroke();
      PShape sphere = createShape(SPHERE, 2);
      sphere.setFill(this.colorofballs);
      rotateZ(this.startAngles[i] + this.sCoord.z);
      translate(20, 0, 0);
      shape(sphere);
      popMatrix();
    }
    
    //This will change the roation values of the spaceship
    if(this.sCoord.z >= 2*PI + this.initialAngle){
      //Seeting the value back to normal
      this.sCoord.z = this.initialAngle;
    }else{
      //Increase the theta values
      this.sCoord.z += this.sCoord.y;
    }
    
    
    //End of function
    return;    
  }
  
  
  
};
