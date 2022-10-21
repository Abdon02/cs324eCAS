//Variables
Board playingBoard;
int boardSize;

void setup(){
  //Size of the canvas
  size(800, 800);
  
  //This is how big the gameBoard will be (20 x 20)
  boardSize = 20;
  
  //setting up the class variables
  playingBoard = new Board(boardSize);  
  
}

void draw(){
  //Displaying the board on the canvas
  playingBoard.displayBoard();
}
