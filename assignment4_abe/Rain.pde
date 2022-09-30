class Rain extends Clouds {
  float fallingSpeed;
  
  Rain(PVector location, int radiusDisplacement, int radius, float translationSpeed, float growShrink, color Color, float fallingSpeed) {
    super(location, radiusDisplacement, radius, translationSpeed, growShrink, Color);
    this.fallingSpeed = fallingSpeed;
  }
  
  void display() {
    this.rainDrop();
    this.move();
  }
  
  void rainDrop() {
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
   this.location.y += this.fallingSpeed;
    if (this.location.y >= height/2){
      this.location.y = (this.location.y - height/2 + this.radius);
    }
   this.location.x += this.translationSpeed;
    if (this.location.x >= width + 150){
      this.location.x = -150;
    } else if (this.location.x <= -150) {
      this.location.x = width;
    }
  }
}
