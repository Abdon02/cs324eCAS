options options1;
home home1;
character player;


ShapeDispenser dispenser;
int numberOfShapes;
int currentVal = 0;
int numCircles = 4;
int numSquares = 2;
int numTriangles = 6;
float circleFalling = 1;
float squareFalling = 1;
float triangleFalling = 1;
float ground = 700;
float size = 30;


void setup(){
  rectMode(CENTER);
  size(800, 800);
  options1 = new options();
  home1 = new home();
  player = new character();
  
  
  //Setting up the values that will be needed for instantiating the dispenser
  PVector numShapes = new PVector(numCircles, numSquares, numTriangles);
  PVector fallingSpeed = new PVector(circleFalling, squareFalling, triangleFalling);
  numberOfShapes = (int) (numShapes.x + numShapes.y + numShapes.z);
  
  //setting up the values of dispenser
  dispenser = new ShapeDispenser(numShapes, size, fallingSpeed, ground);
  
  //frameRate(10);
  
  
}

void draw(){
  options1.keyPressed(home1);
  setting();
  if (home1.pause){
    home1.display();
  } else if (options1.pause){
    options1.display(home1);
  } else {
    //If not every shape has landed on the ground then it will keep looping 
    if(!dispenser.allShapesLanded()){
      //Change the background
      setting();
      player.display();
      dispenser.dispenseShape(player);
    } else {
      setting();
    }
  }
}

void setting(){
  noStroke();
  background(134, 236, 255);
  fill(116, 203, 109);
  rect(width/2, height * 7.5/8, width, height / 8);
  fill(255);
  rect(width-150, 50, 200, 50);
  fill(0);
  text("Score:" + player.score, width-150, 70);
  fill(255);
  float radius = 90;
    ellipse(100, 100, radius, radius);
    ellipse(100 + 40, 100, radius + 20, radius + 20);
    ellipse(100 + 80, 100, radius, radius);
    
    ellipse(600, 150, radius, radius);
    ellipse(600 + 40, 150, radius + 20, radius + 20);
    ellipse(600 + 80, 150, radius, radius);
};
