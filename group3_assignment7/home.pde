class home extends menu{
  catTimer cat_timer;
  
  // Default constructor
  home(){
    super(new PVector(width/2, height/2), new PVector(width/2, height/2), true, "Start"); // Use menu to make Start button
    cat_timer = new catTimer(location, restart_button); //Cat timer to control cat across screen
  }
  
  // Define display
  void display(){
    cat_timer.reset = false; 
    stroke(0);

    // Draw box, cat, and restart button
    rect(location.x, location.y, size.x, size.y);
    cat_timer.display();
    restart_button.display();
    
    // Start button
    if (restart_button.buttonClicked()){
      this.pause = false;
      cat_timer.reset();
    }
  }

}
