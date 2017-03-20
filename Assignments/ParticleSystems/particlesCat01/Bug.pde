class Bug {

  PShape bug;
  PVector position, angle, velocity, amplitude;
  float life;
  int[] glow = new int[36];

  Bug(PVector temp) {
    shapeMode(CENTER);
    bug = loadShape("bug.svg"); //image source: https://www.vecteezy.com/vector-art/126701-insect-icon-vectors
    bug.enableStyle();

    //initiate vectors to render the bugs, add some velocity, and how far they oscillate around center
    angle = new PVector();
    velocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    amplitude = new PVector(random(20, 100), random(30, 70));
    //gets the position when calling the bug cloud
    position = temp.get();
    //initiate count for lifespan
    life = 200.0;
  }

  void run() {
    bugFloat();
    bugDisplay();
  }

  void bugFloat() {
    //adds movement to the bug object
    angle.add(velocity);
    //decreases the lifespan of bug
    life -= 5.0;
  }

  void bugDisplay() {
    // assigns coordinates to the bug position related to the angle derivated from velocity 
    float x = sin(angle.x) * amplitude.x;
    float y = sin(angle.y) * amplitude.y;

    float lightBright = map(light.brightLevel, 0, 255, 100, 0);
    // translate the center of cloud to the position declared on bug cloud
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    shape(bug, x, y, 6, 6);
    //add light for bugs to follow
    for (float g : glow) {
      rotate(TWO_PI/glow.length);
      stroke(255, 254, 232, lightBright);
      g = int(randomGaussian() * .005);
      float d = g/100;
      line(x, y, d, 0);
    }
    popMatrix();
  }

  // function to declare the object is not visible and to be removed from array
  boolean isDead() {
    if (life < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}