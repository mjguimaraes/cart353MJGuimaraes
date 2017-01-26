class Intro {
  
  int fontSize;
  color c;
  int x, y, wrapX, wrapY;
  
  
  Intro() {
    c = color(34, 45, 52);
    x = 0;
    y = 0;
    fontSize = 0;
  }
  
  void display() {
    intro.writeHeader(20, width/2, height/6);
    intro.writeWay1(16, width/12, height/3, 200, 200);
    intro.writeWay2(16, (width*5)/12, height/3, 200, 200);
    intro.writeWay3(16, (width*3)/4, height/3, 200, 200);
    intro.writeSave(20, width/2, (height*2)/3);
    intro.writeReset(20, width/2, (height*2)/3 + 40);
    
  }
  
  void writeHeader(int fontSize, int xPos, int yPos) {
    x = xPos;
    y = yPos;
    textSize(fontSize);
    textAlign(CENTER);
    fill(c);
    String header1 = "Hello!";
    String header2 = "This is the kitten mixer!";
    text(header1, x, y);
    text(header2, x, y + 30);
  }
  
  void writeWay1(int fontSize, int xPos, int yPos, int xWrap, int yWrap) {
    x = xPos;
    y = yPos;
    wrapX = xWrap;
    wrapY = yWrap;
    textAlign(LEFT);
    textSize(fontSize);
    fill(c);
    String way1 = "1. Press 'a' to reveal kittens with your mouse.";
    text(way1, x, y, wrapX, wrapY);
  }
  
  void writeWay2(int fontSize, int xPos, int yPos, int xWrap, int yWrap) {
    x = xPos;
    y = yPos;
    wrapX = xWrap;
    wrapY = yWrap;
    textAlign(LEFT);
    textSize(fontSize);
    fill(c);
    String way2 = "2. Press 'b' to reveal more kittens with your mouse.";
    text(way2, x, y, wrapX, wrapY);
  }
  
  void writeWay3(int fontSize, int xPos, int yPos, int xWrap, int yWrap) {
    x = xPos;
    y = yPos;
    wrapX = xWrap;
    wrapY = yWrap;
    textAlign(LEFT);
    textSize(fontSize);
    fill(c);
    String way3 = "3. Hint: Keep I pressed to reveal first image; keep J pressed to reveal second image.";
    text(way3, x, y, wrapX, wrapY);
  }
  
  void writeSave(int fontSize, int xPos, int yPos) {
    x = xPos;
    y = yPos;
    textSize(fontSize);
    textAlign(CENTER);
    fill(c);
    String save = "Press S at any time to save your work.";
    text(save, x, y);
  }
  
  void writeReset(int fontSize, int xPos, int yPos) {
    x = xPos;
    y = yPos;
    textSize(fontSize);
    textAlign(CENTER);
    fill(c);
    String reset = "Press R to reset your work and start over.";
    text(reset, x, y);
  }
  
}