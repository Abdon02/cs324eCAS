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
