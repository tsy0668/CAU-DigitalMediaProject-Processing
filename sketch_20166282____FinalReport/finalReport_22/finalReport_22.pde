  /* 
  *  20166282 TaeseongYang
  *  Digital Media Project
  *  Final Report
  *  Avoiding Poo Game
  */
  
  import ddf.minim.*;
  
  Minim minim;
  AudioPlayer player1;
  AudioPlayer player2;
  AudioPlayer player3;
  
  PImage poo;
  PImage mouse;
  PImage restroom;
  
  int num;    // the number of items in the array (# of poo)
  float[] y;      // y-position of each poo
  float[] speed;  // speed of each poo
  float[] phase;  // phase of each poo
  
  float gap;
  float presentX;
  float presentY;
  int playStatus;
  
  float red = 120;
  float green = 120;
  float blue = 120;
  
  
  
  void setup() {
    
    playStatus = 1; // 1 : game start, 2 : clear, 3 : game over
    
    minim = new Minim(this);
    player1 = minim.loadFile("background.mp3");
    
    poo = loadImage("poo.png");
    mouse = loadImage("mouse.png");
    restroom = loadImage("restroom.png");
    size(450, 1000);
  
    num = 3;
    
    setting();
    
  }
  
  
  void draw() {
  
    switch(playStatus) {
      case 1 : {  // game start
        play();
        break;
      }
      case 2 : {  // level clear
        clear();
        break;
      }
      case 3: {  // game over
        gameOver();
        break;
      }
    }
    
    stroke(255);
    textSize(20);
    text("stage ", 30, 30);
    text(num - 2, 90 , 30);
  }
  
  // change the mouse position & change the background color if the mouse is dragged
  void mouseDragged(){
    
    if(mouseX > presentX - 25 && mouseX < presentX + 25) {
       
        if(mouseY > presentY - 25 && mouseY < presentY + 25) {
         
            presentX = mouseX;
            presentY = mouseY;
          
        }
    }
    
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);

  }
  
  
  // Ready for starting game
  void setting() {
   
    minim = new Minim(this);
    player2 = minim.loadFile("clear.mp3");
    player3 = minim.loadFile("over.mp3");
    
    
    // allocate space for each array
    y = new float[num];
    speed = new float[num];
    phase = new float[num]; 
  
    // calculate the gap in y based on the number of poo
    gap = height / (num + 3);
    
    // setup an initial value for each item in the array
    for (int i=0; i<num; i++) {
      y[i] = gap * (i + 2);      // y is constant for each so can be calculated once
      speed[i] = random(4);
      phase[i] = random(TWO_PI);
    }
    
    // store mouse position
    presentX = width/2;
    presentY = int(y[num-1] + gap);
    
  }
          
          
  void play() {
      
      background(red, green, blue);
      noStroke();
      player1.play();
    
      rect(0,int(y[num-1] + gap),width,30);
      image(mouse, presentX,presentY,40,40);
      image(restroom, width/2 - 10, 0, 80,80);
  
      for (int i=0; i<num; i++) {
      
        // calculate the x-position of each poo based on the speed, phase and current frame
        float x = width / 2 + sin(radians(frameCount * speed[i]) + phase[i]) * 200;
        
        // situation of game over 
        if(x > presentX - 25 && x < presentX + 25){
       
          if(y[i] > presentY - 25 && y[i] < presentY + 25) {
         
            playStatus = 3;
          
          }
        
        }
          
      image(poo, x, y[i], 50, 50);  // items(poo)
     
      // situation of level clear
      if(presentX > width/2 - 10 && presentX < width/2 + 70 && presentY > 0 && presentY < 80) {
        
        playStatus = 2;
        
      }
      
      
      }
  }
  
  
  void clear() {
   
      noFill();
      stroke(255);
      strokeWeight(5);
      rect(width / 3 - 10, height / 2 , 180, 50);
      textSize(20);
      text(" NEXT STAGE ", width / 3 + 10, height / 2 + 40);    
      textSize(50);
      text("CLEAR!", width / 3, height / 2 - 30);
      player2.play();
      
      if(mousePressed && width / 3 - 10 < mouseX && width / 3 + 170 > mouseX && height / 2 < mouseY && height / 2 + 50 > mouseY){
        num++;
        setting();
        playStatus = 1;
   
      }
    
  }
  
  
  void gameOver() {
  
        noFill();
        stroke(0);
        strokeWeight(5);
        textSize(50);
        text("GAME OVER", width / 4 - 20, height / 2);
        rect(width / 3 - 10, height / 2 + 10 , 180, 50);
        textSize(20);
        text("   RESTART ", width / 3 + 10, height / 2 + 40);  
       
        player1.close();
        player3.play();
        
        if(mousePressed && width / 3 - 10 < mouseX && width / 3 + 170 > mouseX && height / 2 + 10 < mouseY && height / 2 + 60 > mouseY ) {
          num = 3;
          setting();
          playStatus = 1;
        
          minim = new Minim(this);
          player1 = minim.loadFile("background.mp3");
          player1.play();
        
        }
    
  }


 
