void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  Face(mouseX, mouseY);
}
void Face(int x, int y) {
  fill(255, 255, 0);
  noStroke();
  triangle(x-30,y+15,x+30,y+15,x,y-30);
  triangle(x,y+30,x-30,y-15,x+30,y-15);
}
