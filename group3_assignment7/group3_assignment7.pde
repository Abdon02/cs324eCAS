options options1;
home home1;

void setup(){
  rectMode(CENTER);
  size(800, 800);
  options1 = new options();
  home1 = new home();
}

void draw(){
  options1.keyPressed(home1);
  setting();
  if (home1.pause){
    home1.display();
  }
  if (options1.pause){
    options1.display(home1);
  }
}

void setting(){
  noStroke();
  background(134, 236, 255);
  fill(116, 203, 109);
  rect(width/2, height * 7.5/8, width, height / 8);
  float radius = 90;
  fill(255);
    ellipse(100, 100, radius, radius);
    ellipse(100 + 40, 100, radius + 20, radius + 20);
    ellipse(100 + 80, 100, radius, radius);
    
    ellipse(600, 150, radius, radius);
    ellipse(600 + 40, 150, radius + 20, radius + 20);
    ellipse(600 + 80, 150, radius, radius);
};
