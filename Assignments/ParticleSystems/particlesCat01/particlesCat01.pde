// A mashup of Particles System, Oscillating Objects, and a cute cat
import processing.video.*;

Cat cuteCat; //declare the cat shape
Capture camera; //declare the camera to check room brightness
DayNight light; //return the brightness level of room
BugCloud manyBugs; //declare a cloud of bugs

void setup() {
  smooth();
  background(255);
  size(900, 600);

  cuteCat = new Cat(width/2, height+90); //initialize the cat
  camera = new Capture(this); //initialize the computer camera
  light = new DayNight(); //initialize the variable to measure room brightness
  manyBugs = new BugCloud(new PVector(width/2, height/2)); //initialize the cloud in the middle of screen
}

void draw() {
  cuteCat.catEyes(mouseX, mouseY); // call funtion to have cat's eyes to follow mouse movement and pupils to contract/expand
  light.getBrightness(); // call function to read the room brightness and control cat's eyes pupils
  manyBugs.addBug(mouseX, mouseY); //call function to create bugs in mouse position
  manyBugs.run();
}