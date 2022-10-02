class Sun {
  // Declare variables
  PVector position; // (x, y)
  PVector min_max; // (min_rad, max_rad)
  float radius, grow_speed, translation_speed, rotation_speed;
  color center_color;
  color ray_color;
  boolean inc; // increasing or decreasing
  float theta; // rotation angle
  
  // Default Constructor
  Sun() {
    this.position = new PVector (200, 350);
    this.radius = 20;
    this.min_max = new PVector (20, 50);
    this.grow_speed = .5;
    this.translation_speed = -1;
    this.rotation_speed = -1;
    this.ray_color = color (247, 241, 40);
    this.center_color = color (247, 215, 52);
    this.inc = true;
    this.theta = 0;

  }
  
  // Customizable Constructor
  Sun(PVector position, float radius, float grow_speed, float translation_speed, float rotation_speed, color center_color, color ray_color, PVector min_max) {
    this.position = position;
    this.radius = radius;
    this.grow_speed = grow_speed;
    this.translation_speed = translation_speed;
    this.rotation_speed = rotation_speed;
    this.center_color = center_color;
    this.ray_color = ray_color;
    this.min_max = min_max;
    this.inc = true;
    this.theta = 0;
  }
  
  // Define display
  void display(){
    
    
    // Fill with colors and make center
    fill(this.center_color);
    ellipse(this.position.x, this.position.y, 1.2 * this.radius, 1.2 * this.radius);
    
    fill(this.ray_color);
    noStroke();
    
    // Translate and rotate to correct position then adjust theta
    translate(this.position.x, this.position.y);
    rotate(this.theta);
    this.theta += PI/80 * this.rotation_speed;
    
    // Make cardinal sun rays
    triangle( -this.radius/4,     -2 * this.radius/3, this.radius/4,      -2 * this.radius/3, 0,                  -1.5 * this.radius);
    triangle( -this.radius/4,     2 * this.radius/3,  this.radius/4,      2 * this.radius/3,  0,                  1.5 * this.radius);
    triangle( -2 * this.radius/3, -this.radius/4,     -2 * this.radius/3, this.radius/4,      -1.5 * this.radius, 0);
    triangle(  2 * this.radius/3, -this.radius/4,     2 * this.radius/3,  this.radius/4,      1.5 * this.radius,  0);
    
    // Make diagonal sun rays
    rotate(PI/4);
    triangle( -this.radius/4,     -2 * this.radius/3, this.radius/4,      -2 * this.radius/3, 0,                  -1.5 * this.radius);
    triangle( -this.radius/4,     2 * this.radius/3,  this.radius/4,      2 * this.radius/3,  0,                  1.5 * this.radius);
    triangle( -2 * this.radius/3, -this.radius/4,     -2 * this.radius/3, this.radius/4,      -1.5 * this.radius, 0);
    triangle(  2 * this.radius/3, -this.radius/4,     2 * this.radius/3,  this.radius/4,      1.5 * this.radius,  0);
    
    // Reset rotations and translations
    rotate(-PI/4 - this.theta);
    translate(-this.position.x, -this.position.y);
    
    // Move sun and grow sun
    this.move();
    this.grow();
  }
  
 
  
  // Define move
  void move(){
    
    // Move across screen based on speed until loops back around
    this.position.x += this.translation_speed;
    if (this.position.x >= width){
      this.position.x = 0;
    } else if (this.position.x <= 0) {
      this.position.x = width;
    }
    
  }
  
  void grow(){
    // If radius greater than maximum radius, make increasing false
    if (this.radius > this.min_max.y) {
      this.inc = false;
      
    // If radius less than minimum radius, make increasing true
    } else if (this.radius < this.min_max.x) {
      this.inc = true;
    }
    
    // If increasing, increase radius by grow speed
    if (this.inc) {
      this.radius += this.grow_speed;
      
    // Else, decrease by grow speed
    } else {
      this.radius -=  this.grow_speed;
    }
    
  }
}
