////////////////////////////
// 20166282 Taeseong Yang //
////////////////////////////
// Digital Media Project  //
// 2019.05.18             //
// Making YOUTUBE         //
////////////////////////////


import processing.video.*; 

Movie myMovie; 
int buttonFlag = 0;
int speedFlag = 3;
PImage img;
PImage forward;
PImage backward;
PImage testing;


void setup() {

  size(640,350,P3D);
  myMovie = new Movie(this, "a.mp4"); 
  myMovie.play(); 

}


void draw() {
 
  image(myMovie, 0, 0); 
   
  //savePic();  //for saving Image
   
  if (mouseX < 640 && mouseY > 250) {
    bar();
    clock();
    playButton();
    ward();
    speedFlag();
    speedButton();
    
  }
}


void movieEvent(Movie m) { 
  
  m.read(); 

}


void bar() {
   
    fill(50,50,50);
    noStroke();
    rect(0,300,640,10);

}


void clock() {

  fill(255,0,0);
  noStroke();
  
  float s = map(myMovie.time(), 0, myMovie.duration(),0,width);
  rect(0,300,s,10);
  
  if(mouseX > 0 && mouseX < 640 && mouseY > 295 && mouseY < 315) {

    img = loadImage((int)(mouseX/2.63) + ".jpg");
    image(img, mouseX - 40, 240, 80, 50);
    
    fill(210,210,210);
    textAlign(CENTER,CENTER);
    textSize(10);
    text(((int)(mouseX/2.63)/60) + ":" + ((int)(mouseX/2.63)%60), mouseX , 295); 

  }
}


void playButton() {
  
  fill(210,210,210);
  textAlign(CENTER,CENTER);
  textSize(20);
  text(((int)(myMovie.time()/60) + ":" + ((int)(myMovie.time()%60))), 75 , 328); 
  
  if(buttonFlag == 0){
    noStroke();
    fill(200,200,200); 
    rect(20,320,5,20);
    rect(30,320,5,20);
  }

  else {
    noStroke();
    fill(200,200,200); 
    triangle(20,320,20,340,35,330);
  }   
}


void ward() {
  
  forward = loadImage("forward.png");
  image(forward, 200, 318, 30, 30);
  
  backward = loadImage("backward.png");
  image(backward, 150, 318, 30, 30);
  
  testing = loadImage("testing.png");
  image(testing, 530, 318, 30, 30);
}


void speedButton(){
  
  stroke(200,200,200);
  noFill();
  rect(275,320,48,25);
  noStroke();
  fill(255,255,255,30);
  rect(323,320,35,25);
  rect(358,320,30,25);
  rect(388,320,30,25);
  rect(418,320,30,25);
  rect(448,320,30,25);
  
  fill(200,200,200);
  textAlign(CENTER,CENTER);
  textSize(15); 
  text("SPEED", 300 , 330);
  text("0.25", 340 , 330); 
  text("0.5", 372 , 330); 
  text("1.0", 404 , 330); 
  text("1.5", 435 , 330);
  text("2.0", 466 , 330); 

}


void speedFlag() {
   
  if(speedFlag == 1){
     fill(255,255,255,70);
     rect(323,320,35,25);
  }

  else if(speedFlag == 2) {
     fill(255,255,255,70);
     rect(358,320,30,25);
  }
  
  else if(speedFlag == 3) {
     fill(255,255,255,70);
     rect(388,320,30,25);
  }
  
  else if(speedFlag == 4) {
     fill(255,255,255,70);
     rect(418,320,30,25);
  }
  
  else {
     fill(255,255,255,70);
     rect(448,320,30,25);
  }
}


void mouseReleased() {
 
  if(mouseX > 20 && mouseX < 35 && mouseY > 320 && mouseY < 340) {
    if(buttonFlag == 0) {
      myMovie.pause();
      buttonFlag = 1;
    }
    else {
      myMovie.play();
      buttonFlag = 0;
    }
  }
  
  if(mouseX > 0 && mouseX < 640 && mouseY > 295 && mouseY < 315){
    myMovie.jump((myMovie.duration()/640*mouseX));
  }
  
  if(mouseX > 323 && mouseY > 320 && mouseX < 358 && mouseY < 345) {
      myMovie.speed(0.25);
      speedFlag = 1;
  }
  
  if(mouseX > 358 && mouseY > 320 && mouseX < 388 && mouseY < 345) {
      myMovie.speed(0.5);
      speedFlag = 2;
  }
  
  if(mouseX > 388 && mouseY > 320 && mouseX < 418 && mouseY < 345) {
      myMovie.speed(1);
      speedFlag = 3;
  }
  
  if(mouseX > 418 && mouseY > 320 && mouseX < 448 && mouseY < 345) {
      myMovie.speed(1.5);
      speedFlag = 4;
  }
  
  if(mouseX > 448 && mouseY > 320 && mouseX < 478 && mouseY < 345) {
      myMovie.speed(2);
      speedFlag = 5;
  }
  
  if(mouseX > 150 && mouseY > 318 && mouseX < 180 && mouseY < 348) {
    myMovie.jump(myMovie.time() - 10);
  }
  
  if(mouseX > 200 && mouseY > 318 && mouseX < 230 && mouseY < 348) {
    myMovie.jump(myMovie.time() + 10);
  }
  
  if(mouseX > 550 && mouseY > 318 && mouseX < 580 && mouseY < 348) {
    myMovie.jump(0);
  }
  
}


void keyPressed() {

  if(key == ' ') {
    if(buttonFlag == 0) {
      myMovie.pause();
      buttonFlag = 1;
    }
    else {
      myMovie.play();
      buttonFlag = 0;
    }
  }
  
  if(key == CODED) {
    
    if(keyCode == RIGHT) {
    
      myMovie.jump(myMovie.time() + 10);
  
    }
  
    if(keyCode == LEFT) {
   
       myMovie.jump(myMovie.time() - 10);
    
    }
  }
}



/*    ///////save image//////////
void savePic() {
  
  int times = (int)myMovie.time();
  if(times%1 == 0)
    save("./Images/" + times + ".jpg");
    
}
*/
