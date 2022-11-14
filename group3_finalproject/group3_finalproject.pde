home h1;
options o1;

void setup(){
  size(800, 500);
  h1 = new home();
  o1 = new options();
  background(0);
}

void draw(){
  o1.keyPressed(h1);
  if (h1.pause){
    h1.display();
  } else if (o1.pause){
    o1.display(h1);
  } else {
    backdrop();
  }
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
