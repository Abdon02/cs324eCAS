class Star {
  float x, y, z;
  float speed;
  
  Star(float coordX, float coordY, float coordZ, float speedZ) {
    x  = coordX;  
    y  = coordY;  
    z  = coordZ;  
    speed = speedZ;
  }
  
  void dots() {
    stroke(350+z/depth);
    point(x,y,z);
  }
  
  void anim() {
    z = z + speed;
    if(z >= 0)
      z = -350.0;
  }
  
  void display() {
      //redraws and clears to black screen
  if(clearScreen == true) {
    background(0);
  }
  translate(width/2+(((width/2))*10)/(width/2),
            height/2+(((height/2))*10)/(height/2),
            0);
  rotateY(-(((width/2))*radians(30))/(width/2));
  rotateX((((height/2))*radians(30))/(width/2));
  if(rotationMode==1) {
    angle += delta;
  }
  if(rotationMode==2) {
    angle -= delta;
  }
  rotateZ(angle);
  for(int num=0; num<numStarsMax; num++) {
    tabStars[num].dots();
    tabStars[num].anim();
  }  
  }
}
