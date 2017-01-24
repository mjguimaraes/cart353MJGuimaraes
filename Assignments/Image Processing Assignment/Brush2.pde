class Brush2 {
  
  float brushSize, x, y;
  int c;
  float r, g, b;
  
  Brush2() {
    
    r = cat2.r;
    g = cat2.g;
    b = cat2.b;
    c = color(r, g, b);
    noStroke();
  }
  
  
  void paint(float rd, float xPos, float yPos) {
    x = xPos;
    y = yPos;
    brushSize = rd;
    fill(c);
    ellipse(x, y, brushSize, brushSize);
    
  }
  
}