/*
Notes:
1.- The Fish will move around hte board depending on what it's x and y coordinates is incomparison to the boards
2.- The Fish image will then be displayed depening on its current x and y cooridnates and will be multiplied by the size of the individual box
3.- The Fish move accordingly to these rules:
  - If there is more enemies than friends, the fish will move to the left and upward
  - If there is more friends than enemies, the fish will move to the right and go downward
  - If there is equal number of friends and enemies, the fish will move downward
4.- When it reaches the further right or bottom without reaching the bottom of the square thent it goes back to teh start
*/

class BluePiece{
  //Class variables
  PImage blueFishImage;
  int sizeBox;
  Board inputtedBoard;
  int posX; //Current position of the piece on the board 
  int posY; //Current position of the piece on the board
  PVector startVal; //This is the starting x and y values
  boolean ReachedRightSide;
  boolean ReachedBottomSide;
  boolean firstTime = false;
  
  //Constructor
  BluePiece(PImage blueFishImage, int sizeBox, Board inputtedBoard, PVector startVal){
    this.blueFishImage = blueFishImage;    
    this.sizeBox = sizeBox;
    this.inputtedBoard = inputtedBoard;
    this.startVal = startVal;
    this.posX = (int) startVal.x;
    this.posY = (int) startVal.y;  
    this.ReachedRightSide = false;
    this.ReachedBottomSide = false;
    
    
    //End of function
    return;
  }
  
  PVector numberofNeighbors(){
    /*
    This function is going to see how manyNeighbors are around the blue piece
    
    It will count the number of blue, enemies, or white tiles that mean nothing
    */
    
    //This for loop will count the number of 
    int blueTile = 0;
    int enemyTile = 0;
    
    //Looping through the tiles from the board
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        //Edge cases to ignore the indexes out of bounds
        if(((this.posX - 1 + i) < 0 || (this.posY - 1 + j) < 0)){
          //println("IF 1, cellX: ", this.posX - 1 + i, " cellY: ", this.posY - 1 + j);
          continue;
        }else if((this.posX - 1 + i) == this.posX && (this.posY - 1 + j) == this.posY){
          //println("IF 2, cellX: ", this.posX - 1 + i, " cellY: ", this.posY - 1 + j);
          continue;          
        }else if((this.posX - 1 + i) >= this.inputtedBoard.currentBoard.length || (this.posY - 1 + j) >= this.inputtedBoard.currentBoard[0].length){
          //println("IF 3, cellX: ", this.posX - 1 + i, " cellY: ", this.posY - 1 + j);
          continue;
        }
        
        //If they passed all those annoying test cases
        int valueCellij = this.inputtedBoard.currentBoard[this.posX - 1 + i][this.posY - 1 + j];
        
        //println("i: ", this.posX - 1 + i, " j: ", this.posY - 1 + j, " number: ", valueCellij);
        
        
        //If the value of "valueCellij" is 1 or 2 then it is an enemy tile
        if(valueCellij == 1 || valueCellij == 2){
          enemyTile += 1;          
        }else {
          blueTile += 1;
        }
      }      
    }
    
    //println("Blue: ", blueTile, " Enemie: ", enemyTile);
    
    //End of function
    return new PVector(blueTile, enemyTile);
  }
  
  void moveFishCoordinates(){
    /*
    This function is going to change the coordinates of the blue fish Image around the board    
    */
    
    if(!this.ReachedRightSide && !this.ReachedBottomSide){
    
      //This function will return the number of neighbors that the tile has at the moment
      PVector neighbors = this.numberofNeighbors();
      int diffCount = (int)neighbors.x - (int)neighbors.y;
      //println("Matching: ", (int)neighbors.x, " Enemies: ", (int)neighbors.y);
      //println("diffcount: ", diffCount);
      
      //We now use the rules in order to change the position of the tile
      if(diffCount < 0){
        //There is more enemies than matching
        this.posX += 2;
        this.posY -= 1;
      }else if(diffCount > 0){
        //If there are more matching than enemies
        this.posX += 1;
        this.posY += 2;
      }else{
        //If they are balance then the figure goes down
        this.posX += 1;
        this.posY += 0;
      }
      
      //println("   posX: ", this.posX, "   posy: ", this.posY);
      
      //End of function
      return;
    }
    
    //End of function
    return;
  }
  
  void finalizeCoordinates(){
    /*
    This function will make the piece move back to the start if it has reached the bottom right of borad game
    */
    
    //Constrict the values (0, 19)
    this.posX = constrain(this.posX, 0, this.inputtedBoard.currentBoard.length - 1);
    this.posY = constrain(this.posY, 0, this.inputtedBoard.currentBoard[0].length - 1);
    
    if(this.posX == this.sizeBox - 1 && this.posY == this.sizeBox - 1){
      this.ReachedBottomSide = true;
      this.ReachedRightSide = true;
      
    }else if(this.posX == this.sizeBox - 1 && this.posY != this.sizeBox - 1){
      //Reached the far right
      if(!this.firstTime){
        this.ReachedRightSide = true;
        this.firstTime = true;
        return;
      }
      this.ReachedRightSide = true;
      this.posX = this.sizeBox - 1;
      this.posY += 1;
      
    }else if(this.posY == this.sizeBox - 1 && this.posX != this.sizeBox - 1){
      //Reached the bottom
      if(!this.firstTime){
        this.ReachedBottomSide = true;
        this.firstTime = true;
        return;
      }
      this.ReachedBottomSide = true;
      this.posY = this.sizeBox - 1;
      this.posX += 1;
      
    }    
    
    //End of function
    return;
  }
  
  
  void display(){
    /*
    This function is going to display the piece on the board.
    
    It will change the coordinates of the Image on the board    
    */
    
    //Making the blueFishImage smaller
    blueFishImage.resize(40, 40);
    
    //Display the image on top of the board
    image(blueFishImage, this.posX * this.sizeBox * 2, this.posY * this.sizeBox* 2);
    
    //Move the coordinates of the fish
    this.moveFishCoordinates();
    
    //Finalize the coordinates
    this.finalizeCoordinates(); 
    
    //println("New (PosX): ", this.posX, " New (PosY): ", this.posY, " rightSide: ", this.ReachedRightSide, " bottomSide: ", this.ReachedBottomSide);
    
    
    //End of function
    return;    
  }
  
  
}
