import processing.video.*; 

Capture myVideo; 
float x, y;
float xPx, yPx;
int loc;
float baseSize, scale, circle;

void setup() { 
  size(800, 600); 
  myVideo = new Capture(this, width, height, 24);
  myVideo.start();
  background(0);
  baseSize = 100;
  scale = 200;
  circle = 5;
} 

void captureEvent(Capture cap) {
  cap.read();
}

void draw() { 
  myVideo.loadPixels();

  x = random(width);
  y = random(height);

  xPx = noise(mouseX * scale) * width;
  yPx = noise(mouseY * scale) * height;

  loc = (int)x + (int)y * width;

  color c = myVideo.pixels[loc];

  fill(c);
  noStroke();
  rectMode(CENTER);

  if (mouseX!=pmouseX && mouseY!=pmouseY) {
    circle = randomGaussian() * scale;
    ellipse(xPx, yPx, tan(baseSize) * circle, tan(baseSize) * circle);
    circle +=20;
  } else {
    rect(x, y, 20, 20);
  }

  updatePixels();
} 