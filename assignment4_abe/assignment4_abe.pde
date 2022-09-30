/*
Abdon Verdejo-Parada
av34626
*/

//Global variables
Ground ground;
UFO flying_disk, flying_disk2;
Sun s1, s2;
PVector UFO1, UFO2;
PVector SpeedUFO1, SpeedUFO2;
PVector groundCoordinates;
color [] ufo_color1;
color [] ufo_color2;

//This will loop only once 
void setup(){
  //Setting up the size of background
  size(700, 700);
  
  //setting up the values for UFOs
  UFO1 = new PVector(0, 150, 250);
  UFO2 = new PVector(0, 300, 300);
  SpeedUFO1 = new PVector(3, 1);
  SpeedUFO2 = new PVector(2, 1);
  
  //Setting up the colors that will be used
  ufo_color1 = new color[] {color(149, 206, 52), color(206, 52, 57), color(227, 53, 184)};
  ufo_color2 = new color[] {color(55, 119, 227), color(236, 250, 56), color(219, 93, 188)};
  
  //Setting up the coordinates for the ground
  groundCoordinates = new PVector(0, 600);
  
  //Setting up the UFO and ground variables
  ground = new Ground(groundCoordinates, color(13, 250, 69));
  flying_disk = new UFO(UFO1, SpeedUFO1, ufo_color1, ground);
  flying_disk2 = new UFO(UFO2, SpeedUFO2, ufo_color2, ground);
  
  //Setting up the values of s1 and s2
  s1 = new Sun();
  s2 = new Sun(new PVector (width/2, 100), 40, .4, 2, 2, s1.ray_color, s1.center_color, new PVector (40, 80));
 
  
}


//This will loop constantly
void draw(){
  //Draw the background
  ground.resetCanvas();
  
  //Display the sun
  s1.display();
  s2.display();
  
  //Draw out the UFO
  flying_disk.display();
  flying_disk2.display();
  
  //Move the UFO
  flying_disk.moveUFO();
  flying_disk2.moveUFO();
}
