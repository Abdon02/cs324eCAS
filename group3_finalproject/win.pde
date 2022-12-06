class win extends menu{
  boolean restart;
  button quit_button;
  
  // Default constructor
  win(){
    super(new PVector(width/2, height/2), new PVector(width/2, height/2), false, "Replay"); // Use menu to make Start button
    this.quit_button = new button( new PVector(location.x, location.y + size.y/4), new PVector (size.x/1.5, size.y/5), "Home");
    restart = false;
  }
  
  // Define display
  void display(String side, home h1){
    stroke(0);
    fill(255);

    // Draw box, cat, and restart button
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    text(side, location.x, location.y - size.y/4);
    fill(255);
    restart_button.display();
    quit_button.display();
    

    
    // Start button
    if (restart_button.buttonClicked()){
      this.pause = false;
      this.restart = true;
    } else if (quit_button.buttonClicked()){
      this.pause = false;
      this.restart = true;
      h1.pause = true;
      delay(200);
    }
  }
  
  

}
