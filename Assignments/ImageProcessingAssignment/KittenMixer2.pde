Intro intro;
Cat1 cat1;
Cat2 cat2;
Brush1 brush1;
Brush2 brush2;
Reset reset1;
char letter;

void setup() {
  size(900, 600);
  background(235);
  smooth(8);

  cat1 = new Cat1();
  intro = new Intro();
  cat2 = new Cat2();
  brush1 = new Brush1();
  brush2 = new Brush2();
  reset1 = new Reset();
  letter = 'a';

  background(235);
  intro.display();
}


void draw() {
}

void mouseDragged() {
  if (letter == 'b') {
    brush2.paint(10, mouseX, mouseY);
  } else {
    brush1.paint(10, mouseX, mouseY);
  }
}

void keyPressed() {
  switch(key) {
  case 'i':
  case 'I':
    cat1.render();
    break;
  case 'j':
  case 'J':
    cat2.render();
    break;
  case 'r':
  case 'R':
    reset1.reset();
    break;
  case 's':
  case 'S':
    save("screenshot.jpg");
    break;
  case 'a':
  case 'A':
    letter = 'a';
    break;
  case 'b':
  case 'B':
    letter = 'b';
    break;
  }
}