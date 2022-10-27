//Variables
Board playingBoard;
int boardSize;
cat kitty;

void setup(){
  frameRate(2);
  //Size of the canvas
  size(800, 800);
  
  //This is how big the gameBoard will be (20 x 20)
  boardSize = 20;
  
  //setting up the class variables
  playingBoard = new Board(boardSize);  
  kitty = new cat(new PVector (playingBoard.sizeBox/2, playingBoard.sizeBox/2), .32, color (300, 0,0));

  
}

void draw(){
  //Displaying the board on the canvas
  playingBoard.displayBoard();
  
  // Move cat
  kitty.move(playingBoard);
}
