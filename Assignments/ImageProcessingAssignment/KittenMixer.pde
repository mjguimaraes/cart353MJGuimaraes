Intro intro;
Cat1 cat1;
Cat2 cat2;
Brush1 brush1;
Brush2 brush2;
Reset reset1;

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
  background(235);
  intro.display();
}


void draw() {
  if (keyPressed) {
    if (key == 'i' || key == 'I') {    
      cat1.render();
    } else if (key == 'j' || key == 'J') {
      cat2.render();
    } else if (key == 'r' || key == 'R') {
      reset1.reset();
    } else if (key == 's' || key == 'S') {
      save("screenshot.jpg");
    } 
  }

}

void mouseDragged() {
  brush1.paint(60, mouseX, mouseY);
   
}