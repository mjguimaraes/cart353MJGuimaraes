int w = 900;
int h = 600;
int entryCount;
XML [] invResponses;
Date dateEntries;
Condition conditionEntries;
Period periodEntries;
Country countryEntries;
Gender genderEntries;
Age ageEntries;
DayRate ratingEntries;
Emotion emotionEntries;
Source source;


void setup() {
  size(900, 600);
  background(0);
  noStroke();

  //initiating Souce class and creating a XML Array object to store columns from spreadsheet
  source = new Source();
  XML [] invResponses = source.entries();

  //check point to responses - count of entries
  entryCount = invResponses.length;
  println("Count: " + entryCount + " entries");
  println("---------------------------------");

  dateEntries = new Date();
  dateEntries.dateEntry(invResponses);
  println("---------------------------------");

  conditionEntries = new Condition();
  conditionEntries.conditionEntry(invResponses);
  println("---------------------------------");

  periodEntries = new Period();
  periodEntries.periodEntry(invResponses);
  println("---------------------------------");

  countryEntries = new Country();
  countryEntries.countryEntry(invResponses);
  println("---------------------------------");

  genderEntries = new Gender();
  genderEntries.genderEntry(invResponses);
  println("---------------------------------");

  ageEntries = new Age();
  ageEntries.ageEntry(invResponses);
  println("---------------------------------");

  ratingEntries = new DayRate();
  ratingEntries.rateEntry(invResponses);
  println("---------------------------------");

  emotionEntries = new Emotion();
  emotionEntries.emotionEntry(invResponses);
  println("---------------------------------");

  //reading each entry of the array
}

void draw() {
}