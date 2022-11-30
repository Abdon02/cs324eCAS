import processing.sound.*;
import ddf.minim.*;
Minim minim;
home h1;
options o1;
win w1;
ballMovement ball;
paddles right;
paddles left;
paddles wall;
boardGame twoGame;
boardGame singleGame;
SoundFile file;
boolean [] moveArray;
SoundFile background, bounce;
//AudioPlayer win;
boolean music, effects;


void setup(){
  size(800, 500);
  h1 = new home();
  o1 = new options();
  w1 = new win();
  background(0);
  bounce = new SoundFile(this,"./files/bounce.mp3");
  background = new SoundFile(this, "./files/background.mp3");
  minim = new Minim(this);
  win = minim.loadFile("./files/clapping.mp3");

  
  //Initilizing the ball
  ball = new ballMovement();
  
  //Initilizing the paddles
  right = new paddles(true, file, 60);
  left = new paddles(false, file, 60);  
  wall = new paddles(false, file, height);
  
  //Initializing the twoGame
  twoGame = new boardGame(ball, left, right, true);
  background.loop();
  
  // Initializing the singleGame
  singleGame = new boardGame(ball, wall, right, false);
  background.loop();
  
  //Creating the movement array that will be used to move the paddles
  moveArray = createBooleanArray();
}

void draw(){ 
  // Options menu
  o1.keyPressed(h1);
  
  // Game play
  if (h1.pause){
    background(0); // Display home menu
    h1.display();
  } else if (o1.pause){
    o1.display(h1); // Display options menu (only possible if home menu not displayed)
  } else if (h1.singlePlayer){ // If single player mode
    if (o1.restart || w1.restart){ // If restarting game
      //Initializing the singleGame
      ball = new ballMovement();
  
      //Initilizing the paddles
      right = new paddles(true, file, 60);  
      wall = new paddles(false, file, height);
  
      singleGame = new boardGame(ball, wall, right, false);
      o1.restart = false;
      w1.restart = false;
    } else { // If ball out of bounds, display win screen
      // Win conditions
      if (singleGame.leftscore == 1){
        singleGame.ball.xyVel = new PVector (0, 0);
        singleGame.display();
        win.play();
        w1.display("Score: " + singleGame.rightscore, h1);
      } else {
        // Not win conditions
        singleGame.display();
      }
    }
    
    //This will move the sliders for the single game
    singleGame.moveSlidersSound(moveArray);
    
  } else if (h1.twoPlayer){ // If two player mode
    if (o1.restart || w1.restart){ // If restarting game
      //initializing the twoGame
      ball = new ballMovement();
  
      //Initilizing the paddles
      right = new paddles(true, file, 60);
      left = new paddles(false, file, 60);
  
      twoGame = new boardGame(ball, left, right, true);
      o1.restart = false;
      w1.restart = false;
      
    } else { // First to twn wins, display win screen
      // Win conditions
      if (twoGame.leftscore == 10){
        twoGame.ball.xyVel = new PVector (0, 0);
        twoGame.display();
        win.play();
        w1.display("Left wins!", h1);
      } else if (twoGame.rightscore == 10){
      // Display the twoGame
        twoGame.ball.xyVel = new PVector (0, 0);
        twoGame.display();
        win.play();
        w1.display("Right wins!", h1);
      } else {
        // Not win conditions
        twoGame.display();
      }
    }
    
    //Display movement of the sliders
    twoGame.moveSlidersSound(moveArray);
  }
}

boolean [] createBooleanArray(){
  /*
  This function is going to return an array that will hold all the movement
  
  The array will have 4 elements in the array
  
  The first element will be the w key for player 1 moving the left paddle upward
  The second element will be the s key for player 1 moving the left paddle downward
  The third element will be the UP key for player 2 moving the right paddle upward
  The fourth element will be the DOWN key for player 2 moving the right paddle downward
  The fifth element will see if there is a sound to the game
  */
  
  //This is the array that will hold all the possible movements
  boolean [] array = {false, false, false, false, false};
  
  //Returning the array
  return array;
}

void keyReleased(){
  /*
  This function is going to be used when a key is released
  */
  
  //Changing the position of the left paddle
  if(key == 'w' || key == 'W'){
    //Changing the value of the left paddle movement
    moveArray[0] = false;    
  }else if(key == 's' || key == 'S'){
    //Changing the value of the left paddle movement
    moveArray[1] = false;
  }
  
  //Changing the position of the right paddle
  if(keyCode == UP){
    //Increasing the position of the right paddle
    moveArray[2] = false;
  }else if(keyCode == DOWN){
    //Decreasing the position of the right paddle
    moveArray[3] = false;
  }
  
  //Wether there should be sound or not
  if (key == 'v' || key == 'V'){
    moveArray[4] = false;
  }
  
  //End of function
  return;
}

void keyPressed(){
  /*
  This function is going to be used when a key is pressed
  */   
   
  //Changing the position of the left paddle
  if(key == 'w' || key == 'W'){
    //Changing the value of the left paddle movement
    moveArray[0] = true;    
  }else if(key == 's' || key == 'S'){
    //Changing the value of the left paddle movement
    moveArray[1] = true;
  }
  
  //Changing the position of the right paddle
  if(keyCode == UP){
    //Increasing the position of the right paddle
    moveArray[2] = true;
  }else if(keyCode == DOWN){
    //Decreasing the position of the right paddle
    moveArray[3] = true;
  } 
    
  // V to toggle sound when ball hits paddle
  if (key == 'v' || key == 'V'){
    moveArray[4] = true;
  }
  
  if(key == 'm'){
    if (music == true){
      background.play();
      music = false;
    } 
    else if (music == false){
      background.pause();
      music = true;
    }
  }
  
  //End of function
  return;
}
