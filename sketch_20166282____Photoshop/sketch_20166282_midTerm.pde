////////////////////////////
// 20166282 Taeseong Yang //
////////////////////////////
// Digital Media Project  //
// 2019.05.03             //
// Photoshop Program      //
////////////////////////////


int blockWid = 70;
int blockHei = 70;

int startX = 0;
int finishX = 1100;
int startY = 100;
int finishY = 800;
int widthX = 1100;
int heightY = 700;



PImage presentI;


PImage black;
PImage hue;
PImage inverse;
PImage desaturation;
PImage spl;
PImage illusion;



PImage olsen2;
PImage nat;
PImage strange;
PImage ham;
PImage evans;
PImage kiri;
PImage grute;
PImage gamora;
PImage rdj;
PImage bk;
PImage hella;

PImage cmr;



void setup() 
{  
  
    black = loadImage("black.png");
    hue = loadImage("hue.jpg");
    inverse = loadImage("inverse.png");
    desaturation = loadImage("desaturation.png");
    spl = loadImage("spl.png");
    illusion = loadImage("illusion.png");
    
  
    olsen2 = loadImage("olsen2.jpg");
    nat = loadImage("nat.jpg");
    strange = loadImage("strange.png");
    ham = loadImage("ham.jpg");
    evans = loadImage("evans.jpg");
    kiri = loadImage("kiri.jpg");
    grute = loadImage("grute.jpg");
    gamora = loadImage("gamora.jpg");
    rdj = loadImage("rdj.png");
    bk = loadImage("bk.jpg");
    hella = loadImage("hella.jpg");
    
    
    cmr = loadImage("cmr.png");
    
    
    size(1200,800);
    background(255); 
    
}



void draw()
{
   
  
    //////////////////////////////////////////////////////RIGHTBUTTONS//////////////////////////////////////////////////////////////////////////////  
  
  
    noStroke();
    
    image(black, 1110, 100, blockWid, blockHei); 
    
    image(hue, 1110, 200, blockWid, blockHei);
    
    image(inverse, 1110, 300, blockWid, blockHei);
    
    image(desaturation, 1110, 400, blockWid, blockHei);
    
    image(spl, 1110, 500, blockWid, blockHei);
    
    image(illusion, 1110, 600, blockWid, blockHei);
    
    image(cmr, 1110, 700, blockWid, blockHei);
    
    
    //////////////////////////////////////////////////////HIGHBUTTONS//////////////////////////////////////////////////////////////////////////////
    
    
    image(nat, 10, 10, blockWid, blockHei);
    
    image(olsen2, 110, 10, blockWid, blockHei);
    
    image(strange, 210, 10, blockWid, blockHei);
    
    image(ham, 310, 10, blockWid, blockHei);
    
    image(evans, 410, 10, blockWid, blockHei);
    
    image(kiri, 510, 10, blockWid, blockHei);
    
    image(grute, 610, 10, blockWid, blockHei);
    
    image(gamora, 710, 10, blockWid, blockHei);
    
    image(rdj, 810, 10, blockWid, blockHei);
    
    image(bk, 910, 10, blockWid, blockHei);
    
    image(hella, 1010, 10, blockWid, blockHei);
    
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    rightButton();
    
    highButton();
 
    
}
 
 
///////////////////////////////////////////////////////////////////DEFINE FUNCTION////////////////////////////////////////////////////////////////////


void mouseClicked()
{
  if(mouseButton == RIGHT)
    background(255);
}



void nonCol(){

  colorMode(RGB);
  int x, y;
  float r, g, b, ave;

  for(x = startX; x < finishX; x++)
    for(y = startY; y < finishY; y++) {
    
      color c = get(x,y);
  
      r = red(c);
      g = green(c);
      b = blue(c);
      ave = (r + g + b) / 3;
      c = color(ave, ave, ave);
      
      set(x, y, c);
    }  

}



void hue180(){
  
  colorMode(HSB);

  for(int x = startX; x < finishX; x++)
    for(int y = startY; y < finishY; y++) {
      
      color c = get(x, y);
      
      c = color((hue(c) + 128) % 256, saturation(c), brightness(c));
      
      set(x, y, c);
    }
}



void inverse(){

  colorMode(RGB);
  
  for(int x = startX; x < finishX; x++)
    for(int y = startY; y < finishY; y++) {
      
      color c = get(x,y);
      
      c = color(255-red(c),255-green(c),255-blue(c));
      
      set(x,y,c);
  }
  
}



void desaturation()
{

  colorMode(HSB);
  
  for(int x = startX; x < finishX; x++)
    for(int y = startY; y < finishY; y++) {
      
      color c = get(x,y);
      
      c = color(hue(c), 0, brightness(c));
      
      set(x,y,c);
    }
}



