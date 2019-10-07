//////////////////////////////////////////////////////////////////////////////
//                 20166282 TaeSeong Yang                                   //
//                 Digital Media Project                                    //
//                 Making The Clock & Using Reculsive Function              //
//////////////////////////////////////////////////////////////////////////////

import processing.pdf.*;

boolean recording;
PGraphicsPDF pdf;

void setup()
{

  size(1000,1000);
  smooth();
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "clock_record.pdf");

}


void draw()
{    

  noFill();
  background(0);
  
  reculsion(15);
  clock();
  tex();
  lip();
  
}


void clock()
{

  noFill();
  strokeWeight(30);
  
  float s = map(second(), 0, 59,0,2*PI) - PI/2;
  float m = map(minute(), 0, 59, 0, 2*PI ) - PI/2;
  float h = map(hour(), 0, 24, 0, 2*PI ) - PI/2;

  stroke(30,30,30);
  arc(500, 500, 480, 480, 0, 2*PI);
  arc(500, 500, 550, 550, 0, 2*PI);
  arc(500, 500, 620, 620, 0, 2*PI);

  stroke(200,200,200);
  arc(500, 500, 480, 480,- PI/2, h);

  stroke(150,150,150);
  arc(500, 500, 550, 550,- PI/2, m);

  stroke(100,100,100);
  arc(500, 500, 620 , 620,- PI/2, s);

}


void tex()
{

  int th = hour();
  int tm = minute();
  int ts = second();

  stroke(255);
  fill(200,200,200);
  textAlign(CENTER, CENTER);
  textSize(30);
  text(th + "h " + tm + "m " + ts + "s " , 500,450);

} 


void lip()
{
  
  fill(255,0,0);
  noStroke();
  arc(500, 600, 100, 50, 5*PI/365, 360*PI/365);
  
  bezier(450, 600, 460, 600, 480, 570, 500, 593);
  bezier(550, 600, 540, 600, 520, 570, 500, 593);
  
  bezier(450, 600, 460, 595, 480, 590, 500, 593);
  bezier(550, 600, 540, 595, 520, 590, 500, 593);
  
  triangle(449,601, 500,593,551,601);
  triangle(450,600, 500,592, 550,600);
  
  noStroke();
  fill(255,255,255);
  arc(520,610,17,5,0,2*PI);
  
}


void reculsion(int i){
 
  if(i==0)
  return;
  
  float r,g,b,a;
  
  r=random(0,255);
  g=random(0,255);
  b=random(0,255);
  a=random(0,255);
  
  float midX = random(0,width);
  float midY = random(0,height);
  float midX2 = random(0,width);
  float midY2 = random(0,height);
  float midX3 = random(0,width);
  float midY3 = random(0,height);
  float circSize = random(5,50);
  float rectSize = random(5,50);

  strokeWeight(1);
  stroke(r,g,b,a);
  line(width/2,height/2,midX,midY);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(midX2,midY2,circSize,circSize);
  rect(midX3,midY3,rectSize,rectSize);
      
  stroke(0);
  strokeWeight(30);
  fill(0);
  arc(500, 500, 620, 620, 0, 2*PI);

  reculsion(i-1);

}


void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }  
}
