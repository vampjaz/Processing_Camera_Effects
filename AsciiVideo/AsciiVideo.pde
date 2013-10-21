// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com


import processing.video.*;

// Size of each cell in the grid, ratio of window size to video size
int videoScale = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable to hold onto capture object
Capture video;

PFont f;

// 'brightest' to 'darkest' in different forms: (only use one)
String asciilevel = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~<>i!lI;:,\"^`'. ";
//String asciilevel = "@#$%&(){}[]_-=+:;<>^*!\",. ";
//String asciilevel = "1100000";  //binary!
//String asciilevel = "¡™£¢∞§¶•ªº–≠“‘«æ…÷≥≤``œ∑´®†¥¨ˆπåß∂ƒ©˙∆˚¬Ω≈ç√∫˜µ«";
//String asciilevel = "abcdefghijklmnopqrstuvwxyz";
//String asciilevel = "0123456789ABCDEF";  //hex!
//String asciilevel = "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik9ol0p-";
//String asciilevel = "Hello World!";
int levels = asciilevel.length();

void setup() {
  size(640,480);
  // Set up columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this,cols,rows,15);
  video.start();
  // Load the font
  // Using a fixed-width font. In most fonts, individual characters have different widths. 
  // In a fixed-width font, all characters have the same width. 
  // This is useful here since we intend to display the letters one at a time spaced out evenly. 
  // See Section 17.7 for how to display text character by character with a nonfixed width font.
  f = loadFont("Courier-Bold-13.vlw");
 
}

void draw() {
  background(0.8);
  
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  
  // Use a variable to count through chars in String
  int charcount = 0;
  // Begin loop for rows
  for (int j = 0; j < rows; j ++ ) {
    // Begin loop for columns
    for (int i = 0; i < cols; i ++ ) {
      
      // Where are we, pixel-wise?
      int x = i*videoScale;
      int y = j*videoScale;
      
      // Looking up the appropriate color in the pixel array
      color c = video.pixels[i + j*video.width];
      // Displaying an individual character from the String instead of a rectangle
      textFont(f);
      fill(c);
      
      // One character from the source text is displayed colored accordingly to the pixel location. 
      // A counter variableâ charcountâ is used to walk through the source String one character at a time.
      text(asciilevel.charAt((int)map((c & 8388607),-8388608,8388607,levels,0)),x,y);
      
    }
  }
}
