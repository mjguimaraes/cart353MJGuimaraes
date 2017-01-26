class Brush1 {
  
  float brushSize, x, y;
  int c;
  float r, g, b;
  
  Brush1() {
    
    r = cat1.r;
    g = cat1.g;
    b = cat1.b;
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