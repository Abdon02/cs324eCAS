class button {
  // Declare variables
  PVector size;
  PVector pos;
  String type;

  
  // Default Constructor
  button() {
    rectMode(CENTER);
    this.size = new PVector(100, 50);
    this.pos = new PVector(height/2, width/2);
    this.type = "Default";
  }
  
  // Customizable Constructor
  button(PVector pos, PVector size, String type){
    rectMode(CENTER);
    this.size = size;
    this.pos = pos;
    this.type = type;
  }
  
  
  // Return if button clicked
  boolean buttonClicked(){
    if(abs(mouseX - this.pos.x) <= this.size.x/2 && abs(mouseY - this.pos.y) <= this.size.y/2 && mousePressed){
        return true;
      }
      return false;
    }
    
  
  // Define display
  void display(){
    textAlign(CENTER);
    textSize(40);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
    fill(0);
    text(this.type, this.pos.x, this.pos.y + 15);
    fill(255);
  }
} 
