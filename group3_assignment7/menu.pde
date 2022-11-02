class menu{
  PVector size;
  PVector location;
  boolean pause;
  button restart_button;
  
  // Default constructor
  menu(){
    size = new PVector(width/2, height/2);
    location = new PVector(width/2, height/2);
    pause = false;
    restart_button = new button( new PVector(location.x, location.y), new PVector (size.x/1.5, size.y/5), "Restart");
  }
  
  // Customizable constructor
  menu(PVector size, PVector location, boolean pause, String name1){
    this.size = size;
    this.location = location;
    this.pause = pause;
    this.restart_button = new button( new PVector(location.x, location.y), new PVector (size.x/1.5, size.y/5), name1);
  }
}
