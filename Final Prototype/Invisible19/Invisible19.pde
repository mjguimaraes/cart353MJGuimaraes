XML [] invResponses;
// declaring global variables to intialize all classes
Date dateEntries;
Condition conditionEntries;
Period periodEntries;
Country countryEntries;
Gender genderEntries;
Age ageEntries;
DayRate ratingEntries;
Emotion emotionEntries;
Source source;
Person person;
Info allInfo;
boolean sPressed = false;


void setup() {
  size(1280, 800, P2D);
  background(0);
  noStroke();
  smooth();
  //initializing Source class and creating a XML array to store columns from spreadsheet
  source = new Source();
  XML [] invResponses = source.entries();

  //initializing classes and calling functions to read and get results from google spreadsheet
  dateEntries = new Date(invResponses);
  dateEntries.dateEntry();

  conditionEntries = new Condition(invResponses);
  conditionEntries.conditionEntry();

  periodEntries = new Period(invResponses);
  periodEntries.periodEntry();

  countryEntries = new Country(invResponses);
  countryEntries.countryEntry();

  genderEntries = new Gender(invResponses);
  genderEntries.genderEntry();

  ageEntries = new Age(invResponses);
  ageEntries.ageEntry();

  ratingEntries = new DayRate(invResponses);
  ratingEntries.rateEntry();

  emotionEntries = new Emotion(invResponses);
  emotionEntries.emotionEntry();

  allInfo = new Info(invResponses);

  //initializing Person class that combines the output from other classes
  person = new Person(invResponses);
  allInfo.introLogo();
}

void draw() {
  if (sPressed) {
    //drawing the visualization, with a trail for the moving parts
    fill(0);
    rect(0, 0, width, 150);
    fill(0, 15);
    rect(0, 150, width, height-150);
    allInfo.displayLegend(mouseX, mouseY);
    allInfo.displayInfo(mouseX, mouseY);
    person.run();
  }
}

//key to switch screens and call drawing
void keyPressed() {
  switch(key) {
  case '1':
    sPressed = false;
    allInfo.introA();
    break;
  case '2':
    sPressed = false;
    allInfo.introB();
    break;
  case '3':
    sPressed = false;
    allInfo.introC();
    break;
  case 's':
  case 'S':
    sPressed = true;
    fill(0);
    rect(0, 0, width, height);
    this.draw();
    break;
  }
}