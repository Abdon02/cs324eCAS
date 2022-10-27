class Board{
  //Class Variables
  int [][] currentBoard;
  int sizeBox;
  int boardSize;
  
  //Constructor
  Board(int boardSize){
    //Setting up the variables
    this.boardSize = boardSize;
    
    //Getting the value of sizeBox
    this.sizeBox = this.getsizeBox();
    
    currentBoard = this.randomBoard();
  }
  
  int getsizeBox(){
    /*
    This functions is going compute the sizeBox value
    */
    
    //End of function
    return (int)(width / this.boardSize);    
  }
  
  void displayBoard(){
    /*
    This function is going to display the board on the canvas
    */
    for(int row = 0; row < this.currentBoard.length; row++){
      for(int col = 0; col < this.currentBoard.length; col++){
        if(this.currentBoard[row][col] == 1){
         //This will be a red tile
         fill(255, 0, 0);
        }else if(this.currentBoard[row][col] == 2){
          //This will be a green tile
          fill(0, 255, 0);
        }else if(this.currentBoard[row][col] == 3){
          //This will be a blue tile
          fill(0, 0, 255);          
        }else{
          //This will be a white tile
          fill(255, 255, 255);
        }
        
        //Draw out the rectangles on the canvas
        int x = row * this.sizeBox;
        int y = col * this.sizeBox;
        rect(x, y, this.sizeBox, this.sizeBox);
      }
    }
    
    //End of function
    return;
  }
  
  int [][] randomBoard(){
    /*
    This function is going to create a random board    
    */
    int row = (int)(width / this.sizeBox);
    int col = (int)(height / this.sizeBox);
    
    //Creating the boardCreated
    int [][] boardCreated = new int [row][col];
    
    //This will choose the randomvalues for boardCreated varaible
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        float randVal = random(0, 1);
         
        if(randVal <= 0.7){ 
          //the tile is white
          boardCreated[i][j] = 0;
        
        }else if(randVal <= .8){ 
          //the tile is red
          boardCreated[i][j] = 1;
           
        }else if(randVal <= .9){
          //the tile is for green
          boardCreated[i][j] = 2;
          
        }else{
          //the tile is for blue
          boardCreated[i][j] = 3;
          
        }
      }      
    }
    
    //End of function
    return boardCreated;
  }
  
  
}
