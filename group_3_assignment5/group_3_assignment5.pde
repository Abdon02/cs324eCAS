planet earth1;
planet earth2;

void setup(){
  size(700, 700, P3D);
  earth1 = new planet();
  earth2 = new planet( new PVector (height/2, width/2, width/2), 15, 60, new PVector (PI/60, PI/200, PI/500));
  noStroke();
}

void draw(){
  // Redraw background
  background(255);
  
  // Draw Sun in center
  pushMatrix();
    translate(height/2, width/2, width/2);
    fill(255, 234, 0);
    sphere(40);
  popMatrix();
  
  // Draw planets
  earth1.display();
  earth2.display();
}
