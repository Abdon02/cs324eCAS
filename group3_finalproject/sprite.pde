class sprite{
  float theta;
  float theta2;
  boolean inc;
  PImage paddle;

  
  sprite(){
    this.theta = 17 * PI /12;
    this.theta2 = 0;
    paddle = loadImage("./files/paddle.png");
  }
  
  void display(){
    
    // Display and rotate paddles (found at https://www.iconfinder.com/icons/1560139/bat_blade_handshake_paddle_ping_pong_red_rubber_table_tennis_icon)
    pushMatrix();
      translate(125, 275);
      
      pushMatrix();
        rotate(-PI/4 - this.theta2);
        image(paddle, -50, -50, 100, 100);
      popMatrix();
      
      translate(550, 0);
      rotate(-PI/4 - this.theta2);
      image(paddle, -50, -50, 100, 100);
      
    popMatrix();

    
    // Display and move ball
    pushMatrix();
      translate(300 * sin(this.theta),  300 * cos(this.theta));
      ellipse(width/2, height/2 + 75, 20, 20);
    popMatrix();
    
    // Change direction of movement
    if (this.theta < 7 * PI/12){
      inc = true;
    } else if (this.theta > 17 * PI/12){
      inc = false;
    }
    
    // Change position values
    if (inc){
      this.theta += PI/ 200;
      this.theta2 += 3 * PI/1000;
    } else {
      this.theta -= PI/200;
      this.theta2 -= 3 * PI/1000;
    }
  }
}
