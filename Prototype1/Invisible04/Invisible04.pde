XML invisible, timestamp, yourCondition, diagnosisPeriod, yourCountry, yourGender, ageGroup, yourDayRate, yourEmotion, yourFeeling;
StringList yourSpecialFeeling;
String spreadsheetID;
String badDay, regularDay, goodDay, yourBasicEmotion;
boolean excitement, wonder, pride, peace, relief, amusement, compassion, joy, rejoicing, pleasure;
String anguish, sorrow, grief, despair, misery, hopelessness, helplessness, resignation, distraughtness, discouragement, disappointment;
String fury, bitterness, vengefulness, argumentativeness, exasperation, frustration, annoyance;
String terror, horror, panic, desperation, dread, anxiety, nervousness, trepidation;
String loathing, abhorrence, revulsion, repugnance, distaste, aversion, dislike;
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

    yourSpecialFeeling = new StringList();

    if (yourBasicEmotion.equals("Enjoyment")) {
      yourFeeling = children[i].getChild("gsx:consideringyouremotionofenjoymenthowwouldyoudefineyourfeelingsnow");
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
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

    if (yourSpecialFeeling.hasValue("Excitement")) {
      excitement = true;
    } else {
      excitement = false;
    }
    if (yourSpecialFeeling.hasValue("Wonder")) {
      wonder = true;
    } else {
      wonder = false;
    }
    if (yourSpecialFeeling.hasValue("Pride")) {
      pride = true;
    } else {
      pride = false;
    }
    if (yourSpecialFeeling.hasValue("Peace")) {
      peace = true;
    } else {
      peace = false;
    }
    if (yourSpecialFeeling.hasValue("Relief")) {
      relief = true;
    } else {
      relief = false;
    }
    if (yourSpecialFeeling.hasValue("Amusement")) {
      amusement = true;
    } else {
      amusement = false;
    }
    if (yourSpecialFeeling.hasValue("Compassion")) {
      compassion = true;
    } else {
      compassion = false;
    }
    if (yourSpecialFeeling.hasValue("Joy")) {
      joy = true;
    } else {
      joy = false;
    }
    if (yourSpecialFeeling.hasValue("Rejoicing")) {
      rejoicing = true;
    } else {
      rejoicing = false;
    }
    if (yourSpecialFeeling.hasValue("Pleasure")) {
      pleasure = true;
    } else {
      pleasure = false;
    }

    println("("+ excitement +"|"+ wonder +"|"+ pride +"|"+ peace +"|"+ relief +"|"+ amusement +"|"+ compassion +"|"+ joy +"|"+ rejoicing +"|"+ pleasure +")");

   
    println("---------------------------------");
  }
}