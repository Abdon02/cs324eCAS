<<<<<<< HEAD
Paddles paddle;

void setup(){
  size(800, 500);
  background(0);
  paddle = new Paddles();
}

void draw(){
}
=======
void setup(){
  size(800, 500);
}

void draw(){
  backdrop();
}

void backdrop(){
  rectMode(CENTER);
  background(0);
  noStroke();
  fill(255);
  for (int i = 10; i<=height -10; i+= 30){
    rect(width/2, i, 20, 20);
  }
}
>>>>>>> ca24173d00fe05173398928b96c2e3cf1694b2d5
