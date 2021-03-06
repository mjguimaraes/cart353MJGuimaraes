class Brush1 {

  float brushSize, x, y;
  int c;
  float r, g, b;
  Cat1 cat1;

  Brush1() {
    cat1 = new Cat1();
    r = cat1.r;
    g = cat1.g;
    b = cat1.b;
    c = color(r, g, b);
    noStroke();
  }

  void paint(float rd, float xPos, float yPos) {
    color c = cat1.renderMouse(int(xPos), int(yPos));
    brushSize = rd;
    fill(c);
    ellipse(xPos, yPos, brushSize, brushSize);
  }
}