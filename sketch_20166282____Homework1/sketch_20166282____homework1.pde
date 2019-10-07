size(1000,1000);
strokeCap (SQUARE);

quad(500,0,1000,500,500,1000,0,500);
fill(255,0,60);
triangle(400,0,0,360,400,360);

strokeWeight(22);
line(400,360,0,360);

strokeWeight(15);
line(400,0,400,1000);

strokeWeight(20);
line(400,250,1000,250);

strokeWeight(17);
line(750,250,750,1000);

strokeWeight(15);
line(400,550,1000,550);

fill(70,50,120);
triangle(750,550,750,1000,1000,550);

fill(255,255,0);
triangle(400,780,0,780,400,1000);

strokeWeight(20);
line(400,780,0,780);

strokeWeight(15);
fill(0);
quad(400,860,400,1000,1000,1000,1000,860);

strokeWeight(25);
line(90,0,90,1000);

noStroke();
fill(180);
triangle(500,0,0,500,0,0);
triangle(500,0,1000,500,1000,0);
triangle(0,500,500,1000,0,1000);
triangle(1000,1000,500,1000,1000,500);
