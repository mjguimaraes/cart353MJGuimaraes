class Cat1 {
  
  PImage img1;
  int loc;
  int w, h;
  float r, g, b;
  int c;
  
  Cat1() {
    img1 = loadImage("catsA.jpg");
    w = 900;
    h = 600;
  }
  
  //Based on example 15-7 from Daniel Sfiffman's Learning Processing book, chapter 15 'Images'
  void render() {
    loadPixels();
    
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        loc = i + j * w;
        r = red(img1.pixels[loc]);
        g = green(img1.pixels[loc]);
        b = blue(img1.pixels[loc]);
        c = color(r, g, b);
        pixels[loc] = c;
      }
    }
    
    updatePixels();
  }
  
  
}