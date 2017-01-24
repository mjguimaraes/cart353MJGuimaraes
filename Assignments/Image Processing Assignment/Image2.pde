class Cat2 {
  
  PImage img2;
  int loc;
  int w, h;
  float r, g, b;
  
  Cat2() {
    img2 = loadImage("catsB.jpg");
    w = 900;
    h = 600;
  }
  
  //Based on example 15-7 from Daniel Sfiffman's Learning Processing book, chapter 15 'Images'
  void render() {
    loadPixels();
    
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        loc = i + j * w;
        r = red(img2.pixels[loc]);
        g = green(img2.pixels[loc]);
        b = blue(img2.pixels[loc]);
        
        pixels[loc] = color(r, g, b);
      }
    }
    
    updatePixels();
  }
  
  
}