class home extends menu{
  
  // Default constructor
  home(){
    super(new PVector(width/2, height/2), new PVector(width/2, height/2), true, "Start"); // Use menu to make Start button
  }
  
  // Define display
  void display(){
    stroke(0);

    // Draw box, cat, and restart button
    rect(location.x, location.y, size.x, size.y);
    restart_button.display();
    
    // Start button
    if (restart_button.buttonClicked()){
      this.pause = false;
    }
  }

}
