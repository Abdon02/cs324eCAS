// RULES
//  - If there is more enemies than friends, the fish will move to the 2 right and 1 down
//  - If there is more friends than enemies, the fish will move to the 1 right and 3 down
//  - If there is equal number of friends and enemies, the fish will move 1 right and 1 down 

class Frog {
    
  PVector location;
  color c;
  float scale;
  
  Frog(PVector location, float scale, color c ){
    colorMode(RGB, 255, 255, 255);
    this.location = location;
    this.scale = scale;
    this.c = c;
  }
  
   void display(Board playingBoard){
    pushMatrix();
      translate(this.location.x, this.location.y + playingBoard.sizeBox/2);
      scale(this.scale);
        
      //body
      fill(this.c);
      ellipse(0, 60, 70, 90);

      //legs
      fill(this.c);
      line(-45, 55, 0, 100);
      line(45, 55, 0, 100);
      ellipse(0, 110, 60, 10);

      
      //FROG`s mouth
      fill(0,100,10);
      line(-20,55,20,55);
      
      //FROG`s eye left
      fill(255);
      ellipseMode(CENTER);
      ellipse(-15, 15, 25, 25);
      fill(0);
      ellipse(-15, 15, 10, 10);
      
      //FROG`s eye right
      fill(255);
      ellipseMode(CENTER);
      ellipse(15, 15, 25, 25);
      fill(0);
      ellipse(15, 15, 10, 10);
    popMatrix();
  }
  
    PVector neighborCount(Board playingBoard){
    // Define variables
    int matching = 0;
    int enemy = 0;
    PVector gridLoc = new PVector (int(this.location.x/playingBoard.sizeBox), int(this.location.y/playingBoard.sizeBox)); 
    int x = int(gridLoc.x);
    int y = int(gridLoc.y);
    
    for (int i = x-1; i <= x+1; i ++) {
      for (int j = y-1 ; j <= y+1; j ++) {
        if (i >= 0 && i <= playingBoard.currentBoard.length -1 && j >= 0 && j <= playingBoard.currentBoard.length -1){
          if (playingBoard.currentBoard[i][j] == 1){
            matching += 1;
          } else if (playingBoard.currentBoard[i][j] > 1) {
            enemy += 1;
          }
        }
      }
    }

    // Return counts of matching and enemy colors
    return new PVector (matching, enemy);
    
  }
  void move(Board playingBoard){
    PVector neighbors = neighborCount(playingBoard);
    int matching = int(neighbors.x);
    int enemy = int(neighbors.y);
    int size = playingBoard.sizeBox;
    int count = matching - enemy;
    
    // Display current locationition
    this.display(playingBoard);

    // If more matches than enemies
    if (count > 0){
        this.location.x += size;
        this.location.y += 3 * size;
    // If equal
    } else if (count == 0) {
      this.location.x += size;
      this.location.y += size;
    }
    // if more enemies
    else {
      this.location.x += 2 * size;
      this.location.y += size;
    }

    // do not let leave
    this.location.x = constrain(this.location.x, size/2, playingBoard.currentBoard.length * size - size/2);
    this.location.y = constrain(this.location.y, size/2, playingBoard.currentBoard.length * size - size/2);
}
}
