// Define global variables
import processing.sound.*;
SoundFile file;
options options1;
home home1;
win win1;
character player;
ShapeDispenser dispenser;
int numberOfShapes;
int currentVal = 0;
int numCircles = 40;
int numSquares = 20;
int numTriangles = 60;
float circleFalling = 1;
float squareFalling = 1;
float triangleFalling = 1;
float ground = 700;
float size = 30;
PVector numShapes = new PVector(numCircles, numSquares, numTriangles);
PVector fallingSpeed = new PVector(circleFalling, squareFalling, triangleFalling);

void setup(){
  // Set rectangle mode and size
  rectMode(CENTER);
  size(800, 800);
  
  // Define variables
  options1 = new options();
  home1 = new home();
  win1 = new win();
  player = new character();
  file = new SoundFile(this, "background.mp3");
  file.play();
  
  //Setting up the values that will be needed for instantiating the dispenser
  numberOfShapes = (int) (numShapes.x + numShapes.y + numShapes.z);
  
  //setting up the values of dispenser
  dispenser = new ShapeDispenser(numShapes, size, fallingSpeed, ground);
  
  
}

void draw(){
  // Determine if options menu pressed and show background
  options1.keyPressed(home1);
  setting();
  
  if (home1.pause){
    home1.display(); // Show home screen
  } else if (options1.pause){
    options1.display(home1); // Show options menu
  } else if (options1.restart || win1.restart){
    dispenser = new ShapeDispenser(numShapes, size, fallingSpeed, ground); // If restarted, reset values
    player = new character();
    options1.restart = false;
    win1.restart = false;
  } else if (win1.pause){
    win1.display(player); // Show win screen
  } else {
    //If not every shape has landed on the ground and not on some pause screen then it will keep looping 
    if(!dispenser.allShapesLanded()){
      //Change the background
      setting();
      player.display();
      dispenser.dispenseShape(player);
    } else {
      win1.pause = true; // Show win screen if all shapes landed
      setting();
    }
  }
}

void setting(){
  // Make background
  noStroke();
  background(134, 236, 255); // Sky
  fill(116, 203, 109);
  rect(width/2, height * 7.5/8, width, height / 8); // Grass
  fill(255);
  
  // Cloud 1
  ellipse(100, 100, 90, 90);
  ellipse(140, 100, 110, 110);
  ellipse(180, 100, 90, 90);
  // Cloud 2
  ellipse(600, 150, 90, 90);
  ellipse(640, 150, 110, 110);
  ellipse(680, 150, 90, 90);
  // Make score box
  rect(width-150, 50, 200, 50);
  fill(0);
  text("Score:" + player.score, width-150, 70);
  fill(255);
};
