class options extends menu{
  button resume_button, quit_button;
  boolean restart;
  
  // Default constructor
  options(){
    super();
    
    // Extra buttons needed
    this.resume_button = new button( new PVector(location.x, location.y - size.y/4), new PVector (size.x/1.5, size.y/5), "Resume");
    this.quit_button = new button( new PVector(location.x, location.y + size.y/4), new PVector (size.x/1.5, size.y/5), "Quit");
    this.restart = false;
  }
  
  // Define display
  void display(home home1){
    stroke(0);

    // Display box and buttons
    rect(location.x, location.y, size.x, size.y);
    resume_button.display();
    restart_button.display();
    quit_button.display();

    // Button conditions
    if (resume_button.buttonClicked()){
      this.pause = false;
    } else if (restart_button.buttonClicked()){
      this.pause = false;
      this.restart = true;
    } else if (quit_button.buttonClicked()){
      this.pause = false;
      this.restart = true;
      home1.pause = true;
      // Other quit options
    }
    
  }
  
  // If spacebar pressed and not on homescreen, pause game
  void keyPressed(home home1){
    if(keyPressed && key == ' ' && !home1.pause){
        this.pause = true;
    }
  }
  
}
