XML invisible, timestamp, yourCondition, diagnosisPeriod, yourCountry, yourGender, ageGroup, yourDayRate, yourEmotion, yourFeeling;
String spreadsheetID;
String badDay, regularDay, goodDay, yourBasicEmotion;
int yourRate;

void setup() {
  spreadsheetID = "1zLK2gKb-BaVQATpt5bH1aVI8Imnw24cF3Ss8sDfl_QY";
  invisible = loadXML("https://spreadsheets.google.com/feeds/list/" + spreadsheetID + "/1/public/full");
  //String test = invisible.format(4);
  XML[] children = invisible.getChildren("entry");
  
  println("Count: " + children.length + " entries");
  println("---------------------------------");

  for (int i = 0; i < children.length; i++) {
    
    timestamp = children[i].getChild("gsx:timestamp");
    String date = timestamp.getContent().substring(0, 10);
    println(date);
    
    yourCondition = children[i].getChild("gsx:whichisyourconditioninthecaseyouhavemultiplepleaseselecttheonethatwasfirstidentifieddiagnosed.");
    println(yourCondition.getContent());
    
    diagnosisPeriod = children[i].getChild("gsx:howlongagodidyouhavetheaboveconditionidentifieddiagnosed");
    println(diagnosisPeriod.getContent());
    
    yourCountry = children[i].getChild("gsx:whichcountryareyoulivingcurrently");
    println(yourCountry.getContent());
    
    yourGender = children[i].getChild("gsx:whatisyourgender");
    println(yourGender.getContent());
    
    ageGroup = children[i].getChild("gsx:whichisyouragegroup");
    println(ageGroup.getContent());
    
    yourDayRate = children[i].getChild("gsx:howwouldyourateyourdaytoday");
    badDay = "Bad day";
    regularDay = "Regular day";
    goodDay = "Good day";
    yourRate = yourDayRate.getIntContent();
    if (yourRate == 1) {
      println(yourRate + " - " + badDay);
    } else if (yourRate == 2) {
      println(yourRate + " - " + regularDay);
    } else if (yourRate == 3) {
      println(yourRate + " - " + goodDay);
    } else {
      println("No rate");
    }
    //println(yourDayRate.getContent());
    
    yourEmotion = children[i].getChild("gsx:howwouldyoudefineyouremotionsatthismoment");
    yourBasicEmotion = yourEmotion.getContent();
    println(yourBasicEmotion);
    
    if (yourBasicEmotion.equals("Enjoyment")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionofenjoymenthowwouldyoudefineyourfeelingsnow");
      println(yourFeeling.getContent());
    } else if (yourBasicEmotion.equals("Sadness")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionofsadnesshowwouldyoudefineyourfeelingsnow");
      println(yourFeeling.getContent());
    } else if (yourBasicEmotion.equals("Anger")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionofangerhowwouldyoudefineyourfeelingsnow");
      println(yourFeeling.getContent());
    } else if (yourBasicEmotion.equals("Fear")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionoffearhowwouldyoudefineyourfeelingsnow");
      println(yourFeeling.getContent());
    } else if (yourBasicEmotion.equals("Disgust")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionofdisgusthowwouldyoudefineyourfeelingsnow");
      println(yourFeeling.getContent());
    }
    
    println("---------------------------------");
  }
 
 
}