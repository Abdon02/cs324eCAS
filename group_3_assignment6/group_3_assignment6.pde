//Variables
Board playingBoard;
int boardSize;
cat kitty;
BluePiece blueFish; //This is the blue fish character piece 
PImage blueFishImage; //This is the PImage of the blue fish

void setup(){
  frameRate(2);
  //Size of the canvas
  size(800, 800);
  
  //This is how big the gameBoard will be (20 x 20)
  boardSize = 20;
  
  //setting up the class variables
  playingBoard = new Board(boardSize);  
  kitty = new cat(new PVector (playingBoard.sizeBox/2, playingBoard.sizeBox/2), .32, color (300, 0,0));

  //For the fish 
  blueFishImage = loadImage("./images/blueFish.jpg");
  PVector startingPoint = new PVector(0, 0);
  blueFish = new BluePiece(blueFishImage, boardSize, playingBoard, startingPoint);
  
}

void draw(){
  //Displaying the board on the canvas
  playingBoard.displayBoard();
  
  // Move cat
  kitty.move(playingBoard);
  
  //Display the fish
  blueFish.display();
}
