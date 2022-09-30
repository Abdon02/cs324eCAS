class Clouds
{
  
  PVector location;
  int radiusDisplacement;
  float radius;
  float translationSpeed;
  float growShrink;
  color Color;
  PShape cloud;


  
  Clouds() {
    this.location = new PVector (20.0, 60);
    this.radiusDisplacement = 30;
    this.radius = 80;
    this.translationSpeed = 1.0;
    this.growShrink = 0.2;
    this.Color = color(255);
  }
  
  //Constructor
  Clouds(PVector location, int radiusDisplacement, int radius, float translationSpeed, float growShrink, color Color)
  {

    this.location = location;
    this.radius = radius;
    this.radiusDisplacement = radiusDisplacement;
    this.translationSpeed = translationSpeed;
    this.growShrink = growShrink;
    this.Color = Color;
    

  }
  
  //Display
  void display() 
  {
    this.Cloud();
    this.move();
    this.grow();
  }
  
  void Cloud() {
    noStroke();
    fill(Color);
    ellipse(this.location.x, this.location.y, radius, radius);
    ellipse(this.location.x + 40, this.location.y, radius, radius);
    ellipse(this.location.x + 80, this.location.y, radius, radius);
  }
  
  
  //Move
  void move()
  {
    this.location.x += this.translationSpeed;
    if (this.location.x >= width + 150){
      this.location.x = -150;
    } else if (this.location.x <= -150) {
      this.location.x = width;
    }
  }
  
  void grow(){
    
    if(this.radius < 95 - this.radiusDisplacement ||  this.radius > 85 + this.radiusDisplacement) {
      growShrink *= -1;
    }
    //increment the size with the size speed (be it positive or negative)
    this.radius += growShrink;

    }
}
