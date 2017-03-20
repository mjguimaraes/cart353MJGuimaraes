class Cat {

  PShape cuteCat;
  //variables to control the eyes movement and pupil contraction
  float xShape, yShape, xLeftEye, yLeftEye, xRightEye, yRightEye, xMouse, yMouse;

  Cat(int xTemp, int yTemp) {
    xShape = xTemp;
    yShape = yTemp;
    shapeMode(CENTER);
    cuteCat = loadShape("cat.svg"); //image source: https://www.vecteezy.com/vector-art/82069-cute-black-cat-vector-pack
    cuteCat.enableStyle();
    // initiate the eyes on a specific position to match cat shape position
    xLeftEye = xShape - 54;
    xRightEye = xShape + 60;
    yLeftEye = yShape - 150;
    yRightEye = yShape - 149;
  }


  void catEyes(int xTemp, int yTemp) {
    xMouse = xTemp;
    yMouse = yTemp;
    float roomBright = light.brightLevel; // check the room brightness read from camera
    //adjusts brightness of bg to match room brightness
    float bgBright = map(roomBright, 0, 180, 160, 255);
    background(bgBright);
    // constrain and match eyes moment to follow mouse movement
    float leftEyeXMove = map(xMouse, 0, 900, xLeftEye-10, xLeftEye+10);
    float rightEyeXMove = map(xMouse, 0, 900, xRightEye-10, xRightEye+10);
    float leftEyeYMove = map(yMouse, 0, 600, yLeftEye-4, yLeftEye+4);
    float rightEyeYMove = map(yMouse, 0, 600, yRightEye-4, yRightEye+4);
    // contrain and match pupils expansion/contraction to react to room brightness
    float pupilOpen = map(roomBright, 0, 255, 28, 8);
    fill(0);
    ellipse(leftEyeXMove, leftEyeYMove, pupilOpen, 28);
    ellipse(rightEyeXMove, rightEyeYMove, pupilOpen, 28);
    //render cat shape
    shape(cuteCat, xShape, yShape);
  }
}