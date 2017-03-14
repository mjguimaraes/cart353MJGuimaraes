//variable to store Google spreadsheet ID
String spreadsheetID;
//variables to store XML data
XML invisible, timestamp, yourCondition, diagnosisPeriod, yourCountry, yourGender, ageGroup, yourDayRate, yourEmotion, yourFeeling;

Date dateEntries;
Condition conditionEntries;
Period periodEntries;
Country countryEntries;
Gender genderEntries;
Age ageEntries;
DayRate ratingEntries;
Emotion emotionEntries;

void setup() {
  size(900, 600);
  background(0);
  noStroke();
  
  //calling Google spreadsheet XML responses file
  spreadsheetID = "1zLK2gKb-BaVQATpt5bH1aVI8Imnw24cF3Ss8sDfl_QY";
  invisible = loadXML("https://spreadsheets.google.com/feeds/list/" + spreadsheetID + "/1/public/full");

  //creating a XML Array object to store columns from spreadsheet
  XML[] invResponses = invisible.getChildren("entry");
  //check point to responses - count of entries
  println("Count: " + invResponses.length + " entries");
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