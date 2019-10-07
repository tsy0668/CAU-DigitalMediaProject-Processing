
// 20166282 Taeseong Yang //

//////////////////////////////////////////////////////
// if press key'1' == strokeWeight increase         //
// if press key'2' == strokeWeight decrease         //
// if press black button at South-East == save      //
// if press mouseButton 'RIGHT' == Background clear // 
//////////////////////////////////////////////////////


color clickColor = color(255); //strokeColor
int i = 1; //strokeWeight


void setup() 
{  
    size(500,500);
    stroke(1);
    strokeWeight(i);
    background(255); 
}


void draw()
{
    
    noStroke();
    
    fill(255,0,0);  // red button
    rect(10,10,20,20);
    if(mousePressed&&mouseX>10&&mouseY>10&&mouseX<30&&mouseY<30) {
      clickColor = color(255,0,0);
    }
    
    fill(0,0,255); // blue button
    rect(40,10,20,20);
    
    if(mousePressed&&mouseX>40&&mouseY>10&&mouseX<60&&mouseY<30) 
    {  
      clickColor = color(0,0,255);
    }
    
    
    fill(0,255,0); // green button
    rect(70,10,20,20);
 
    if(mousePressed&&mouseX>70&&mouseY>10&&mouseX<90&&mouseY<30) 
    {
      clickColor = color(0,255,0);
    }
    
    
    fill(255,255,0); // yellow button
    rect(100,10,20,20);
    
    if(mousePressed&&mouseX>100&&mouseY>10&&mouseX<120&&mouseY<30) 
    {
      clickColor = color(255,255,0);
    }
    
    
    fill(180,80,150); // purple button
    rect(130,10,20,20);
    
    if(mousePressed&&mouseX>130&&mouseY>10&&mouseX<150&&mouseY<30) 
    {
      clickColor = color(180,80,150);
    }
    
    
    fill(0); 
    rect(160,10,20,20); // black button
    
    if(mousePressed&&mouseX>160&&mouseY>10&&mouseX<180&&mouseY<30) 
    {
      clickColor = color(0);
    }
    
    
    fill(40,80,41); 
    rect(190,10,20,20); 
    
    if(mousePressed&&mouseX>190&&mouseY>10&&mouseX<210&&mouseY<30) 
    {
      clickColor = color(40,80,41);
    }
    
    
    fill(50,60,150); 
    rect(220,10,20,20); 
    
    if(mousePressed&&mouseX>220&&mouseY>10&&mouseX<240&&mouseY<30) 
    {
      clickColor = color(50,60,150);
    }
    
    
    fill(100,40,150); 
    rect(250,10,20,20); 
    
    if(mousePressed&&mouseX>250&&mouseY>10&&mouseX<270&&mouseY<30) 
    {
      clickColor = color(100,40,150);
    }
    
    
    fill(50,148,10); 
    rect(280,10,20,20); 
    
    if(mousePressed&&mouseX>280&&mouseY>10&&mouseX<300&&mouseY<30) 
    {
      clickColor = color(50,148,10);
    }
    
    
    fill(80,200,150); 
    rect(310,10,20,20); 
    
    if(mousePressed&&mouseX>310&&mouseY>10&&mouseX<330&&mouseY<30) 
    {
      clickColor = color(80,200,150);
    }
    
    
    fill(200,50,14); 
    rect(340,10,20,20); 
    
    if(mousePressed&&mouseX>340&&mouseY>10&&mouseX<360&&mouseY<30) 
    {
      clickColor = color(200,50,14);
    }
    
    
    fill(150,140,0); 
    rect(370,10,20,20); 
    
    if(mousePressed&&mouseX>370&&mouseY>10&&mouseX<390&&mouseY<30) 
    {
      clickColor = color(150,140,0);
    }
    
    
    fill(31,179,190); 
    rect(400,10,20,20); 
    
    if(mousePressed&&mouseX>400&&mouseY>10&&mouseX<420&&mouseY<30) 
    {
      clickColor = color(31,179,190);
    }
    
    
    fill(200,200,100); 
    rect(430,10,20,20); 
    
    if(mousePressed&&mouseX>430&&mouseY>10&&mouseX<450&&mouseY<30) 
    {
      clickColor = color(200,200,100);
    }
    
    
    fill(150,0,80); 
    rect(460,10,20,20); 
    
    if(mousePressed&&mouseX>460&&mouseY>10&&mouseX<480&&mouseY<30) 
    {
      clickColor = color(150,0,80);
    }
    
    
    fill(0); 
    rect(460,460,30,30); 
    
    if(mousePressed&&mouseX>460&&mouseY>460&&mouseX<490&&mouseY<490) 
    {
      save("pic.jpg");
    }
    
    
    if(keyPressed && key == '1')
    {
      i = i+1;
      strokeWeight(i);
    }
    
    
    if(keyPressed && key == '2')
    {
      i = i-1;
      strokeWeight(i);
    }
    
    
    stroke(clickColor);
    
    
    if(mousePressed && mouseButton == LEFT)
      line(pmouseX,pmouseY,mouseX,mouseY);  
    
}
 
 

void mouseClicked()
{
  if(mouseButton == RIGHT)
    background(255);
}
