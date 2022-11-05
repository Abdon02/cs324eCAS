class catTimer extends timer{
  int frames;
  PImage[] cats;
  float cat_loc;
  catTimer cat_timer;
  int currentFrame;
  PVector location;
  button restart_button;
  
  // Customizable constructor only
  catTimer(PVector location, button restart_button){
    super(200); // Time interval of 200
    this.location = location; // Take location from home button
    this.restart_button = restart_button; // Take restart button from home button
    this.frames = 8; // Number of frames
    this.cats = new PImage[frames]; // Array of cats
    this.cat_loc = this.location.x - this.restart_button.size.x/2; // Starting location
    this.currentFrame = 0; // Initial frame
    
    // Assign images
    for (int i = 0; i < this.frames; i++){
      this.cats[i] = loadImage("./pictures/" +nf(i+1) + ".png");
    }
  }
  
  // Count what current cat frame should be
  int countcurrentFrame(int currentFrame, int numFrames){
    if (reset){
      this.timeElapsed = 0; // If reset, rest time elapsed
    } else if((millis() - this.timeElapsed) >= this.interval) {
       this.currentFrame = (this.currentFrame + 1) % this.frames;
       this.timeElapsed = millis();
    }
    return this.currentFrame;
  }
  
  // Display cat
  void display(){
    this.currentFrame = this.countcurrentFrame(this.currentFrame, this.frames);
    image(this.cats[this.currentFrame], this.cat_loc, this.location.y - this.restart_button.size.y/2 - 70, 75, 75);
    this.cat_loc += this.restart_button.size.x/this.interval; // Move cat across restart button
    if (this.cat_loc >= this.location.x + this.restart_button.size.x/2 - 75){
      this.cat_loc = this.location.x - this.restart_button.size.x/2;
    }
  }
   
  // Reset location and frame
  void reset(){
    this.reset = true;
    this.cat_loc = this.location.x - this.restart_button.size.x/2;
    this.currentFrame = 0;
  }
}
