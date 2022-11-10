class win extends menu{
  catTimer cat_timer;
  boolean restart;
  
  // Default constructor
  win(){
    super(new PVector(width/2, height/2), new PVector(width/2, height/2), false, "Replay"); // Use menu to make Start button
    cat_timer = new catTimer(location, restart_button); //Cat timer to control cat across screen
    restart = false;
  }
  
  // Define display
  void display(character player){
    cat_timer.reset = false; 
    stroke(0);

    // Draw box, cat, and restart button
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    text(player.score + " Points!", location.x, location.y - 150);
    fill(255);
    cat_timer.display();
    restart_button.display();
    
    // Display stars contingent on score
    if (player.score >= 5){
      star(width/2 - size.x/3, restart_button.pos.y + size.y/4);
    }
    
    if (player.score >= 15){
      star(width/2, restart_button.pos.y + size.y/4);
    }
    
    if (player.score >= 25){
      star(width/2 + size.x/3, restart_button.pos.y + size.y/4);
    }
    
    // Start button
    if (restart_button.buttonClicked()){
      this.pause = false;
      this.restart = true;
      cat_timer.reset();
    }
  }
  
  // Define star
  void star(float x, float y){
    pushMatrix();
      translate(x, y);
      scale(2);
      noStroke();
      fill(255, 243, 0);
      triangle(-10, 0, 10, 0, 0, -20);
      rotate(2 * PI/5);
      triangle(-10, 0, 10, 0, 0, -20);
      rotate(2 * PI/5);
      triangle(-10, 0, 10, 0, 0, -20);
      rotate(2 * PI/5);
      triangle(-10, 0, 10, 0, 0, -20);
      rotate(2 * PI/5);
      triangle(-10, 0, 10, 0, 0, -20);
      fill(0);
    popMatrix();
  }

}
