// Declare Suns
Sun s1 = new Sun();
Sun s2 = new Sun(new PVector (width/2, 100), 40, .4, 2, 2, s1.ray_color, s1.center_color, new PVector (40, 80));
  
void setup(){
  size(700, 700);
}

void draw(){
  // Redraw background
  background(255);
  
  s1.display();
  s2.display();
  
}
