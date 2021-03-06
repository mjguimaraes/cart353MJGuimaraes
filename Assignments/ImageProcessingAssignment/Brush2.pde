class Brush2 {

  float brushSize, x, y;
  int c;
  float r, g, b;
  Cat2 cat2;
  
  Brush2() {
    cat2 = new Cat2();
    r = cat2.r;
    g = cat2.g;
    b = cat2.b;
    c = color(r, g, b);
    noStroke();
  }


  void paint(float rd, float xPos, float yPos) {
    color c = cat2.renderMouse(int(xPos), int(yPos));
    brushSize = rd;
    fill(c);
    ellipse(xPos, yPos, brushSize, brushSize);
  }
}