class planet {
  // Declare variables
  PVector center; // center of movement (x, y)
  float radius; // planet radius
  float center_scale; // distance from center
  
  PVector theta; // (rotation around center, moon rotation around planet, globe rotation around axis)
  PVector theta_inc; // (increase in rotation around center, increase in moon rotation around planet, increase in globe rotation around axis)
  
  PImage earth_tex; // earth texture
  PShape globe; // earth object
  PImage moon_tex; // moon texture
  PShape moon; // moon object
  
  // Default Constructor
  planet() {
    noStroke();
    
    this.center = new PVector (height/2, width/2, width/2);
    this.radius = 20;
    this.center_scale = 100;
    
    this.theta = new PVector(0, 0, 0);
    this.theta_inc = new PVector(PI/250, PI/100, PI/50);
        
    this.earth_tex = loadImage("earth_tex.jpg");
    this.globe = createShape(SPHERE, this.radius);
    this.globe.setTexture(this.earth_tex);
    
    this.moon_tex = loadImage("moon_tex.jpg");
    this.moon = createShape(SPHERE, this.radius / 4);
    this.moon.setTexture(this.moon_tex);
  }
  
  // Customizable Constructor
  planet(PVector center, float radius, float center_scale, PVector theta_inc){
    noStroke();
    
    this.center = center;
    this.radius = radius;
    this.center_scale = center_scale;
    
    this.theta = new PVector(0, 0, 0); // not customizable
    this.theta_inc = theta_inc;
    
    this.earth_tex = loadImage("earth_tex.jpg"); // not customizable
    this.globe = createShape(SPHERE, this.radius);
    this.globe.setTexture(this.earth_tex); // not customizable
    
    this.moon_tex = loadImage("moon_tex.jpg"); // not customizable
    this.moon = createShape(SPHERE, this.radius / 4);
    this.moon.setTexture(this.moon_tex); // not customizable
  }
  
  
  // Define display
  void display(){
    
    pushMatrix();
       // Translate to point on circle around center
      translate(this.center.x + this.center_scale * sin(this.theta.x), this.center.y + this.center_scale * cos(this.theta.x), this.center.z);
      
      pushMatrix();
        // Rotate globe around axis
        rotateY(this.theta.z);
        shape(this.globe);
      popMatrix();
      
      // Translate to point on circle around planet
      translate(.4 * this.center_scale * sin(this.theta.y), 0, .4 * this.center_scale * cos(this.theta.y));
      shape(this.moon);
    popMatrix();
    
    // Increase theta values
    this.theta.x += this.theta_inc.x;
    this.theta.y += this.theta_inc.y;
    this.theta.z += this.theta_inc.z;
  }
} 
