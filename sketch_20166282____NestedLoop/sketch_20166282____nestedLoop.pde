/*
    2019.04.13
    20166282 Taeseong Yang
    Nested Loop Report
*/


int xx;
int yy;

float increase = 0;

void setup() {
  
  size(1000, 1000);
  background(0);
  noFill();
  strokeWeight(0.1);
  strokeCap(RECT);
}


void draw() {
  
  int origin_x = width/2;
  int origin_y = height/2;
   
  float millis_degrees = ( TWO_PI / 1000) * (millis() % 1000);
  
  for (yy = 0; yy < 1000; yy +=100) {
    for (xx = 0; xx < 1000; xx += 100) {
      
      float ran1;
      float ran2;
      float ran3;
      float ran4;
       
      ran1 = (random(255));
      ran2 = (random(255));
      ran3 = (random(255));
      ran4 = (random(255));
      
      stroke(ran1,ran2,ran3,ran4);
      
      drawUnit( origin_x, origin_y, 750, millis_degrees );
    
  }
  }
}


void drawUnit( float originx , float originy, int radius, float degrees) {
  
  float x = originx + (radius * cos(degrees));
  float y = originy + (radius * sin(degrees));
  
   if (mousePressed) {
     arc(mouseX, mouseY, increase , increase , -PI/2, 2*PI);  
     arc(x, y, xx+500, yy+500, 0, TWO_PI);     
     increase = increase + 0.1;
    }
   else
     arc(x, y, xx+500, yy+500, 0, TWO_PI); 
     
   
}

void mouseReleased()
{
  increase = 0;
}
