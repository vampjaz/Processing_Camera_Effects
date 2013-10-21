// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-13: Simple motion detection

import processing.video.*;
// Variable for capture device
Capture video;

float threashhold = 100;

float cellsize = 3;

void setup() {
  size(640,480);
  video = new Capture(this, width, height, 30);
  video.start();
}

void draw() {
  background(0);
  // Capture video
  if (video.available()) {
    video.read();
  }
  
  //loadPixels();
  video.loadPixels();
  
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x += cellsize ) {
    for (int y = 0; y < video.height; y += cellsize ) {
      
      int loc = x + y*video.width;            // Step 1, what is the 1D pixel location
      color current = video.pixels[loc];      // Step 2, what is the current color
      
      // Step 4, compare colors (previous vs. current)
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
      
      stroke(color((r1 < threashhold ? 0 : 255),(g1 < threashhold ? 0 : 255),(b1 < threashhold ? 0 : 255)));
      fill(color((r1 < threashhold ? 0 : 255),(g1 < threashhold ? 0 : 255),(b1 < threashhold ? 0 : 255)));
      rect(x,y,cellsize,cellsize);
    }
  }
  threashhold = map(mouseX,0,width,0,255);
  cellsize = map(mouseY,0,height,1,20);
}
