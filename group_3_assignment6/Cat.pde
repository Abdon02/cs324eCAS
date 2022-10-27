class cat{
  // Declare position, scale, and color
  PVector pos;
  float scale;
  color col;
  
  cat(){
    // Change color mode and define variables
    colorMode(HSB, 360, 100, 100);
    this.pos = new PVector (250, 250);
    this.scale = 2;
    this.col =  color (random(0, 360), random(0,100), random(0,100));
    colorMode(RGB, 255, 255, 255);
  }
  
  cat(PVector pos, float scale, color col ){
    // Change color mode and define variables
    colorMode(HSB, 360, 100, 100);
    this.pos = pos;
    this.scale = scale;
    this.col = col;
    colorMode(RGB, 255, 255, 255);
  }
  
  void display(Board playingBoard){
    // Draw cat
    pushMatrix();
      // Change color mode, translate, and scale
      colorMode(HSB, 360, 100, 100);
      translate(this.pos.x, this.pos.y + playingBoard.sizeBox/2);
      scale(this.scale);
  
      
      // Tail
      fill(hue(this.col), constrain(saturation(this.col)-30, 0, 100), brightness(this.col));
      pushMatrix();
        translate(21, -83.5);
        rotate(PI/20);
        ellipse(0, 0, 10, 80);
      popMatrix();
      
      // Outer ears
      fill(this.col);
      triangle(-20, -108.5, -20, -88.5, 0, -108.5);
      triangle(20, -108.5, 20, -88.5, 0, -108.5);
      
      // Inner ears
      fill(hue(this.col), constrain(saturation(this.col)-30, 0, 100), brightness(this.col));
      triangle(17, -105.5, 17, -88.5, 0, -105.5);
      triangle(-17, -105.5, -17, -88.5, 0, -105.5);
      
      // Body
      fill(this.col);
      ellipse (0, -43.5, 45, 70);
    
      // Head
      ellipse (0, -88.5, 40, 40);
      
      // Whiskers
      arc(-4, -83.5, 7, 7, 0, PI);
      arc(4, -83.5, 7, 7, 0, PI);
      
      // Legs
      fill(hue(this.col), constrain(saturation(this.col)-30, 0, 100), brightness(this.col));
      ellipse(-12.5, -28.5, 20, 50);
      ellipse(12.5, -28.5, 20, 50);
      
      // Feet
      fill(this.col);
      arc(-12.5, -6, 14, 14, PI, TWO_PI);
      arc(12.5, -6, 14, 14, PI, TWO_PI);
      
      // Toes
      fill(hue(this.col), constrain(saturation(this.col)-30, 0, 100), brightness(this.col));
      ellipse(-12.5, -3.5, 7, 7);
      ellipse(-19.5, -3.5, 7, 7);
      ellipse(-5.5, -3.5, 7, 7);
      
      ellipse(12.5, -3.5, 7, 7);
      ellipse(5.5, -3.5, 7, 7);
      ellipse(19.5, -3.5, 7, 7);
      
      // Eyes
      fill(0);
      ellipse (-7, -97, 5, 5);
      ellipse (7, -97, 5, 5);
      
          
      // Nose
      triangle(0, -88.5, 4, -84.5, -4, -84.5);
      
      colorMode(RGB, 255, 255, 255);
    popMatrix();
  }
  
  PVector neighborCount(Board playingBoard){
    // Define variables
    int matchCount = 0;
    int enemyCount = 0;
    PVector gridLoc = new PVector (int(this.pos.x/playingBoard.sizeBox), int(this.pos.y/playingBoard.sizeBox)); 
    int x = int(gridLoc.x);
    int y = int(gridLoc.y);
    
    // Count the number of matching color or other color tiles around position including current position
    for (int i = x-1; i <= x+1; i ++) {
      for (int j = y-1 ; j <= y+1; j ++) {
        // Do not count if edge case
        if (i >= 0 && i <= playingBoard.currentBoard.length -1 && j >= 0 && j <= playingBoard.currentBoard.length -1){
          if (playingBoard.currentBoard[i][j] == 1){
            matchCount += 1;
          } else if (playingBoard.currentBoard[i][j] > 1) {
            enemyCount += 1;
          }
        }
      }
    }

    // Return counts of matching and enemy colors
    return new PVector (matchCount, enemyCount);
    
  }
  void move(Board playingBoard){
    // Declare variables
    PVector neighbors = neighborCount(playingBoard);
    int matchCount = int(neighbors.x);
    int enemyCount = int(neighbors.y);
    int box = playingBoard.sizeBox;
    int biggerBy = matchCount - enemyCount;
    
    // Display current position
    this.display(playingBoard);
    
    // If more matches than enemies, move 2 in each direction
    if (biggerBy > 0){
        this.pos.x += 2 * box;
        this.pos.y += 2 * box;
    // If equal matches and enemies, move 1 to the right and 2 down
    } else if (biggerBy == 0) {
      this.pos.x += box;
      this.pos.y += 2 * box;
    // If more enemies than matches, move 2 to the right and 1 down
    } else {
      this.pos.x += 2 * box;
      this.pos.y += box;
    }
    
    // Prevent position from leaving the board
    this.pos.x = constrain(this.pos.x, box/2, playingBoard.currentBoard.length * box - box/2);
    this.pos.y = constrain(this.pos.y, box/2, playingBoard.currentBoard.length * box - box/2);
    

  }
}
