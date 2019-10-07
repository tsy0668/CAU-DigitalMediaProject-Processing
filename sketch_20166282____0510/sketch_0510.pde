import processing.video.*;
Capture cam;
void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i+" "+cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
 // image(cam, 0, 0);
  background(0);
  for (int x=0; x<width; x+=10) {
    for (int y=0; y<height; y+=10) {
      color c = (cam.get(x, y));   // color c = (myMovie.get(x/2, y/2)); 
      fill(255);
      ellipse(x, y, map(brightness(c),0,255,1,10), map(brightness(c),0,255,1,10));
    }
  }

}
void captureEvent(Capture c) {
  c.read();
}
