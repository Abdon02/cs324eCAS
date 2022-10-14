<<<<<<< HEAD
planet earth1;
planet earth2;
Star Stars;
Comet comet;

//variables and parameters to create stars
int depth = 7;
int numStarsMax = 3500;
Star[] tabStars = new Star[numStarsMax];
int maxStarsSpeed = 2;
// boolean to reset screen or not
boolean clearScreen = true;
// Rotation variable
int rotationMode = 2;
float angle = 0;
float delta = radians(0.15);

void setup(){
  size(700, 700, P3D);
  earth1 = new planet();
  earth2 = new planet( new PVector (height/2, width/2, width/2), 15, 60, new PVector (PI/60, PI/200, PI/500));
  noStroke();
  
  //stars background setup
  colorMode(RGB,255);
  loop();
  strokeWeight(1);
  //draws a point for the star randomly until number of max stars is hit
  for(int num=0; num<numStarsMax; num++) {
    tabStars[num] = new Star(random(-2*width,2*width),random(-2*height,2*height),
                               -random(depth*255),random(1,maxStarsSpeed)); }
  comet = new Comet();
}
void draw(){
  // Redraw background
  if(clearScreen == true) {
    background(0);
  }
  //translate and rotate on canvas
  pushMatrix();
  translate(width/2+(((width/2))*10)/(width/2),
            height/2+(((height/2))*10)/(height/2),
            0);
  rotateY(-(((width/2))*radians(30))/(width/2));
  
  
  if(rotationMode==2) {
    angle -= delta;
  }
  rotateZ(angle);
  for(int num=0; num<numStarsMax; num++) {
    tabStars[num].dots();
    tabStars[num].anim();
  }
  popMatrix();

  pushMatrix();
    translate(0, 50, 0);
    comet.display();
  popMatrix();
  
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
=======
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
>>>>>>> 7b1402f5ade49b90ec6d69e181fb96e3edfb96c9
