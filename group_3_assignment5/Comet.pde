class Comet {
  //variables
  PVector location;
  float radius;
  float speed;
  float scale;
  PVector theta;
  
  PImage texture;
  PShape comet;
  PShape comet2;
  PShape rock;

   Comet() {
    noStroke();
    lights();
    this.location = new PVector (0, 50, 0);
    this.radius = 15;
    this.speed = 1.75;
    this.scale = radius * 5;
    this.theta = new PVector(0, 0, 0);
        
    this.texture = loadImage("cometTexture.png");
    this.comet = createShape(SPHERE, this.radius);
    this.comet.setTexture(this.texture);
    
    this.rock = createShape(SPHERE, this.radius/4);
    
  }
  
  Comet(PVector location, float radius, float speed, float scale, PVector theta ){
    noStroke();
    this.location = location;
    this.radius = radius;
    this.speed = speed;
    this.scale = scale;
    this.theta = theta;
    this.texture = loadImage("cometTexture.png");
    this.comet = createShape(SPHERE, this.radius);
    this.comet.setTexture(this.texture);
    this.rock = createShape(SPHERE, this.radius/2);
  
  }
  
  void display(){

    pushMatrix();
      lights();
      translate(this.location.x, this.location.y, this.location.z);
      rotateX(this.theta.x);
      rotateY(this.theta.y);
      shape(this.comet);
      translate(.4 * this.scale * sin(this.theta.y), 0, .4 * this.scale * cos(this.theta.y));
      lights();
      fill(255);
      shape(this.rock);
      translate( .4 * this.scale * cos(this.theta.y), .4 * this.scale * sin(this.theta.y), 0);
      shape(this.rock);
    popMatrix();
            
    if (this.location.x > height + this.radius) {
    this.location.x = -this.radius;
    }
    this.location.x += this.speed;
    this.theta.x += PI/100;
    this.theta.y += PI/100;
    this.theta.z += PI/100;
  }
}
