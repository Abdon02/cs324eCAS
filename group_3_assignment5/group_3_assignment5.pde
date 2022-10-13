planet earth1;
planet earth2;


SpaceShip sp1; //Space ship
PVector sp1StartCoor; //Starting coordinates of the spaceship (distance_from_center, orbit_speed, starting_angle)
color spaceshipColor;
color ballsColor;

void setup(){
  size(700, 700, P3D);
  earth1 = new planet();
  earth2 = new planet( new PVector (height/2, width/2, width/2), 15, 60, new PVector (PI/60, PI/200, PI/500));
  noStroke();
  
  //Setting up the values
  sp1StartCoor = new PVector(100, .03, PI/12);
  spaceshipColor = color(126, 240, 172);
  ballsColor = color(235, 245, 239);
  int numberofBalls = 4;
  sp1 = new SpaceShip(9, sp1StartCoor, spaceshipColor, ballsColor, numberofBalls);
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
  
  pushMatrix();
  translate(height/2, height/2, height/2);
  sp1.moveSpaceship();
  popMatrix();
}
