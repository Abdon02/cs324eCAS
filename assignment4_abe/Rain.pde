class Rain extends Clouds {
  //variables
  float fallingSpeed;
  
  Rain(PVector location, int radiusDisplacement, int radius, float translationSpeed, float growShrink, color Color, float fallingSpeed) {
    super(location, radiusDisplacement, radius, translationSpeed, growShrink, Color);
    this.fallingSpeed = fallingSpeed;
  }
  
  //Display
  void display() {
    this.rainDrop();
    this.move();
  }
  
  void rainDrop() {
    //create the rain drops
    noStroke();
    fill(this.Color);
    // rain drop 1 left
    ellipse(this.location.x, this.location.y + this.radius + 10, 20, 20);
    triangle(this.location.x + 10, this.location.y + this.radius + 10, this.location.x - 10, this.location.y + this.radius + 10, this.location.x, this.location.y + this.radius - 20);
    //rain drop 2 right
    ellipse(this.location.x + 80, this.location.y + this.radius + 10, 20, 20);
    triangle(this.location.x + 90, this.location.y + this.radius + 10, this.location.x + 70, this.location.y + this.radius + 10, this.location.x + 80, this.location.y + this.radius - 20);
    // rain drop 3 middle
    ellipse(this.location.x + 40, this.location.y + this.radius + 50, 20, 20);
    triangle(this.location.x + 50, this.location.y + this.radius + 50, this.location.x + 30, this.location.y + this.radius + 50, this.location.x + 40, this.location.y + this.radius + 20);

}

  void move() {
   //moving the raindrops down the screen and reset when it almost the ground
   this.location.y += this.fallingSpeed;
    if (this.location.y >= 600){
      this.location.y = (this.location.y - 600 + this.radius);
    }
    
   // moves the raindrops with the clouds
   this.location.x += this.translationSpeed;
    if (this.location.x >= width + 150){
      this.location.x = -150;
    } else if (this.location.x <= -150) {
      this.location.x = width;
    }
  }
}
