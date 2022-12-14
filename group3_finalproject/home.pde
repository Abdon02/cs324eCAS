class home extends menu{
  button single_button;
  button two_button;
  boolean singlePlayer;
  boolean twoPlayer;
  sprite homeSprite;
  
  // Default constructor
  home(){
    super(new PVector(width/2, height/2), new PVector(width/2, height/2), true, "Start"); // Use menu to make Start button
    this.single_button = new button( new PVector(location.x, location.y), new PVector (size.x/1.5, size.y/5), "Single Player");
    this.two_button = new button( new PVector(location.x, location.y + size.y/4), new PVector (size.x/1.5, size.y/5), "Two Player");
    this.homeSprite = new sprite();
  }
  
  // Define display
  void display(){
    stroke(0);

    // Draw box, cat, and restart button
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    text("Welcome to Pong!", location.x, location.y - size.y/4);
    fill(255);
    single_button.display();
    two_button.display();
    homeSprite.display();
    
    // Start button
    if (single_button.buttonClicked()){
      this.pause = false;
      this.singlePlayer = true;
      this.twoPlayer = false;
    } else if (two_button.buttonClicked()){
      this.pause = false;
      this.singlePlayer = false;
      this.twoPlayer = true;
    }
  }

}