void spl(PImage i)
{
  
  color c;
  float h;
  
  colorMode(HSB);

  for (int x = startX; x < 1100; x += 367)
    for (int y = startY; y < 700; y += 233) {
      
      image(i, x, y, finishX/3, finishY/3);
      h = random(255);
      
      for (int xx = x; xx < x + 367; xx++)
        for (int yy = y; yy < y + 233; yy++) {
          c = get(xx, yy);
          set(xx, yy, color(h, saturation(c), brightness(c)));
        }
    }
}



void illusion(PImage i)
{
  
  colorMode(RGB);
  
  PImage cutImage;
  image(i,startX,startY,widthX,heightY);
  cutImage = get(int(random(startX,startX + 50)) ,int(random(startY,startY + 50)),int(random(1000,1050)),int(random(600,650)));
  image(cutImage, startX , startY , widthX, heightY);
  
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



void rightButton()
{
  
  if(mousePressed && mouseX > 1110 && mouseY > 100 && mouseX < 1110 + blockWid && mouseY < 100 + blockHei) 
  {
     nonCol();
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 200 && mouseX < 1110 + blockWid && mouseY < 200 + blockHei) 
  {  
     hue180();
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 300 && mouseX < 1110 + blockWid && mouseY < 300 + blockHei) 
  {  
     inverse();
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 400 && mouseX < 1110 + blockWid && mouseY < 400 + blockHei) 
  {  
     desaturation();
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 500 && mouseX < 1110 + blockWid && mouseY < 500 + blockHei) 
  {  
     spl(presentI);
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 600 && mouseX < 1110 + blockWid && mouseY < 600 + blockHei) 
  {  
     illusion(presentI);
  }
  
  if(mousePressed && mouseX > 1110 && mouseY > 700 && mouseX < 1110 + blockWid && mouseY < 700 + blockHei) 
  {  
     save("pic.jpg");
  }
  
  
}



void highButton()
{
 
  if(mousePressed && mouseX > 10 && mouseY > 10 && mouseX < 10 + blockWid && mouseY < 10 + blockHei) 
    {
      image(nat, 0,100,widthX,heightY);
      
      presentI = nat;
    }
    
  if(mousePressed && mouseX > 110 && mouseY > 10 && mouseX < 110 + blockWid && mouseY < 10 + blockHei) 
    {
      image(olsen2, 0,100,widthX,heightY);   
      
      presentI = olsen2;
    }
    
  if(mousePressed && mouseX > 210 && mouseY > 10 && mouseX < 210 + blockWid && mouseY < 10 + blockHei) 
    {
      image(strange, 0,100,widthX,heightY);  
      
      presentI = strange;
    }
    
  if(mousePressed && mouseX > 310 && mouseY > 10 && mouseX < 310 + blockWid && mouseY < 10 + blockHei) 
    {
      image(ham, 0,100,widthX,heightY);     
      
      presentI = ham;
    }
    
  if(mousePressed && mouseX > 410 && mouseY > 10 && mouseX < 410 + blockWid && mouseY < 10 + blockHei) 
    {
      image(evans, 0,100,widthX,heightY); 
      
      presentI = evans;
    }
    
  if(mousePressed && mouseX > 510 && mouseY > 10 && mouseX < 510 + blockWid && mouseY < 10 + blockHei) 
    {
      image(kiri, 0,100,widthX,heightY);     
      
      presentI = kiri;
    }
    
  if(mousePressed && mouseX > 610 && mouseY > 10 && mouseX < 610 + blockWid && mouseY < 10 + blockHei) 
    {
      image(grute, 0,100,widthX,heightY);  
      
      presentI = grute;
    }
    
  if(mousePressed && mouseX > 710 && mouseY > 10 && mouseX < 710 + blockWid && mouseY < 10 + blockHei) 
    {
      image(gamora, 0,100,widthX,heightY); 
      
      presentI = gamora;
    }
    
  if(mousePressed && mouseX > 810 && mouseY > 10 && mouseX < 810 + blockWid && mouseY < 10 + blockHei) 
    {
      image(rdj, 0,100,widthX,heightY);   
      
      presentI = rdj;
    }
    
  if(mousePressed && mouseX > 910 && mouseY > 10 && mouseX < 910 + blockWid && mouseY < 10 + blockHei) 
    {
      image(bk, 0,100,widthX,heightY);    
      
      presentI = bk;
    }
    
  if(mousePressed && mouseX > 1010 && mouseY > 10 && mouseX < 1010 + blockWid && mouseY < 10 + blockHei) 
    {
      image(hella, 0,100,widthX,heightY);    
      
      presentI = hella;
    }
    
}
