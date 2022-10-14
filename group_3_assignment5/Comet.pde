class Comet {
  //variables
  PVector location;
  float radius;
  float speed;
  PVector theta;
  
  PImage texture;
  PShape comet;
  
   Comet() {
    noStroke();
    lights();
    this.location = new PVector (0, 50, 0);
    this.radius = 15;
    this.speed = 1.75;
    
    this.theta = new PVector(0, 0, 0);
        
    this.texture = loadImage("cometTexture.png");
    this.comet = createShape(SPHERE, this.radius);
    this.comet.setTexture(this.texture);


  }
  
  Comet(PVector location, float radius, float speed, PVector theta ){
    noStroke();
    this.location = location;
    this.radius = radius;
    this.speed = speed;
    this.theta = theta;
    this.texture = loadImage("cometTexture.png");
    this.comet = createShape(SPHERE, this.radius);
    this.comet.setTexture(this.texture);
  }
  
  void display(){

      pushMatrix();
        lights();
        translate(this.location.x, this.location.y, this.location.z);
        rotateX(this.theta.x);
        rotateY(this.theta.y);
        shape(this.comet);
      popMatrix();
      
    if (this.location.x > height + this.radius) {
    this.location.x = -this.radius;
    }
    this.location.x += this.speed;
    this.theta.x += PI/100;
    this.theta.y += PI/100;
  }
}
